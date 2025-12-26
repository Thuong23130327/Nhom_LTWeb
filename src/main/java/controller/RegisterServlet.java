package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.MD5;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String fullname = request.getParameter("regisFullname");
        String email = request.getParameter("regisEmail");
        String password = request.getParameter("regisPassword");
        String repassword = request.getParameter("repassword");
        String url = "";
        request.setAttribute("error", null);

        if (!repassword.equals(password)) {
            request.setAttribute("registerError", "Passwords không trùng khớp");
            url = "/login.jsp";
        }

        UserDAO dao = new UserDAO();
        if (dao.checkExistMail(email)) {
            url = "/login.jsp";
            request.setAttribute("registerError", "Email đã được sử dụng");
            request.setAttribute("regisEmail", email);
            request.setAttribute("regisFullname", fullname);
        }
        String passHash = null;
        try {
            passHash = MD5.getMd5(password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        User newUser = new User(email,passHash,fullname);

        if (dao.register(newUser)) {
            url = "/login.jsp";
            request.getSession().setAttribute("registerMessage", "Đã đăng kí thành công");
            request.setAttribute("error", null);
            request.setAttribute("email", email);
            request.setAttribute("registerError", null);

        } else {
            url = "/login.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}