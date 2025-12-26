package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.MD5;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String url;
        String error = "";


        User user;
        try {
            user = userDAO.checkLogin(email, password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (user != null) {
            if (user.isLocked()) {
                request.setAttribute(error, "Tài khoản của bạn đã bị khóa");
                url = "/login.jsp";

            }
            HttpSession session = request.getSession();
            if (user.getRole() == User.Role.Admin) {
                session.setAttribute("author", user);
                url = "/admin/admin.jsp";
            } else {
                session.setAttribute("auth", user);
                url = "/index.jsp";
            }


        } else if (!userDAO.checkExistMail(email)) {
            url = "/login.jsp";
            request.setAttribute("email", email);
            request.setAttribute("error", "Email chưa có tài khoản");


        } else {
            url = "/login.jsp";
            error = "Mật khẩu không đúng";
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("error", error);
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}