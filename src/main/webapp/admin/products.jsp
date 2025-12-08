<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm - Admin AuraSound</title>
    <link rel="stylesheet" href="../assets/css/styleHome.css">
    <link rel="stylesheet" href="../assets/css/styleProfile.css">
    <link rel="stylesheet" href="../assets/css/styleAdmin.css"> 
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
                <div class="info-item"><a href="">Cửa hàng gần đây</a></div>
                <div class="info-item"><a href="">Tra cứu đơn hàng</a></div>
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

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column" id="sidebar-menu">
                        <li class="nav-item">
                            <a href="admin.jsp" class="nav-link" aria-current="page"><i class="fas fa-home"></i>
                                Admin</a>
                        </li>

                        <li class="nav-item">
                            <a href="users.jsp" class="nav-link"><i class="fas fa-users"></i> Quản lý Người dùng</a>
                        </li>

                        <li class="nav-item">
                            <a href="orders.jsp" class="nav-link"><i class="fas fa-shopping-cart"></i> Quản lý Đơn
                                hàng</a>
                        </li>

                        <li class="nav-item">
                            <a href="products.jsp" class="nav-link"><i class="fas fa-box"></i> Quản lý Sản phẩm</a>
                        </li>

                        <li class="nav-item">
                            <a href="reports.jsp" class="nav-link"><i class="fas fa-chart-line"></i> Báo cáo & Thống
                                kê</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2"><i class="fas fa-box"></i> Quản lý Sản phẩm</h1>
                </div>

                <p class="text-muted">Thêm, sửa, xóa sản phẩm và quản lý tồn kho.</p>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Tồn kho</th>
                                    <th>Giá</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>SP001</td>
                                    <td>Tai nghe Sony WH-CH520</td>
                                    <td>15</td>
                                    <td>900.000vnđ</td>
                                    <td>
                                        <a href="product_detail.jsp"><button class="btn btn-sm btn-warning">Sửa</button></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SP002</td>
                                    <td>Loa Bluetooth JBL Flip 6</td>
                                    <td>8</td>
                                    <td>2.500.000vnđ</td>
                                    <td>
                                        <a href="product_detail.jsp"><button class="btn btn-sm btn-warning">Sửa</button></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="product_detail.jsp"><button class="btn btn-primary mt-3"><i class="fas fa-plus"></i> Thêm Sản phẩm Mới</button></a>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/scriptAdmin.js"></script>
    <script src="../assets/js/scriptProfile.js"></script>
</body>

</html>