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
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-2 border-bottom">

                <h2 class="h2 section-title text-primary">
                    Chi tiết đơn # ${o.id}
                </h2>

                <div class="btn-toolbar">
                    <a class="a-nodecor" href="${AuraSound}/admin/manage-order">
                        <button type="button" class="btn btn-sm btn-primary btn-update-status">
                            Trở lại
                        </button>
                    </a>

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
                                <p><strong>Khách hàng: </strong>${os.recipientName}</p>
                                <p><strong>Điện thoại: </strong> ${os.phone}</p>
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
                                <span><i class="fas fa-user-circle me-2"></i>Thông tin Giao hàng & Thanh toán</span>
                            </div>
                            <div class="card-body">

                                <div class="row">
                                    <h6>Địa chỉ Giao hàng:</h6>
                                    <p class="text-muted">${os.address} , ${os.city}</p>


                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <h6>Thanh toán: COD</h6>

                                        <c:if test="${o.paymentStatus == 'Paid'}">
                                                            <span data-sort="đã thanh toaán" class="text-success"><i
                                                                    class="bi bi-check2-circle me-2"></i> Đã thanh toán</span>
                                        </c:if>
                                        <c:if test="${o.paymentStatus == 'Unpaid'}">
                                                            <span data-sort="chưa thanh toaán" class="text-danger"><i
                                                                    class="bi bi-x-circle-fill text-danger me-2"></i>Chưa thanh toán</span>
                                        </c:if>
                                        <h6 class="mt-2">Ngày Đặt hàng: </h6>

                                        <p class="text-muted">
                                            ${o.orderDate}
                                        </p>


                                    </div>

                                </div>

                            </div>


                        </div>


                    </div>
                    <div class="col-lg-4 mb-2 ">
                        <div class="card h-100">
                            <div class="card-header">
                                <span><i class="fas fa-user-circle me-2"></i>Ghi chú Admin</span>
                            </div>
                            <div class="card-body">
                                    <textarea ${o.status == 'Cancelled' || o.status == 'Completed' ? 'readonly':''} id="adminNote" class="form-control" rows="4"
                                              placeholder="Thêm ghi chú nội bộ về đơn hàng này...">
${o.adminNote}
                                    </textarea>

                                <button ${o.status == 'Cancelled' || o.status == 'Completed' ? 'disabled':''} class="mt-3 btn btn-sm btn-primary " onclick="saveAdminNote('${o.id}')">
                                    <i class="fas fa-save"></i>
                                    Lưu ghi chú
                                </button>
                                <label class="form-label"><span>Cập nhật trạng thái đơn:</span></label>
                                <select class="form-select mt-4" id="statusDropdown"
                                        data-current="${o.status}" onchange="updateOrderStatus('${o.id}')">

                                    <c:choose>
                                        <c:when test="${o.status == 'Pending'}">
                                            <option value="Pending" selected disabled>Câp nhật trạng thái</option>
                                            <option value="Shipping">Bắt đầu giao hàng</option>
                                            <option value="Cancelled">Hủy đơn hàng</option>
                                        </c:when>

                                        <c:when test="${o.status == 'Shipping'}">
                                            <option value="Shipping" selected disabled>Câp nhật trạng thái</option>
                                            <option value="Completed">Giao thành công</option>
                                        </c:when>

                                        <c:when test="${o.status == 'Completed'}">
                                            <option value="Completed" selected disabled>Đã hoàn thành</option>
                                        </c:when>

                                        <c:otherwise>
                                            <option value="Cancelled" selected disabled>Đã hủy</option>
                                        </c:otherwise>
                                    </c:choose>

                                </select>
                            </div>
                        </div>
                    </div>

                </div>

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

                                <tbody>
                                <c:forEach items="${listItem}" var="item" varStatus="i">
                                    <tr>
                                        <td>${i.count}</td>
                                        <td>${item.name}</td>
                                        <td>${item.skuVar}</td>
                                        <td>${item.quantity}</td>
                                        <td data-order="${item.price}" class="new-price">
                                            <fmt:formatNumber
                                                    value="${item.price}" pattern="#,###"/> đ
                                        </td>
                                        <td data-order="${item.totalItemPrice}" class="new-price">
                                            <fmt:formatNumber
                                                    value="${item.totalItemPrice}" pattern="#,###"/> đ
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="row mt-4 justify-content-end">
                            <div class="col-md-7">
                                <div class="card h-100" style="box-shadow: none; border-radius: 0;">
                                    <div class="card-header"
                                         style="border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
                                        <span><i class="fas fa-user-circle me-2"></i>Ghi chú của Khách</span>
                                    </div>
                                    <div class="card-body">
                                        <p class="text-muted fst-italic">
                                            ${os.note != null ? os.note : " Không có note "}
                                        </p>
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-5">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Tổng tiền hàng:</strong>
                                        <span><fmt:formatNumber
                                                value="${o.totalProductsPrice}" pattern="#,###"/> đ</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Phí vận chuyển:</strong>
                                        <span>+ <fmt:formatNumber
                                                value="${o.shippingFee}" pattern="#,###"/> đ</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <strong>Chiết khấu:</strong>
                                        <span>- <fmt:formatNumber
                                                value="${o.discountAmount}" pattern="#,###"/> đ</span>
                                    </li>
                                    <a class="a-nodecor" style="border: none" href="">
                                        <li class="list-group-item d-flex justify-content-between">
                                            <strong>Voucher: </strong>

                                            <span class="text-success"># ${o.vouchersId}</span>
                                        </li>
                                    </a>
                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                        <span class="mb-0">Tổng cộng (Đã bao gồm VAT):</span>
                                        <span class="mb-0 text-primary text-gradient-total"> <fmt:formatNumber
                                                value="${o.finalAmount}" pattern="#,###"/> đ</span>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="${AuraSound}/assets/js/scriptAdmin.js"></script>
</html>