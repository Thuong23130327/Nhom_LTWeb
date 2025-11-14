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

let slideIndex = 0; // Bắt đầu từ index 0
let slideshowTimer;

// Hàm chính để hiển thị slide và điều khiển vị trí trượt
function showSlides(n) {
    const slides = document.querySelectorAll('#home .slide');
    const container = document.querySelector('.slideshow-container');
    const dots = document.querySelectorAll('.dots-container .dot');

    if (slides.length === 0 || !container) return;

    // Tính toán Index mới (đảm bảo quay vòng)
    if (n >= slides.length) { slideIndex = 0 }
    else if (n < 0) { slideIndex = slides.length - 1 }
    else { slideIndex = n }

    // Chiều rộng của mỗi slide chính là chiều rộng của container
    const slideWidth = container.clientWidth; 
    
    // Tính toán vị trí trượt bằng PIXEL (slideIndex * chiều rộng 1 slide)
    const offsetInPixels = slideIndex * slideWidth;
    
    // Áp dụng hiệu ứng trượt ngang bằng PIXEL
    container.style.transform = `translateX(-${offsetInPixels}px)`;

    // Cập nhật các chấm chỉ báo
    dots.forEach(dot => {
        dot.classList.remove('active');
    });
    // Đảm bảo dots[slideIndex] tồn tại trước khi truy cập
    if (dots[slideIndex]) {
        dots[slideIndex].classList.add('active');
    }
    
    // Đặt lại bộ đếm thời gian tự động chuyển slide
    clearTimeout(slideshowTimer);
    slideshowTimer = setTimeout(autoShowSlides, 5000); 
}

// Xử lý khi nhấn nút Prev/Next
function plusSlides(n) {
    showSlides(slideIndex + n);
}

// Xử lý khi nhấn vào chấm chỉ báo
function currentSlide(n) {
    //  dot index bắt đầu từ 1, slide index bắt đầu từ 0
    showSlides(n - 1); 
}

// Hàm tự động chuyển slide
function autoShowSlides() {
    showSlides(slideIndex + 1);
}

// Khởi tạo Slideshow khi trang được tải
document.addEventListener("DOMContentLoaded", function() {
    
    //Slideshow lần đầu
    showSlides(slideIndex);
});
