package controller.admin.ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdOrderService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AjaxActionOrder", value = "/admin/order")
public class AjaxActionOrder extends HttpServlet {
    AdOrderService adOrderService = new AdOrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu action");
            return;
        }
        switch (action) {
            case "updateStatus":
                updateStatus(request, response);
                break;
            case "updateNote":
                updateNote(request, response);
                break;

        }
    }

    private void updateNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String note = request.getParameter("status");

        PrintWriter out = response.getWriter();
        out.print(adOrderService.updateAdNote(id, note));
        out.flush();

    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        PrintWriter out = response.getWriter();
        out.print(adOrderService.updateStatus(id, status));
        out.flush();
    }
}