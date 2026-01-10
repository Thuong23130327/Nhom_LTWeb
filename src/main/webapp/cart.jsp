
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>
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

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleProfile.css">
    <link rel="stylesheet" href="assets/css/styleCart.css">

</head>

<body>
<jsp:include page="/tag/_header.jsp"></jsp:include>
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

<jsp:include page="tag/_footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scriptProfile.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scriptStore.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scriptCart.js"></script>
</body>
</html>