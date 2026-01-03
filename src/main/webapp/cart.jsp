<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>


<%
    Cart cart = (Cart) session.getAttribute("cart");
    List<CartItem> listItems = (cart != null) ? cart.getListItems() : new ArrayList<>();
    double totalPrice = (cart != null) ? cart.getTotalPrice() : 0;
    int totalQty = (cart != null) ? cart.getTotalQuantity() : 0;

    request.setAttribute("pageTitle", "Giỏ hàng - AuraSound");
    request.setAttribute("activePage", "cart");
    request.setAttribute("keepDefaultCss", true);
%>

<c:set var="customCss">
    <link rel="stylesheet" href="assets/css/styleCart.css">
</c:set>
<%@ include file="_header.jsp" %>

<main class="cart-container">
    <div class="cart-items-list">
        <%
            if (!listItems.isEmpty()) {
                for (CartItem item : listItems) {
                    Product p = item.getProduct();
        %>
        <div class="cart-item">
            <div class="item-main">
<%--Lấy ảnh từ sku--%>
                <img class="item-img" src="<%= p.getDescription() %>" alt="<%= p.getName() %>">

                <div class="item-details">
                    <h4><%= p.getName() %></h4>
                    <div class="item-variant">
                        <span>Màu: Mặc định</span>
                        <i class="bi bi-chevron-compact-down"></i>
                    </div>
                </div>
                <div class="item-price-col">
                    <span class="item-price"><%= String.format("%,.0f", item.getPrice()) %>₫</span>
                </div>
            </div>
            <div class="item-actions">
<%-- Xóa sản phẩm --%>
                <span class="item-delete"
                      onclick="if(confirm('Xóa sản phẩm này?')) location.href='CartServlet?action=delete&id=<%= p.getId() %>'">
                        Xoá
                    </span>

                <div class="quantity-control">
<%-- Giảm số lượng(mặc định q = 1) --%>
                    <button class="quantity-btn" onclick="location.href='CartServlet?action=add&id=<%= p.getId() %>&q=-1'">-</button>
                    <input class="quantity-input" type="text" value="<%= item.getQuantity() %>" readonly>
<%-- Tăng số lượng(mặc định q = 1) --%>
                    <button class="quantity-btn" onclick="location.href='CartServlet?action=add&id=<%= p.getId() %>&q=1'">+</button>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div style="text-align: center; padding: 50px;">
            <p>Giỏ hàng của bạn đang trống.</p>
            <a href="ProductListServlet" style="color: blue;">Tiếp tục mua sắm</a>
        </div>
        <%
            }
        %>
    </div>

    <div class="cart-subtotal">
        <span>Tạm tính (<%= totalQty %> sản phẩm):</span>
        <span class="subtotal-price"><%= String.format("%,.0f", totalPrice) %>₫</span>
    </div>

    <div class="checkout-button-container">
        <a href="checkout.jsp">
            <button class="checkout-button-tgdd">THANH TOÁN</button>
        </a>
    </div>
</main>

<%
    request.setAttribute("keepDefaultJs", true);
%>

<c:set var="customJs" scope="request">
    <script src="assets/js/scriptCart.js"></script>
</c:set>

<%@ include file="_footer.jsp" %>

</>

</html>