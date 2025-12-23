<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "QUẢN LÝ ĐƠN - AuraSound");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="/assets/css/styleResponseMail.css">
</c:set>
<%@ include file="/_header.jsp" %>

    <!-- section -->
    
    <main class="mail-manager-main pt-5">
        <div class="container content">
            <div class="d-flex justify-content-start">
                <a href="html" class="btn btn-sm back-btn-custom">
                    <i class="fas fa-arrow-left"></i> Quay lại Hộp thư
                </a>
            </div>

            <div class="card mail-detail-card mt-3">
                <div class="card-body">
                    <div class="mail-info-header pb-3 mb-3">
                        <h4 class="mb-3">Vấn đề: Đặt hàng sản phẩm JBL Flip 6 bị lỗi</h4>
                        <div class="d-flex justify-content-between align-items-center mail-info">
                            <div>
                                <p class="mb-1"><i class="fas fa-user-alt me-2"></i> **Người gửi:** Nguyễn Văn B</p>
                                <p class="mb-1"><i class="fas fa-clock me-2"></i> **Thời gian:** 10:30 AM, 25/08/2025</p>
                            </div>
                        </div>
                    </div>

                    <div class="mail-content mail-body">
                        <p>Kính gửi bộ phận hỗ trợ,</p>
                        <p>Tôi đã nhận được đơn hàng số 123456789 mua loa JBL Flip 6. Tuy nhiên, sau khi sử dụng được 2 ngày, loa bắt đầu có hiện tượng rè và đôi khi bị mất kết nối Bluetooth.</p>
                        <p>Tôi xin gửi kèm hóa đơn và video chứng minh lỗi sản phẩm. Mong quý công ty sớm có biện pháp hỗ trợ đổi trả hoặc bảo hành.</p>
                        <p>Trân trọng cảm ơn.</p>
                    </div>

                    <div class="mail-attachment mt-3 pt-3 border-top">
                        <i class="fas fa-paperclip me-2"></i> Tệp đính kèm: 
                        <a href="#" class="ms-2">HoaDon_123456789.pdf</a>,
                        <a href="#" class="ms-2">VideoLoi.mp4</a>
                    </div>
                </div>
            </div>

            <div class="card response-card mt-4">
                <div class="card-body">
                    <h5 class="card-title mb-3">Phản hồi lại người dùng:</h5>
                    <form id="responseForm">
                        <div class="mb-3">
                            <label for="responseSubject" class="form-label">
                                <i class="fas fa-tag me-2"></i> Chủ đề:
                            </label>
                            <input type="text" class="form-control" id="responseSubject"
                                value="Re: Về vấn đề đặt hàng sản phẩm JBL Flip 6 bị lỗi" required>
                        </div>
                        <div class="mb-3">
                            <label for="responseBody" class="form-label">
                                <i class="fas fa-edit me-2"></i> Nội dung phản hồi:
                            </label>
                            <textarea class="form-control" id="responseBody" rows="8" required></textarea>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn reply-btn" id="replyBtn">
                                <i class="fas fa-paper-plane me-2"></i> Phản hồi
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <i class="fas fa-check-circle fa-3x mb-3"></i> 
                            <p id="modalMessage" class="h6"></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <!-- footer -->

<%
    request.setAttribute("keepDefaultJs", true);
%>

<c:set var="customJs" scope="request">
    <script src="/assets/js/scriptResponseMail.js"></script>
    <script src="/assets/js/scriptAdmin.js"></script>
</c:set>

<%@ include file="/_footer.jsp" %>

</body>
</html>

