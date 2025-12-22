 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="assets/css/styleHome.css">
    <link rel="stylesheet" href="assets/css/styleProfile.css">
    <link rel="stylesheet" href="assets/css/styleStore.css">
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%
     request.setAttribute("pageTitle", "Sản phẩm - AuraSound");
     request.setAttribute("activePage", "product");
     request.setAttribute("keepDefaultCss", true);
 %>
 <c:set var="customCss">
     <link rel="stylesheet" href="assets/css/styleProduct.css">
     <link rel="stylesheet" href="assets/css/styleCheckout.css">
 </c:set>
 <%@ include file="_header.jsp" %>

    <main class="store-container content">
        <h1>Sản Phẩm</h1>

        <div class="store-controls" id="filter-buttons">
            <a href="store.jsp"><button class="filter-btn active">Tất cả</button></a>
            <a href="headphones.jsp"><button class="filter-btn">Tai Nghe</button></a>
            <a href="speakers.jsp"><button class="filter-btn">Loa</button></a>
        </div>

        <div class="product-grid" id="product-grid">
            <a href="sproduct.jsp" class="product-card tai-nghe page-1">
                <div class="product-badge discount">
                    Giảm 18%
                </div>
                <img src="https://salt.tikicdn.com/cache/750x750/ts/product/ac/cf/71/908237eb3f6dfd93ee494866616de085.jpg.webp"
                    alt="Sony WH-1000XM5">

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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 10%
                </div>
                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/l/o/loa-jbl-charge-5-hong-pink-4.jpg"
                    alt="Loa JBL Charge 5">
                <div class="product-card-info">
                    <h4>Loa JBL Charge 5</h4>
                    <div class="price-block">
                        <span class="new-price">4.590.000đ</span>
                        <span class="old-price">3.990.000đ</span>
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
            <a href="sproduct.jsp" class="product-card tai-nghe page-2">
                <div class="product-badge discount">
                    Giảm 20%
                </div>
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/330709/tai-nghe-bluetooth-true-wireless-ava-go-p310-trang-1-638642413611048035-750x500.jpg"
                    alt="Sony WH-1000XM5">
                <div class="product-card-info">
                    <h4>Tai nghe Bluetooth True Wireless AVA+ Go P310 </h4>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 20%
                </div>
                <img src="https://cdn.tgdd.vn/Products/Images/2162/311100/loa-bluetooth-jbl-partybox-encore-2mic-5-750x500.jpg"
                    alt="Loa JBL Charge 5">
                <div class="product-card-info">
                    <h4>Loa Bluetooth JBL Partybox Encore 2Mic </h4>
                    <div class="price-block">
                        <span class="new-price">8.890.000đ</span>
                        <span class="old-price">10.700.000đ</span>
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
            <a href="sproduct.jsp" class="product-card tai-nghe page-1">
                <div class="product-badge discount">
                    Giảm 18%
                </div>
                <img src="https://cdn.tgdd.vn/Products/Images/54/311187/tai-nghe-bluetooth-chup-tai-havit-h661bt-2-750x500.jpg"
                    alt="Sony WH-1000XM5">
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
                            <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/356825/loa-bluetooth-jbl-partybox-720-1-638976840411732460-750x500.jpg"
                    alt="Loa Bluetooth JBL Partybox 720">
                <div class="product-card-info">
                    <h4>Loa Bluetooth JBL Partybox 720</h4>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 18%
                </div>
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/344851/loa-bluetooth-alpha-works-aw-w39-cam-1-638951930619876890-750x500.jpg"
                    alt="Loa Bluetooth Alpha Works AW-W39">
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
            <a href="sproduct.jsp" class="product-card tai-nghe page-1">
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/332455/tai-nghe-tws-jbl-wave-beam-2-den-3-638682176208572620-750x500.jpg"
                    alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">
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
            <a href="sproduct.jsp" class="product-card tai-nghe page-1">
                <div class="product-badge discount">
                    Giảm 39%
                </div>
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/54/333561/tai-nghe-tws-xiaomi-redmi-buds-6-den-3-638707208403801581-750x500.jpg"
                    alt="Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 ">
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 49%
                </div>
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/337351/loa-bluetooth-rezo-magsound-nau-1-638849101702450173-750x500.jpg"
                    alt="Loa Bluetooth Rezo MagSound">
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
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <img src="https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/2162/356866/loa-bluetooth-alpha-works-aw-ikon20-den-cam-1-638947617992323340-750x500.jpg"
                    alt="Loa Bluetooth Alpha Works AW-IKON20">
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
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 15%
                </div>
                <img src="https://tse3.mm.bing.net/th/id/OIP.ed4RLz1Z7QcIdYJ3167xEgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 Play">
                <div class="product-card-info">
                    <h4>Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 6 Play</h4>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 49%
                </div>
                <img src="https://cdn.tgdd.vn/Products/Images/54/74185/tai-nghe-chup-tai-kanen-ip-2-750x500-2090.png"
                    alt="Tai nghe Chụp Tai Kanen IP-2090">
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 56%
                </div>
                <img src="https://product.hstatic.net/200000722513/product/0-1_0edf0066fcec493d8012e1bfecfb94d7.jpg"
                    alt="Tai nghe Soundpeats Capsule 3 Pro">
                <div class="product-card-info">
                    <h4>Tai nghe Soundpeats Capsule 3 Pro </h4>
                    <div class="price-block">
                        <span class="new-price">350.000đ</span>
                        <span class="old-price">690.000đ</span>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 43%
                </div>
                <img src="https://greetingsvietnam.com/wp-content/uploads/2021/09/tai_nghe_bluetooth_samsung.jpg"
                    alt="Tai nghe Samsung Galaxy Buds Pro">
                <div class="product-card-info">
                    <h4>Tai nghe Samsung Galaxy Buds Pro</h4>
                    <div class="price-block">
                        <span class="new-price">1.590.000đ</span>
                        <span class="old-price">2.590.000đ</span>
                    </div>
                    <div class="product-bottom-row">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span>4.3</span>
                        </div>
                        <div class="favorite">
                            <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 50%
                </div>
                <img src="https://tse2.mm.bing.net/th/id/OIP._gFpIR9N8ClZJ1Uf5ywlZwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3"
                    alt="Tai nghe Havit TW 967">
                <div class="product-card-info">
                    <h4>Tai nghe Havit TW 967 </h4>
                    <div class="price-block">
                        <span class="new-price">350.000đ</span>
                        <span class="old-price">700.000đ</span>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 56%
                </div>
                <img src="https://www.tnc.com.vn/uploads/product/sp2025/ext/loa-bluetooth-sony-ult-field-3-srs-ult30-white-166533.webp"
                    alt="Loa Bluetooth Sony ULT Field 3 SRS-ULT30 (SRS-ULT30/W)">
                <div class="product-card-info">
                    <h4>Loa Bluetooth Sony ULT Field 3 SRS-ULT30 (SRS-ULT30/W) </h4>
                    <div class="price-block">
                        <span class="new-price">1.890.000đ</span>
                        <span class="old-price">3,890,000đ</span>
                    </div>
                    <div class="product-bottom-row">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span>4.6</span>
                        </div>
                        <div class="favorite">
                            <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 50%
                </div>
                <img src="https://www.winwinstore.vn/wp-content/uploads/2021/08/loa-bluetooth-sony-srs-xb13-black-8.jpeg"
                    alt="Loa bluetooth Sony SRS-XB13">
                <div class="product-card-info">
                    <h4>Loa bluetooth Sony SRS-XB13 </h4>
                    <div class="price-block">
                        <span class="new-price">645.000đ</span>
                        <span class="old-price">1.290.000đ</span>
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
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 39%
                </div>
                <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/l/o/loa-bluetooth-havit-sk810bt_5_.png"
                    alt="Loa Bluetooth Havit SK810BT">
                <div class="product-card-info">
                    <h4>Loa Bluetooth Havit SK810BT </h4>
                    <div class="price-block">
                        <span class="new-price">690.000đ</span>
                        <span class="old-price">1.100.000đ</span>
                    </div>
                    <div class="product-bottom-row">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span>4.4</span>
                        </div>
                        <div class="favorite">
                            <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>
            <a href="sproduct.jsp" class="product-card loa page-1">
                <div class="product-badge discount">
                    Giảm 46%
                </div>
                <img src="https://product.hstatic.net/1000213339/product/havit-h628bt-black_b9156096ada2423ab1f2ac2758e30140_1024x1024.jpg"
                    alt="Tai nghe Bluetooth chụp tai Havit H628BT">
                <div class="product-card-info">
                    <h4>Tai nghe Bluetooth chụp tai Havit H628BT</h4>
                    <div class="price-block">
                        <span class="new-price">590.000đ</span>
                        <span class="old-price">1.100.000đ</span>
                    </div>
                    <div class="product-bottom-row">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span>5.0</span>
                        </div>
                        <div class="favorite">
                            <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </main>

 <%@ include file="_footer.jsp" %>

</body>

</html>