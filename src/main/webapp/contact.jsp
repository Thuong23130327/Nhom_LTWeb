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

<section class="contact-header">
    <h2>Liên Hệ Aurasound</h2>
    <p>Bạn muốn để lại lời nhắn hay hợp tác công việc? Đừng ngần ngại điền form bên dưới nhé!</p>
</section>
<main>
    <%
        User user = (User) session.getAttribute("auth");

        String myEmail = "";
        String myPhone = "";
        String myName = "";

        if (user != null) {
            myEmail = (user.getEmail() != null) ? user.getEmail() : "";
            myPhone = (user.getPhone() != null) ? user.getPhone() : "";
            myName = (user.getFullName() != null) ? user.getFullName() : "";
        }
    %>
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

    <section id="form-details">
        <form action="contact" method="post"><% if (user != null) { %>
            <div style="margin-bottom: 15px;">
                <button type="button" onclick="autoFill()">
                    Sử dụng thông tin của tôi
                </button>
            </div>
            <% } %>
            <span class="text-success">${successMessage}</span>
            <span class="text-danger">${errorMessage}</span>
            <span>ĐỂ LẠI LỜI NHẮN</span>
            <h2>Aurasound luôn lắng nghe bạn</h2>
            <input type="text" name="name" value="<%=myName%>" placeholder="Họ tên">
            <input type="email" name="email" value="<%=myEmail%>" placeholder="E-mail">
            <input type="text" name="phone" value="<%=myPhone%>" placeholder="Số điện thoại">
            <textarea name="message" id="" cols="30" rows="10" placeholder="Lời nhắn"></textarea>
            <button type="submit" class="send-btn">Gửi</button>
        </form>
        <script>
            function autoFill() {
                var uName = "<%= myName %>";
                var uEmail = "<%= myEmail %>";
                var uPhone = "<%= myPhone %>";

                document.getElementById("txtName").value = uName;
                document.getElementById("txtEmail").value = uEmail;
                document.getElementById("txtPhone").value = uPhone;
            }
        </script>
    </section>


</main>
<%@ include file="_footer.jsp" %>

</body>

</html>