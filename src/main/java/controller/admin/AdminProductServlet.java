package controller.admin;

import dao.adminDAO.AdminProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.admin.ProductAdminDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/admin/product-manager")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminProductDAO adminProductDAO = new AdminProductDAO();
        List<ProductAdminDTO> productList = adminProductDAO.getAllAdminProducts();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
