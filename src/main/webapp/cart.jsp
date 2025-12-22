
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Giỏ hàng - AuraSound");
    request.setAttribute("activePage", "cart");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="assets/css/styleCart.css">
</c:set>
<%@ include file="_header.jsp" %>

    <main class="cart-container">
        <div class="cart-items-list">
            <div class="cart-item">
                <div class="item-main">
                    <img class="item-img"
                        src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/333082/loa-bluetooth-rezo-light-k238-2-638700446200610565-750x500.jpg"
                        alt="Sản phẩm">
                    <div class="item-details">
                        <h4>Loa Bluetooth Rezo Light K238</h4>
                        <div class="item-variant">
                            <span>Màu: Xanh</span>
                            <i class="bi bi-chevron-compact-down"></i>
                            <div class="variant-dropdown">
                                <div class="variant-option" onclick="selectColor(this)">Màu: Vàng</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Be</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Đen</div>
                            </div>
                        </div>
                        <div class="item-promo">
                            <i class="bi bi-ticket-perforated-fill"></i>
                            <span> 6 Khuyến mãi</span>
                            <i class="bi bi-chevron-compact-down"></i>
                        </div>
                    </div>
                    <div class="item-price-col">
                        <span class="item-price">600.000₫</span>
                    </div>
                </div>
                <div class="item-actions">
                    <span class="item-delete">Xoá</span>
                    <div class="quantity-control">
                        <button class="quantity-btn" aria-label="Giảm">-</button>
                        <input class="quantity-input" type="text" value="1" aria-label="Số lượng">
                        <button class="quantity-btn" aria-label="Tăng">+</button>
                    </div>
                </div>
            </div>

            <div class="cart-item">
                <div class="item-main">
                    <img class="item-img"
                        src="https://salt.tikicdn.com/cache/750x750/ts/product/ac/cf/71/908237eb3f6dfd93ee494866616de085.jpg.webp"
                        alt="Sản phẩm">
                    <div class="item-details">
                        <h4>Tai nghe Sony WH-1000XM5</h4>
                        <div class="item-variant">
                            <span>Màu: Trắng</span>
                            <i class="bi bi-chevron-compact-down"></i>
                            <div class="variant-dropdown">
                                <div class="variant-option" onclick="selectColor(this)">Màu: Be</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Xanh Dương</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Đen</div>
                            </div>
                        </div>

                    </div>
                    <div class="item-price-col">
                        <span class="item-price">7.990.000đ</span>
                    </div>
                </div>
                <div class="item-actions">
                    <span class="item-delete">Xoá</span>
                    <div class="quantity-control">
                        <button class="quantity-btn" aria-label="Giảm">-</button>
                        <input class="quantity-input" type="text" value="1" aria-label="Số lượng">
                        <button class="quantity-btn" aria-label="Tăng">+</button>
                    </div>
                </div>
            </div>

            <div class="upsell-section">
                <div class="upsell-header">
                    <i class="ri-shoppin g-bag-3-line"></i>
                    <strong>Mua kèm giảm giá 20%</strong>
                    <i class="ri-arrow-down-s-line arrow-icon"></i>
                </div>
                <div class="upsell-body">

                    <div class="upsell-items">
                        <div class="upsell-item">
                            <a class="a-nodecor" href="sproduct.jsp">
                                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-bluetooth-true-wireless-oppo-enco-buds-3_3_.png"
                                    alt="Tai nghe">
                                <span class="upsell-discount">-20%</span>
                                <p class="upsell-name">Tai nghe Bluetooth True Wireless OPPO Enco Buds3</p>
                                <span class="upsell-new-price">710.000₫</span>
                                <span class="upsell-old-price">800.000₫</span>
                                <button class="upsell-add-btn">Chọn mua</button>
                            </a>
                        </div>
                        <div class="upsell-item">
                            <a class="a-nodecor" href="sproduct.jsp">
                                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/_/____product-images__white__front_cover_opening_cmyk.png"
                                    alt="Tai nghe">
                                <span class="upsell-discount">-20%</span>
                                <p class="upsell-name">Tai nghe Bluetooth True Wireless OPPO Enco Buds 2</p>
                                <span class="upsell-new-price">1.560.000₫</span>
                                <span class="upsell-old-price">1.950.000₫</span>
                                <button class="upsell-add-btn">Chọn mua</button>
                            </a>
                        </div>
                        <div class="upsell-item">
                            <a class="a-nodecor" href="sproduct.jsp">
                                <img src="https://cdn.tgdd.vn/Products/Images/54/326589/tai-nghe-co-day-ep-ava-livebass-e1-trang-1-1-750x500.jpg"
                                    alt="Tai nghe">
                                <span class="upsell-discount">-20%</span>
                                <p class="upsell-name">Tai nghe AVA+ E1</p>
                                <span class="upsell-new-price">190.000₫</span>
                                <span class="upsell-old-price">240.000₫</span>
                                <button class="upsell-add-btn">Chọn mua</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cart-item">
                <div class="item-main">
                    <img class="item-img"
                        src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/l/o/loa-jbl-charge-5-hong-pink-4.jpg"
                        alt="Sản phẩm">
                    <div class="item-details">
                        <h4>Loa JBL Charge 5</h4>
                        <div class="item-variant">
                            <span>Màu: Hồng</span>
                            <i class="ri-arrow-down-s-line"></i>
                            <div class="variant-dropdown">
                                <div class="variant-option" onclick="selectColor(this)">Màu: Trắng</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Xanh Dương</div>
                                <div class="variant-option" onclick="selectColor(this)">Màu: Vàng</div>
                            </div>
                        </div>
                    </div>
                    <div class="item-price-col">
                        <span class="item-price">4.590.000đ</span>
                    </div>
                </div>
                <div class="item-actions">
                    <span class="item-delete">Xoá</span>
                    <div class="quantity-control">
                        <button class="quantity-btn" aria-label="Giảm">-</button>
                        <input class="quantity-input" type="text" value="1" aria-label="Số lượng">
                        <button class="quantity-btn" aria-label="Tăng">+</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="cart-subtotal">
            <span>Tạm tính (2 sản phẩm):</span>
            <span class="subtotal-price">10.490.000₫</span>
        </div>
        <div class="checkout-button-container">
            <a href="checkout.jsp">
                <button class="checkout-button-tgdd">
                    THANH TOÁN
                </button>
            </a>
        </div>
    </main>
    
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
        </section>
    </footer>

    <script src="assets/js/script.js"></script>
    <script src="assets/js/scriptProfile.js"></script>
    <script src="assets/js/scriptCart.js"></script>

</body>

</html>