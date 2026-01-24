<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>


<%
    request.setAttribute("pageTitle", "Quản lý Đơn - AuraSound");
    request.setAttribute("activePage", "order");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleAdmin.css">

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"><i class="fas fa-shopping-cart"></i> Quản lý Đơn hàng</h1>
            </div>

            <p class="text-muted">Quản lý các trạng thái đơn hàng: Chờ duyệt, Đang giao, Đã hoàn thành, Đã hủy.</p>
            <div class="card shadow-sm">
                <div class="card-body">
                    <table id="orderTable" class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>Stt</th>
                            <th>Mã đơn</th>
                            <th>Khách hàng</th>
                            <th>Ngày đặt</th>
                            <th>Trạng thái</th>
                            <th>Thanh toán</th>
                            <th>Tổng tiền</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${list}" var="o" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${o.orderCode}</td>
                                <td>${o.recipientName}</td>
                                <td data-sort="${o.orderDate}">${o.fmOrderDate}</td>
                                <td>
                                    <c:if test="${o.status == 'Pending'}">
                                        <span class="badge bg-warning-subtle text-warning-emphasis">Chờ duyệt</span>
                                    </c:if>
                                    <c:if test="${o.status == 'Shipping'}">
                                        <span class="badge bg-info text-info-emphasis">Đang giao</span>
                                    </c:if>
                                    <c:if test="${o.status == 'Completed'}">
                                        <span class="badge bg-success">Đã giao</span>
                                    </c:if>
                                    <c:if test="${o.status == 'Cancelled'}">
                                        <span class="badge bg-secondary-subtle text-secondary">Đã hủy</span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${o.paymentStatus == 'Paid'}">
                                        <span data-sort="đã thanh toaán" class="text-success"><i
                                                class="bi bi-check2-circle me-2"></i> Đã thanh toán</span>
                                    </c:if>
                                    <c:if test="${o.paymentStatus == 'Unpaid'}">
                                        <span data-sort="chưa thanh toaán" class="text-danger"><i
                                                class="bi bi-x-circle-fill text-danger me-2"></i>Chưa thanh toán</span>
                                    </c:if>


                                </td>
                                <td data-order="${o.finalAmount}" class="new-price"><fmt:formatNumber
                                        value="${o.finalAmount}" pattern="#,###"/> đ
                                </td>
                                <td>
                                    <a href="${AuraSound}/admin/manage-order-detail?id=${o.id}">
                                        <button class="btn-sm">Chi tiết</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--Nếu danh sách trống--%>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="8" class="text-center">Không có đơn hàng nào trong hệ thống.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/script.js"></script>
<script src="../assets/js/scriptAdmin.js"></script>
<script src="../assets/js/scriptProfile.js"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#orderTable').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
            }
        });
        $('#orderTable thead tr').clone(true).appendTo('#orderTable thead');
        $('#orderTable thead tr:eq(1) th').each(function (i) {
            var title = $(this).text();
            if (title !== 'Thao tác' && title !== 'Stt') { // Không thêm lọc cho cột thao tác/stt
                $(this).html('<input type="text" class="form-control form-control-sm" placeholder="Lọc ' + title + '" />');

                $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table.column(i).search(this.value).draw();
                    }
                });
            } else {
                $(this).html('');
            }
        });
    });


</script>
</body>

</html>
