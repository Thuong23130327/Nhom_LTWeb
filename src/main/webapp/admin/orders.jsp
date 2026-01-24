<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2"><i class="fas fa-shopping-cart"></i> Quản lý Đơn hàng</h1>
                </div>

                <p class="text-muted">Quản lý các trạng thái đơn hàng: Chờ duyệt, Đang giao, Đã hoàn thành, Đã hủy.</p>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Khách hàng</th>
                                    <th>Trạng thái</th>
                                    <th>Tổng tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>#1212</td>
                                    <td>Tô Tấn Phát</td>
                                    <td>
                                        <span class="badge bg-warning">Chờ duyệt</span>
                                    </td>
                                    <td>1.500.000vnđ</td>
                                    <td>
                                        <a href="order_detail.jsp"><button class="btn btn-sm btn-info">Chi tiết</button></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#1223</td>
                                    <td>Nguyễn Trường Vũ</td>
                                    <td>
                                        <span class="badge bg-success">Đang giao</span>
                                    </td>
                                    <td>3.200.000vnđ</td>
                                    <td>
                                        <a href="order_detail.jsp"><button class="btn btn-sm btn-info">Chi tiết</button></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#1234</td>
                                    <td>Lý Đại Vỷ</td>
                                    <td>
                                        <span class="badge bg-secondary">Đã giao</span>
                                    </td>
                                    <td>700.000vnđ</td>
                                    <td>
                                        <a href="order_detail.jsp"><button class="btn btn-sm btn-secondary">Xem</button></a>
                                    </td>
                                </tr>
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
</body>

</html>
