package controller.cart;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.CartItem;
import model.Product;

import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
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
                int productId = Integer.parseInt(id);

                // Xóa sản phẩm thẳng (Khi ấn nút Xoá)
                if ("delete".equals(action)) {
                    cart.deleteItem(productId);
                }
                // Cộng/Trừ số lượng (Khi ấn + hoặc -)
                else if ("add".equals(action)) {
                    int qty = (qStr != null) ? Integer.parseInt(qStr) : 1;

                    // Sử dụng hàm getById lấy sản phẩm
                    Product p = new ProductDAO().getById(id);

                    if (p != null) {
                        cart.addOrUpdateItem(p, qty);
                    }
                } else if ("check".equals(action)) {
                    for (CartItem item : cart.getListItems()) {
                        if (item.getProduct().getId() == Integer.parseInt(id)) {
                            item.setChecked(!item.isChecked());
                            break;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Quay lại cart để cập nhật giao diện
        response.sendRedirect("cart.jsp");
    }
// TAO CÓ CHỈNH LẠI CÁI HIỂN THỊ CHO ĐÚG SP+SỐ LG, VOI GỌN HƠN AH
// BAM VÔ SP NÀO DO RÒI THÊM VÔ GIỎ XEM THỬ
// (CHƯA CHỈNH LẠI CẬP NHẬT SỐ LG, VỚI XỬ LÝ CHECKBOX THÔI)

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String variantId = request.getParameter("variantId");
        String quantityStr = request.getParameter("quantity");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if (variantId != null) {
            int qty = (quantityStr != null) ? Integer.parseInt(quantityStr) : 1;
            Product p = new ProductDAO().getById(variantId);
            if (p != null) {
                cart.addOrUpdateItem(p, qty);
            }
        }
        response.sendRedirect("cart.jsp");
    }
}