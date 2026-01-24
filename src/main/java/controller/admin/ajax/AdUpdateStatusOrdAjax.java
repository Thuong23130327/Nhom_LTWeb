package controller.admin.ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdOrderService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdUpdateStatusOrdAjax", value = "/admin/update-order-status")
public class AdUpdateStatusOrdAjax extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        AdOrderService adOrderService = new AdOrderService();
        PrintWriter out = response.getWriter();
        out.print(adOrderService.updateStatus(id, status));
        out.flush();
    }
}