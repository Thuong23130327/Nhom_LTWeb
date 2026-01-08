<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>${pageTitle}</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
      rel="stylesheet">

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous">

<c:choose>
    <c:when test="${not empty customCss}">
        ${customCss}

        <c:if test="${keepDefaultCss == true}">
            <link rel="stylesheet"
                  href="${pageContext.request.contextPath}/assets/css/styleAdmin.css">
            <link rel="stylesheet"
                  href="${pageContext.request.contextPath}/assets/css/styleHome.css">
        </c:if>
    </c:when>

    <c:otherwise>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/styleAdmin.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/styleHome.css">
    </c:otherwise>
</c:choose>
