package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Banner;
import model.Brand;
import service.AdCustomService;
import service.HomeService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HomeService service = new HomeService();
        List<Banner> bannerList = service.getListBanner();

        List<Brand> brandList = null;
        try {
            brandList = service.getListBrands();
            request.setAttribute("bannerList", bannerList);
            request.setAttribute("brandList", brandList);
            System.out.println(bannerList + " " + brandList);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}