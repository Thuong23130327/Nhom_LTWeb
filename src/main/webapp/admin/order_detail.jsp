<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute("pageTitle", "Quản lý Đơn hàng - AuraSound");
    request.setAttribute("activePage", "order");
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

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="/assets/css/styleStore.css">
    <link rel="stylesheet" href="/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="/assets/css/order_detail.css">

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>
        <!-- Main Content -->

        <main class="col-12 px-md-4">

            <!-- Nút Quay lại -->

            <div class="pt-3 pb-2">
                <a href="orders.jsp" class="btn btn-sm btn-primary" title="Quay lại">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </a>
            </div>

            <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2" id="main-title"><i class="fas fa-file-invoice"></i> Chi Tiết Đơn Hàng #1212</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <button type="button" class="btn btn-sm btn-primary ms-2 btn-update-status">
                        <i class="fas fa-pencil-alt"></i> Cập nhật Trạng thái
                    </button>
                </div>
            </div>

            <div id="order-detail-content" class="content-section active">
                <div class="row">

                    <!--Thông tin Khách hàng & Vận chuyển -->

                    <div class="col-lg-4 mb-4">
                        <div class="card shadow-sm h-100">

                            <!-- card-header-customer -->

                            <div class="card-header text-white card-header-customer">
                                <h5 class="mb-0"><i class="fas fa-user-circle me-2"></i>Thông tin Khách hàng</h5>
                            </div>
                            <div class="card-body">
                                <p><strong>Tên Khách hàng:</strong>Tô Tấn Phát</p>
                                <p><strong>Email:</strong>23130236@st.hcmuaf.edu.vn</p>
                                <p><strong>Điện thoại:</strong> 0987 654 321</p>
                                <hr>
                                <h6 class="mt-3">Trạng thái Đơn hàng:</h6>

                                <!-- Cập nhật trạng thái và màu sắc (Đang giao) -->

                                <span class="badge bg-success p-2 badge-status">Đang giao</span>
                            </div>
                        </div>
                    </div>

                    <!-- Địa chỉ & Thanh toán -->

                    <div class="col-lg-8 mb-4">
                        <div class="card shadow-sm h-100">

                            <!-- card-header-shipping -->

                            <div class="card-header text-white card-header-shipping">
                                <h5 class="mb-0"><i class="fas fa-map-marked-alt me-2"></i>Thông tin Giao hàng & Thanh
                                    toán</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h6>Địa chỉ Giao hàng:</h6>

                                        <!-- Cập nhật địa chỉ -->

                                        <p class="text-muted">Đường số 6, Linh Trung, Thủ Đức, Trường ĐH Nông Lâm TP. Hồ
                                            Chí Minh</p>
                                    </div>
                                    <div class="col-md-6">
                                        <h6>Phương thức Thanh toán:</h6>

                                        <!-- Cập nhật phương thức thanh toán -->

                                        <p class="text-muted">Đã thanh toán (Thẻ tín dụng)</p>
                                        <h6>Ngày Đặt hàng:</h6>

                                        <!-- Cập nhật ngày đặt hàng -->

                                        <p class="text-muted">21/11/2025</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bảng chi tiết sản phẩm -->

                <div class="card shadow-sm mb-4">

                    <!-- card-header-products: ĐÃ ĐỒNG NHẤT bằng Primary Gradient -->

                    <div class="card-header text-white card-header-products">
                        <h5 class="mb-0"><i class="fas fa-boxes me-2"></i>Danh sách Sản phẩm</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead class="bg-light">
                                <tr>
                                    <th>#</th>
                                    <th>Sản phẩm</th>
                                    <th>Mã SKU</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Tổng</th>
                                </tr>
                                </thead>
                                <tbody>

                                <!-- Cập nhật sản phẩm 1 -->

                                <tr>
                                    <td>1</td>
                                    <td>Tai nghe AuraBuds Air 2</td>
                                    <td>AS-ABA2-BLK</td>
                                    <td>1</td>
                                    <td><span class="text-price">1,250,000</span> vnđ</td>
                                    <td><span class="text-price">1,250,000</span> vnđ</td>
                                </tr>

                                <!-- Cập nhật sản phẩm 2 -->

                                <tr>
                                    <td>2</td>
                                    <td>Cáp sạc USB-C bện dù (2m)</td>
                                    <td>AS-CABLE-DU2</td>
                                    <td>3</td>
                                    <td><span class="text-price">250,000</span> vnđ</td>
                                    <td><span class="text-price">250,000</span> vnđ</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Tóm tắt thanh toán -->

                        <div class="row mt-4 justify-content-end">
                            <div class="col-md-5">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Tổng tiền hàng:</strong>
                                        <span>1,500,000 vnđ</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Phí vận chuyển:</strong>
                                        <span class="text-danger">0 vnđ</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Chiết khấu:</strong>
                                        <span class="text-success">- 0 vnđ</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                        <h5 class="mb-0">Tổng cộng (Đã bao gồm VAT):</h5>
                                        <h5 class="mb-0 text-primary text-gradient-total">1,500,000 vnđ</h5>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Ghi chú của khách hàng và nội bộ -->

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm h-100">

                            <!-- card-header-customer-note: ĐÃ ĐỒNG NHẤT bằng Primary Gradient -->

                            <div class="card-header text-white card-header-customer-note">
                                <h5 class="mb-0"><i class="fas fa-comment-dots me-2"></i>Ghi chú Khách hàng</h5>
                            </div>
                            <div class="card-body">

                                <!-- Cập nhật ghi chú -->

                                <p class="text-muted fst-italic">"Tôi cần giao hàng trước 5 giờ chiều ngày mai. Nếu
                                    không kịp vui lòng gọi lại."</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm h-100">

                            <!-- card-header-admin-note: ĐÃ ĐỒNG NHẤT bằng Primary Gradient -->

                            <div class="card-header text-white card-header-admin-note">
                                <h5 class="mb-0"><i class="fas fa-clipboard-list me-2"></i>Ghi chú Nội bộ (Admin)</h5>
                            </div>
                            <div class="card-body">
                                <textarea class="form-control" rows="3"
                                          placeholder="Thêm ghi chú nội bộ về đơn hàng này...">Đã gọi xác nhận yêu cầu giao hàng gấp. Phối hợp với đơn vị vận chuyển để ưu tiên.</textarea>
                                <button class="btn btn-sm btn-primary mt-2 btn-save-note"><i class="fas fa-save"></i>
                                    Lưu ghi chú
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- footer -->

<%
    request.setAttribute("keepDefaultJs", true);
%>

<c:set var="customJs" scope="request">
    <script src="/assets/js/scriptAdmin.js"></script>
</c:set>

<%@ include file="/_footer.jsp" %>

</body>

</html>