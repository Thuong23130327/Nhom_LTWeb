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
                    <h1 class="h2"><i class="fas fa-chart-line"></i> Báo cáo & Thống kê</h1>
                </div>

                <p class="text-muted">Các báo cáo chi tiết về doanh thu, khách hàng và hiệu suất bán hàng.</p>
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-white">Báo Cáo Doanh Thu Tháng</div>
                            <div class="card-body">
                                <p>Tổng doanh thu: 100,000,000vnđ</p>
                                <p>Tỷ lệ chuyển đổi: 30,000,000vnđ</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-white">Báo Cáo Khách Hàng Mới</div>
                            <div class="card-body">
                                <p>Số lượng khách hàng mới: 250</p>
                                <p>Tỷ lệ chuyển đổi: 5,5%</p>
                            </div>
                        </div>
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
