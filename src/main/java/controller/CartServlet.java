package controller;

import com.aurasound.model.Cart;
import com.aurasound.model.CartItem;

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

// Lấy thông tin từ Request (giả định form gửi variantId và quantity)
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

// Đã có logic truy vấn DB để lấy giá và tên theo variantId ***
        double price = 1000000.0; // Giá bán (Mock)
        String productName = "Tai nghe Bose QuietComfort (Xanh Navy)"; // Tên SP (Mock)

// Lấy đối tượng Cart từ Session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

// Tạo CartItem và thêm vào giỏ
        CartItem newItem = new CartItem(variantId, productName, quantity, price);
        cart.addItem(newItem);

// Lưu lại đối tượng Cart đã cập nhật vào Session
        session.setAttribute("cart", cart);

// Chuyển hướng người dùng về trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }
}