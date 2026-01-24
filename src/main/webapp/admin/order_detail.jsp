<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>

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

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/order_detail.css">

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

                <h2 class="h2 section-title text-primary">
                    Chi tiết đơn # ${o.id}
                </h2>

                <div class="btn-toolbar mb-2 mb-md-0">
                    <button type="button" class="btn btn-sm btn-primary ms-2 btn-update-status">
                        <i class="fas fa-pencil-alt"></i> Cập nhật Trạng thái
                    </button>
                </div>
            </div>

            <div id="order-detail-content" class="content-section active">
                <div class="row">
                    <div class="col-lg-4 mb-2 ">
                        <div class="card h-100">
                            <div class="card-header">
                                <span><i class="fas fa-user-circle me-2"></i>Thông tin Khách hàng</span>
                            </div>
                            <div class="card-body">
                                <p><strong>Khách hàng: </strong>${u.fullName}</p>
                                <p><strong>Email: </strong>${u.email}</p>
                                <p><strong>Điện thoại: </strong> ${u.phone}</p>
                                <hr>
                                <p class="mt-2">Trạng thái: </p>
                                <c:if test="${o.status == 'Pending'}">
                                    <p class="badge bg-warning-subtle text-warning-emphasis">Chờ duyệt</p>
                                </c:if>
                                <c:if test="${o.status == 'Shipping'}">
                                    <p class="badge bg-info text-info-emphasis">Đang giao</p>
                                </c:if>
                                <c:if test="${o.status == 'Completed'}">
                                    <p class="badge bg-success">Đã giao</p>
                                </c:if>
                                <c:if test="${o.status == 'Cancelled'}">
                                    <p class="badge bg-secondary-subtle text-secondary">Đã hủy</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-2 ">
                        <div class="card h-100">
                            <div class="card-header">
                                <span><i class="fas fa-user-circle me-2"></i>Ghi chú của Khách</span>
                            </div>
                            <div class="card-body">
                                <p class="text-muted fst-italic">
                                    "Tôi cần giao hàng trước 5 giờ chiều ngày mai. Nếu
                                    không kịp vui lòng gọi lại."</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-2 ">
                        <div class="card h-100">
                            <div class="card-header">
                                <span><i class="fas fa-user-circle me-2"></i>Ghi chú Admin</span>
                            </div>
                            <div class="card-body">
                                    <textarea class="form-control" rows="3"
                                              placeholder="Thêm ghi chú nội bộ về đơn hàng này...">Đã gọi xác nhận yêu cầu giao hàng gấp. Phối hợp với đơn vị vận chuyển để ưu tiên.</textarea>
                                <button class="btn btn-sm btn-primary "><i class="fas fa-save"></i>
                                    Lưu ghi chú
                                </button>
                            </div>
                        </div>
                    </div>


                    <%--                    <div class="col-lg-8 mb-2">--%>
                    <%--                        <div class="card h-100">--%>
                    <%--                            <div class="card-header">--%>
                    <%--                                <span><i class="fas fa-user-circle me-2"></i>Thông tin Giao hàng & Thanh toán</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="card-body">--%>
                    <%--                                <div class="row">--%>
                    <%--                                    <div class="col-md-8">--%>
                    <%--                                        <h6>Địa chỉ Giao hàng:</h6>--%>
                    <%--                                        <p class="text-muted">Đường số 6, Linh Trung, Thủ Đức, Trường ĐH Nông Lâm TP. Hồ--%>
                    <%--                                            Chí Minh</p>--%>
                    <%--                                    </div>--%>
                    <%--                                    <div class="col-md-4">--%>
                    <%--                                        <h6>Thanh toán: COD</h6>--%>

                    <%--                                        <c:if test="${o.paymentStatus == 'Paid'}">--%>
                    <%--                                        <span data-sort="đã thanh toaán" class="text-success"><i--%>
                    <%--                                                class="bi bi-check2-circle me-2"></i> Đã thanh toán</span>--%>
                    <%--                                        </c:if>--%>
                    <%--                                        <c:if test="${o.paymentStatus == 'Unpaid'}">--%>
                    <%--                                        <span data-sort="chưa thanh toaán" class="text-danger"><i--%>
                    <%--                                                class="bi bi-x-circle-fill text-danger me-2"></i>Chưa thanh toán</span>--%>
                    <%--                                        </c:if>--%>
                    <%--                                        <h6 class="mt-2">Ngày Đặt hàng: </h6>--%>

                    <%--                                        <p class="text-muted">--%>
                    <%--                                            ${o.orderDate}--%>
                    <%--                                        </p>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>

                <!-- Bảng chi tiết sản phẩm -->

                <div class="card">
                    <div class="card-header">
                        <span><i class="fas fa-user-circle me-2"></i>Sản phẩm trong đơn</span>
                    </div>
                    <div class="card-body">
                        <div>
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
                            </table>

                            <tbody>
                            <c:forEach items="listItem" var="item" varStatus="i">
                                <tr>
                                    <td>${i.count}</td>
<%--                                    <td>${o.orderCode}</td>--%>
<%--                                    <td>${o.usersId}</td>--%>
<%--                                    <td>${o.orderDate}</td>--%>
                                    <td>Tai nghe AuraBuds Air 2</td>
                                    <td>AS-ABA2-BLK</td>
                                    <td>1</td>
                                    <td><span class="text-price">1,250,000</span> vnđ</td>
                                    <td><span class="text-price">1,250,000</span> vnđ</td>
                                </tr>


                            </c:forEach>


                            </tbody>

                        </div>


                    </div>

                </div>
                <div class="card">

                    <!-- card-header-products: ĐÃ ĐỒNG NHẤT bằng Primary Gradient -->

                    <div class="card-header text-white card-header-products">
                        <span class="mb-0"><i class="fas fa-boxes me-2"></i>Danh sách Sản phẩm</span>
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
                                        <span class="mb-0">Tổng cộng (Đã bao gồm VAT):</span>
                                        <span class="mb-0 text-primary text-gradient-total">1,500,000 vnđ</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </div>
</div>

</body>

</html>