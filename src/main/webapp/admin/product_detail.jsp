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
    <link rel="stylesheet" href="${AuraSound}/assets/css/product_detail.css">
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

            <form class="bg-white p-4 p-md-5 rounded-3 shadow-lg">
                <!-- Thông tin cơ bản -->
                <section class="mb-5">
                    <h2 class="h5 section-title">
                        <i class="ri-information-line"></i>
                        <span>1.</span> Thông tin chung
                    </h2>

                    <!-- Sửa thông tin chung của sp -->
                    <div class="mb-3">
                        <div class="col-md-6">
                            <label for="product-name" class="form-label">Tên Sản phẩm <span
                                    class="text-required">:</span></label>
                            <input type="text" id="product-name" value="${p.name}" class="form-control"
                                   placeholder="Tên SP của bạn">
                        </div>
                        <div class="col-md-6">
                            <label for="product-sku" class="form-label">Mã SKU</label>
                            <input type="text" id="product-sku" value="${p.sku}" class="form-control"
                                   placeholder="Nhập mã SKU sản phẩm">
                        </div>

                        <div class="mb-3 mt-4">
                            <label for="product-short-desc" class="form-label">Mô tả</label>
                            <textarea id="product-short-desc" class="form-control" rows="3"
                                      placeholder="Tóm tắt ngắn gọn về sản phẩm.">
                                ${p.description}</textarea>
                        </div>

                    </div>
                </section>

                <section class="mb-5 border-top pt-4" id="var-detail">
                    <h2 class="h5 section-title">
                        <i class="ri-folder-open-line"></i>
                        <span>4.</span> Biến thể
                    </h2>

                    <!-- Trạng thái, Danh mục và Tồn kho -->
                    <div class="row g-3 mb-2">
                        <div class="col-md-2">
                            <label for="product-status" class="form-label">Các biến thể</label>
                            <select onchange="updateVariantInfo(this.value)" id="product-status" class="form-select">
                                <c:forEach items="${variants}" var="v">
                                    <option value="${v.colorName}" selected>${v.colorName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class=" form-label">Tên màu<span
                                    class="text-required">:</span></label>
                            <input type="text" id="var-colorName" value="" class="form-control"
                                   placeholder="Màu của biến thể">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Mã SKU</label>
                            <input type="text" id="var-sku" value="" class="form-control"
                                   placeholder="Nhập mã SKU sản phẩm">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Giá Chưa Giảm</label>
                            <input type="number" id="var-oldP" value="" class="form-control"
                                   placeholder="Nhập mã SKU sản phẩm">
                        </div>

                        <div class="col-md-3">
                            <label class="form-label">Giá Đã Giảm</label>
                            <input type="number" id="var-newP" value="" class="form-control"
                                   placeholder="Nhập mã SKU sản phẩm">
                        </div>

                        <div class="col-md-2">
                            <label for="product-stock" class="form-label">Số lượng kho</label>
                            <input type="number" id="var-stock" value="" class="form-control"
                                   placeholder="Số lượng">
                        </div>
                        <div class="col-md-2">
                            <label for="product-stock" class="form-label">Đã bán:</label>
                            <input type="number" id="var-sold" value="" class="form-control bg-light"
                                   placeholder="Số lượng" readonly>
                        </div>

                        <div class="col-md-3">
                            <label for="product-category" class="form-label">Danh mục</label>
                            <select id="product-category" class="form-select">
                                <option>Tai Nghe</option>
                                <option selected>Loa Bluetooth</option>
                                <option>Phụ kiện Âm thanh</option>
                            </select>
                        </div>
                        <input type="hidden" id="current-variant-id" value="">
                        <div class="d-flex flex-sm-row justify-content-end pt-1">
                            <button onclick="confirmDelete('v', document.getElementById('current-variant-id').value)" type="button" class="btn btn-outline-danger btn-accent me-sm-3 mb-0">
                                Xóa Biến thể
                            </button>
                            <button type="submit" class="btn btn-primary btn-gradient">
                                Lưu Thay Đổi
                            </button>
                        </div>
                    </div>
                </section>

                <!-- Chi tiết kỹ thuật -->

                <section class="mb-5 border-top pt-4" id="spec-detail">
                    <h2 class="h5 section-title">
                        <i class="ri-tools-line"></i>
                        <span>2.</span> Chi tiết kỹ thuật
                    </h2>

                    <div class="row g-3">
                        <!-- Công suất -->
                        <c:forEach items="${specs}" var="s">
                            <div class="col-md-3">
                                <label for="product-power" class="form-label">${s.specName}</label>
                                <textarea
                                        class="form-control"
                                        rows="3"
                                        placeholder="Nhập nội dung chi tiết...">${s.specValue}</textarea>
                            </div>
                        </c:forEach>

                    </div>
                </section>

                <!-- Nút Hành động -->
                <div class="d-flex flex-column flex-sm-row justify-content-end pt-4 border-top">
                    <button type="button" class="btn btn-outline-danger btn-accent me-sm-3 mb-3 mb-sm-0" onclick="confirmDelete('p','${p.id}')">
                        <i class="ri-delete-bin-line me-1"></i> Xóa Sản Phẩm
                    </button>

                    <!-- Nút Lưu -->

                    <button type="submit" class="btn btn-primary btn-gradient">
                        <i class="ri-save-line me-1"></i> Lưu Thay Đổi
                    </button>
                </div>

            </form>
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