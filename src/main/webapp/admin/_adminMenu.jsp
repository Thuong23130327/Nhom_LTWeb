<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="position-sticky pt-3">
        <ul class="nav flex-column" id="sidebar-menu">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/admin.jsp" class="nav-link" aria-current="page"><i
                        class="fas fa-home"></i> Admin</a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/users.jsp" class="nav-link"><i
                        class="fas fa-users"></i> Quản lý Người
                    dùng</a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/product_detail.jsp" class="nav-link"><i
                        class="fas fa-shopping-cart"></i> Quản lý
                    Đơn hàng</a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/products.jsp" class="nav-link"><i
                        class="fas fa-box"></i> Quản lý Sản
                    phẩm</a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/reports.jsp" class="nav-link"><i
                        class="fas fa-chart-line"></i> Báo cáo &
                    Thống kê</a>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>
