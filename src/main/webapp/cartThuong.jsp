<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="/tag/_taglibs.jsp" %>--%>
<%--<%@ page import="model.CartThuong" %>--%>


<%--<%--%>
<%--    CartThuong cart = (CartThuong) session.getAttribute("cart");--%>

<%--    if (cart == null) {--%>
<%--        cart = new model.CartThuong();--%>
<%--    }--%>
<%--    request.setAttribute("pageTitle", "Giỏ hàng - AuraSound");--%>
<%--    request.setAttribute("activePage", "cart");--%>
<%--    request.setAttribute("cart", cart);--%>

<%--%>--%>

<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>${pageTitle}</title>--%>

<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">--%>
<%--    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet"/>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">--%>

<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProfile.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleCart.css">--%>

<%--</head>--%>

<%--<body>--%>
<%--<jsp:include page="/tag/_header.jsp"></jsp:include>--%>
<%--<main class="cart-container">--%>
<%--    <div class="cart-items-list">--%>
<%--        &lt;%&ndash; Dùng 'cart' từ request đã set ở Scriptlet trên đầu trang &ndash;%&gt;--%>
<%--        <c:forEach items="${cart.listItems}" var="item">--%>
<%--            <div class="cart-item" style="display: flex; align-items: center; gap: 15px;">--%>
<%--                <div class="item-checkbox">--%>
<%--                        &lt;%&ndash; Dùng item.isChecked nếu hàm là isChecked() &ndash;%&gt;--%>
<%--                    <input type="checkbox" ${item.isChecked() ? "checked" : ""}>--%>
<%--                </div>--%>
<%--                <div class="item-main">--%>
<%--                    <img class="item-img" src="${item.img}" alt="${item.name}">--%>
<%--                    <div class="item-details">--%>
<%--                        <h4>${item.name}</h4>--%>
<%--                        <div class="item-variant">--%>
<%--                            <span>Màu: ${item.productVariant.colorName}</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="item-price-col">--%>
<%--                        <span class="item-price">--%>
<%--                            <fmt:formatNumber value="${item.price}" pattern="#,###"/> ₫--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item-actions">--%>
<%--                    <h4 style="font-size: 10px">Số lượng còn:--%>
<%--                    <span id="stock" data-stock="${item.productVariant.stockQuantity}">${item.productVariant.stockQuantity} </span>--%>
<%--                    </h4>--%>
<%--                    <span class="item-delete" onclick="removeCartItem('${item.productVariant.id}')">Xoá</span>--%>
<%--                    <div class="quantity-control">--%>
<%--                        <button type="button" class="quantity-btn" onclick="updateQuan(this,-1)">-</button>--%>
<%--                        <input class="quantity-input"--%>
<%--                               type="text"--%>
<%--                               value="${item.quantity}"--%>
<%--                               data-stock="${item.productVariant.stockQuantity}"--%>
<%--                               onchange="checkInput(this)">--%>
<%--                        <button type="button" class="quantity-btn" onclick="updateQuan(this,+1)">+</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>

<%--        &lt;%&ndash; Kiểm tra nếu danh sách trống &ndash;%&gt;--%>
<%--        <c:if test="${empty cart.listItems}">--%>
<%--            <div style="text-align: center; padding: 50px;">--%>
<%--                <p>Giỏ hàng của bạn đang trống.</p>--%>
<%--                <a href="product" style="color: blue;">Tiếp tục mua sắm</a>--%>
<%--            </div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="cart-subtotal">--%>
<%--        &lt;%&ndash; Truy cập trực tiếp qua biến cart ở request &ndash;%&gt;--%>
<%--        <span>Tạm tính (${cart.totalQuantity} sản phẩm):</span>--%>
<%--        <span class="subtotal-price">--%>
<%--            <fmt:formatNumber value="${cart.totalPrice}" pattern="#,###"/> ₫--%>
<%--        </span>--%>
<%--    </div>--%>
<%--    <div class="checkout-button-container">--%>
<%--        <a href="checkout.jsp">--%>
<%--            <button class="checkout-button-tgdd">THANH TOÁN</button>--%>
<%--        </a>--%>
<%--    </div>--%>
<%--</main>--%>

<%--<jsp:include page="/tag/_footer.jsp"></jsp:include>--%>

<%--<script src="${AuraSound}/assets/js/script.js"></script>--%>
<%--<script src="${AuraSound}/assets/js/scriptProfile.js"></script>--%>
<%--<script src="${AuraSound}/assets/js/scriptStore.js"></script>--%>
<%--<script src="${AuraSound}/assets/js/scriptCart.js"></script>--%>
<%--</body>--%>
<%--</html>--%>