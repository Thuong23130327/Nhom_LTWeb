package controller.cart;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;
import service.CartService;
import service.ProductService;
import service.ProductVariantService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String qStr = request.getParameter("q");
        String newVariantId = request.getParameter("newVariantId"); // Chọn biến thể

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        response.setCharacterEncoding("UTF-8");

        try {
            // Khởi tạo Service
            CartService cartService = new CartService();
            ProductVariantService variantService = new ProductVariantService();

            // Xử lý AJAX Update Variant
            if ("updateVariant".equals(action) && id != null) {
                String newVariantIdStr = request.getParameter("newVariantId");

                if (newVariantIdStr != null) {
                    int oldVid = Integer.parseInt(id);
                    int newVid = Integer.parseInt(newVariantIdStr); // Tùy logic CartService của bạn nhận String hay int

                    // Gọi Service cập nhật giỏ hàng
                    boolean isUpdated = cartService.updateVariant(cart, oldVid, newVariantIdStr);

                    if (isUpdated) {
                        // Cập nhật lại session
                        session.setAttribute("cart", cart);

                        // Lấy dữ liệu biến thể từ db -> Client
                        ProductVariant newVar = variantService.getProductVariant(newVariantIdStr);

                        // Phản hồi JSON
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        PrintWriter out = response.getWriter();

                        if (newVar != null) {
                            StringBuilder json = new StringBuilder();
                            json.append("{");
                            json.append("\"status\": \"success\",");
                            json.append("\"newId\": ").append(newVar.getId()).append(",");
                            json.append("\"img\": \"").append(newVar.getMainImageUrl()).append("\",");
                            json.append("\"price\": ").append(newVar.getSellPrice()).append(",");
                            json.append("\"name\": \"").append(newVar.getColorName()).append("\",");
                            json.append("\"totalOrder\": ").append(cart.getTotalPrice());
                            json.append("}");

                            out.print(json.toString());
                        } else {
                            out.print("{\"status\": \"error\", \"message\": \"Không tìm thấy biến thể\"}");
                        }
                        out.flush();
                        return;
                    }
                }
            }

            if (id != null) {
                int variantId = Integer.parseInt(id);
                boolean isSuccess = false;

                // Xóa sản phẩm
                if ("delete".equals(action)) {
                    cart.deleteItem(variantId);
                    isSuccess = true;
                }

                // Cộng/Trừ số lượng (Khi ấn + hoặc - trong cart.jsp)
                else if ("add".equals(action)) {
                    int qty = (qStr != null) ? Integer.parseInt(qStr) : 1;

                    // Lấy item hiện tại trong giỏ để lấy thông tin Variant và Name
                    CartItem existingItem = cart.getItems().get(variantId);

                    if (existingItem != null) {
                        // Cập nhật số lượng dựa trên phương thức ở Cart
                        cart.addOrUpdateItem(existingItem.getName(), existingItem.getProductVariant(), qty);
                        isSuccess = true;
                    } else {
                        Product p = cartService.getProductById(id);
                        if (p != null) {
                            ProductVariant defaultVariant = CartService.getProductVariant(id);
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
                        isSuccess = true;
                    }
                }

                session.setAttribute("cart", cart);

                // Phản hồi JSON
                if ("ajax".equals(newVariantId)) {
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();

                    // Lấy thông tin item hiện tại
                    CartItem currentItem = cart.getItems().get(variantId);
                    int currentItemQty = (currentItem != null) ? currentItem.getQuantity() : 0;

                    // Tính tổng tiền
                    double totalPrice = cart.getTotalPrice();
                    int totalQty = cart.getTotalQuantity();

                    StringBuilder json = new StringBuilder();
                    json.append("{");
                    json.append("\"status\": \"success\",");
                    json.append("\"action\": \"").append(action).append("\",");
                    json.append("\"itemId\": ").append(variantId).append(",");
                    json.append("\"itemQty\": ").append(currentItemQty).append(",");
                    json.append("\"cartTotal\": ").append(totalPrice).append(",");
                    json.append("\"cartQty\": ").append(totalQty);
                    json.append("}");

                    out.print(json.toString());
                    out.flush();
                    return;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Trả về lỗi
            if ("ajax".equals(newVariantId)) {
                response.setStatus(500);
                response.getWriter().write("{\"status\": \"error\"}");
                return;
            }
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
                session.setAttribute("cart", cart);
            }

            // Lấy Biến thể từ DB
            ProductVariant productVariant = CartService.getProductVariant(variantIdStr);

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