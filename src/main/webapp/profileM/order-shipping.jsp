<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đơn hàng đang vận chuyển - AuraSound</title>
    <link rel="stylesheet" href="../assets/css/styleHome.css">
    <link rel="stylesheet" href="../assets/css/styleProfile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
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
                <div class="info-item"><a href="../contact.jsp">Cửa hàng gần đây</a></div>
                <div class="info-item"><a href="order-history.jsp">Tra cứu đơn hàng</a></div>
                <div class="info-item"><a href="tel:19001919">1900 1919</a></div>
            </div>
        </div>
    </header>
    <nav>
        <div class="nav-container content">
            <div class="nav-left">
                <a class="a-nodecor logo-container" href="../index.jsp">
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
                <a class="a-nodecor" href="../index.jsp">
                    <div class="home">
                        Trang chủ</div>
                </a>
                <a class="a-nodecor" href="../contact.jsp">
                    <div class="contact">
                        Liên hệ</div>
                </a>
                <div class="nav-item-dropdown">
                    <a class="a-nodecor active" href="../store.jsp">
                        <div class="store">
                            Sản phẩm
                            <i class="bi bi-chevron-compact-down"></i>
                        </div>
                    </a>

                    <div class="menu-product">
                        <a class="a-nodecor" href="../speakers.jsp">
                            <div>Loa</div>
                        </a>
                        <a class="a-nodecor" href="../headphones.jsp">
                            <div>Tai nghe</div>
                        </a>
                    </div>
                </div>

                <a class="a-nodecor" href="../cart.jsp">
                    <div class="cart"> <i class="bi bi-cart"></i>
                        Giỏ hàng</div>
                </a>
                <div id="hamburger-icon">
                    <i class="bi bi-list"></i>
                </div>
            </div>

        </div>
    </nav>

    <div class="mobile-menu" id="mobile-menu-container">
        <div class="mobile-menu-header">
            <div class="logo-container">
                <a href="../index.jsp" class="a-nodecor">
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
            <a href="../index.jsp">Trang chủ</a>
        </div>
        <div class="mobile-menu-item">
            <a href="../cart.jsp">Giỏ hàng</a>
        </div>
        <div class="mobile-menu-item">
            <a href="../contact.jsp">Liên hệ</a>
        </div>
        <div class="mobile-menu-item">
            <a href="../store.jsp">Sản phẩm</a>
        </div>

        <div class="mobile-menu-footer">
            <a href="../login.jsp" id="logoutBtn" class="logout-btn">Đăng xuất</a>
        </div>
    </div>
    <div class="overlay" id="menu-overlay"></div>

    <!-- section -->

    <main class="profile-page-main">
        <div class="profile-container">
            <div class="profile-sidebar">
                <div class="user-info"><img class="img-profile" src="../assets/img/avatar/HoaiThuong.png" alt="Avatar">
                    <h5 class="user-name">Chào, Nguyễn Hoài Thương</h5>
                    <p class="user-email">23130327@st.hcmuaf.edu.vn</p>
                </div>
                <div class="side-menu mobile-hidden" id="sideMenuContent">
                    <ul class="nav-list">
                        <li><a class="nav-link" href="profile.jsp"><i class="fa-solid fa-user icon"></i> Thông
                                tin tài khoản</a></li>
                        <li><a class="nav-link" href="favorites.jsp"><i class="fa-solid fa-heart icon"></i> Sản phẩm
                                yêu thích</a></li>
                        <li><a class="nav-link active" href="order-shipping.jsp"><i class="fa-solid fa-truck icon"></i>
                                Đang vận chuyển</a></li>
                        <li><a class="nav-link" href="order-pending.jsp"><i class="fa-solid fa-clock icon"></i> Đang
                                chờ duyệt</a></li>
                        <li><a class="nav-link" href="order-cancelled.jsp"><i class="fa-solid fa-ban icon"></i> Đã
                                hủy</a></li>
                        <li><a class="nav-link" href="order-history.jsp"><i class="fa-solid fa-history icon"></i> Lịch
                                sử mua hàng</a></li>
                    </ul>
                </div>
            </div>
            <section class="profile-content">
                <h3 class="title">Đơn hàng đang vận chuyển</h3>


                <a class="a-nodecor" href="../order-detail.jsp">
                    <div class="list-item">
                        <div class="item-order shipping">#AS1002 - Loa SoundPro. Ngày giao dự kiến: 15/12</div>
                    </div>
                </a>
                <a class="a-nodecor" href="../order-detail-success.jsp">
                    <div class="list-item">
                        <div class="item-order shipping">#AS1003 - Tai nghe AVA+. Ngày giao dự kiến: 25/12</div>
                    </div>
                </a>

            </section>
        </div>
    </main>

    <!-- footer -->
    <%@ include file="../_footer.jsp" %>
</body>

</html>