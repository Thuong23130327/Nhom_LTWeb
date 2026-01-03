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
                    <h1 class="h2"><i class="fas fa-box"></i> Quản lý Sản phẩm</h1>
                </div>

                <p class="text-muted">Thêm, sửa, xóa sản phẩm và quản lý tồn kho.</p>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Tồn kho</th>
                                    <th>Giá</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${productList}" var="p">
                                    <tr>
                                        <td>${p.sku}</td>
                                        <td>${p.name}</td>
                                        <td>${p.stock}</td>
                                        <td>${p.price}vnđ</td>
                                        <td>
                                            <a href="product_detail.jsp?id=${p.productId}">
                                                <button class="btn btn-sm btn-warning">Sửa</button>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%--Nếu danh sách trống--%>
                                <c:if test="${empty productList}">
                                    <tr>
                                        <td colspan="5" class="text-center">Không có sản phẩm nào trong hệ thống.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <a href="product_detail.jsp"><button class="btn btn-primary mt-3"><i class="fas fa-plus"></i> Thêm Sản phẩm Mới</button></a>
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