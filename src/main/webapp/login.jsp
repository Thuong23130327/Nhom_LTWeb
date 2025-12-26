<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - AuraSound</title>

    <link rel="stylesheet" href="assets/css/styleHome.css">
    <link rel="stylesheet" href="assets/css/styleLogin.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet">
</head>

<body>

<%
    String password = request.getAttribute("password") == null ? "" : request.getAttribute("password") + "";
    String email = request.getAttribute("email") == null ? "" : request.getAttribute("email") + "";
    String error = request.getAttribute("error") == null ? "" : request.getAttribute("error") + "";

%>
<div class="container" id="container">
    <div class="form-container sign-up">
        <form action="register" method="post">
            <h1>Đăng ký</h1>
            <div class="social-icons">
                <a href="#" class="icon">
                    <i class="fa-brands fa-google-plus-g"></i>
                </a>
                <a href="#" class="icon">
                    <i class="fa-brands fa-facebook-f"></i>
                </a>
                <a href="admin.jsp" class="icon">
                    <i class="fa-brands fa-github"></i>
                </a>
                <a href="#" class="icon">
                    <i class="fa-brands fa-linkedin-in"></i>
                </a>
            </div>
            <span>hoặc dùng email để đăng ký</span>
            <input type="text" name="regisFullname" placeholder="Họ và tên" required />
            <input type="email" name ="regisEmail" placeholder="Email"/>
            <input type="password" name ="regisPassword"placeholder="Password"/>
            <input type="password" name ="repassword" placeholder="Nhập lại password"/>
            <p class="text-danger">${registerError}</p>
            <p class="text-success">${registerMessage}</p>
            <button type="submit" id="signUp">Đăng Ký</button>
        </form>
    </div>

    <div class="form-container sign-in">
        <form action="login" method="post">
            <h1>Đăng Nhập</h1>
            <div class="social-icons">
                <a href="#" class="icon">
                    <i class="fa-brands fa-google-plus-g"></i>
                </a>
                <a href="#" class="icon">
                    <i class="fa-brands fa-facebook-f"></i>
                </a>
                <a href="admin/admin.jsp" class="icon">
                    <i class="fa-brands fa-github"></i>
                </a>
                <a href="#" class="icon">
                    <i class="fa-brands fa-linkedin-in"></i>
                </a>
            </div>
            <input type="email" name="email" value="<%=email%>" placeholder="Nhập Email"/>
            <input type="password" name="password" value="<%=password%>"
                   placeholder="Password"/>
            <p class="text-danger"><%= error %>
            </p>
            <a href="#">Quên mật khẩu?</a>
            <button type="submit" id="signIn">Đăng Nhập</button>
            </a>
        </form>
    </div>

    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <h1>Xin Chào!</h1>
                <p>
                    Đăng ký thông tin cá nhân của bạn để sử dụng trang web
                </p>
                <button class="hidden" id="login">Đăng Nhập</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Chào Mừng Quay Lại!</h1>
                <p>
                    Nhập thông tin cá nhân của bạn để sử dụng trang web
                </p>
                <button class="hidden" id="register">Đăng Ký</button>

            </div>
        </div>
    </div>
</div>

<script src="assets/js/scriptLogin.js"></script>
</body>

</html>