<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ SẢN PHẨM - AuraSound");
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

                        <a class="a-nodecor" href="#">
                            <div class="contact">Sửa Sản Phẩm</div>
                        </a>

                        <a class="a-nodecor" href="#product-detail">
                            <div class="contact">${p.name}</div>
                        </a>

                        <a class="a-nodecor" href="#var-detail">
                            <div class="contact">Sửa Biến Thể</div>
                        </a>

                        <a class="a-nodecor" href="#spec-detail">
                            <div class="contact">Sửa Thông Số</div>
                        </a>

                        <a class="a-nodecor" href="#">
                            <div class="contact">Sửa Ảnh SP</div>
                        </a>
                    </div>

                    <div id="hamburger-icon"><i class="bi bi-list"></i></div>
                </div>

            </nav>

            <div class="mb-3 title" id="product-detail">
                <a href="products.jsp" class="btn btn-primary btn-gradient btn-sm rounded-3"
                   title="Quay lại danh sách Sản phẩm">
                    <i class="ri-arrow-left-line me-1"></i> Quay lại
                </a>
                <span class="header-title"> CHỈNH SỬA SẢN PHẨM </span>
            </div>

            <div id="order-detail-content" class="content-section active">
                <div class="col-lg-12 mb-2 ">
                    <div class="card h-100">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-9 mb-2 ">
                                    <span><i class="fas fa-user-circle me-2"></i>Thông tin chung</span>
                                </div>

                                <div class="col-lg-3 mb-2 ">
                                    <div class="d-flex flex-sm-row justify-content-end">
                                        <button onclick="confirmDelete('v', document.getElementById('current-variant-id').value)"
                                                type="button" class="btn btn-outline-danger btn-accent">
                                            Ẩn SP
                                        </button>
                                        <button type="submit" class="btn btn-primary btn-gradient ms-2">
                                            Lưu Thay Đổi
                                        </button>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-4 mb-2 ">

                                    <span><strong>Thương hiệu: </strong></span>
                                    <select onchange="" id="product-status"
                                            class="form-select mb-3">
                                        <c:forEach items="${variants}" var="v">
                                            <option value="${v.colorName}" selected>${v.colorName}</option>
                                        </c:forEach>
                                    </select>


                                    <span><strong>Danh mục: </strong></span>
                                    <select id="product-category" class="form-select">
                                        <option>Tai Nghe</option>
                                        <option selected>Loa Bluetooth</option>
                                        <option>Phụ kiện Âm thanh</option>
                                    </select>


                                    <span><strong>Tên SP: </strong></span>
                                    <input type="text" id="product-name"
                                           value="${p.name}"
                                           class="form-control mb-3"
                                           placeholder="Tên SP">

                                    <span><strong>SKU: </strong></span>
                                    <input type="text" id="product-sku" value="${p.sku}" class="form-control mb-3"
                                           placeholder="Nhập mã SKU sản phẩm">

                                </div>

                                <div class="col-lg-4 mb-2 ">


                                    <span><strong>Mô tả: </strong></span>
                                    <textarea id="product-short-desc"
                                              class="form-control"
                                              style="height: 200px; resize: vertical;"
                                              placeholder="Tóm tắt ngắn gọn về sản phẩm.">${p.description}</textarea>
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
                                                           data-discount="${v.discountPercent}">
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
                    </div>


                </div>

                <div class="col-lg-12 mb-2 ">
                    <div class="card h-100">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-4 mb-2 ">
                                    <span><i class="fas fa-user-circle me-2"></i>Biến thể </span>
                                </div>

                                <div class="col-lg-3 mb-2 d-flex align-items-center">
                                    <span class="text-nowrap"><strong>Đã bán: </strong></span>
                                    <input type="number" id="var-sold" value="" class="form-control bg-light ms-2"
                                           placeholder="Số lượng" readonly>
                                </div>

                                <div class="col-lg-2 mb-2 ">
                                    <select onchange="updateVariantInfo(this.value)" id="product-status"
                                            class="form-select">
                                        <c:forEach items="${variants}" var="v">
                                            <option value="${v.colorName}" selected>${v.colorName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-3 mb-2 ">
                                    <div class="d-flex flex-sm-row justify-content-end">
                                        <button onclick="confirmDelete('v', document.getElementById('current-variant-id').value)"
                                                type="button" class="btn btn-outline-danger btn-accent">
                                            Xóa Biến thể
                                        </button>
                                        <button type="submit" class="btn btn-primary btn-gradient ms-2">
                                            Lưu Thay Đổi
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-4 mb-2 ">
                                    <span><strong>Tên màu: </strong></span>
                                    <input type="text" id="var-colorName" value="" class="form-control"
                                           placeholder="Màu của biến thể">

                                    <span><strong>SKU biến thể: </strong></span>
                                    <input readonly type="text" id="var-sku" value="" class="form-control"
                                           placeholder="Nhập mã SKU sản phẩm">

                                    <span><strong>Số lượng kho: </strong></span>
                                    <input type="text" id="product-sku" value="${p.sku}" class="form-control mb-3"
                                           placeholder="Nhập mã SKU sản phẩm">

                                </div>

                                <div class="col-lg-4 mb-2 ">
                                    <span><strong>Giá Chưa Giảm </strong></span>
                                    <input type="number" id="var-oldP" value="" class="form-control"
                                           placeholder="Nhập mã SKU sản phẩm">

                                    <span><strong>Giá Đã Giảm </strong></span>
                                    <input type="number" id="var-newP" value="" class="form-control"
                                           placeholder="Nhập mã SKU sản phẩm">

                                    <span class="mb-4"><strong>Ảnh đại diện: </strong></span>
                                    <input type="number" id="var-pic" value="" class="form-control"
                                           placeholder="Nhập link ảnh sp">
                                    <input type="hidden" id="current-variant-id" value="">

                                </div>

                                <div class="col-lg-4 mb-2 ">
                                    <img style="height: 150px; width: 150px;" id="varImg" src="${p.img}" alt="${p.name}"
                                         onerror="this.src='https://placehold.co/300x300?text=No+Image'">

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-12 mb-2 ">
                    <div class="card h-100">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-8">
                                    <span><i class="fas fa-user-circle me-2"></i>Chi tiết kỹ thuật </span>
                                </div>
                                <div class="col-lg-3 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary btn-gradient">
                                            Lưu Thay Đổi
                                        </button>
                                </div>

                            </div>


                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <c:forEach items="${specs}" var="s">
                                    <div class="col-lg-3">
                                        <label for="product-power" class="form-label">${s.specName}</label>
                                        <textarea
                                                class="form-control"
                                                rows="3"
                                                placeholder="Nhập nội dung chi tiết...">${s.specValue}</textarea>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </main>

        <script>
            const productVariants = ${variantsJson};
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/script.js"></script>
        <script src="../assets/js/scriptAdmin.js"></script>
        <script src="../assets/js/product_detail.js"></script>
</body>

</html>