package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/ProductListServlet")
public class ProductListServlet extends HttpServlet {
    private ProductService productService;

//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String category = request.getParameter("category");
//        List<Product> products;
//
//        if (category == null) {
//            // /products → TẤT CẢ
//            products = productService.getAllProduct();
//            request.setAttribute("title", "Tất cả sản phẩm");
//            request.getRequestDispatcher("/store.jsp").forward(request, response);
//            return;
//        }
//
//        if (category.equals("headphones")) {
//            products = productService.getProductsByCategory(1);
//            request.setAttribute("title", "Tai nghe");
//            request.getRequestDispatcher("/headphones.jsp").forward(request, response);
//            return;
//        }
//
//        if (category.equals("speakers")) {
//            products = productService.getProductsByCategory(2);
//            request.setAttribute("title", "Loa");
//            request.getRequestDispatcher("/speakers.jsp").forward(request, response);
//        }
//    }

}
