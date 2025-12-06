<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm - AuraSound</title>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/styleHome.css">
    <link rel="stylesheet" href="assets/css/styleStore.css">
    <link rel="stylesheet" href="assets/css/styleCheckout.css">
    <link rel="stylesheet" href="assets/css/styleProduct.css">

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

    <main>
        <section class="container sproduct my-5 pt-5">
            <div class="row">
                <div class="gallery-container col-lg-5 col-md-12 col-12">
                    <img class="main-img img-fluid w-100 pb-1" src="assets/img/Sony/6.webp" width="100%" id="MainImg">

                    <div class="thumb-container">
                        <button class="scroll-btn left" onclick="prevImage()">&#10094;</button>

                        <div class="small-img-group" id="thumbScroll">
                            <img src="assets/img/Sony/6.webp" class="small-img active" onclick="showImg(this, 0)">
                            <img src="assets/img/Sony/7.webp" class="small-img" onclick="showImg(this, 1)">
                            <img src="assets/img/Sony/8.webp" class="small-img" onclick="showImg(this, 2)">
                            <img src="assets/img/Sony/9.webp" class="small-img" onclick="showImg(this, 3)">
                            <img src="assets/img/Sony/1.webp" class="small-img" onclick="showImg(this, 4)">
                            <img src="assets/img/Sony/2.webp" class="small-img" onclick="showImg(this, 5)">
                            <img src="assets/img/Sony/3.webp" class="small-img" onclick="showImg(this, 6)">
                            <img src="assets/img/Sony/4.webp" class="small-img" onclick="showImg(this, 7)">
                            <img src="assets/img/Sony/5.webp" class="small-img" onclick="showImg(this, 8)">
                        </div>
                        <button class="scroll-btn right" onclick="nextImage()">&#10095;</button>
                    </div>
                </div>

                <div class="info col-lg-6 col-md-12 col-12">
                    <h6>Home / SONY </h6>
                    <h3>Tai nghe Bluetooth chụp tai Sony WH-CH520</h3>
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <h2>998.000 VNĐ</h2>

                    <div class="product-options">
                        <h4>Màu sắc: </h4>
                        <div class="color-options">

                            <div class="color-item active" onclick="selectColor(this)" data-img="assets/img/Sony/1.webp">
                            <img src="assets/img/Sony/1.webp" alt="Đen">
                            <span>Đen</span>
                        </div>

                        <div class="color-item" onclick="selectColor(this)" data-img="assets/img/Sony/2.webp">
                            <img src="assets/img/Sony/2.webp" alt="Xanh đen">
                            <span>Xanh đen</span>
                        </div>

                        <div class="color-item" onclick="selectColor(this)" data-img="assets/img/Sony/3.webp">
                            <img src="assets/img/Sony/3.webp" alt="Hồng">
                            <span>Hồng</span>
                        </div>

                        <div class="color-item" onclick="selectColor(this)" data-img="assets/img/Sony/4.webp">
                            <img src="assets/img/Sony/4.webp" alt="Vàng">
                            <span>Vàng</span>
                        </div>

                        <div class="color-item" onclick="selectColor(this)" data-img="assets/img/Sony/5.webp">
                            <img src="assets/img/Sony/5.webp" alt="Trắng">
                            <span>Trắng</span>
                        </div>

                    </div>

                    <div class="product-quantity">
                        <h4>Số lượng: </h4>
                        <input type="number" value="1">
                    </div>

                    <div class="btn">
                        <button class="buy-btn popup" id="cart-btn">Thêm vào giỏ hàng</button>
                        <div id="success-popup" class="popup-content-wrap">
                            <div class="popup-content">
                                <button class="popup-close-btn" id="popup-close">
                                    <i class="bi bi-x-lg"></i>
                                </button>
                                <div class="icon-box">
                                    <i class="bi bi-check-lg"></i>
                                </div>
                                <h3>Đã thêm vào giỏ hàng thành công!</h3>
                                </p>
                            </div>
                        </div>

                        <a href="cart.jsp"><a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a></a>
                    </div>



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
                            <tr>
                                <td class="spec-title">Kích thước</td>
                                <td>Dài 22.8 cm - Rộng 17.2 cm - Cao 4.4 cm</td>
                            </tr>
                            <tr>
                                <td class="spec-title">Trọng lượng</td>
                                <td>147 gram</td>
                            </tr>
                            <tr>
                                <td class="spec-title">Công nghệ âm thanh</td>
                                <td>
                                    Âm thanh kỹ thuật số<br>
                                    Công nghệ ENC<br>
                                    360 Reality Audio<br>
                                    DSEE<br>
                                    Equalizer
                                </td>
                            </tr>
                            <tr>
                                <td class="spec-title">Micro</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td class="spec-title">Thời lượng pin</td>
                                <td>50 giờ</td>
                            </tr>
                            <tr>
                                <td class="spec-title">Điều khiển</td>
                                <td>Nút bấm vật lý</td>
                            </tr>
                            <tr>
                                <td class="spec-title">Tính năng khác</td>
                                <td>
                                    Sạc nhanh<br>
                                    Chống ồn đàm thoại
                                </td>
                            </tr>
                            <tr>
                                <td class="spec-title">Hãng sản xuất</td>
                                <td>Sony</td>
                            </tr>
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

        <!-- <section id="Headphone" class="my-5 pb-5">
            <div class="container text-center mt-5 py-5">
                <h3>Sản phẩm liên quan</h3>
                <hr class="mx-auto">
                <p>Bạn có thể tìm thấy những chiếc tai nghe tương tự ở đây.</p>
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img src="assets/img/Headphone/headphone_1.webp" alt="" class="img-fluid mb-3">
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <h5 class="p-name">Tai nghe True Wireless LG Tone Free HBS-FN4</h5>
                    <h4 class="p-price">1,900,000vnđ</h4>
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>
                </div>

                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img src="assets/img/Headphone/headphone_2" alt="" class="img-fluid mb-3">
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <h5 class="p-name">Tai nghe Bose SoundSport Free Wireless</h5>
                    <h4 class="p-price">4.690.000vnđ</h4>
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>
                </div>

                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img src="assets/img/Headphone/headphone_3" alt="" class="img-fluid mb-3">
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <h5 class="p-name">Tai nghe Bluetooth True Wireless JBL Tune Flex</h5>
                    <h4 class="p-price">2.690.000vnđ</h4>
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>
                </div>

                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img src="assets/img/Headphone/headphone_4" alt="" class="img-fluid mb-3">
                    <div class="star">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                    <h5 class="p-name">Tai Nghe True Wireless Sony WF-XB700</h5>
                    <h4 class="p-price">2.390.000vnđ</h4>
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>
                </div>
            </div>
        </section> -->

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
                    </a> <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    </a> <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    </a> <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    </a> <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>

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
                    </a> <a href="checkout.jsp"><button class="buy-btn">Mua Ngay</button></a>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer-container">
        <div class="row container mx-auto pt-5">
            <div class="footer-one col-lg-3 col-md-6 col-12">
                <div class="logo-container">
                    <a href="index.jsp" style="text-decoration: none; display: flex; align-items: center;">
                        <div class="logo-wave">
                            <div class="sound-wave wave1"></div>
                            <div class="sound-wave wave2"></div>
                            <div class="sound-wave wave3"></div>
                        </div>
                        <span class="logo-text">AuraSound</span>
                    </a>
                </div>
                <p class="pt-3">Với Aura Sound, âm nhạc không chỉ để nghe – mà là để cảm nhận. Mỗi nhịp điệu, mỗi giai
                    điệu đều
                    được
                    tái hiện chân thực, giúp bạn thể hiện phong cách và cá tính qua từng thanh âm.</p>
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
    <script src="assets/js/scriptProduct.js"></script>

</body>


</html>