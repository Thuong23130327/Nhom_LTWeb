package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Contact;
import model.User;
import service.ContactService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContactServlet", value = "/contact")
public class ContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activePage", "contact");
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activePage", "contact");

        ContactService contactService = new ContactService();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        String submit = request.getParameter("submit");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        try {
            boolean sendSuccess = contactService.sendContactMail(email, name, phone, message, user);
            if (sendSuccess) {
                request.getSession().setAttribute("successMessage", "AuraSound đã nhận được thành công, Xin cảm ơn quý khách");
                request.setAttribute("name", "");
                request.setAttribute("email", "");
                request.setAttribute("phone", "");
                request.setAttribute("message", "");
            } else {
                request.setAttribute("errorMessage", "Lỗi hệ thống. Vui lòng thử lại!");
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("message", message);
            }
            request.getRequestDispatcher("/contact.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }
}