<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="Trang chủ - AuraSound" scope="request"/>

<!DOCTYPE html>
<html lang="en">

<%@ include file="_header.jsp" %>

<div class="slideshow-container">
    <div class="slides-track">
        <div class="slide"><a href="speakers.jsp" class="a-nodecor"><img src="assets/img/banner/banner_1.png"
                                                                         alt="Banner 1"></a></div>
        <div class="slide"><a href="store.jsp" class="a-nodecor"><img src="assets/img/banner/banner_2.jpg"
                                                                      alt="Banner 2"></a></div>
        <div class="slide"><a href="headphones.jsp" class="a-nodecor"><img src="assets/img/banner/banner_3.png"
                                                                           alt="Banner 3"></a></div>
        <div class="slide"><a href="speakers.jsp" class="a-nodecor"><img src="assets/img/banner/banner_4.png"
                                                                         alt="Banner 4"></a></div>
    </div>
    <button class="slide-btn prev">&#10094;</button>
    <button class="slide-btn next">&#10095;</button>
    <div class="slide-dots">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>

<main class="home-container content">
    <%-- (GIỮ NGUYÊN PHẦN NỘI DUNG CAM KẾT VÀ SẢN PHẨM CỦA BẠN Ở ĐÂY) --%>
    <%-- Để tiết kiệm chỗ hiển thị, tôi tóm tắt lại. Bạn dán lại phần Section Product của bạn vào đây --%>

    <section id="service-commitment" class="py-5">
        <div class="container row mx-auto">
            <div class="feature-box col-lg-3 col-md-6 col-12 mb-4"><i class="ri-truck-line"></i><h5 class="mt-3">GIAO
                HÀNG SIÊU TỐC  </h5>
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"></script>
</main>
<jsp:include page="_footer.jsp"/>
</body>
</html>