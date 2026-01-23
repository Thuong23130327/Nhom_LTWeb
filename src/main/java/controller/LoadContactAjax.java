package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;
import model.Product;
import service.AdminMailService;
import service.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadContactAjax", value = "/contact-Ajax")
public class LoadContactAjax extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contact> list = null;
        service.AdminMailService adminMailService = null;
        String selectedSort = request.getParameter("selectedSort") != null ? request.getParameter("selectedSort") : "default";

        try {
            adminMailService = new AdminMailService();
            list = adminMailService.sort(selectedSort);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        PrintWriter out = response.getWriter();
        System.out.println(list.size());
        if (list == null) {
            out.println(" <tr>\n" +
                    "       <td colspan=\"5\" class=\"text-center\">Không có Liên hệ nào trong hệ thống.</td>\n" +
                    "       </tr>");
            return;
        }
        int i = 0;
        String buttonTil = "Phản hồi";
        for (Contact c : list) {
            i++;
            out.println(" <tr>\n" +
                    "                                        <td>" + i + "</td>\n" +
                    "                                        <td>" + c.getSenderName() + "</td>\n" +
                    "                                        <td>" + c.getMess() + "</td>\n" +
                    "                                        <td>" + c.getStringCreatedAt());
            out.println("<td>\n");
            if (c.getStatus() == Contact.Status.New) {
                out.println(" <a\n" +
                        "          href=\"mail_detail?id=" + c.getId() + "\">\n" +
                        "          <button class=\"btn-new\">" + c.getStringStatus() + "</button>\n" +
                        "            </a>");

            } else {
                buttonTil = "Chi tiết";
                out.println(" <a\n" +
                        "          href=\"mail_detail?id=" + c.getId() + "\">\n" +
                        "          <button class=\"btn-replied\">" + c.getStringStatus() + "</button>\n" +
                        "            </a>");
            }
            out.println("<td>\n");
            out.println(" <a\n" +
                    "          href=\"mail_detail?id=" + c.getId() + "\">\n" +
                    "          <button class=\"btn-sm\">" + buttonTil + "</button>\n" +
                    "            </a>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}