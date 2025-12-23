<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "QUẢN LÝ ĐƠN - AuraSound");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="/assets/css/styleAdmin.css">
</c:set>
<%@ include file="/_header.jsp" %>

    <!-- section -->

    <div class="container-fluid">
        <div class="row">

            <%@ include file="/admin/_adminMenu.jsp" %>

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
