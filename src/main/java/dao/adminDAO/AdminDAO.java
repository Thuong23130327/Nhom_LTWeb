package dao.adminDAO;

import dao.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminDAO {

    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // tổng sp
    public int totalProducts() throws SQLException, ClassNotFoundException{

        String sql = "SELECT COUNT(*) FROM Products";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    // tổng đơn hàng
    public int totalOrders() throws SQLException, ClassNotFoundException{

        String sql = "SELECT COUNT(*) FROM Orders";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    // đơn chờ xử lý
    public int ordersPending() throws SQLException, ClassNotFoundException{

        String sql = "SELECT COUNT(*)  FROM Orders WHERE payment_status = 'PENDING'";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    // tổng khách hàng
    public int totalCustomer() throws SQLException, ClassNotFoundException{

        String sql = "SELECT COUNT(*) FROM Users WHERE role = 'Customer';";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    // tổng doanh thu
    public int totalRevenue() throws SQLException, ClassNotFoundException{

        String sql = "SELECT SUM(final_amount) FROM Orders WHERE status = 'COMPLETED' ";
        conn = DBConnect.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    // doanh thu theo từng thời điểm
        //năm
        public int yearRevenue() throws SQLException, ClassNotFoundException{

            String sql = "SELECT SUM(final_amount) AS DoanhThuNamNay FROM Orders WHERE status = 'COMPLETED' AND YEAR(order_date) = YEAR(CURDATE())";
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0;
        }

        //tháng
        public int monthRevenue() throws SQLException, ClassNotFoundException{

            String sql = "SELECT SUM(final_amount) AS DoanhThuThangNay FROM Orders WHERE status = 'COMPLETED'  AND MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())";
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0;
        }

        //ngày
        public int dayRevenue() throws SQLException, ClassNotFoundException{

            String sql = "SELECT SUM(final_amount) FROM Orders WHERE status = 'COMPLETED' AND DATE(order_date) = CURDATE()";
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0;
        }

        //6 tháng gần nhất
        public Map<String, Integer> chartRevenue() throws SQLException, ClassNotFoundException {
            Map<String, Integer> finalData = new LinkedHashMap<>();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/yyyy");
            LocalDate now = LocalDate.now();

            for (int i = 5; i >= 0; i--) {
                LocalDate targetDate = now.minusMonths(i);
                finalData.put(targetDate.format(formatter), 0);
            }

            String sql = "SELECT " +
                    "  DATE_FORMAT(order_date, '%m/%Y') AS month_year, " +
                    "  SUM(final_amount) AS monthly_revenue " +
                    "FROM Orders " +
                    "WHERE status = 'COMPLETED' " +
                    "  AND order_date >= LAST_DAY(CURRENT_DATE - INTERVAL 6 MONTH) + INTERVAL 1 DAY " +
                    "GROUP BY YEAR(order_date), MONTH(order_date) " +
                    "ORDER BY YEAR(order_date) ASC, MONTH(order_date) ASC";

            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    String dbMonthYear = rs.getString("month_year");
                    int revenue = rs.getInt("monthly_revenue");

                    if (finalData.containsKey(dbMonthYear)) {
                        finalData.put(dbMonthYear, revenue);
                    }
                }
            }

            return finalData;
        }

        //7 ngày gần nhất
        public Map<String, Long> chartSevenDaysRevenue() throws SQLException, ClassNotFoundException {
            Map<String, Long> finalData = new LinkedHashMap<>();

            DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("dd/MM");
            DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            LocalDate today = LocalDate.now();
            for (int i = 6; i >= 0; i--) {
                LocalDate date = today.minusDays(i);
                finalData.put(date.format(dbFormatter), 0L);
            }

            String sql = "SELECT DATE(order_date) AS d, SUM(final_amount) AS r " +
                    "FROM Orders " +
                    "WHERE status = 'COMPLETED' " +
                    "  AND order_date >= CURDATE() - INTERVAL 6 DAY " +
                    "GROUP BY DATE(order_date)";

            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    String dbDate = rs.getString("d");
                    long revenue = rs.getLong("r");

                    if (finalData.containsKey(dbDate)) {
                        finalData.put(dbDate, revenue);
                    }
                }
            }

            Map<String, Long> displayData = new LinkedHashMap<>();
            finalData.forEach((key, value) -> {
                String displayDate = LocalDate.parse(key).format(displayFormatter);
                displayData.put(displayDate, value);
            });

            return displayData;
        }



}
