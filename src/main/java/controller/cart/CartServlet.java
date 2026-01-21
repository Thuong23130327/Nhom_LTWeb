package controller.cart;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;
import service.CartService;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        // 'id' ở đây trong ngữ cảnh giỏ hàng (cart.jsp) sẽ là variantId
        String id = request.getParameter("id");
        String qStr = request.getParameter("q");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        try {
            if (id != null) {
                int variantId = Integer.parseInt(id);

                // Xóa sản phẩm
                if ("delete".equals(action)) {
                    cart.deleteItem(variantId);
                }

                // Cộng/Trừ số lượng (Khi ấn + hoặc - trong cart.jsp)
                else if ("add".equals(action)) {
                    int qty = (qStr != null) ? Integer.parseInt(qStr) : 1;

                    // Lấy item hiện tại trong giỏ để lấy thông tin Variant và Name
                    CartItem existingItem = cart.getItems().get(variantId);

                    if (existingItem != null) {
                        // Cập nhật số lượng dựa trên phương thức ở Cart
                        cart.addOrUpdateItem(existingItem.getName(), existingItem.getProductVariant(), qty);
                    } else {
                        ProductService productService = new ProductService();
                        Product p = productService.getById(id);
                        if (p != null) {
                            CartService cartService = new CartService();
                            ProductVariant defaultVariant = cartService.getProductVariant(id);
                            if(defaultVariant != null) {
                                cart.addOrUpdateItem(p.getName(), defaultVariant, qty);
                            }
                        }
                    }
                }
                // Xử lý Checkbox
                else if ("check".equals(action)) {
                    CartItem item = cart.getItems().get(variantId);
                    if (item != null) {
                        item.setChecked(!item.isChecked());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nameProduct = request.getParameter("nameProduct");
            String variantIdStr = request.getParameter("variantId");
            String quantityStr = request.getParameter("quantity");

            // Kiểm tra tham số đầu vào
            if (variantIdStr == null || variantIdStr.isEmpty()) {
                throw new Exception("Lỗi: Không nhận được variantId từ trang sản phẩm!");
            }

            int qty = 1;
            try {
                qty = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 1;
            } catch (NumberFormatException e) {
                qty = 1;
            }

            // Lấy giỏ hàng từ Session
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            // Lấy Biến thể từ DB
            CartService cartService = new CartService();
            ProductVariant productVariant = cartService.getProductVariant(variantIdStr);

            if (productVariant != null) {
                cart.addOrUpdateItem(nameProduct, productVariant, qty);
                session.setAttribute("cart", cart);
                response.sendRedirect("cart.jsp");
            } else {
                throw new Exception("Lỗi: Biến thể ID " + variantIdStr + " không tồn tại trong DB!");
            }

        } catch (Exception e) {

        }
    }
}