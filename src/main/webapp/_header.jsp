<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    <c:choose>
        <c:when test="${not empty customCss}">
            ${customCss}
            <c:if test="${keepDefaultCss == true}">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleStore.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleHome.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleProfile.css">
            </c:if>
        </c:when>

        <c:otherwise>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleStore.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleHome.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleProfile.css">
        </c:otherwise>
    </c:choose>
</head>

<body>
<button onclick="backTop()" id="back-top-btn" title="Lên đầu trang">
    <i class="bi bi-caret-up-fill"></i>
</button>

<header>
    <div class="header-container content">
        <div class="head-left">
            <div class="head-scroll">
                <div class="text-item">AuraSound - Âm thanh định hình phong cách</div>
                <div class="text-item">Chuyên các loại Loa, Tai nghe chính hãng</div>
                <div class="text-item">AuraSound - Âm thanh định hình phong cách</div>
                <div class="text-item">Bảo hành 1 đổi 1 trong 1 tháng</div>
            </div>
        </div>
        <div class="head-right">
            <div class="info-item"><a href="contact.jsp">Cửa hàng gần đây</a></div>
            <div class="info-item"><a href="profileM/order-history.jsp">Tra cứu đơn hàng</a></div>
            <div class="info-item"><a href="tel:19001919">1900 1919</a></div>
        </div>
    </div>
</header>

<nav>
    <div class="nav-container content">
        <div class="nav-left">
            <a class="a-nodecor logo-container" href="index.jsp">
                <div class="logo-wave">
                    <div class="sound-wave wave1"></div>
                    <div class="sound-wave wave2"></div>
                    <div class="sound-wave wave3"></div>
                </div>
                <span class="logo-text">AuraSound</span>
            </a>
        </div>
        <div class="nav-right">
            <div class="searchBar">
                <input type="text" placeholder="Tìm kiếm">
                <a href="#"><i class="bi bi-search"></i></a>
            </div>
            <a class="a-nodecor ${activePage =='home'?'active':''}" href="index.jsp">
                <div class="home">Trang chủ</div>
            </a>
            <a class="a-nodecor ${activePage =='contact'?'active':''}" href="contact.jsp">
                <div class="contact">Liên hệ</div>
            </a>
            <div class="nav-item-dropdown aura-dropdown-container">
                <a class="a-nodecor ${activePage =='product'?'active':''}" href="${pageContext.request.contextPath}/product">
                    <div class="store">
                        Sản phẩm <i class="bi bi-chevron-compact-down"></i>
                    </div>
                </a>

                <ul class="aura-menu-parent">
                    <c:forEach items="${parentList}" var="par">
                        <li class="aura-menu-item has-child">
                            <a href="product?cateId=${par.id}" class="parent-link">
                                    ${par.name}
                                <i class="bi bi-chevron-right ms-auto"></i>
                            </a>

                            <ul class="aura-menu-child">
                                <c:forEach items="${childList}" var="child">
                                    <c:if test="${child.parentId == par.id}">
                                        <li>
                                            <a href="product?cateId=${child.id}">${child.name}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>


        <a class="a-nodecor ${activePage =='cart'?'active':''}" href="cart.jsp">
            <div class="cart">
                <i class="bi bi-cart"></i> Giỏ hàng
                <span id="cart-badge" class="badge bg-danger rounded-pill"
                      style="font-size: 0.7rem; vertical-align: top; ${sessionScope.cart == null ? 'display:none' : ''}">
                    ${sessionScope.cart != null ? sessionScope.cart.totalQuantity : 0}
                </span>
            </div>
        </a>

        <div class="nav-account">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <div class="account-avatar">
                        <a href="profileM/profile.jsp" class="avatar-link">
                            <img src="${sessionScope.loggedInUser.avatarUrl}" alt="Avatar">
                        </a>
                        <div class="account-menu">
                            <a class="account-menu-item" href="profileM/profile.jsp">Thông tin tài khoản</a>
                            <a class="account-menu-item" href="logout" id="navLogout">Đăng xuất</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a class="a-nodecor login-link" href="login.jsp">
                        <div class="login">Đăng nhập</div>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
        <div id="hamburger-icon"><i class="bi bi-list"></i></div>
    </div>
    </div>
</nav>

<div class="mobile-menu" id="mobile-menu-container">
    <div class="mobile-menu-header">
        <div class="logo-container">
            <span class="logo-text">AuraSound</span>
        </div>
        <i class="bi bi-x-lg" id="mobile-menu-close"></i>
    </div>
    <div class="mobile-menu-item">
        <div class="searchBar">
            <input type="text" placeholder="Tìm kiếm">
            <a href="#"><i class="ri-search-line"></i></a>
        </div>
    </div>
    <c:choose>
        <c:when test="${not empty sessionScope.loggedInUser}">
            <div class="mobile-menu-item"><a href="profileM/profile.jsp">Thông tin tài khoản</a></div>
            <div class="mobile-menu-item"><a href="logout">Đăng xuất</a></div>
        </c:when>
        <c:otherwise>
            <div class="mobile-menu-item"><a href="login.jsp" class="nav-login-btn">Đăng nhập</a></div>
        </c:otherwise>
    </c:choose>
    <div class="mobile-menu-item ${activePage =='cart'?'active':''}"><a href="cart.jsp">Giỏ hàng</a></div>
    <div class="mobile-menu-item ${activePage =='contact'?'active':''}"><a href="contact.jsp">Liên hệ</a></div>
    <div class="mobile-menu-item ${activePage =='product'?'active':''}"><a href="store.jsp">Sản phẩm</a></div>
</div>
<div class="overlay" id="menu-overlay"></div>