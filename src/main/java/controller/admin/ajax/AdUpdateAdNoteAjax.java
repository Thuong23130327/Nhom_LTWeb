package controller.admin.ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdOrderService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdUpdateAdNoteAjax", value = "/admin/update-admin-note")
public class AdUpdateAdNoteAjax extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String note = request.getParameter("status");

        AdOrderService adOrderService = new AdOrderService();
        PrintWriter out = response.getWriter();
        out.print(adOrderService.updateAdNote(id, note));
        out.flush();
    }
}