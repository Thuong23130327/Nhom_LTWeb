package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


// 1. Nếu chạy được dòng này thì Servlet OK
@WebServlet(name = "controller.TestServlet", value = "/check")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gửi một dòng chữ sang bên JSP
        request.setAttribute("loi_chao", "Chúc mừng! Servlet, JSP và JSTL đều hoạt động tốt!");

        // Chuyển hướng sang file JSP
        request.getRequestDispatcher("/ketqua.jsp").forward(request, response);
    }
}