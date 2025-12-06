<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Kiểm tra hệ thống</title>
</head>
<body>
    <h1>Kết quả kiểm tra:</h1>

    <h3 style="color: green;">
        <c:out value="${loi_chao}" default="Lỗi: Không nhận được dữ liệu hoặc JSTL hỏng" />
    </h3>

    <p>Nếu bạn thấy dòng chữ màu xanh lá cây bên trên, nghĩa là Tomcat cũng đang chạy ngon.</p>
</body>
</html>