package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import service.AdOrderService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AMOrderServlet", value = "/admin/manage-order")
public class AMOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> list = new ArrayList<>();
        AdOrderService adOrderService = new AdOrderService();
        list = adOrderService.geAllOrders();


        request.setAttribute("list", list);
        request.getRequestDispatcher("/WEB-INF/views/admin/orders.jsp").forward(request, response);

    }

}