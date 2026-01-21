//package controller.cart;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.Cart;
//import model.CartThuong;
//import model.ProductVariant;
//import service.CartService;
//
//import java.io.IOException;
//
//@WebServlet(name = "CartThuongServlet", value = "/cartt")
//public class CartServletThuong extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//
//    @Override
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            String nameProduct = request.getParameter("nameProduct");
//            String variantIdStr = request.getParameter("variantId");
//            String quantityStr = request.getParameter("quantity");
//
//            // 1. Kiểm tra tham số đầu vào
//            if (variantIdStr == null || variantIdStr.isEmpty()) {
//                throw new Exception("Lỗi: Không nhận được variantId từ trang sản phẩm!");
//            }
//
//            int qty = 1;
//            try {
//                qty = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 1;
//            } catch (NumberFormatException e) {
//                qty = 1;
//            }
//
//            // 2. Lấy giỏ hàng từ Session
//            HttpSession session = request.getSession();
//            CartThuong cart = (CartThuong) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new CartThuong();
//            }
//
//            // 3. Lấy Biến thể từ DB
//            CartService cartService = new CartService();
//            ProductVariant productVariant = cartService.getProductVariant(variantIdStr);
//
//            if (productVariant != null) {
//                cart.addItem(nameProduct, productVariant, qty);
//                session.setAttribute("cart", cart);
//                response.sendRedirect("cartThuong.jsp");
//            } else {
//                throw new Exception("Lỗi: Biến thể ID " + variantIdStr + " không tồn tại trong DB!");
//            }
//
//        } catch (Exception e) {
//
//        }
//    }
//}