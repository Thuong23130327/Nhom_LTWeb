package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Order;
import model.OrderShipping;
import model.Product;
import service.AdOrderService;
import service.AdminProductService;
import service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminOrderServlet", value = "/admin/manage-order")
public class AdminOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> list = new ArrayList<>();
        AdOrderService adOrderService = new AdOrderService();
        list = adOrderService.geAllOrders();


        request.setAttribute("list", list);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}