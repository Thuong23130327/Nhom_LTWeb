<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ VOUCHER - AuraSound");
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleMail.css">
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>
        <main class="mail-manager-main pt-5">

            <a href="admin.jsp" class="btn btn-sm back-btn-custom">
                <i class="fas fa-arrow-left me-2"></i> Quay lại Admin
            </a>

            <div class="mail-content-center-wrapper mx-auto">

                <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 mt-4">
                    <h1 class="h2">Quản lý Thư Liên hệ</h1>
                </div>

                <div class="card shadow-sm mail-manager-container">

                    <div id="mail-list" class="list-group list-group-flush mail-list-scroll">

                        <div class="list-group-item mail-item unread-mail d-flex justify-content-between p-3">

                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Nguyễn Hoài Thương</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Về vấn đề đặt hàng online</div>
                                <div class="mail-time flex-grow-0 text-muted small">09:30 AM | 10/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item unread-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Trần Thị B</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Yêu cầu hỗ trợ kỹ thuật sản
                                    phẩm X12
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">Hôm qua | 14:00 PM</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item unread-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Lê Hoàng D</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Thông tin về chính sách bảo
                                    hành
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">08:00 AM | 09/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Phạm Văn C</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Hợp tác đại lý phân phối sản
                                    phẩm
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">2 ngày trước</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Customer Support</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Góp ý về giao diện website và
                                    trải
                                    nghiệm người dùng
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">07:45 AM | 09/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Võ Thanh E</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Hỏi về giá sỉ loa X</div>
                                <div class="mail-time flex-grow-0 text-muted small">06/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Bùi Văn G</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Xác nhận đã nhận hàng #1180
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">05/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Hà Kiều H</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Khiếu nại về chất lượng âm
                                    thanh
                                </div>
                                <div class="mail-time flex-grow-0 text-muted small">04/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>

                        <div class="list-group-item mail-item read-mail d-flex justify-content-between p-3">
                            <div class="mail-info d-flex align-items-center w-100">
                                <div class="mail-sender flex-grow-0 me-3">Ngô Đình K</div>
                                <div class="mail-subject flex-grow-1 text-truncate me-3">Đề nghị hợp tác quảng cáo</div>
                                <div class="mail-time flex-grow-0 text-muted small">03/11/2025</div>
                            </div>
                            <a href="responseMail.jsp" class="btn btn-sm btn-primary reply-btn ms-3">
                                <i class="ri-eye-line me-1"></i> Xem chi tiết & Phản hồi
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>


</body>
</html>
