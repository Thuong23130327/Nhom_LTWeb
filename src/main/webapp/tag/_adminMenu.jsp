<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar shadow-sm">
        <a class="a-nodecor logo-container" href="index.jsp">
            <div class="logo-wave">
                <div class="sound-wave wave1"></div>
                <div class="sound-wave wave2"></div>
                <div class="sound-wave wave3"></div>

            </div>

            <span class="logo-text">AuraSound Admin</span>
        </a>

        <ul class="nav flex-column">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <i class="fas fa-home me-2"></i>
                    Tổng quan
                </a>
            </li>

            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-shopping-cart me-2"></i>
                    Quản lý đơn hàng
                </a>
            </li>

            <li class="nav-item">
                <a href="${AuraSound}/admin/user-manager" class="nav-link"><i
                        class="fas fa-users"></i> Quản lý Người
                    dùng</a>
            </li>

            <li class="nav-item">
                <a href="${AuraSound}/admin/voucher.jsp" class="nav-link">
                    <i class="fa-solid fa-comment-dots me-2"></i>
                    Quản lý Voucher
                </a>
            </li>

            <li class="nav-item">
                <a href="${AuraSound}/admin/product-manager" class="nav-link"><i
                        class="fas fa-box"></i> Quản lý Sản
                    phẩm</a>
            </li>

            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fa-solid fa-list me-2"></i>
                    Danh mục
                </a>
            </li>

            <li class="nav-item">
                <a href="${AuraSound}/index.jsp" class="nav-link">
                    <i class="fa-solid fa-earth-asia me-2"></i>
                    Xem website
                </a>
            </li>

            <li class="nav-item">
                <a href="${AuraSound}/logout" class="nav-link text-danger">
                    <i class="fa-solid fa-right-from-bracket me-2"></i>
                    Đăng xuất
                </a>
            </li>
        </ul>

</nav>
