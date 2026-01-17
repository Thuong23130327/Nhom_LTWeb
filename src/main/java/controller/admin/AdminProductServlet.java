package controller.admin;

import dao.adminDAO.AdminProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.admin.ProductAdminDTO;
import service.AdminProductService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminProductServlet", value = "/admin/product-manager")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminProductService adminProductService = null;
        try {
            adminProductService = new AdminProductService();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        List<Product> productList = adminProductService.getAllProduct();
        Map<Integer, Integer> stockMap = adminProductService.getTotalStock();

        request.setAttribute("productList", productList);
        request.setAttribute("totalStockMap", stockMap);

        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
