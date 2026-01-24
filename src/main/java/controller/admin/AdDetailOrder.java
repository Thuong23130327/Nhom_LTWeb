package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderItems;
import model.User;
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
        List<OrderItems> listItem = adOrderService.getAllOrdersItem(id);
        if (listItem != null) {
            System.out.println("Don hang ko co item");
        }
        Order order = adOrderService.getOrderById(id);
        User user = adOrderService.getUserById(id);
        request.setAttribute("listItem", listItem);
        request.setAttribute("o", order);
        request.setAttribute("u", user);
        request.getRequestDispatcher("order_detail.jsp").forward(request, response);
    }
}