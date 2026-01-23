<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
    request.setAttribute("pageTitle", "Quản lý Liên hệ - AuraSound");
    request.setAttribute("activePage", "contact");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${path}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${path}/assets/css/styleAdmin.css">
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div id="page-content-wrapper">
                <div class="container-fluid py-4">
                    <div class="card shadow-lg border-0 rounded-3">
                        <div class="card-body p-2 p-md-5">
                            <form action="${AuraSound}/admin/send-reply" method="POST">
                                <input type="hidden" name="id" value="${contact.id}">
                                <input type="hidden" name="email" value="${contact.senderMail}">
                                <section class="mb-5">
                                    <h2 class="h2 section-title text-primary">
                                        Chi tiết thư liên hệ
                                    </h2>

                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <p><span class="info-label">Người gửi:</span> <span
                                                    class="info-value">${contact.senderName}</span></p>
                                            <p><span class="info-label">Email:</span> <span
                                                    class="info-value">${contact.senderMail}</span></p>
                                            <p><span class="info-label">Số ĐT:</span> <span
                                                    class="info-value">${contact.phone}</span></p>
                                        </div>
                                        <div class="col-md-6 text-md-end">
                                            <p class="text-muted">
                                                <i class="fas fa-clock me-2"></i><strong>Thời
                                                gian:</strong> ${contact.stringCreatedAt}
                                            </p>
                                            <p>
                                        <span class="badge ${contact.status == 'New' ? 'bg-danger' : 'bg-success'}">
                                            ${contact.stringStatus}
                                        </span>
                                            </p>
                                        </div>
                                        <div class="col-12 mt-2">
                                            <label class="info-label d-block mb-2">Nội dung liên hệ:</label>
                                            <div class="p-3 bg-light rounded-2 border">
                                                ${contact.mess}
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <section>
                                    <h2 class="h2 section-title text-success">
                                        Soạn thư phản hồi
                                    </h2>

                                    <div class="mb-3">
                                        <label for="mail-subject" class="form-label fw-bold">Tiêu đề Email <span
                                                class="text-danger">*</span></label>
                                        <input ${contact.replyMess != null ?'readonly':''} type="text" id="mail-subject"
                                                                                           name="subject"
                                                                                           class="form-control"
                                                                                           placeholder="Ví dụ: Phản hồi yêu cầu hỗ trợ từ AuraSound"
                                                                                           value="AuraSound Phản hồi về: ${contact.mess.length() > 30 ? contact.mess.substring(0,30).concat('...') : contact.mess}"
                                                                                           required>
                                    </div>

                                    <div class="mb-4">
                                        <label for="mail-content" class="form-label fw-bold">Nội dung phản
                                            hồi</label>
                                        <textarea ${contact.replyMess != null ?'readonly':''} id="mail-content"
                                                                                              name="content"
                                                                                              class="form-control"
                                                                                              style="height: 250px; resize: vertical;"
                                                                                              placeholder="Nhập nội dung bạn muốn gửi tới khách hàng..."><c:if
                                                test="${contact.replyMess == null}">
Chào ${contact.senderName}, Cảm ơn bạn đã liên hệ với AuraSound.

Về vấn đề của bạn "${contact.mess}",

Chúng tôi xin phản hồi như sau: ...


Trân trọng!
                                        </c:if><c:if test="${contact.replyMess != null}">${contact.replyMess} </c:if>

                                        </textarea>
                                    </div>

                                    <div class="d-flex justify-content-end gap-2">

                                        <c:if test="${contact.replyMess == null}">
                                            <button type="reset" class="btn btn-light border">Hủy bỏ</button>
                                            <button class="btn btn-primary px-4">
                                                Gửi phản hồi & Lưu
                                            </button>
                                        </c:if>
                                        <c:if test="${contact.replyMess != null}">
                                            <a href="${AuraSound}/admin/mail">
                                                <button type="button" class="btn btn-primary px-4">
                                                    Trở lại
                                                </button>
                                            </a>
                                        </c:if>

                                    </div>
                                </section>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
        if (msg.equals("fail")) {
%>
<script>
    alert("Thất bại! Email của bạn chưa được gửi đi.");
</script>
<%
            session.removeAttribute("msg");
        }
    }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/assets/js/scriptResponseMail.js"></script>
<script src="${path}/assets/js/scriptAdmin.js"></script>
</body>
</html>