<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/tag/_taglibs.jsp" %>

<%
    request.setAttribute("pageTitle", "QUẢN LÝ GIAO DIỆN - AuraSound");
    request.setAttribute("activePage", "custom");
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

            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-2 border-bottom">
                <h2 class="h2 section-title text-primary">
                    Quản lý giao diện
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
                <div class="card shadow-sm mt-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Để lại đánh giá của bạn</h5>
                    </div>
                    <div class="card-body">
                        <form action="${AuraSound}/submit-review" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="pid" value="${p.id}"> <div class="mb-3">
                            <label class="form-label d-block">Mức độ hài lòng:</label>
                            <div class="star-rating">
                                <input type="radio" name="rating" id="star-5" value="5" required />
                                <label for="star-5" title="5 sao"><i class="fas fa-star"></i></label>
                                <input type="radio" name="rating" id="star-4" value="4" />
                                <label for="star-4" title="4 sao"><i class="fas fa-star"></i></label>
                                <input type="radio" name="rating" id="star-3" value="3" />
                                <label for="star-3" title="3 sao"><i class="fas fa-star"></i></label>
                                <input type="radio" name="rating" id="star-2" value="2" />
                                <label for="star-2" title="2 sao"><i class="fas fa-star"></i></label>
                                <input type="radio" name="rating" id="star-1" value="1" />
                                <label for="star-1" title="1 sao"><i class="fas fa-star"></i></label>
                            </div>
                        </div>

                            <div class="mb-3">
                                <label for="comment" class="form-label">Cảm nhận về sản phẩm:</label>
                                <textarea name="comment" id="comment" class="form-control" rows="3" placeholder="Chia sẻ trải nghiệm của bạn về âm thanh, thiết kế..."></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Thêm hình ảnh thực tế (nếu có):</label>
                                <input type="file" name="reviewFiles" class="form-control" accept="image/*" multiple onchange="previewReviewImages(this)">
                                <div id="review-preview" class="d-flex gap-2 mt-2"></div>
                            </div>

                            <button type="submit" class="btn btn-primary px-4">Gửi Đánh Giá</button>
                        </form>
                    </div>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex justify-content-between">
                        <h6>Ảnh Banner</h6>
                        <form action="${AuraSound}/admin/upd-product?action=addGalery" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="inputPid" value="${p.id}">
                            <input type="file" name="galleryFiles" class="d-none" id="btn-upload"
                                   onchange="this.form.submit()">
                            <button type="button" class="btn btn-sm btn-success"
                                    onclick="document.getElementById('btn-upload').click()">
                                <i class="fas fa-plus"></i> Thêm ảnh mới
                            </button>
                        </form>
                    </div>

                    <div class="card-body">
                        <form action="${AuraSound}/admin/upd-product?action=updateOrder" method="post">
                            <input type="hidden" name="inputPid" value="${p.id}">
                            <div class="row">
                                <c:forEach items="${images}" var="img">
                                    <div class="col-md-3 mb-3 text-center">
                                        <div class="border p-2 rounded">
                                            <img src="${img.imageUrl}" class="img-fluid rounded mb-2"
                                                 style="height: 120px; object-fit: cover;">

                                            <input type="hidden" name="imgIds" value="${img.id}">
                                            <div class="input-group input-group-sm mb-2">
                                                <span class="input-group-text">Thứ tự</span>
                                                <input type="number" name="orders" value="${img.sortOrder}"
                                                       class="form-control text-center">
                                            </div>

                                            <a href="${AuraSound}/admin/upd-product?action=delGalery&imgId=${img.id}&inputPid=${p.id}"
                                               class="btn btn-sm btn-outline-danger w-100"
                                               onclick="return confirm('Xóa ảnh này khỏi AuraSound?')">
                                                <i class="fas fa-trash"></i> Xóa ảnh
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Lưu thứ tự hiển thị</button>
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