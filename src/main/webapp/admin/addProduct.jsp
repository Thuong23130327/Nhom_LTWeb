<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ SẢN PHẨM - AuraSound");
    request.setAttribute("activePage", "product");
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
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHeadphones.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/order_detail.css">
</head>

<body>

<button onclick="backTop()" id="back-top-btn" title="Lên đầu trang">
    <i class="bi bi-caret-up-fill"></i>
</button>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="/tag/_adminMenu.jsp"/>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-2 border-bottom">
                <h2 class="h2 section-title text-primary">
                    Thêm Sản phẩm
                </h2>

                <div class="btn-toolbar">
                    <a class="a-nodecor" href="${AuraSound}/admin/product-manager">
                        <button type="button" class="btn btn-sm btn-primary btn-update-status">
                            Trở lại
                        </button>
                    </a>
                </div>
            </div>

            <div id="order-detail-content" class="content-section active">
                <div class="col-lg-12 mb-2 ">
                    <div class="card h-100">
                        <form action="${p == null ? AuraSound + '/admin/add-product' : AuraSound + '/admin/upd-product?action=updateProduct'}"
                              method="post">
                            <c:if test="${p != null}">
                            <input name="inputPid" type="hidden" value="${p.id}">
                        </c:if>
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <span><i class="fas fa-user-circle me-2"></i>Thông tin chung</span>
                                </div>

                                <div class="d-flex align-items-center gap-4">
                                    <div class="form-check form-switch mb-0 d-flex align-items-center gap-2">
                                        <label for="isActiveToggle">
                                            Hiển thị sản phẩm
                                        </label>
                                        <input
                                                type="checkbox"
                                                id="isActiveToggle"
                                                name="isActive"
                                                value="true"
                                        ${p.isActive ? 'checked' : ''}>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-gradient">
                                        Lưu Thay Đổi
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-3 mb-2 ">

                                        <span><strong>Thương hiệu: </strong></span>
                                        <select name="inputBrand" id="product-brand"
                                                class="form-select mb-3">
                                            <c:forEach items="${brandList}" var="brand">
                                                <option value="${brand.id}" ${brand.id == p.brandId ? 'selected' : ''}>${brand.name}</option>
                                            </c:forEach>
                                        </select>


                                        <span><strong>Danh mục: </strong></span>
                                        <select name="inputCate" id="product-category" class="form-select">
                                            class="form-select mb-3">
                                            <c:forEach items="${childList}" var="cate">
                                                <option value="${cate.id}" ${cate.id == p.categoriesId ? 'selected' : ''} >${cate.name}</option>
                                            </c:forEach>
                                        </select>


                                        <span><strong>Tên SP: </strong></span>
                                        <input name="inputNameProduct" type="text" id="product-name"
                                               value="${p.name}"
                                               class="form-control mb-3"
                                               placeholder="Tên SP">

                                        <span><strong>SKU: </strong></span>
                                        <input name="inputSku" type="text" id="product-sku" value="${p.sku}"
                                               class="form-control mb-3"
                                               placeholder="Nhập mã SKU sản phẩm">

                                    </div>

                                    <div class="col-lg-5 mb-2 ">


                                        <span><strong>Mô tả: </strong></span>
                                        <textarea name="inputDiscrip" id="product-short-desc"
                                                  class="form-control"
                                                  rows="10">${p.description}</textarea>
                                    </div>

                                    <div class="col-lg-4 mb-2 ">
                                        <span class="mb-4"><strong>Chọn biến thể làm đại diện: </strong></span>
                                        <div class="row">
                                            <div class="col-lg-4 mb-2">
                                                <c:forEach items="${variants}" var="v" varStatus="status">
                                                    <div class="form-check mb-2">
                                                        <input type="radio"
                                                               name="variantSelect"
                                                               id="var-${status.index}"
                                                               value="${v.id}"
                                                               class="form-check-input"
                                                               onchange="showSample(this)"
                                                               data-img="${v.mainImageUrl}"
                                                               data-price="${v.sellPrice}"
                                                               data-oldprice="${v.marketPrice}"
                                                               data-discount="${v.discountPercent}"
                                                            ${v. mainImageUrl == p.img ? 'checked' : ''}
                                                        >
                                                        <span>${v.colorName}</span>
                                                    </div>
                                                </c:forEach>

                                            </div>

                                            <div class="col-lg-6 showVar mt-3">
                                                <a href="detail?pid=${p.id}" class="product-card">
                                                    <div id="sampleBadge" class="product-badge discount"
                                                         style="${p.discountPercent > 0 ? '' : 'display:none'}">
                                                        Giảm <span id="sampleDiscountText">${p.discountPercent}</span> %
                                                    </div>

                                                    <img id="sampleImg" src="${p.img}" alt="${p.name}"
                                                         onerror="this.src='https://placehold.co/300x300?text=No+Image'">

                                                    <div class="product-card-info">
                                                        <h4>${p.name}</h4>
                                                        <div class="price-block">
                                                            <div id="sampleNewPrice" class="new-price">
                                                                <fmt:formatNumber value="${p.sellPrice}"
                                                                                  pattern="#,###"/> đ
                                                            </div>

                                                            <div id="sampleOldPriceBlock"
                                                                 style="${p.discountPercent > 0 ? '' : 'display:none'}">
                                                                <div id="sampleOldPrice" class="old-price">
                                                                    <fmt:formatNumber value="${p.oldPrice}"
                                                                                      pattern="#,###"/> đ
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </form>
                    </div>

                </div>


                <%
                    String msg = (String) session.getAttribute("msg");
                    if (msg != null) {
                        if (msg.equals("success")) {
                %>
                <script>
                    alert("Cập nhật THÀNH CÔNG!!");
                </script>
                <%
                    }
                    if (msg.equals("fail")) {
                %>
                <script>
                    alert("Cập nhật THẤT BẠI!!");
                </script>
                <%
                        }
                        session.removeAttribute("msg");
                    }
                %>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/script.js"></script>
        <script src="../assets/js/scriptAdmin.js"></script>
        <script src="../assets/js/product_detail.js"></script>


</body>

</html>