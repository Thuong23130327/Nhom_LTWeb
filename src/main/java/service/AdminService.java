package service;

import dao.adminDAO.AdminDAO;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AdminService  {

    private AdminDAO adminDAO = new AdminDAO();

    public Map<String, Object> getDashboardStats() throws SQLException, ClassNotFoundException {

        Map<String, Object> stats = new HashMap<>();

        //khách hàng, đơn hàng
        stats.put("totalProducts", adminDAO.totalProducts());
        stats.put("totalOrders", adminDAO.totalOrders());
        stats.put("ordersPending", adminDAO.ordersPending());
        stats.put("totalCustomer", adminDAO.totalCustomer());

        //doanh thu
        stats.put("totalRevenue", adminDAO.totalRevenue());
        stats.put("yearRevenue", adminDAO.yearRevenue());
        stats.put("monthRevenue", adminDAO.monthRevenue());
        stats.put("dayRevenue", adminDAO.dayRevenue());

        //data chart
        stats.put("chartRevenue", adminDAO.chartRevenue());
        stats.put("sevenDaysRevenue", adminDAO.chartSevenDaysRevenue());

        return stats;
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        AdminService a = new AdminService();
        System.out.println(a.getDashboardStats());

    }

}
