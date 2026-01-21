<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ SẢN PHẨM - AuraSound");
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

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleAdmin.css">
    <%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleResponseMail.css">--%>
</head>

<body>


<button onclick="backTop()" id="back-top-btn" title="Lên đầu trang">
    <i class="bi bi-caret-up-fill"></i>
</button>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

            <nav>
                <div class="nav-container content">
                    <div class="nav-left">
                        <form action="${AuraSound}/admin/product-manager" method="post">
                            <div class="searchBar">
                                <input name="search" type="text" placeholder="Tìm kiếm" value="${search}">
                                <button type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>
                        <c:forEach items="${categoryList}" var="cate">
                            <a class="a-nodecor ${activeId == cate.id ? 'active':''}" href="${AuraSound}/admin/product-manager?categoryId=${cate.id}">
                                <div class="contact">${cate.name}</div>
                            </a>
                        </c:forEach>
                    </div>

                    <div id="hamburger-icon"><i class="bi bi-list"></i></div>
                </div>

            </nav>


            <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"><i class="fas fa-box"></i> Quản lý Sản phẩm</h1>
            </div>

            <p class="text-muted">Thêm, sửa, xóa sản phẩm và quản lý tồn kho.</p>
            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="table-scroll-wrapper">
                        <table class="table table-striped table-sm">
                            <thead>
                            <tr>
                                <th>Stt</th>
                                <th>Mã SKU</th>
                                <th>Tên sản phẩm</th>
                                <th>Tổng biến thể</th>
                                <th>Tồn kho</th>
                                <th>Giá gốc</th>
                                <th>Giá bán</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${productList}" var="p" varStatus="i">
                                <tr>
                                    <td>${i.count}</td>
                                    <td>${p.sku}</td>
                                    <td>${p.name}</td>
                                    <td>${varCountMap[p.id]}</td>
                                    <td>${totalStockMap[p.id]}</td>

                                        <%--                                    <c:if test="${p.discountPercent > 0}">--%>
                                    <td class="old-price"><fmt:formatNumber value="${p.oldPrice}" pattern="#,###"/>
                                        đ
                                    </td>
                                        <%--                                    </c:if>--%>
                                    <td class="new-price"><fmt:formatNumber value="${p.sellPrice}" pattern="#,###"/> đ
                                    </td>
                                    <td>
                                        <a href="${AuraSound}/admin/product-detail-manager?pid=${p.id}">
                                            <button class="btn btn-sm btn-warning">Chi tiết</button>
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
                    </div>
                    <a href="product_detail.jsp">
                        <button class="btn btn-primary mt-3"><i class="fas fa-plus"></i> Thêm Sản Phẩm Mới</button>
                    </a>
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