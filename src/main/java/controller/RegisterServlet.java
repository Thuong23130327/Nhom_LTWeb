package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.UserService;
import util.MD5;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String url = "/login.jsp";
        request.setAttribute("error", null);
        UserService userService = new UserService();

        //Mail tồn tại chưa ?
        if (userService.checkExistMail(email)) {
            request.setAttribute("registerError", "Email đã được sử dụng");
            request.setAttribute("loginEmail", email);
            request.setAttribute("fullname", fullname);
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        //Pass giống repass ko
        if (!repassword.equals(password)) {
            request.setAttribute("registerError", "Password không trùng khớp");
            request.setAttribute("fullname", fullname);
            request.setAttribute("regEmail", email);
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        boolean regisSuccess = false;
        try {
            regisSuccess = userService.register(email, password, fullname);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        if (regisSuccess) {
            request.getSession().setAttribute("registerMessage", "Đã đăng kí thành công");
            request.setAttribute("error", null);
            request.setAttribute("registerError", null);
            request.setAttribute("loginEmail", email);
        } else {
            request.setAttribute("fullname", fullname);
            request.setAttribute("regEmail", email);
            request.setAttribute("registerError", "Lỗi đăng kí, vui lòng thử lại");
        }
        request.getRequestDispatcher(url).forward(request, response);

    }
}