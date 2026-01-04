package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductService productService = null;
        try {
            productService = new ProductService();
            String cateId = request.getParameter("cateId");

            List<Product> productList = null;
            if (cateId != null) {
                productList = productService.getProductByCategoryId(cateId);
            } else {
                productList = productService.getAllProduct();
            }
            request.setAttribute("productList", productList);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/headphones.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/headphones.jsp").forward(request, response);
    }
}