package service;

import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Properties;

public class EmailSender {

    // 1. Hàm đọc API Key từ file bí mật
    private static String getApiKey() {
        Properties prop = new Properties();
        // Tìm file config.properties trong thư mục resources hoặc src
        try (InputStream input = EmailSender.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                System.out.println("Cảnh báo: Không tìm thấy file config.properties!");
                return null;
            }
            prop.load(input);
            return prop.getProperty("brevo.api.key");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String escapeJson(String input) {
        if (input == null) return "";
        return input.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }

    public static boolean send(String toEmail, String subject, String content) {
        // 2. Lấy API Key động thay vì để chuỗi cứng
        String apiKey = getApiKey();

        if (apiKey == null || apiKey.isEmpty()) {
            System.err.println("Lỗi: Chưa cấu hình API Key trong config.properties!");
            return false;
        }

        try {
            // Xử lý nội dung để hiển thị được xuống dòng trong Gmail
            String htmlBody = content.replace("\n", "<br>");
            String safeSubject = escapeJson(subject);
            String safeContent = escapeJson(htmlBody);

            String json = "{"
                    + "\"sender\":{\"name\":\"AuraSound\",\"email\":\"23130327@st.hcmuaf.edu.vn\"},"
                    + "\"to\":[{\"email\":\"" + toEmail + "\"}],"
                    + "\"subject\":\"" + safeSubject + "\","
                    + "\"htmlContent\":\"<html><body>" + safeContent + "</body></html>\""
                    + "}";

            // 3. Xây dựng yêu cầu gửi đến Brevo với API_KEY từ file
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://api.brevo.com/v3/smtp/email"))
                    .header("api-key", apiKey) // Dùng biến apiKey vừa đọc được
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(json))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 201 || response.statusCode() == 200) {
                return true;
            } else {
                System.out.println("Lỗi từ API (Status " + response.statusCode() + "): " + response.body());
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}