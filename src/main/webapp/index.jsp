<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>
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

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProfile.css">

</head>

<body>
<jsp:include page="/tag/_header.jsp"></jsp:include>
<div class="slideshow-container">
    <div class="slides-track">
        <c:forEach items="${bannerList}" var="b">
            <div class="slide">
                <a href="${AuraSound}${b.targetUrl}" class="a-nodecor">
                    <img src="${AuraSound}/display-banner?name=${b.imageUrl}" alt="${b.title}">
                </a>
            </div>
        </c:forEach>
    </div>

    <button class="slide-btn prev">&#10094;</button>
    <button class="slide-btn next">&#10095;</button>

    <div class="slide-dots">
        <c:forEach items="${bannerList}" varStatus="i">
            <span class="dot ${i.first ? 'active' : ''}"></span>
        </c:forEach>
    </div>
</div>

<main class="home-container content">
    <section id="service-commitment" class="py-5">
        <div class="container row mx-auto">
            <div class="feature-box col-lg-3 col-md-6 col-12 mb-4"><i class="ri-truck-line"></i><h5 class="mt-3">GIAO
                HÀNG SIÊU TỐC </h5>
                <p>Miễn phí vận chuyển cho đơn hàng trên 1 triệu.</p></div>
            <div class="feature-box col-lg-3 col-md-6 col-12 mb-4"><i class="ri-customer-service-2-line"></i><h5
                    class="mt-3">HỖ TRỢ TRỰC TUYẾN</h5>
                <p>Đội ngũ luôn sẵn sàng 24/7 để hỗ trợ bạn.</p></div>
            <div class="feature-box col-lg-3 col-md-6 col-12 mb-4"><i class="ri-shield-check-line"></i><h5 class="mt-3">
                BẢO HÀNH CHÍNH HÃNG</h5>
                <p>Sản phẩm cam kết chất lượng 100%.</p></div>
            <div class="feature-box col-lg-3 col-md-6 col-12 mb-4"><i class="ri-refresh-line"></i><h5 class="mt-3">ĐỔI
                TRẢ DỄ DÀNG</h5>
                <p>Đổi trả miễn phí trong 30 ngày đầu tiên.</p></div>
        </div>

    </section>
</main>
<jsp:include page="/tag/_footer.jsp"></jsp:include>

<script src="${AuraSound}/assets/js/script.js"></script>
<script src="${AuraSound}/assets/js/scriptProfile.js"></script>
<script src="${AuraSound}/assets/js/scriptStore.js"></script>
</body>
</html>