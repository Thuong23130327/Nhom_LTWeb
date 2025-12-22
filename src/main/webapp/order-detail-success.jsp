<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Đơn hàng - AuraSound");
    request.setAttribute("activePage", "profile");
%>
<%@ include file="_header.jsp" %>

    <main class="profile-page-main">
        <div class="profile-container">

            <div class="profile-sidebar" id="profileSidebar">
                <div class="user-info">
                    <img class="img-profile" src="assets/img/avatar/HoaiThuong.png" alt="Avatar">
                    <h5 class="user-name">Chào, Nguyễn Hoài Thương</h5>
                    <p class="user-email">23130327@st.hcmuaf.edu.vn</p>
                </div>

                <div class="side-menu mobile-hidden" id="sideMenuContent">
                    <ul class="nav-list">
                        <li><a class="nav-link" href="profileM/profile.jsp"><i class="fa-solid fa-user icon"></i> Thông
                                tin tài khoản</a></li>
                        <li><a class="nav-link" href="profileM/favorites.jsp"><i class="fa-solid fa-heart icon"></i>
                                Sản
                                phẩm đã
                                yêu thích</a></li>
                        <li><a class="nav-link" href="profileM/order-shipping.jsp"><i
                                    class="fa-solid fa-truck icon"></i> Đang
                                vận chuyển</a></li>
                        <li><a class="nav-link" href="profileM/order-pending.jsp"><i
                                    class="fa-solid fa-clock icon"></i> Đang
                                chờ duyệt</a></li>
                        <li><a class="nav-link" href="profileM/order-cancelled.jsp"><i
                                    class="fa-solid fa-ban icon"></i> Đã
                                hủy</a></li>
                        <li><a class="nav-link active" href="profileM/order-history.jsp"><i
                                    class="fa-solid fa-history icon"></i> Lịch
                                sử mua hàng</a></li>
                    </ul>
                </div>
            </div>

            <div class="profile-content">
                <a href="profileM/order-history.jsp" class="back-link">
                    <i class="fa-solid fa-arrow-left"></i> TRỞ LẠI
                </a>

                <div class="order-detail-header">
                    <h3 class="title" style="margin-bottom: 0; border-bottom: none;">Chi tiết đơn hàng #AS0780</h3>
                    <span class="order-status completed">
                        <i class="fa-solid fa-check-circle"></i> Hoàn tất
                    </span>
                </div>

                <div class="order-detail-block">
                    <h4>Sản phẩm</h4>
                    <div class="block-content">
                        <div class="product-item-detail">
                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/l/o/loa-bluetooth-harman-kardon-aura-studio-5-den_7_.png"
                                alt="Sản phẩm 1">
                            <div class="product-info">
                                <p class="product-name">Loa Bluetooth Harman Kardon Aura Studio 5</p>
                                <p class="product-qty">x 1</p>
                            </div>
                            <div class="product-price">8.400.000₫</div>
                        </div>

                        <div class="order-total">
                            <span>Thành tiền:</span>
                            <span class="total-price">8.400.000₫</span>
                        </div>
                    </div>
                </div>

                <div class="order-detail-block">
                    <h4>Thông tin đơn hàng</h4>
                    <div class="block-content">
                        <ul class="order-info-list">
                            <li>
                                <strong>Mã đơn hàng:</strong>
                                <span>#AS0780</span>
                            </li>
                            <li>
                                <strong>Ngày đặt:</strong>
                                <span>01-08-2025 10:15</span>
                            </li>
                            <li>
                                <strong>Ngày giao hàng:</strong>
                                <span>03-08-2025 14:00</span>
                            </li>
                            <li>
                                <strong>Trạng thái:</strong>
                                <span>Đã giao hàng thành công</span>
                            </li>
                            <li>
                                <strong>Phương thức thanh toán:</strong>
                                <span>COD</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="order-detail-block">
                    <h4>Địa chỉ nhận hàng</h4>
                    <div class="block-content address-info">
                        <strong>Nguyễn Hoài Thương</strong>
                        <p>0708870329</p>
                        <p>10 Đường số 5, Phường Linh Xuân, TP.HCM</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

<%@ include file="_footer.jsp" %>

</body>

</html>