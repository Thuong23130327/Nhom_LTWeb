<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/tag/_taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm - AuraSound</title>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProduct.css">
    <link rel="stylesheet" href="${AuraSound}/assets/css/styleCart.css">


</head>

<body>
<jsp:include page="/tag/_header.jsp"></jsp:include>
<main>
    <section class="container sproduct my-5 pt-5">
        <div class="row">
            <div class="gallery-container col-lg-5 col-md-12 col-12">
                <div class="main-img-container">
                    <img class="main-img img-fluid w-100 pb-1" src="${curVariant.mainImageUrl}" width="100%"
                         id="MainImg">
                </div>

                <div class="thumb-container">
                    <button class="scroll-btn left" onclick="prevImage()">&#10094;</button>

                    <div class="small-img-group" id="thumbScroll">
                        <c:forEach items="${images}" var="eachImg">
                            <img src="${eachImg}"
                                 class="small-img ${eachImg == curVariant.mainImageUrl ? 'active' : ''}"
                                 onclick="changeMainImg(this.src)">
                        </c:forEach>
                    </div>

                    <button class="scroll-btn right" onclick="nextImage()">&#10095;</button>
                </div>
            </div>

            <div class="info col-lg-6 col-md-12 col-12">
                <h6>Home / ${product.name}</h6>
                <h3>${product.name}</h3>
                <div class="star">
                    <span>${product.avgRating}</span>
                    <i class='bx bxs-star'></i>
                </div>

                <div class="price-block">
                    <span class="new-price" id="new-price"><fmt:formatNumber value="${product.sellPrice}"
                                                                             pattern="#,###"/> đ</span>
                    <span class="old-price" id="old-price"><fmt:formatNumber value="${product.oldPrice}"
                                                                             pattern="#,###"/> đ</span>
                </div>
                <form action="cart" method="post">
                    <input type="hidden" name="variantId" id="selectedVariantId" value="${curVariant.id}">
                    <div class="product-options">
                        <h4>Màu sắc: </h4>
                        <div class="color-options">
                            <c:forEach var="eachVar" items="${variants}">
                                <div class="color-item ${eachVar.id==curVariant.id?'active':''}"

                                     onclick="selectVariant(this)"
                                     data-id="${eachVar.id}"
                                     data-sellPrice="${eachVar.sellPrice}"
                                     data-marketPrice="${eachVar.marketPrice}"
                                     data-stock="${eachVar.stockQuantity}"
                                     data-img="${eachVar.mainImageUrl}">
                                    <img src="${eachVar.mainImageUrl}" alt="${eachVar.colorName}">
                                    <span>${eachVar.colorName}</span>
                                </div>

                            </c:forEach>
                        </div>
                    </div>

                    <div class="product-quantity">
                        <h4>Số lượng còn:
                            <span id="stock" data-stock="${curVariant.stockQuantity}">${curVariant.stockQuantity} </span>
                        </h4>
                        <button type="button" class="quantity-btn" onclick="updateQuan(-1)">-</button>
                        <input id="quanProduct" type="number" onchange="checkInput()" value="1">
                        <button type="button" class="quantity-btn" onclick="updateQuan(+1)">+</button>

                    </div>

                    <div class="btn">
                        <button class="buy-btn popup" id="cart-btn">Thêm vào giỏ hàng</button>

                        <a href="cart.html"><a href="checkout.html">
                            <button class="buy-btn">Mua Ngay</button>
                        </a></a>
                    </div>
                </form>


            </div>
        </div>
        </div>

    </section>

    <section class="container my-5 pt-5">
        <div class="row equal-columns">
            <div class="describe col-lg-6 col-md-12 col-12">
                <div class="specs-container">
                    <h3>Thông số kỹ thuật</h3>

                    <table class="specs-table">
                        <c:forEach items="${specs}" var="eachSpec">
                            <tr>
                                <td class="spec-title">${eachSpec.specName}</td>
                                <td class="spec-value" style="white-space: pre-line;">${eachSpec.specValue}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="col-lg-5 col-md-12 col-12">
                <div class=" describe-container">
                    <h3>Mô tả sản phẩm</h3>
                    <span style="white-space: pre-line;">${product.description}</span>
                </div>
            </div>
        </div>
    </section>

    <section class="boxReview">
        <div class="boxReview-head">
            <h3>Đánh giá</h3>
        </div>
        <div class="boxReview-review">
            <div class="boxReview-overView">
                <div class="score">
                    <span class="average">5.0</span>/5
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <p>23 lượt đánh giá</p>
                </div>


                <button class="btn-review">Viết đánh giá</button>
                <div class="over-lay"></div>
                <div class="wrapper">

                    <h3>Đánh giá sản phẩm</h3>
                    <form action="cart">
                        <div class="rating">
                            <input type="number" name="rating" hidden>
                            <i class='bx bx-star star'></i>
                            <i class='bx bx-star star'></i>
                            <i class='bx bx-star star'></i>
                            <i class='bx bx-star star'></i>
                            <i class='bx bx-star star'></i>
                        </div>
                        <textarea name="opinion" cols="30" rows="5" placeholder="Đánh giá của bạn..."></textarea>
                        <div class="btn-group">
                            <button type="submit" class="btn submit">Gửi</button>
                            <button class="btn cancel">Cancel</button>
                        </div>
                    </form>
                </div>


            </div>

            <div class="boxReview-rating">
                <div class="rating-level">
                    <div class="star-count">
                        <div>5</div>
                        <i class='bx bxs-star' style="color: goldenrod;"></i>
                    </div>
                    <progress class="progress" value="100" max="100"></progress>
                    <span>23 đánh giá</span>
                </div>
                <div class="rating-level">
                    <div class="star-count">
                        <div>4</div>
                        <i class='bx bxs-star' style="color: goldenrod;"></i>
                    </div>
                    <progress class="progress" value="0" max="100"></progress>
                    <span>0 đánh giá</span>
                </div>
                <div class="rating-level">
                    <div class="star-count">
                        <div>3</div>
                        <i class='bx bxs-star' style="color: goldenrod;"></i>
                    </div>
                    <progress class="progress" value="0" max="100"></progress>
                    <span>0 đánh giá</span>
                </div>
                <div class="rating-level">
                    <div class="star-count">
                        <div>2</div>
                        <i class='bx bxs-star' style="color: goldenrod;"></i>
                    </div>
                    <progress class="progress" value="0" max="100"></progress>
                    <span>0 đánh giá</span>
                </div>
                <div class="rating-level">
                    <div class="star-count">
                        <div>1</div>
                        <i class='bx bxs-star' style="color: goldenrod;"></i>
                    </div>
                    <progress class="progress" value="0" max="100"></progress>
                    <span>0 đánh giá</span>
                </div>
            </div>

            <div class="boxReview-experience">
                <h4>Đánh giá theo trải nghiệm</h4>
                <div class="experience-review-item">
                    <div class="item-title">Thời lượng pin</div>
                    <div class="result-item">
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <div class="item-point">5/5</div>
                        <div class="item-review-count">(19 đánh giá)</div>
                    </div>
                </div>
                <div class="experience-review-item">
                    <div class="item-title">Cảm giác đeo</div>
                    <div class="result-item">
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <div class="item-point">5/5</div>
                        <div class="item-review-count">(19 đánh giá)</div>
                    </div>
                </div>
                <div class="experience-review-item">
                    <div class="item-title">Chất âm</div>
                    <div class="result-item">
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <div class="item-point">5/5</div>
                        <div class="item-review-count">(19 đánh giá)</div>
                    </div>
                </div>
            </div>
        </div>


    </section>


    <section id="featured" class="my-5 pb-5">
        <div class="container text-center">
            <h3>Sản phẩm nổi bật</h3>
            <hr class="mx-auto">
            <p>Bạn có thể tìm thấy những sản phẩm nổi bật với giá cả hợp lí tại đây.</p>
        </div>
        <div class="row mx-auto container-fluid">
            <div class="product  col-lg-3 col-md-4 col-12">
                <a href="sproduct.html" class="product-card loa page-1">
                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/356825/loa-bluetooth-jbl-partybox-720-1-638976840411732460-750x500.jpg"
                         alt="Loa Bluetooth JBL Partybox 720">
                    <div class="product-card-info">
                        <h4>Loa Bluetooth JBL Partybox 720
                        </h4>
                        <div class="price-block">
                            <span class="new-price">20.900.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.0</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>

                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="checkout.html">
                    <button class="buy-btn">Mua Ngay</button>
                </a>
            </div>

        </div>
    </section>
</main>
<jsp:include page="/tag/_footer.jsp"></jsp:include>

<script src="${AuraSound}/assets/js/script.js"></script>
<script src="${AuraSound}/assets/js/scriptProfile.js"></script>
<script src="${AuraSound}/assets/js/scriptStore.js"></script>
</body>
</html>

<%--CODE CŨ--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="/tag/_taglibs.jsp" %>--%>

<%--&lt;%&ndash;%>
<%--    request.setAttribute("pageTitle", "Tên sp - AuraSound");--%>
<%--    request.setAttribute("activePage", "product");--%>
<%--    request.setAttribute("keepDefaultCss", true);--%>
<%--%>--%>

<%--<c:set var="customjs" scope="request">--%>
<%--    <script src="assets/js/scriptProduct.js"></script>--%>
<%--</c:set>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>${pageTitle}</title>--%>

<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">--%>
<%--    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet"/>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">--%>

<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleStore.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHome.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleProfile.css">--%>
<%--    <link rel="stylesheet" href="${AuraSound}/assets/css/styleHeadphones.css">--%>
<%--    <link rel="stylesheet" href="assets/css/product_detail.css">--%>

<%--</head>--%>

<%--<body>--%>

<%--&lt;%&ndash;%>

<%--%>--%>
<%--<main>--%>
<%--    <section class="container sproduct my-5 pt-5">--%>
<%--                <h2 class="product-price-detail" id="displayPrice">--%>
<%--                    <fmt:formatNumber value="${curVariant.price}" pattern="#,###"/> VNĐ--%>
<%--                </h2>--%>
<%--                <div class="product-options">--%>
<%--                    <h4 class="option-title">Màu sắc:</h4>--%>
<%--                    <div class="color-options-grid">--%>
<%--                        <c:forEach var="v" items="${variants}">--%>
<%--                            <div class="color-item" onclick="selectColor(this)" data-variant-id="${v.variantId}"--%>
<%--                                 data-img="${v.mainImageUrl}">--%>
<%--                                <img src="${v.mainImageUlr}" alt="${v.colorName}">--%>
<%--                                <span>${v.colorName}</span>--%>
<%--                                <div class="check-mark"><i class='bx bx-check'></i></div>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="quantity-section mt-4">--%>
<%--                    <h4 class="option-title mb-3">Số lượng: ${curVariant.stockQuantity}</h4>--%>
<%--                    <div class="quantity-input-group d-flex align-items-center mb-4">--%>
<%--                        &lt;%&ndash; Nút trừ/cộng giúp tăng UX trên mobile &ndash;%&gt;--%>
<%--                        <button class="qty-btn minus" onclick="changeQty(-1)">-</button>--%>
<%--                        <input type="number" value="1" min="1" class="qty-input" id="productQty">--%>
<%--                        <button class="qty-btn plus" onclick="changeQty(1)">+</button>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="action-btns d-flex gap-3">--%>
<%--                    <button class="btn-add-cart flex-grow-1" onclick="addToCart('${product.productId}')">--%>
<%--                        <i class='bx bx-cart-add'></i> Thêm vào giỏ hàng--%>
<%--                    </button>--%>
<%--                    <button class="btn-buy-now flex-grow-1" onclick="buyNow('${product.productId}')">--%>
<%--                        Mua Ngay--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>





