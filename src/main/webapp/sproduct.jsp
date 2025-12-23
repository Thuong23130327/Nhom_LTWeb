<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Tên sp - AuraSound");
    request.setAttribute("activePage", "product");
    request.setAttribute("keepDefaultCss", true);
%>

<c:set var="customCss" scope="request">
    <script src="assets/js/scriptProduct.js"></script>
</c:set>
<%@ include file="_header.jsp" %>
<main>
    <section class="container sproduct my-5 pt-5">
        <div class="row">
            <div class="gallery-container col-lg-5 col-md-12 col-12">
                <%-- Ảnh chính - Giữ nguyên class và id --%>
                <img class="main-img img-fluid w-100 pb-1" src="${prod.mainImageUrl}" width="100%" id="MainImg">

                <div class="thumb-container">
                    <button class="scroll-btn left" onclick="prevImage()">&#10094;</button>

                    <div class="small-img-group" id="thumbScroll">
                        <c:forEach var="imgUrl" items="${images}" varStatus="status">
                            <div class="small-img-col">
                                <img src="${imgUrl}" width="100%" class="small-img ${status.first ? 'active' : ''}"
                                     onclick="showImg(this, ${status.index})">
                            </div>
                        </c:forEach>
                    </div>

                    <button class="scroll-btn right" onclick="nextImage()">&#10095;</button>
                </div>
            </div>

            <div class="info col-lg-6 col-md-12 col-12">
                <h6>Home / ${product.categoryName}</h6>
                <h3>${product.productName}</h3>
                <h2>${product.basePrice} VNĐ</h2>

                <div class="product-options">
                    <h4>Màu sắc: </h4>
                    <div class="color-options">
                        <c:forEach var="v" items="${variants}">
                            <div class="color-item" onclick="selectColor(this)" data-img="${v.mainImageUrl}">
                                <img src="${v.mainImageUlr}" alt="${v.colorName}">
                                <span>${v.colorName} - ${v.sellPrice} VNĐ</span>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="product-quantity">
                    <h4>Số lượng: </h4>
                    <input type="number" value="1">
                </div>

                <div class="btn">
                    <button class="buy-btn popup" id="cart-btn">Thêm vào giỏ hàng</button>
                    <a href="checkout.jsp">
                        <button class="buy-btn">Mua Ngay</button>
                    </a>
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
                        <c:forEach var="s" items="${specs}">
                            <tr>
                                <td class="spec-title">${s.specName}</td>
                                <td>${s.specValue}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="col-lg-5 col-md-12 col-12">
                <div class=" describe-container">
                    <h3>Mô tả sản phẩm</h3>
                    <span>Tai nghe Sony WH-CH520 sở hữu âm thanh kỹ thuật số DSEE giúp mang lại âm thanh chân thực
                            cùng
                            với đó là pin cho thời gian sử dụng tới 40 giờ. Bên cạnh đó, sản phẩm tai nghe Sony này sở
                            hữu
                            thiết
                            kế khá gọn nhẹ cùng với thiết kế tích hợp micro vô cùng tiện lợi. Thưởng thức âm thanh chất
                            lượng cao suốt cả ngày.
                            Trải nghiệm lắng nghe dành riêng cho bạn. Cơ chế tăng cường âm thanh kỹ thuật số (DSEE)
                            khôi phục các hòa âm và độ sống động bị mất trong quá trình nén nhạc thông thường, mang lại
                            âm
                            thanh trung thực hơn.</span>
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
                    <form action="#">
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
                <a href="sproduct.jsp" class="product-card loa page-1">
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
                </a> <a href="checkout.jsp">
                <button class="buy-btn">Mua Ngay</button>
            </a>

            </div>

            <div class="product col-lg-3 col-md-4 col-12">
                <a href="sproduct.jsp" class="product-card loa page-1">
                    <!-- Tag giảm giá -->
                    <div class="product-badge discount">
                        Giảm 18%
                    </div>
                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/344851/loa-bluetooth-alpha-works-aw-w39-cam-1-638951930619876890-750x500.jpg"
                         alt="Loa Bluetooth Alpha Works AW-W39">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth Alpha Works AW-W39</h4>

                        <div class="price-block">
                            <span class="new-price">1.990.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.2</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>

                </a>
                <a href="checkout.jsp">
                    <button class="buy-btn">Mua Ngay</button>
                </a>

            </div>


            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card tai-nghe page-1">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/332455/tai-nghe-tws-jbl-wave-beam-2-den-3-638682176208572620-750x500.jpg"
                         alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless JBL Wave Beam 2 </h4>

                        <div class="price-block">
                            <span class="new-price">1.390.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.2</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>

                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="checkout.jsp">
                    <button class="buy-btn">Mua Ngay</button>
                </a>

            </div>

            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card tai-nghe page-1">

                    <!-- Tag giảm giá -->
                    <div class="product-badge discount">
                        Giảm 39%
                    </div>
                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/333561/tai-nghe-tws-xiaomi-redmi-buds-6-den-3-638707208403801581-750x500.jpg"
                         alt="Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 </h4>

                        <div class="price-block">
                            <span class="new-price">1.490.000đ</span>
                            <span class="old-price">890.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.9</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>

                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="checkout.jsp">
                    <button class="buy-btn">Mua Ngay</button>
                </a>

            </div>


            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card loa page-1">

                    <!-- Tag giảm giá -->
                    <div class="product-badge discount">
                        Giảm 49%
                    </div>
                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/337351/loa-bluetooth-rezo-magsound-nau-1-638849101702450173-750x500.jpg"
                         alt="Loa Bluetooth Rezo MagSound">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth Rezo MagSound</h4>

                        <div class="price-block">
                            <span class="new-price">390.000đ</span>
                            <span class="old-price">590.000đ</span>

                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.2</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a> <a href="checkout.jsp">
                <button class="buy-btn">Mua Ngay</button>
            </a>

            </div>

            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card loa page-1">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/356866/loa-bluetooth-alpha-works-aw-ikon20-den-cam-1-638947617992323340-750x500.jpg"
                         alt="                    Loa Bluetooth Alpha Works AW-IKON20">
                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth Alpha Works AW-IKON20</h4>

                        <div class="price-block">
                            <span class="new-price">3.890.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.2</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a> <a href="checkout.jsp">
                <button class="buy-btn">Mua Ngay</button>
            </a>

            </div>

            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card loa page-1">
                    <div class="product-badge discount">
                        Giảm 15%
                    </div>

                    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-khong-day-havit-tw-931_3_.png"
                         alt="Loa JBL Charge 5">
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 Play </h4>
                        <div class="price-block">
                            <span class="new-price">330.000đ</span>
                            <span class="old-price">380.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.8</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a> <a href="checkout.jsp">
                <button class="buy-btn">Mua Ngay</button>
            </a>

            </div>

            <div class="product  col-lg-3 col-md-4 col-12">

                <a href="sproduct.jsp" class="product-card loa page-1">
                    <div class="product-badge discount">
                        Giảm 49%
                    </div>

                    <img src="https://cdn.tgdd.vn/Products/Images/54/74185/tai-nghe-chup-tai-kanen-ip-2-750x500-2090.png"
                         alt="Loa JBL Charge 5">
                    <div class="product-card-info">
                        <h4>Tai nghe Chụp Tai Kanen IP-2090 </h4>
                        <div class="price-block">
                            <span class="new-price">390.000đ</span>
                            <span class="old-price">590.000đ</span>
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
                </a> <a href="checkout.jsp">
                <button class="buy-btn">Mua Ngay</button>
            </a>
            </div>
        </div>
    </section>
</main>
<%
    request.setAttribute("keepDefaultJs", true);
%>

<c:set var="customJs" scope="request">
    <script src="assets/js/scriptProduct.js"></script>
</c:set>

<%@ include file="_footer.jsp" %>


</body>


</html>