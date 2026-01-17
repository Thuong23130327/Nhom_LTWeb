<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>
<%
    request.setAttribute("pageTitle", "Đơn hàng đã hủy - AuraSound");
    request.setAttribute("activePage", "profile");
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
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProfile.css">

</head>

<body>
<jsp:include page="/tag/_header.jsp"></jsp:include>

<!-- secion -->

<main class="profile-page-main">
    <div class="profile-container">
        <div class="profile-sidebar">
            <div class="user-info"><img class="img-profile" src="../assets/img/avatar/HoaiThuong.png" alt="Avatar">
                <h5 class="user-name">Chào, Nguyễn Hoài Thương</h5>
                <p class="user-email">23130327@st.hcmuaf.edu.vn</p>
            </div>
            <div class="side-menu mobile-hidden" id="sideMenuContent">
                <ul class="nav-list">
                    <li><a class="nav-link" href="profile.jsp"><i class="fa-solid fa-user icon"></i> Thông
                        tin tài khoản</a></li>
                    <li><a class="nav-link" href="favorites.jsp"><i class="fa-solid fa-heart icon"></i> Sản phẩm
                        yêu thích</a></li>
                    <li><a class="nav-link" href="order-shipping.jsp"><i class="fa-solid fa-truck icon"></i> Đang
                        vận chuyển</a></li>
                    <li><a class="nav-link" href="order-pending.jsp"><i class="fa-solid fa-clock icon"></i> Đang
                        chờ duyệt</a></li>
                    <li><a class="nav-link active" href="order-cancelled.jsp"><i class="fa-solid fa-ban icon"></i>
                        Đã hủy</a></li>
                    <li><a class="nav-link" href="order-history.jsp"><i class="fa-solid fa-history icon"></i> Lịch
                        sử mua hàng</a></li>
                </ul>
            </div>
        </div>
        <section class="profile-content">
            <h3 class="title">Đơn hàng đã hủy</h3>
            <a class="a-nodecor" href="../order-detail.jsp">
                <div class="list-item">
                    <div class="item-order cancelled">#AS0891 - Đã hủy: 12/10/2025</div>
                </div>
            </a>
        </section>
    </div>
</main>


<jsp:include page="/tag/_footer.jsp"></jsp:include>

<script src="${AuraSound}/assets/js/script.js"></script>
<script src="${AuraSound}/assets/js/scriptProfile.js"></script>
<script src="${AuraSound}/assets/js/scriptStore.js"></script>
</body>
</html>