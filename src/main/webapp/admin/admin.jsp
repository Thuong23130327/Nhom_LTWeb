<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ - AuraSound");
    request.setAttribute("activePage", "admin");
    request.setAttribute("keepDefaultCss", true);
%>

<c:set var="customCss">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/styleAdmin.css">
</c:set>

<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="/tag/_headerAdmin.jsp" %>
</head>

<body>

<div class="container-fluid">
    <div class="row">

        <%@ include file="/admin/_adminMenu.jsp" %>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

            <!-- Header -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap
                        align-items-center pt-3 pb-2 mb-3 border-bottom">

                <h1 class="h2">
                    <i class="fas fa-home me-2"></i> Admin
                </h1>

                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-mail-container me-3">
                        <button class="btn btn-primary btn-sm rounded-3">
                            <i class="fas fa-envelope"></i>
                            <span class="badge rounded-pill bg-danger badge-counter">3</span>
                        </button>
                    </div>

                    <button type="button" class="btn btn-sm btn-primary rounded-3">
                        <i class="fas fa-sync-alt me-1"></i> Cập nhật Dữ liệu
                    </button>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-lg-3 col-md-6 mb-3">
                    <div class="card stat-card">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Tổng sản phẩm</h5>
                                <p class="h3 fw-bold">165</p>
                            </div>
                            <i class="fas fa-box fa-3x opacity-50"></i>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mb-3">
                    <div class="card stat-card">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Tổng đơn hàng</h5>
                                <p class="h3 fw-bold">2,240</p>
                            </div>
                            <i class="fas fa-shopping-cart fa-3x opacity-50"></i>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mb-3">
                    <div class="card stat-card">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Đơn chờ xử lý</h5>
                                <p class="h3 fw-bold">5</p>
                            </div>
                            <i class="fas fa-exclamation-triangle fa-3x opacity-50"></i>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mb-3">
                    <div class="card stat-card">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Khách hàng</h5>
                                <p class="h3 fw-bold">123</p>
                            </div>
                            <i class="fas fa-users fa-3x opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold text-dark">Thống kê doanh thu</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <div class="bar-chart">
                                    <div class="bar" style="height:50%" data-label="T6"></div>
                                    <div class="bar" style="height:70%" data-label="T7"></div>
                                    <div class="bar" style="height:60%" data-label="T8"></div>
                                    <div class="bar" style="height:90%" data-label="T9"></div>
                                    <div class="bar" style="height:80%" data-label="T10"></div>
                                    <div class="bar" style="height:95%" data-label="T11"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mb-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold text-dark">Hoạt động gần đây</h5>
                        </div>
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item py-3 border-bottom">
                                    <i class="fas fa-shopping-cart text-success me-2"></i>
                                    <strong>Đơn hàng mới</strong> #1209 vừa được tạo.
                                </li>
                                <li class="list-group-item py-3 border-bottom">
                                    <i class="fas fa-user-plus text-primary me-2"></i>
                                    <strong>Nguyễn Hoài Thương</strong> đăng ký tài khoản.
                                </li>
                                <li class="list-group-item py-3 border-bottom">
                                    <i class="fas fa-box text-warning me-2"></i>
                                    <strong>Sản phẩm X</strong> sắp hết hàng (SL: 10).
                                </li>
                                <li class="list-group-item py-3 border-bottom">
                                    <i class="fas fa-envelope text-info me-2"></i>
                                    <strong>5</strong> tin nhắn hỗ trợ mới.
                                </li>
                                <li class="list-group-item py-3">
                                    <i class="fas fa-check-circle text-success me-2"></i>
                                    <strong>Đơn hàng #1199</strong> đã giao thành công.
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<%@ include file="/tag/_footerAdmin.jsp" %>
