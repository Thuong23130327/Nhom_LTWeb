package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.util.List;

public class ProductListServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryIdParam = request.getParameter("categoryId");

        List<Product> products;

        if (categoryIdParam != null) {
            int categoryId = Integer.parseInt(categoryIdParam);
            products = productService.getProductsByCategory(categoryId);
        } else {
            products = productService.getNewArrivals(10);
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}
