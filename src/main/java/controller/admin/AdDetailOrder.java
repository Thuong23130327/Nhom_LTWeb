package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import service.AdOrderService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdDetailOrder", value = "/admin/manage-order-detail")
public class AdDetailOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        AdOrderService adOrderService = new AdOrderService();
        List<CartItem> listItem = adOrderService.getAllOrdersItem(id);
        OrderShipping os = adOrderService.getOrShip(id);
        Order order = adOrderService.getOrderById(id);

        request.setAttribute("listItem", listItem);
        request.setAttribute("o", order);
        request.setAttribute("os", os);
        request.getRequestDispatcher("order_detail.jsp").forward(request, response);
    }
}