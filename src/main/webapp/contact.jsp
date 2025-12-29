<%@ page import="model.User" %>
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

<main>
    <%
        //Lấy user từ session
        User user = (User) session.getAttribute("auth");
        String myEmail = "", myPhone = "", myName = "";
        if (user != null) {
            myEmail = user.getEmail();
            myPhone = (user.getPhone() != null) ? user.getPhone() : "";
            myName = user.getFullName();
        }
    %>

    <div class="contact-header">
        <h2>Liên hệ AuraSound</h2>
        Bạn muốn để lại lời nhắn hay hợp tác công việc? Đừng ngần ngại điền form nhé!
    </div>

    <section id="form-details">
        <form action="contact" method="post">

            <span class="text-success">${successMessage}</span>
            <span class="text-danger">${errorMessage}</span>

            <div class="input-group">
                <input type="text" id="ContactName" name="name" value="<%=myName%>" placeholder="Họ tên"
                       autocomplete="off">
            </div>

            <div class="input-group">
                <input type="email" id="ContactEmail" name="email" value="<%=myEmail%>" placeholder="E-mail"
                       autocomplete="off">
                <small>Lỗi: Email không đúng định dạng</small>
            </div>

            <div class="input-group">
                <input type="tel" id="ContactPhone" name="phone" value="<%=myPhone%>" placeholder="Số điện thoại"
                       autocomplete="off">
                <small>Lỗi: Số điện thoại sai</small>
            </div>

            <div class="input-group">
                <textarea id="c-message" name="message" cols="30" rows="10" placeholder="Lời nhắn"></textarea>
                <small>Vui lòng nhập lời nhắn</small>
            </div>
            <button type="submit" class="send-btn">Gửi</button>
        </form>

    </section>


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
                    <p>Từ thứ Hai đến Chủ Nhật: 9:00-22:00</p>
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
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            const nameEl = document.getElementById('ContactName');
            const emailEl = document.getElementById('ContactEmail');
            const phoneEl = document.getElementById('ContactPhone');
            const messageEl = document.getElementById('c-message');

            const showResult = (el, isValid) => {
                const parent = el.parentElement;
                const small = parent.querySelector('small');

                if (isValid) {
                    parent.classList.add('success');
                    parent.classList.remove('error');
                } else {
                    parent.classList.add('error');
                    parent.classList.remove('success');
                    small.classList.add('active')
                }
            };

            emailEl.addEventListener('input', function () {
                const value = emailEl.value;

                if (value == ''|| value.includes(' ')|| !value.includes('@') || !value.includes('.')){
                    showResult(emailEl, false);
                } else {
                    showResult(emailEl, true);
                }
            });

            messageEl.addEventListener('input', function () {
                const value = messageEl.value.trim();
                if (value === '') {
                    showResult(messageEl, false);
                } else {
                    showResult(messageEl, true);
                }
            });
        });

        function validateFinal() {
            const inputs = document.querySelectorAll('.input-group input, .input-group textarea');
            inputs.forEach(input => {
                input.dispatchEvent(new Event('input'));
            });

            const errors = document.querySelectorAll('.input-group.error');

            if (errors.length > 0) {
                alert("Thông tin chưa hợp lệ. Vui lòng kiểm tra các ô màu đỏ!");
                return false;
            }
            return true;
        }
    </script>
</main>
<%@ include file="_footer.jsp" %>

</body>

</html>