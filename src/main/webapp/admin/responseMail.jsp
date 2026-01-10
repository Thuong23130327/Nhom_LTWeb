<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ THƯ - AuraSound");
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleResponseMail.css">

    <style>
        /* Ép layout về dạng Flexbox chuẩn để không bị vỡ */
        body {
            overflow-x: hidden; /* Chặn thanh cuộn ngang thừa */
        }

        .admin-wrapper {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        /* FIX CỘT MENU: Ép về vị trí tương đối, không cho bay lung tung */
        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #fff; /* Hoặc màu nền của menu */
            border-right: 1px solid #dee2e6;
            /* Quan trọng: Bỏ fixed để nó nằm ngoan ngoãn trong cột */
            position: relative !important;
            height: auto !important;
        }

        /* Xử lý nội dung bên trong file _adminMenu.jsp */
        #sidebar-wrapper .sidebar {
            position: static !important; /* Gỡ bỏ fixed của class sidebar cũ */
            height: auto !important;
            width: 100% !important;
            box-shadow: none !important; /* Bỏ bóng nếu bị đè */
            padding-top: 20px;
        }

        /* FIX CỘT NỘI DUNG CHÍNH */
        #page-content-wrapper {
            flex: 1; /* Chiếm hết khoảng trống còn lại */
            width: 100%;
            padding: 20px;
            background-color: #fff;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .admin-wrapper {
                flex-direction: column;
            }
            #sidebar-wrapper {
                min-width: 100%;
                max-width: 100%;
                height: auto;
            }
        }
    </style>
</head>

<body>

<div class="admin-wrapper">

    <div id="sidebar-wrapper">
        <jsp:include page="/tag/_adminMenu.jsp" />
    </div>

    <div id="page-content-wrapper">

        <div class="container-fluid">

            <div class="d-flex justify-content-start mb-3">
                <a href="mailbox.jsp" class="btn btn-sm back-btn-custom">
                    <i class="fas fa-arrow-left"></i> Quay lại Hộp thư
                </a>
            </div>

            <div class="card mail-detail-card shadow-sm mb-4">
                <div class="card-body">
                    <div class="mail-info-header border-bottom pb-3 mb-3">
                        <h4 class="mb-3">Vấn đề: Đặt hàng sản phẩm JBL Flip 6 bị lỗi</h4>
                        <div class="d-flex gap-4 text-muted">
                            <span><i class="fas fa-user-alt me-2"></i> <strong>Người gửi:</strong> Nguyễn Văn B</span>
                            <span><i class="fas fa-clock me-2"></i> <strong>Thời gian:</strong> 10:30 AM, 25/08/2025</span>
                        </div>
                    </div>

                    <div class="mail-content mail-body mb-3">
                        <p>Kính gửi bộ phận hỗ trợ,</p>
                        <p>Tôi đã nhận được đơn hàng số 123456789 mua loa JBL Flip 6. Tuy nhiên, sau khi sử dụng được 2 ngày, loa bắt đầu có hiện tượng rè.</p>
                        <p>Tôi xin gửi kèm hóa đơn và video chứng minh lỗi sản phẩm. Mong quý công ty sớm có biện pháp hỗ trợ.</p>
                        <p>Trân trọng cảm ơn.</p>
                    </div>

                    <div class="mail-attachment pt-2 text-primary">
                        <i class="fas fa-paperclip me-2"></i> Tệp đính kèm:
                        <a href="#" class="ms-2 text-decoration-none">HoaDon_123456789.pdf</a>,
                        <a href="#" class="ms-2 text-decoration-none">VideoLoi.mp4</a>
                    </div>
                </div>
            </div>

            <div class="card response-card shadow-sm mb-5">
                <div class="card-body">
                    <h5 class="card-title mb-4 text-primary"><i class="fas fa-reply me-2"></i>Phản hồi lại người dùng:</h5>
                    <form id="responseForm">
                        <div class="mb-3">
                            <label for="responseSubject" class="form-label fw-bold">
                                Chủ đề:
                            </label>
                            <input type="text" class="form-control" id="responseSubject"
                                   value="Re: Về vấn đề đặt hàng sản phẩm JBL Flip 6 bị lỗi" required>
                        </div>
                        <div class="mb-3">
                            <label for="responseBody" class="form-label fw-bold">
                                Nội dung phản hồi:
                            </label>
                            <textarea class="form-control" id="responseBody" rows="8" required></textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary px-4 py-2 reply-btn" id="replyBtn">
                                <i class="fas fa-paper-plane me-2"></i> Gửi Phản Hồi
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div> </div> </div> <div class="modal fade" id="successModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center p-4">
                <i class="fas fa-check-circle fa-3x mb-3 text-success"></i>
                <p id="modalMessage" class="h6 fw-bold">Gửi thành công!</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scriptResponseMail.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scriptAdmin.js"></script>

</body>
</html>