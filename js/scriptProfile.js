// profile.js

function showTab(tabId) {
    // 1. Ẩn tất cả nội dung tab
    const contents = document.querySelectorAll('.tab-content');
    contents.forEach(content => {
        content.classList.remove('active');
    });

    // 2. Bỏ trạng thái 'active' khỏi tất cả menu links
    const navLinks = document.querySelectorAll('.side-menu .nav-list a');
    navLinks.forEach(link => {
        link.classList.remove('active');
    });

    // 3. Hiển thị tab nội dung được chọn
    const activeContent = document.getElementById(tabId);
    if (activeContent) {
        activeContent.classList.add('active');
    }

    // 4. Đặt trạng thái 'active' cho menu item được click
    const clickedLink = event.target.closest('.nav-link');
    if (clickedLink) {
        clickedLink.classList.add('active');
    }
    
}

// HÀM MỚI ĐỂ CHUYỂN ĐỔI MENU MOBILE
function toggleMobileMenu() {
    const sideMenu = document.getElementById('sideMenuContent');
    if (sideMenu.classList.contains('mobile-hidden')) {
        sideMenu.classList.remove('mobile-hidden');
        sideMenu.classList.add('mobile-visible');
    } else {
        sideMenu.classList.remove('mobile-visible');
        sideMenu.classList.add('mobile-hidden');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const hamburgerIcon = document.getElementById('hamburger-icon');
    const closeButton = document.getElementById('mobile-menu-close');
    const mobileMenu = document.getElementById('mobile-menu-container');
    const overlay = document.getElementById('menu-overlay');

    // Hàm mở menu
    function openMenu() {
        mobileMenu.classList.add('open');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    // Hàm đóng menu
    function closeMenu() {
        mobileMenu.classList.remove('open');
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    // Gán sự kiện
    if (hamburgerIcon) {
        hamburgerIcon.addEventListener('click', openMenu);
    }
    if (closeButton) {
        closeButton.addEventListener('click', closeMenu);
    }
    if (overlay) {
        overlay.addEventListener('click', closeMenu);
    }
    
    // Tự động đóng menu khi resize lên desktop
    window.addEventListener('resize', () => {
        if (window.innerWidth > 991 && mobileMenu.classList.contains('open')) {
            closeMenu();
        }
    });
});