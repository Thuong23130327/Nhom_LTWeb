<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "QUẢN LÝ - AuraSound");
    request.setAttribute("activePage", "admin");
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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2" id="main-title"><i class="fas fa-chart-area"></i> Admin Chính</h1>
                    <div class="btn-toolbar mb-2 mb-md-0"> 
                        <a href="mailBox.jsp" class="btn btn-sm btn-primary ms-2 btn-mail-feedback" title="Thư phản hồi">
                            <i class="fas fa-envelope"></i>
                            <span class="badge rounded-pill bg-danger badge-counter">3</span> 
                        </a>
                        <button type="button" class="btn btn-sm btn-primary ms-2"> 
                            <i class="fas fa-sync-alt"></i> Cập nhật Dữ liệu 
                        </button> 
                        </div>
                </div>

                <div id="admin" class="content-section active">
                    <div class="row mb-4">
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card text-white bg-primary shadow-sm">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title">Tổng người dùng</h5>
                                            <p class="card-text h3">1,250</p>
                                        </div>
                                        <div class="col-4 text-end"><i class="fas fa-users fa-3x"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card text-white bg-success shadow-sm">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title">Doanh thu (Tháng)</h5>
                                            <p class="card-text h3">15.5 Tỷ</p>
                                        </div>
                                        <div class="col-4 text-end"><i class="fas fa-dollar-sign fa-3x"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card text-white bg-info shadow-sm">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title">Đơn hàng mới</h5>
                                            <p class="card-text h3">45</p>
                                        </div>
                                        <div class="col-4 text-end"><i class="fas fa-shopping-bag fa-3x"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card text-white bg-danger shadow-sm">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title">Sự cố chờ</h5>
                                            <p class="card-text h3">3</p>
                                        </div>
                                        <div class="col-4 text-end"><i class="fas fa-exclamation-triangle fa-3x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Biểu đồ -->

                    <div class="row">
                        <div class="col-lg-8 mb-4">
                            <div class="card shadow-sm h-100">
                                <div class="card-header bg-white border-bottom">
                                    <h5 class="mb-0">Doanh thu 6 tháng gần nhất</h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <div class="bar-chart">
                                            <div class="bar" style="height: 50%;" data-label="T6"></div>
                                            <div class="bar" style="height: 70%;" data-label="T7"></div>
                                            <div class="bar" style="height: 60%;" data-label="T8"></div>
                                            <div class="bar" style="height: 90%;" data-label="T9"></div>
                                            <div class="bar" style="height: 80%;" data-label="T10"></div>
                                            <div class="bar" style="height: 95%;" data-label="T11"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-4">
                            <div class="card shadow-sma h-100">
                                <div class="card-header bg-white border-bottom">
                                    <h5 class="mb-0">Hoạt động gần đây</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush activity-list">
                                        <li class="list-group-item"><i
                                                class="fas fa-shopping-cart text-success me-2"></i> **Đơn hàng mới**
                                            #1209 vừa được tạo.</li>
                                        <li class="list-group-item"><i class="fas fa-user-plus text-primary me-2"></i>
                                            **Nguyễn Hoài Thương** đăng ký tài khoản.</li>
                                        <li class="list-group-item"><i class="fas fa-box text-warning me-2"></i> **Sản
                                            phẩm X** sắp hết hàng (SL: 10).</li>
                                        <li class="list-group-item"><i class="fas fa-envelope text-info me-2"></i> **5**
                                            tin nhắn hỗ trợ mới.</li>
                                        <li class="list-group-item"><i
                                                class="fas fa-check-circle text-success me-2"></i> **Đơn hàng #1199** đã
                                            được giao thành công.</li>
                                    </ul>
                                </div>
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