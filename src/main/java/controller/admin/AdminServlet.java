package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AdminService;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Map;

@WebServlet(name = "AdminServlet", value = "/admin/dashboard")
public class AdminServlet extends HttpServlet {

    private AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Map<String, Object> stats = adminService.getDashboardStats();

            System.out.println("===== DASHBOARD STATS =====");
            System.out.println(stats);

            request.setAttribute("stats", stats);

            LocalDate now = LocalDate.now();
            request.setAttribute("currentMonth", now.getMonthValue());
            request.setAttribute("currentYear", now.getYear());


            request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }

}
