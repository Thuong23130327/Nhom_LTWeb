package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String url;
        String error;
        HttpSession session = request.getSession();
        if (username.equals("admin") && password.equals("13052005")) {
            url = "/admin/admin.jsp";
            session.setAttribute("loggedIn", true);
        } else {
            url = "/login.jsp";
            error = "Tên đăng nhập hoặc mật khẩu không đúng?";
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("error", error);
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}