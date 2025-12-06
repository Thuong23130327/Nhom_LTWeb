<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loa - AuraSound</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/styleHome.css">
    <link rel="stylesheet" href="assets/css/styleProfile.css">
    <link rel="stylesheet" href="assets/css/styleStore.css">
    <link rel="stylesheet" href="assets/css/styleHeadphones.css">

</head>

<body>
    <!-- header -->

    <button onclick="backTop()" id="back-top-btn" title="Lên đầu trang">
        <i class="bi bi-caret-up-fill"></i>
    </button>
    <header>
        <div class="header-container content">
            <div class="head-left">
                <div class="head-scroll">
                    <div class="text-item">AuraSound - Âm thanh định hình phong cách</div>
                    <div class="text-item">Chuyên các loại Loa, Tai nghe chính hãng</div>
                    <div class="text-item">AuraSound - Âm thanh định hình phong cách</div>
                    <div class="text-item">Bảo hành 1 đổi 1 trong 1 tháng</div>
                </div>
            </div>
            <div class="head-right">
                <div class="info-item"><a href="contact.jsp">Cửa hàng gần đây</a></div>
                <div class="info-item"><a href="profileM/order-history.jsp">Tra cứu đơn hàng</a></div>
                <div class="info-item"><a href="tel:19001919">1900 1919</a></div>
            </div>
        </div>
    </header>

    <nav>
        <div class="nav-container content">
            <div class="nav-left">
                <a class="a-nodecor logo-container" href="index.jsp">
                    <div class="logo-wave">
                        <div class="sound-wave wave1"></div>
                        <div class="sound-wave wave2"></div>
                        <div class="sound-wave wave3"></div>
                    </div>
                    <span class="logo-text">AuraSound</span>
                </a>
            </div>
            <div class="nav-right">
                <div class="searchBar">
                    <input type="text" placeholder="Tìm kiếm">
                    <a href="#"><i class="bi bi-search"></i></a>
                </div>
                <a class="a-nodecor" href="index.jsp">
                    <div class="home">
                        Trang chủ</div>
                </a>
                <a class="a-nodecor" href="contact.jsp">
                    <div class="contact">
                        Liên hệ</div>
                </a>
                <div class="nav-item-dropdown">
                    <a class="a-nodecor active" href="store.jsp">
                        <div class="store">
                            Sản phẩm
                            <i class="bi bi-chevron-compact-down"></i>
                        </div>
                    </a>

                    <div class="menu-product">
                        <a class="a-nodecor" href="speakers.jsp">
                            <div>Loa</div>
                        </a>
                        <a class="a-nodecor" href="headphones.jsp">
                            <div>Tai nghe</div>
                        </a>
                    </div>
                </div>

                <a class="a-nodecor" href="cart.jsp">
                    <div class="cart"> <i class="bi bi-cart"></i>
                        Giỏ hàng</div>
                </a>
                <div class="nav-account">
                    <!-- hiện khi chưa đăng nhập -->
                    <a class="a-nodecor login-link" href="login.jsp">
                        <div class="login">Đăng nhập</div>
                    </a>
                    <!-- hiện khi đã đăng nhập -->
                    <div class="account-avatar">
                        <a href="profileM/profile.jsp" class="avatar-link">
                            <img src="assets/img/avatar/HoaiThuong.png" alt="Avatar">
                        </a>
                        <div class="account-menu">
                            <a class="account-menu-item" href="profileM/profile.jsp">Thông tin tài khoản</a>
                            <a class="account-menu-item" href="login.jsp" id="navLogout">Đăng xuất</a>
                        </div>
                    </div>
                </div>
                <div id="hamburger-icon">
                    <i class="bi bi-list"></i>
                </div>
            </div>

        </div>
    </nav>

    <div class="mobile-menu" id="mobile-menu-container">
        <div class="mobile-menu-header">
            <div class="logo-container">
                <a href="index.jsp" class="a-nodecor">
                    <div class="logo-wave">
                        <div class="sound-wave wave1"></div>
                        <div class="sound-wave wave2"></div>
                        <div class="sound-wave wave3"></div>
                    </div>
                    <span class="logo-text">AuraSound</span>
                </a>
            </div>
            <i class="bi bi-x-lg" id="mobile-menu-close"></i>
        </div>

        <div class="mobile-menu-item">
            <div class="searchBar">
                <input type="text" placeholder="Tìm kiếm">
                <a href="#"><i class="ri-search-line"></i></a>
            </div>
        </div>

        <div class="mobile-menu-item">
            <a href="cart.jsp">Giỏ hàng</a>
        </div>
        <div class="mobile-menu-item">
            <a href="login.jsp" class="nav-login-btn">Đăng nhập</a>
        </div>
        <div class="mobile-menu-item">
            <a href="contact.jsp">Liên hệ</a>
        </div>
        <div class="mobile-menu-item ">
            <a href="store.jsp">Sản phẩm</a>
        </div>
    </div>
    <div class="overlay" id="menu-overlay"></div>

    <!-- HẾT PHẦN HEAD, NAV, MENU = -->

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
                        <button class="filter-option" data-filter="jbl">JBL</button>
                        <button class="filter-option" data-filter="marshall">Marshall</button>
                    </div>
                </div>

                <div class="filter-group">
                    <h4>Loại Loa</h4>
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
            <h1>Loa</h1>

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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="200000">
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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="200000">

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


                <a href="sproduct.jsp" class="product-card" data-brand="sony" data-type="truewireless"
                   data-feature="bluetooth" data-price="1390000">

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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="260000">

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
                </a>


                <a href="sproduct.jsp" class="product-card" data-brand="Rezo" data-type="truewireless"
                   data-feature="bluetooth" data-price="460000">
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
                </a>

                <a href="sproduct.jsp" class="product-card" data-brand="Rezo" data-type="truewireless"
                   data-feature="bluetooth" data-price="460000">
                    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/l/o/loa-bluetooth-harman-kardon-aura-studio-5-den_7_.png"
                        alt="Loa Bluetooth Alpha Works AW-IKON20">
                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth Harman Kardon Aura Studio 5</h4>

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

    <footer class="footer-container">
        <div class="row container mx-auto pt-5">
            <div class="footer-one col-lg-3 col-md-6 col-12">
                <a class=" a-nodecor" href="index.jsp">
                    <div class="logo-container">
                        <div class="logo-wave">
                            <div class="sound-wave wave1"></div>
                            <div class="sound-wave wave2"></div>
                            <div class="sound-wave wave3"></div>
                        </div>
                        <span class="logo-text">AuraSound</span>
                    </div>
                </a>

                <p class="pt-3">Với Aura Sound, âm nhạc không chỉ để nghe – mà là để cảm nhận. Mỗi nhịp điệu, mỗi giai
                    điệu đều được tái hiện chân thực, giúp bạn thể hiện phong cách và cá tính qua từng thanh âm.</p>
            </div>
            <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
                <h5 class="pb-2">Featured</h5>
                <ul class="text-uppercase list-unstyled">
                    <li><a href="#">Tai nghe thể thao</a></li>
                    <li><a href="#">Tai nghe cao cấp</a></li>
                    <li><a href="#">Loa cao cấp</a></li>
                    <li><a href="#">Tai nghe SONY</a></li>
                    <li><a href="#">Loa JBL</a></li>
                </ul>
            </div>
            <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
                <h5 class="pb-2">Liên Hệ</h5>
                <div>
                    <h6 class="text-uppercase">Địa chỉ</h6>
                    <p>Nong Lam University, VQCR+GP6, khu phố 6, Thủ Đức, Thành phố Hồ Chí Minh</p>
                </div>
                <div>
                    <h6 class="text-uppercase">Hotline</h6>
                    <p>1900 1919</p>
                </div>
                <div>
                    <h6 class="text-uppercase">Email</h6>
                    <p>Aurasound.work@gmail.com</p>
                </div>
            </div>
            <div class="footer-one col-lg-3 col-md-6 col-12">
                <h5 class="pb-2">Instagram</h5>
                <div class="row">
                    <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img1.jpg" alt="">
                    <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img10.jpg" alt="">
                    <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img2.jpg" alt="">
                    <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img5.jpg" alt="">
                    <img class="img-fluid w-25 h-100 m-2" src="assets/img/Instagram/img6.jpg" alt="">
                </div>
            </div>
        </div>

        <div class="copyright mt-5">
            <div class="row container mx-auto">
                <div class="col-lg-3 col-md-6 col-12 mb-4">
                    <img src="assets/img/Payment/payment.png" alt="">
                </div>
                <div class="col-lg-4 col-md-6 col-12 text-nowrap mb-2">
                    <p>© 2025 Công Ty Cổ Phần AuraSound </p>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

        </div>
    </footer>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/scriptProfile.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>

</html>