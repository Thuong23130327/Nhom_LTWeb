
document.addEventListener("DOMContentLoaded", function () {

    let mybutton = document.getElementById("back-top-btn");

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

    function scrollTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }


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

    // Xử lí đăng nhập/xuát
    function updateAuthUI() {
        const isLogged = localStorage.getItem('isLoggedIn') === 'true';
        const loginLink = document.querySelector('.nav-right .login-link');
        const accountAvatar = document.querySelector('.nav-right .account-avatar');
        if (isLogged) {
            if (loginLink) loginLink.style.display = 'none';
            if (accountAvatar) accountAvatar.style.display = 'flex';
        } else {
            if (loginLink) loginLink.style.display = 'inline-flex';
            if (accountAvatar) accountAvatar.style.display = 'none';
        }
    }


    function performLogoutNav() {
        try { localStorage.removeItem('isLoggedIn'); localStorage.removeItem('authToken'); sessionStorage.removeItem('authToken'); } catch (e) { }
        const onIndex = location.pathname.endsWith('index.html') || location.pathname === '/' || location.pathname === '';
        if (onIndex) {
            updateAuthUI();
            return;
        }
        window.location.href = 'login.html';
    }

    document.addEventListener('click', function (e) {
        const logoutEl = e.target.closest('#navLogout');
        if (logoutEl) {
            e.preventDefault();
            performLogoutNav();
        }
    });

    const loginLinkEl = document.querySelector('.nav-right .login-link');
    if (loginLinkEl) {
        loginLinkEl.addEventListener('click', function (e) {
            if (e.shiftKey || e.ctrlKey || e.metaKey) {
                e.preventDefault();
                localStorage.setItem('isLoggedIn', 'true');
                updateAuthUI();
            }
        });
    }

    window.addEventListener('storage', (ev) => {
        if (ev.key === 'isLoggedIn') updateAuthUI();
    });

    updateAuthUI();

});

// SlideShow 
document.addEventListener('DOMContentLoaded', function () {
    const slidesTrack = document.querySelector('.slideshow-container .slides-track');
    const slides = document.querySelectorAll('.slideshow-container .slide');
    const dots = document.querySelectorAll('.slideshow-container .dot');
    const prevBtn = document.querySelector('.slideshow-container .prev');
    const nextBtn = document.querySelector('.slideshow-container .next');
    const container = document.querySelector('.slideshow-container');
    let current = 0;
    const total = slides.length;
    const intervalMs = 5000; // 5s
    let autoSlide;

    function goTo(idx) {
        if (!slidesTrack) return;
        idx = (idx + total) % total;
        slidesTrack.style.transform = `translateX(-${idx * 100}%)`;
        dots.forEach((d, i) => d.classList.toggle('active', i === idx));
        current = idx;
    }

    function next() { goTo(current + 1); }
    function prev() { goTo(current - 1); }


    const btns = document.querySelectorAll('.slideshow-container .slide-btn');
    btns.forEach(btn => {
        if (btn.classList.contains('next')) {
            btn.addEventListener('click', () => { next(); resetTimer(); });
        } else if (btn.classList.contains('prev')) {
            btn.addEventListener('click', () => { prev(); resetTimer(); });
        }
    });
    dots.forEach((dot, i) => dot.addEventListener('click', () => { goTo(i); resetTimer(); }));

    function startTimer() {
        autoSlide = setInterval(next, intervalMs);
    }
    function stopTimer() {
        clearInterval(autoSlide);
    }
    function resetTimer() {
        stopTimer();
        startTimer();
    }

    container.addEventListener('mouseenter', stopTimer);
    container.addEventListener('mouseleave', startTimer);

    goTo(0);
    startTimer();
});
const searchBar = document.querySelector('.searchBar');
const icon = document.querySelector('.searchBar i');

icon.addEventListener('click', () => {
    searchBar.classList.toggle('active');
});

// Thông báo đã nhập thành công
document.addEventListener("DOMContentLoaded", function () {
    const newsletterForm = document.getElementById('newsletter-form');

    if (newsletterForm) {
        // Bắt sự kiện 'submit' của form
        newsletterForm.addEventListener('submit', function(event) {
            // Ngăn chặn hành vi gửi form mặc định (tránh reload trang)
            event.preventDefault();

            // Hiển thị thông báo theo yêu cầu
            alert("Đã đăng kí nhận thông tin mới nhất từ trang web");

            // Xóa nội dung input để tạo cảm giác đăng ký thành công
            const emailInput = newsletterForm.querySelector('input[type="email"]');
            if (emailInput) {
                emailInput.value = '';
            }
        });
    }
});