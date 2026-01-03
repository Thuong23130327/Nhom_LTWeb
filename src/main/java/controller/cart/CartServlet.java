//package controller.cart;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import model.Cart;
//import model.Product;
//import service.ProductService;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet(name = "CartServlet", value = "/CartServlet")
//public class CartServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        int quantity = Integer.parseInt(request.getParameter("q"));
//        HttpSession session = request.getSession();
//
//        try {
//// Khởi tạo SERVICE bên trong khối try
//            ProductService productService = new ProductService();
//            Product product = productService.getProduct(id);
//
//            if (product != null) {
//                Cart cart = (Cart) session.getAttribute("cart");
//                if (cart == null) {
//                    cart = new Cart();
//                }
//                cart.addItem(product, quantity);
//                session.setAttribute("cart", cart);
//                response.setContentType("text/plain");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write(String.valueOf(cart.getTotalQuantity()));
//// Cập nhật lại session sau khi thêm hàng
//                response.sendRedirect(request.getContextPath() + "/ProductListServlet");
//            }
//
//            response.sendRedirect(request.getContextPath() + "/ProductListServlet");
//            return;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.sendError(500, "Lỗi kết nối cơ sở dữ liệu");
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
