package controller;

import model.Cart;
import  model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

// DoPost xử lý hành động "Thêm vào giỏ hàng"
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
// Lấy giỏ hàng từ Session, nếu chưa có thì tạo mới
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
//Thêm vào giỏ hàng
            if ("add".equals(action)) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Thông tin Mockup (Thực tế sẽ lấy từ Database)
                double price = 1000000.0;
                String productName = "Tai nghe Bose QuietComfort";

                CartItem newItem = new CartItem(variantId, productName, quantity, price);
                cart.addItem(newItem);

            }
//Cập nhật số lượng
            else if ("update".equals(action)) {
                int newQuantity = Integer.parseInt(request.getParameter("quantity"));

                if (cart.getItems().containsKey(variantId) && newQuantity > 0) {
                    cart.getItems().get(variantId).setQuantity(newQuantity);
                }

            }
//Xóa sản phẩm
            else if ("removeOne".equals(action)) {
//Giảm số lượng
                CartItem tempItem = new CartItem();
                tempItem.setVariantId(variantId);
                tempItem.setQuantity(1); // Giảm đi 1 đơn vị
                cart.removeItem(tempItem);

            } else if ("delete".equals(action)) {
//Xóa hẳn một món đồ khỏi giỏ
                cart.getItems().remove(variantId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("cart", cart);
//Sau khi xử lý xong (Thêm/Sửa/Xóa), quay lại trang giỏ hàng
        response.sendRedirect("Cart");
    }
}