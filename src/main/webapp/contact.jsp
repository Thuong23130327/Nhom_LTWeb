<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Liên hệ - AuraSound");
    request.setAttribute("activePage", "contact");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="assets/css/styleContact.css">
</c:set>
<%@ include file="_header.jsp" %>

    <section class="contact-header">
        <h2>Liên Hệ Aurasound</h2>
        <p>Bạn muốn để lại lời nhắn hay hợp tác công việc? Đừng ngần ngại điền form bên dưới nhé!</p>
    </section>
    <main>

        <section id="contact-details" class="section-p1">
            <div class="details">
                <h3>LIÊN HỆ</h3>
                <h2>AuraSound có mặt chính hãng duy nhất tại</h2>
                <h3>Vị trí</h3>
                <div>
                    <li>
                        <i class="fal fa-map"></i>
                        <p>Nong Lam University, VQCR+GP6, khu phố 6, Thủ Đức, Thành phố Hồ Chí Minh</p>
                    </li>
                    <li>
                        <i class="fal fa-envelope"></i>
                        <p>Aurasound.work@gmail.com</p>
                    </li>
                    <li>
                        <i class="fal fa-phone-alt"></i>
                        <p>1900 1919</p>
                    </li>
                    <li>
                        <i class="fal fa-clock"></i>
                        <p>Từ thứ Hai đến Chủ Nhật: 9:00-21:00</p>
                    </li>
                </div>
            </div>

            <div class="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2145255165465!2d106.78918141043681!3d10.8712816573926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2sNong%20Lam%20University!5e0!3m2!1sen!2s!4v1763230325191!5m2!1sen!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>

        <section id="form-details">
            <form action="">
                <span>ĐỂ LẠI LỜI NHẮN</span>
                <h2>Aurasound luôn lắng nghe bạn</h2>
                <input type="text" placeholder="Họ tên">
                <input type="text" placeholder="E-mail">
                <input type="text" placeholder="Số điện thoại">
                <textarea name="" id="" cols="30" rows="10" placeholder="Lời nhắn"></textarea>
                <button class="send-btn">Gửi</button>
            </form>
        </section>


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
    </footer>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/scriptProfile.js"></script>
    <script src="assets/js/scriptContact.js"></script>
</body>

</html>