const searchBar = document.querySelector('.searchBar');
const icon = document.querySelector('.searchBar i');

icon.addEventListener('click', () => {
    searchBar.classList.toggle('active');
});

document.addEventListener("DOMContentLoaded", function () {

    const hamburgerIcon = document.getElementById('hamburger-icon');
    const mobileMenu = document.getElementById('mobile-menu-container');
    const closeIcon = document.getElementById('mobile-menu-close');
    const overlay = document.getElementById('menu-overlay');

    function openMenu() {
        mobileMenu.classList.add('active');
        overlay.classList.add('active');
    }

    function closeMenu() {
        mobileMenu.classList.remove('active');
        overlay.classList.remove('active');
    }

    if (hamburgerIcon) {
        hamburgerIcon.addEventListener('click', openMenu);
    }

    if (closeIcon) {
        closeIcon.addEventListener('click', closeMenu);
    }

    if (overlay) {
        overlay.addEventListener('click', closeMenu);
    }

    // Hàm kiểm tra trạng thái đăng nhập và cập nhật UI
    function checkLoginStatus() {
        const isLoggedIn = localStorage.getItem('isLoggedIn');

        const loginLink = document.getElementById('login-button-link');
        const profileSection = document.getElementById('profile-section');

        const mobileLoginSection = document.getElementById('mobile-login-section');
        const mobileProfileSection = document.getElementById('mobile-profile-section');

        if (isLoggedIn === 'true') {
            // Đã đăng nhập: Ẩn nút Đăng nhập, Hiện Icon Profile
            if (loginLink) loginLink.style.display = 'none';
            if (profileSection) profileSection.style.display = 'flex';

            if (mobileLoginSection) mobileLoginSection.style.display = 'none';
            if (mobileProfileSection) mobileProfileSection.style.display = 'flex'; // Dùng flex để bố cục các mục con
        } else {
            // Chưa đăng nhập: Hiện nút Đăng nhập, Ẩn Icon Profile
            if (loginLink) loginLink.style.display = 'flex'; // Trả về display ban đầu
            if (profileSection) profileSection.style.display = 'none';

            if (mobileLoginSection) mobileLoginSection.style.display = 'block'; // Trả về display ban đầu
            if (mobileProfileSection) mobileProfileSection.style.display = 'none';
        }
    }

    // Hàm xử lý Đăng xuất
    function logout() {
        // Xóa cờ trạng thái đăng nhập
        localStorage.removeItem('isLoggedIn');
        // Chuyển hướng về trang chủ để UI được cập nhật (hoặc về trang login)
        window.location.href = "index.html";
    }


    // Chạy hàm kiểm tra trạng thái khi DOM đã tải xong
    // (Sử dụng hàm này để thêm logic vào khối DOMContentLoaded đã có)
    document.addEventListener("DOMContentLoaded", function () {

        checkLoginStatus();
    });
});

let mybutton = document.getElementById("back-top-btn");

// Lắng nghe sự kiện cuộn trang
window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}
function backTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}