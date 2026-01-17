package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");


        //Mail tồn tại chưa ?
        if (userService.checkExistMail(email)) {
            request.setAttribute("registerError", "Email đã được sử dụng, vui lòng Đăng Nhập");
            request.setAttribute("loginEmail", email);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        //Pass giống repass ko
        if (!repassword.equals(password)) {
            request.setAttribute("registerError", "Password không trùng khớp");
            request.setAttribute("fullname", fullname);
            request.setAttribute("regEmail", email);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        boolean regisSuccess = false;
        try {
            regisSuccess = userService.register(email, password, fullname);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        if (regisSuccess) {
            request.setAttribute("registerMessage", "Đã đăng kí thành công");
            request.setAttribute("error", null);
            request.setAttribute("registerError", null);
            request.setAttribute("loginEmail", email);
        } else {
            request.setAttribute("fullname", fullname);
            request.setAttribute("regEmail", email);
            request.setAttribute("registerError", "Lỗi đăng kí, vui lòng thử lại");
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }
}