package controller.admin;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Contact;
import service.AdminMailService;
import service.ContactService;
import service.EmailSender;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "sendReply", value = "/admin/send-reply")
public class sendReply extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String contextPath = request.getContextPath();
        String mailId = request.getParameter("id");

        boolean isSuccess = EmailSender.send(email, subject, content);
        HttpSession session = request.getSession();
        if (isSuccess) {
            session.setAttribute("msg", "success");
            new AdminMailService().saveReply(mailId, content);
            response.sendRedirect(contextPath + "/admin/mail");
        } else {
            session.setAttribute("msg", "fail");
            response.sendRedirect(contextPath + "/admin/mail_detail?id=" + mailId );
        }
    }
}