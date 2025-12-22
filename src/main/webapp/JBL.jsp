<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tai nghe - AuraSound</title>
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
        <div class="mobile-menu-item active">
            <a href="store.jsp">Sản phẩm</a>
        </div>
    </div>
    <div class="overlay" id="menu-overlay"></div>

    <!-- HẾT PHẦN HEAD, NAV, MENU = -->
    <main class="store-container content headphones-page-container">

        <aside class="filter-sidebar" id="filter-sidebar">

            <div class="pt-3 pb-2">
                    <a href="index.jsp" class="btn btn-sm btn-primary" title="Quay lại">
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
            <h1>JBL</h1>

            <div class="sort-options">
                <span>Sắp xếp theo:</span>
                <button class="sort-btn active" data-sort="default">Nổi bật</button>
                <button class="sort-btn" data-sort="price-asc">Giá tăng dần</button>
                <button class="sort-btn" data-sort="price-desc">Giá giảm dần</button>
            </div>

            <div class="product-grid" id="product-grid">
                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth chong-on" data-price="2690000">
                    <div class="product-badge discount">
                        Giảm 18%
                    </div>
                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-khong-day-jbl-tune-buds-2_10_.png"
                     alt="JBL Tune Buds 2">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe không dây JBL Tune Buds 2</h4>

                        <div class="price-block">
                            <span class="new-price">2.990.000đ</span>
                            <span class="old-price">3.690.000đ</span>
                        </div>

                        <div class="product-bottom-row">
                            <div class="rating">
                                <i class="bi bi-star-fill"></i>
                                <span>5.0</span>
                            </div>
                            <div class="favorite">
                                <i class="bi bi-heart"></i>
                                <i class="bi bi-heart-fill"></i>
                                <span>Yêu thích</span>
                            </div>
                        </div>
                    </div>
                </a>

                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth" data-price="1590000">

                    <!-- Tag giảm giá -->
                    <div class="product-badge discount">
                        Giảm 20%
                    </div>
                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-khong-day-jbl-wave-buds-2-_26_.png"
                        alt="JBL Wave Buds 2">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe không dây JBL Wave Buds 2</h4>

                        <div class="price-block">
                            <span class="new-price">1.590.000đ</span>
                            <span class="old-price">1.690.000đ</span>
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
                        src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-chup-tai-jbl-tune-520bt_10_.png">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth chụp tai JBL Tune 520BT </h4>

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

                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth" data-price="260000">

                    <img
                        src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_-_2023-02-11t195709.807.png">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe Bluetooth True Wireless JBL Tune Flex</h4>

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

                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth" data-price="460000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/d/v/dvdv5_2_.jpg">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe nhét tai JBL C200 SIU </h4>

                        <div class="price-block">
                            <span class="new-price">390.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth" data-price="3270000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-jbl-tune-310c-1.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe có dây JBL Tune 310C</h4>

                        <div class="price-block">
                            <span class="new-price">770.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="JBL" data-type="truewireless"
                   data-feature="bluetooth" data-price="990000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-the-thao-jbl-sence-lite_17__1.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe thể thao JBL Sense Lite</h4>

                        <div class="price-block">
                            <span class="new-price">2.590.000đ</span>
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


                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="1050000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-bluetooth-jbl-tour-pro-2-1.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe JBL Tour Pro 2 </h4>

                        <div class="price-block">
                            <span class="new-price">4.050.000đ</span>
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
                   data-feature="bluetooth" data-price="490000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-khong-day-jbl-wave-buds-2-_7_.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe không dây JBL Wave Buds 2 </h4>

                        <div class="price-block">
                            <span class="new-price">1.490.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="230000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/8/_/8_126_5.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>TTai nghe Bluetooth True Wireless JBL Live Pro 2</h4>

                        <div class="price-block">
                            <span class="new-price">2.230.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="3390000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/t/a/tai-nghe-khong-day-jbl-tune-beam-2-den-trong_9__1.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Tai nghe không dây JBL Tune Beam 2 Ghost </h4>

                        <div class="price-block">
                            <span class="new-price">2.390.000đ</span>
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

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/l/o/loa-bluetooth-jbl-go-4_16_.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth JBL Go 4</h4>

                        <div class="price-block">
                            <span class="new-price">1.490.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="890000">

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/j/b/jbl_flip_6_6.png"
                        alt="Tai nghe Bluetooth True Wireless JBL Wave Beam 2 ">

                    <!-- Thông tin sản phẩm -->
                    <div class="product-card-info">
                        <h4>Loa Bluetooth JBL Flip 6</h4>

                        <div class="price-block">
                            <span class="new-price">1.890.000đ</span>
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

                <a href="sproduct.jsp" class="product-card" data-brand="ava" data-type="truewireless"
                   data-feature="bluetooth" data-price="3390000">
                    <div class="product-badge discount">
                        Giảm 15%
                    </div>

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/l/o/loa-jbl-charge-5-den-black-4.jpg"
                        alt="Loa JBL Charge 5">
                    <div class="product-card-info">
                        <h4> Loa Bluetooth JBL Charge 5</h4>
                        <div class="price-block">
                            <span class="new-price">3.490.000đ</span>
                            <span class="old-price">3.990.000đ</span>
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

                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/j/b/jbl-partybox-club-120_1.jpg"
                        alt="Loa JBL Charge 5">
                    <div class="product-card-info">
                        <h4>Loa JBL PartyBox Club 120 </h4>
                        <div class="price-block">
                            <span class="new-price">10.390.000đ</span>
                            <span class="old-price">10.790.000đ</span>
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