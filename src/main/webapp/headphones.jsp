<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Tên sp - AuraSound");
    request.setAttribute("activePage", "product");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="assets/css/styleHeadphones.css">
</c:set>
<%@ include file="_header.jsp" %>
    <main class="store-container content headphones-page-container">

        <aside class="filter-sidebar" id="filter-sidebar">

            <div class="pt-3 pb-2">
                    <a href="store.jsp" class="btn btn-sm btn-primary" title="Quay lại">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
            </div>

            <button class="filter-toggle-btn" id="filter-toggle">
                <i class="bi bi-funnel-fill"></i> Bộ lọc
            </button>

            <div class="filter-wrapper">
                <div class="filter-header">
                    <h3>Bộ lọc</h3>
                    <button class="filter-close-btn" id="filter-close">&times;</button>
                </div>

                <div class="filter-group">
                    <h4>Hãng sản xuất</h4>
                    <div class="filter-options" data-filter-group="brand">
                        <button class="filter-option" data-filter="sony">Sony</button>
                        <button class="filter-option" data-filter="samsung">Samsung</button>
                        <button class="filter-option" data-filter="apple">Apple</button>
                        <button class="filter-option" data-filter="xiaomi">Xiaomi</button>
                        <button class="filter-option" data-filter="jbl">JBL</button>
                        <button class="filter-option" data-filter="marshall">Marshall</button>
                        <button class="filter-option" data-filter="ava">AVA+</button>
                    </div>
                </div>

                <div class="filter-group">
                    <h4>Loại tai nghe</h4>
                    <div class="filter-options" data-filter-group="type">
                        <button class="filter-option" data-filter="truewireless">True Wireless</button>
                        <button class="filter-option" data-filter="chup-tai">Chụp tai</button>
                        <button class="filter-option" data-filter="co-day">Có dây</button>
                    </div>
                </div>

                <div class="filter-group">
                    <h4>Tính năng</h4>
                    <div class="filter-options" data-filter-group="feature">
                        <button class="filter-option" data-filter="bluetooth">Bluetooth</button>
                        <button class="filter-option" data-filter="chong-on">Chống ồn</button>
                        <button class="filter-option" data-filter="chong-nuoc">Chống nước (IPX4+)</button>
                    </div>
                </div>

                <button class="filter-reset-btn" id="filter-reset">Xóa tất cả bộ lọc</button>
            </div>
        </aside>

        <div class="product-grid-container">
            <h1>Tai Nghe</h1>

            <div class="sort-options">
                <span>Sắp xếp theo:</span>
                <button class="sort-btn active" data-sort="default">Nổi bật</button>
                <button class="sort-btn" data-sort="price-asc">Giá tăng dần</button>
                <button class="sort-btn" data-sort="price-desc">Giá giảm dần</button>
            </div>

            <div class="product-grid" id="product-grid">
                <c:forEach items="${products}" var="p">
                    <a href="sproduct.jsp" class="product-card">
                        <div class="product-badge discount">
                            Giảm 50%
                        </div>
                        <img src="${p.img}"
                            alt="${p.name}">
                        <div class="product-card-info">
                            <h4>"${p.name}"</h4>
                            <div class="price-block">
                                <span class="new-price">"${p.price}<"/span>
                            </div>
                            <div class="product-bottom-row">
                                <div class="rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>"${p.avgRating}"</span>
                                </div>
                                <div class="favorite">
                                    <i class="bi bi-heart"></i>
                                    <i class="bi bi-heart-fill"></i>
                                    <span>Yêu thích</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>

            </div>

        <div class="pagination" id="pagination-buttons">
            <button class="page-btn active" data-page="1">1</button>
            <button class="page-btn" data-page="2">2</button>
            <button class="page-btn" data-page="3">3</button>
        </div>
        </div>
    </main>


<%@ include file="_footer.jsp" %>

</body>

</html>