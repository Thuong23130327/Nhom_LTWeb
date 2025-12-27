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
import service.UserService;
import util.MD5;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String url = "/login.jsp";
        String error = "";
        request.setAttribute("registerMessage", null);
        request.setAttribute("registerError", null);


        User user = null;
        try {
            user = userService.login(email, password);
            if (user != null) {
                if (user.isLocked()) {
                    request.setAttribute(error, "Tài khoản của bạn đã bị khóa");
                    request.setAttribute("loginEmail", email);
                    request.getRequestDispatcher(url).forward(request, response);
                    return;
                }

                HttpSession session = request.getSession();
                session.setAttribute("auth", user);
                if (user.getRole() == User.Role.Admin) {
                    response.sendRedirect("admin/admin.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
                return;
            } else if (!userService.checkExistMail(email)) {
                request.setAttribute("regEmail", email);
                request.setAttribute("error", "Email chưa có tài khoản, vui lòng chọn Đăng kí");
            } else {
                request.setAttribute("loginEmail", email);
                request.setAttribute("error", "Mật khẩu không đúng");
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}