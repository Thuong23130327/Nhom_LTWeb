<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>
<%
    request.setAttribute("pageTitle", "Thanh toán - AuraSound");
    request.setAttribute("activePage", "cart");
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

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProfile.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleCheckout.css">

</head>

<body>
<jsp:include page="/tag/_header.jsp"></jsp:include>

<main class="content">
    <div class="checkout-container">

        <div class="customer-details">
            <h2>Thông tin giao hàng</h2>
            <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>

            <div class="form-group">
                <label for="fullname">Họ và tên *</label>
                <input type="text" id="fullname" placeholder="Nhập họ và tên của bạn" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" placeholder="Nhập địa chỉ email">
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại *</label>
                    <input type="tel" id="phone" placeholder="Nhập số điện thoại" required>
                </div>
            </div>

            <h2>Địa chỉ nhận hàng</h2>

            <div class="form-group">
                <label for="city">Tỉnh / Thành phố *</label>
                <input type="text" id="city" required placeholder="Nhập Tỉnh/ Thành phố nơi nhận hàng">
                </input>
            </div>
            <div class="form-group">
                <label for="ward">Phường / Xã *</label>
                <input type="text" id="ward" required placeholder="Phường / Xã *">
                </input>
            </div>

            <div class="form-group">
                <label for="address">Địa chỉ cụ thể *</label>
                <input type="text" id="address" placeholder="Số nhà, tên đường..." required>
            </div>

            <div class="form-group">
                <label for="notes">Ghi chú (tùy chọn)</label>
                <textarea id="notes" rows="3"
                          placeholder="Ghi chú về đơn hàng, ví dụ: thời gian giao hàng..."></textarea>
            </div>
        </div>

        <div class="order-summary">
            <h2>Đơn hàng của bạn</h2>

            <ul class="product-list">

                <li class="product-item">
                    <div class="product-image">
                        <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/333082/loa-bluetooth-rezo-light-k238-2-638700446200610565-750x500.jpg"
                             alt="Sony XM5">
                        <span class="product-quantity">1</span>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Loa Bluetooth Rezo Light K238</p>
                        <p class="product-variant">Màu: Xanh đen</p>
                    </div>
                    <p class="product-price">600.000đ</p>
                </li>
                <li class="product-item">
                    <div class="product-image">
                        <img src="https://salt.tikicdn.com/cache/750x750/ts/product/ac/cf/71/908237eb3f6dfd93ee494866616de085.jpg.webp"
                             alt="Sony XM5">
                        <span class="product-quantity">1</span>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Tai nghe Sony WH-1000XM5</p>
                        <p class="product-variant">Màu: Trắng</p>
                    </div>
                    <p class="product-price">7.990.000đ</p>
                </li>
                <li class="product-item">
                    <div class="product-image">
                        <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/l/o/loa-jbl-charge-5-hong-pink-4.jpg"
                             alt="JBL Charge 5">
                        <span class="product-quantity">1</span>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Loa JBL Charge 5</p>
                        <p class="product-variant">Màu: Hồng</p>
                    </div>
                    <p class="product-price">4.590.000đ</p>
                </li>
            </ul>

            <div class="promo-code">
                <input type="text" placeholder="Nhập mã giảm giá">
                <button>Áp dụng</button>
            </div>

            <div class="totals">
                <div class="totals-item">
                    <p>Tạm tính:</p>
                    <p>13.180.000đ</p>
                </div>
                <div class="totals-item">
                    <p>Phí vận chuyển:</p>
                    <p>Miễn phí</p>
                </div>
                <div class="totals-item total">
                    <p>Tổng cộng:</p>
                    <p>13.180.000đ</p>
                </div>
            </div>

            <div class="payment-methods">
                <h4>Phương thức thanh toán</h4>
                <div class="payment-option">
                    <input type="radio" id="payment-cod" name="payment" value="cod" checked>
                    <label for="payment-cod">
                        <i class="bi bi-truck"></i> Thanh toán khi nhận hàng (COD)
                    </label>
                </div>
                <div class="payment-option">
                    <input type="radio" id="payment-bank" name="payment" value="bank">
                    <label for="payment-bank">
                        <i class="bi bi-credit-card"></i> Chuyển khoản ngân hàng
                    </label>
                </div>
                <div class="payment-option">
                    <input type="radio" id="payment-momo" name="payment" value="momo">
                    <label for="payment-momo">
                        <i class="bi bi-qr-code"></i> Ví Momo (QR Code)
                    </label>
                </div>
            </div>

            <button class="checkout-btn" id="btn-dat-hang">ĐẶT HÀNG</button>
        </div>
    </div>
</main>


<!-- footer -->

<footer class="footer-container">
    <div class="row container mx-auto pt-5">
        <div class="footer-one col-lg-3 col-md-6 col-12">
            <a class=" a-nodecor" href="index.jsp">
                <div class="logo-container">
                    <div class="logo-wave">
                        <div class="sound-wave wave1"></div>
                        <div class="sound-wave wave2"></div>
                        <div class="sound-wave wave3"></div>
                    </div>
                    <span class="logo-text">AuraSound</span>
                </div>
            </a>

            <p class="pt-3">Với Aura Sound, âm nhạc không chỉ để nghe – mà là để cảm nhận. Mỗi nhịp điệu, mỗi giai
                điệu đều
                được
                tái hiện chân thực, giúp bạn thể hiện phong cách và cá tính qua từng thanh âm.</p>
        </div>
        <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
            <h5 class="pb-2">Featured</h5>
            <ul class="text-uppercase list-unstyled">
                <li><a href="#">Tai nghe thể thao</a></li>
                <li><a href="#">Tai nghe cao cấp</a></li>
                <li><a href="#">Loa cao cấp</a></li>
                <li><a href="#">Tai nghe SONY</a></li>
                <li><a href="#">Loa JBL</a></li>
            </ul>
        </div>
        <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
            <h5 class="pb-2">Liên Hệ</h5>
            <div>
                <h6 class="text-uppercase">Địa chỉ</h6>
                <p>Nong Lam University, VQCR+GP6, khu phố 6, Thủ Đức, Thành phố Hồ Chí Minh</p>
            </div>
            <div>
                <h6 class="text-uppercase">Hotline</h6>
                <p>1900 1919</p>
            </div>
            <div>
                <h6 class="text-uppercase">Email</h6>
                <p>Aurasound.work@gmail.com</p>
            </div>
        </div>
        <div class="footer-one col-lg-3 col-md-6 col-12">
            <h5 class="pb-2">Instagram</h5>
            <div class="row">
                <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img1.jpg" alt="">
                <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img10.jpg" alt="">
                <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img2.jpg" alt="">
                <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img5.jpg" alt="">
                <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img6.jpg" alt="">
            </div>
        </div>
    </div>

    <div class="copyright mt-5">
        <div class="row container mx-auto">
            <div class="col-lg-3 col-md-6 col-12 mb-4">
                <img src="assets/img/Payment/payment.png" alt="">
            </div>
            <div class="col-lg-4 col-md-6 col-12 text-nowrap mb-2">
                <p>© 2025 Công Ty Cổ Phần AuraSound </p>
            </div>
            <div class="col-lg-4 col-md-6 col-12">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>

    </div>
</footer>

<div id="success-popup" class="popup-content-wrap">
    <div class="popup-content">
        <button class="popup-close-btn" id="popup-close">
            <i class="bi bi-x-lg"></i>
        </button>
        <div class="icon-box">
            <i class="bi bi-check-lg"></i>
        </div>
        <h3>Đặt hàng thành công!</h3>
    </div>
</div>


<jsp:include page="/tag/_footer.jsp"></jsp:include>

<script src="${AuraSound}/assets/js/script.js"></script>
<script src="${AuraSound}/assets/js/scriptProfile.js"></script>
</body>
</html>