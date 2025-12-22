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
                <a href="sproduct.jsp" class="product-card" data-brand="sony" data-type="chup-tai"
                   data-feature="bluetooth chong-on" data-price="7990000">
                    <div class="product-badge discount">
                        Giảm 18%
                    </div>
                    <img src="https://salt.tikicdn.com/cache/750x750/ts/product/ac/cf/71/908237eb3f6dfd93ee494866616de085.jpg.webp"
                        alt="Sony WH-1000XM5">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Sony WH-1000XM5</h4>

                        <div class="price-block">
                            <span class="new-price">7.990.000đ</span>
                            <span class="old-price">9.690.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.7</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i>
                                <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="200000">

                    <!-- Tag giảm giá -->
                    <div class="product-badge discount">
                        Giảm 20%
                    </div>
                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/330709/tai-nghe-bluetooth-true-wireless-ava-go-p310-trang-1-638642413611048035-750x500.jpg"
                        alt="Sony WH-1000XM5">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless AVA+ Go P310 </h4>

                        <div class="price-block">
                            <span class="new-price">200.000đ</span>
                            <span class="old-price">250.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.7</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>

                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="200000">

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


                <a href="sproduct.jsp" class="product-card" data-brand="sony" data-type="truewireless"
                   data-feature="bluetooth" data-price="1390000">

                    <img
                        src="https://cdn.tgdd.vn/Products/Images/54/313694/tai-nghe-bluetooth-chup-tai-sony-wh-ch520-kem-1-750x500.jpg">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth Chụp Tai Sony WH-CH520 </h4>

                        <div class="price-block">
                            <span class="new-price">990.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>4.5</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>

                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="260000">

                    <img
                        src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/344789/tai-nghe-bluetooth-true-wireless-ava-freego-w30-be-1-638953531706676388-750x500.jpg">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless AVA+ FreeGo W30 </h4>

                        <div class="price-block">
                            <span class="new-price">260.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="Rezo" data-type="truewireless"
                   data-feature="bluetooth" data-price="460000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/344791/tai-nghe-bluetooth-true-wireless-rezo-wave-be-1-638974193969452581-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Rezo Wave </h4>

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

                <a href="sproduct.jsp" class="product-card" data-brand="marshall" data-type="truewireless"
                   data-feature="bluetooth" data-price="3270000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/325339/tai-nghe-bluetooth-true-wireless-marshall-minor-iv-kem-4-638765963642589793-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Marshall Minor IV </h4>

                        <div class="price-block">
                            <span class="new-price">3.270.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="990000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/358222/tai-nghe-bluetooth-open-ear-tws-baseus-eli-sport-2-trang-1-638966551249565795-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth Open-Ear TWS Baseus Eli Sport 2</h4>

                        <div class="price-block">
                            <span class="new-price">990.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="1050000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/357872/tai-nghe-chup-tai-gaming-razer-blackshark-v2-x-den-1-638966414132244492-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Chụp tai Gaming Razer BlackShark V2 X Mẫu mới </h4>

                        <div class="price-block">
                            <span class="new-price">1.050.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="490000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/339344/tai-nghe-bluetooth-true-wireless-havit-tw943-pro-trang-1-638853257824365639-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Havit TW943 Pro Tai nghe Bluetooth True Wireless Havit
                            TW943 Pro </h4>

                        <div class="price-block">
                            <span class="new-price">490.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="230000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/330247/tai-nghe-bluetooth-true-wireless-ava-freego-w28-den-2-638635667837693318-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless AVA+ FreeGo W28 </h4>

                        <div class="price-block">
                            <span class="new-price">230.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="3390000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/357871/tai-nghe-bluetooth-chup-tai-gaming-razer-barracuda-x-chroma-den-1-638966397359387402-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth Chụp Tai Gaming Razer Barracuda X Chroma Mẫu mới </h4>

                        <div class="price-block">
                            <span class="new-price">3.390.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="490000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/358391/tai-nghe-bluetooth-true-wireless-havit-life-nc01t-tw984-1-638974297502180594-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Havit LIFE NC01T TW984</h4>

                        <div class="price-block">
                            <span class="new-price">490.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="890000">

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/357563/tai-nghe-tws-realme-buds-t200-xam-1-638956932350520566-750x500.jpg"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless Realme Buds T200 Tai nghe Bluetooth True Wireless Realme
                            Buds T200</h4>

                        <div class="price-block">
                            <span class="new-price">890.000đ</span>
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



                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="3390000">
                    <div class="product-badge discount">
                        Giảm 15%
                    </div>

                    <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/329993/tai-nghe-bluetooth-true-wireless-xiaomi-redmi-buds-6-play-den-1-638627096017625880-750x500.jpg"
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
                </a>
                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="3390000">
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
                </a>
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