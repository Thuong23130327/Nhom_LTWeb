//package controller;
//
//import dao.ProductDAO;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import model.ProductDTO;
//import service.ProductService;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//@WebServlet(name = "headphonesServlet", value = "/headphones")
//public class headphonesServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        int pageSize = 30; //30 SP 1 trang
//        int page = 1;
//        request.getRequestDispatcher("/headphones.jsp").forward(request, response);
//// Lấy tham số page từ URL
//        String pageParam = request.getParameter("page");
//
//        if (pageParam != null && !pageParam.isEmpty()) {
//            page = Integer.parseInt(pageParam);
//            session.setAttribute("currentHeadphonePage", page); // Lưu vào session
//        } else {
//// Nếu URL không có page, lấy lại trang cũ từ session
//            Integer sessionPage = (Integer) session.getAttribute("currentHeadphonePage");
//            if (sessionPage != null) page = sessionPage;
//        }
//
//        ProductDAO dao = new ProductDAO();
//        int offset = (page - 1) * pageSize;
//
//// Lấy dữ liệu và tính tổng số trang
//        List<ProductDTO> list = dao.getHeadphonesByPage(pageSize, offset);
//        int totalProducts = dao.countTotalHeadphones();
//        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
//
//// Đẩy dữ liệu sang JSP
//        request.setAttribute("products", list);
//        request.setAttribute("currentPage", page);
//        request.setAttribute("totalPages", totalPages);
//
//        request.getRequestDispatcher("headphones.jsp").forward(request, response);
//    }
//
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
//
