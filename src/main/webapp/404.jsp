<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi 404 | AuraSound</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleHome.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7faff;
            color: #333;
            display: grid;
            min-height: 100vh;
            text-align: center;
            padding: 20px;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
        }

        .error-code {
            font-size: 10rem;
            font-weight: 800;
            line-height: 1;
            background: var(--theme-gradient-button);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-fill-color: transparent;
            text-shadow: 2px 2px 10px rgba(0, 123, 255, 0.1);
            margin-bottom: 10px;
        }

        .error-title {
            font-size: 35px;
            font-weight: 600;
            color: #222;
            margin-bottom: 15px;
        }

        .error-message {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .home-button {
            display: inline-block;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 600;
            color: #fff;
            background-color: var(--theme-color-secondary);
            padding: 12px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
        }

        .home-button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.4);
        }

        .footer-brand {
            margin-top: 40px;
            font-size: 0.9rem;
            color: #aaa;
            font-weight: 600;
        }

        .footer-brand span {
            font-weight: 800;
            color: #007BFF;
        }
        .nav-left{
            margin: 0 auto;
        }
    </style>
</head>

<body>


    <div class="nav-left">
        <a class="a-nodecor logo-container" href="index.jsp">
            <div class="logo-wave">
                <div class="sound-wave wave1"></div>
                <div class="sound-wave wave2"></div>
                <div class="sound-wave wave3"></div>
            </div>
            <span class="logo-text">AuraSound</span>
        </a>
    </div>

    <div class="container">
        <h1 class="error-code">404</h1>
        <h2 class="error-title">Oops! Lạc Sóng Rồi</h2>
        <p class="error-message">
            Có vẻ như bạn đã lạc vào một tần số không xác định.
            Trang bạn đang tìm kiếm có thể đã bị di chuyển hoặc không còn tồn tại.
        </p>

        <a href="index.jsp" class="home-button">Quay về Trang Chủ</a>

    </div>
</body>

</html>