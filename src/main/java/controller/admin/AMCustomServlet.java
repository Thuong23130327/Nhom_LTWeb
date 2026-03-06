package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import service.AdCustomService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AMCustomServlet", value = "/admin/my-web")
public class AMCustomServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      AdCustomService adCustomService = null;
        adCustomService = new AdCustomService();
        List<Banner> banners = adCustomService.getListBanner();
        request.setAttribute("banners", banners);
        request.getRequestDispatcher("/WEB-INF/views/admin/customWeb.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
    }
}