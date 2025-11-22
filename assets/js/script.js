document.addEventListener("DOMContentLoaded", function () {

    // --- KHAI BÁO CÁC PHẦN TỬ CHUNG ---
    const mybutton = document.getElementById("back-top-btn");
    const hamburgerIcon = document.getElementById('hamburger-icon');
    const mobileMenu = document.getElementById('mobile-menu-container');
    const overlay = document.getElementById('menu-overlay');
    const allCloseIcons = document.querySelectorAll('.bi-x-lg');

    // Các phần tử cho trang Checkout 
    const btnDatHang = document.getElementById('btn-dat-hang');
    const successPopup = document.getElementById('success-popup');

    // Thêm: Lấy phần tử nội dung popup để chặn propagation
    const popupContent = document.querySelector('#success-popup .popup-content');

    // --- 1. CHỨC NĂNG BACK-TO-TOP ---

    window.onscroll = function () {
        scrollFunction();
    };

    function scrollFunction() {
        if (!mybutton) return;
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // --- 2. HÀM XỬ LÝ POPUP ĐẶT HÀNG ---

    function openPopup() {
        if (successPopup) {
            successPopup.classList.add('show');
            overlay.classList.add('active');
        }
    }

    function closePopup() {
        if (successPopup) {
            successPopup.classList.remove('show');
            if (!(mobileMenu && mobileMenu.classList.contains('active'))) {
                overlay.classList.remove('active');
            }
        }
    }

    // --- 3. HÀM XỬ LÝ MENU MOBILE ---

    function openMenu() {
        mobileMenu.classList.add('active');
        overlay.classList.add('active');
    }

    function closeMenu() {
        if (mobileMenu) {
            mobileMenu.classList.remove('active');
            if (!(successPopup && successPopup.classList.contains('show'))) {
                overlay.classList.remove('active');
            }
        }
    }


    // --- 4. GÁN SỰ KIỆN TƯƠNG TÁC (Listeners) ---

    // Mở Menu khi click Hamburger
    if (hamburgerIcon) {
        hamburgerIcon.addEventListener('click', openMenu);
    }

    // Nút Đặt hàng mở Popup
    if (btnDatHang) {
        btnDatHang.addEventListener('click', openPopup);
    }
    allCloseIcons.forEach(icon => {
        icon.addEventListener('click', function (event) {
            event.stopPropagation();
            const parentPopup = event.target.closest('#success-popup');
            const parentMenu = event.target.closest('#mobile-menu-container');

            if (parentPopup) {
                closePopup();
            }
            if (parentMenu) {
                closeMenu();
            }
        });
    });

    // FIX CHÍNH: Xử lý Overlay và Popup một cách riêng biệt

    // A. Xử lý click vào nền xám của Popup (đóng Popup)
    if (successPopup) {
        successPopup.addEventListener('click', function (event) {
            // Kiểm tra: Nếu click đích danh vào container ngoài (tức là nền xám của Popup)
            // Hoặc click đích danh vào overlay (nền xám chung)
            if (event.target === successPopup || event.target === overlay) {
                // Đảm bảo không đóng Menu nếu chỉ muốn đóng Popup
                if (successPopup.classList.contains('show')) {
                    closePopup();
                }
            }
        });
    }

    // B. Xử lý click vào Overlay (đóng Menu Mobile)
    if (overlay) {
        overlay.addEventListener('click', function (event) {
            // Nếu Popup không mở, và Menu đang mở -> Đóng Menu
            if (!(successPopup && successPopup.classList.contains('show')) && mobileMenu && mobileMenu.classList.contains('active')) {
                closeMenu();
            }
        });
    }

    // --- 5. LOGIC ĐĂNG NHẬP/ĐĂNG XUẤT ---

    function updateAuthUI() {
        const isLogged = localStorage.getItem('isLoggedIn') === 'true';
        const loginLink = document.querySelector('.nav-right .login-link');
        const accountAvatar = document.querySelector('.nav-right .account-avatar');
        const mobileLoginBtn = document.querySelector('.mobile-menu .nav-login-btn');

        if (isLogged) {
            if (loginLink) loginLink.style.display = 'none';
            if (accountAvatar) accountAvatar.style.display = 'flex';
            if (mobileLoginBtn) mobileLoginBtn.textContent = 'Thông tin tài khoản';
            if (mobileLoginBtn) mobileLoginBtn.href = 'profileM/profile.html';
        } else {
            if (loginLink) loginLink.style.display = 'inline-flex';
            if (accountAvatar) accountAvatar.style.display = 'none';
            if (mobileLoginBtn) mobileLoginBtn.textContent = 'Đăng nhập';
            if (mobileLoginBtn) mobileLoginBtn.href = 'login.html';
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

    // --- 6. LOGIC THANH SEARCH BAR ---
    const searchBar = document.querySelector('.searchBar');
    const searchIcon = document.querySelector('.searchBar i.bi-search');

    if (searchIcon) {
        searchIcon.addEventListener('click', () => {
            searchBar.classList.toggle('active');
        });
    }

    // --- 7. LOGIC NEWSLETTER ---
    const newsletterForm = document.getElementById('newsletter-form');

    if (newsletterForm) {
        newsletterForm.addEventListener('submit', function (event) {
            event.preventDefault();
            alert("Đã đăng kí nhận thông tin mới nhất từ trang web");
            const emailInput = newsletterForm.querySelector('input[type="email"]');
            if (emailInput) {
                emailInput.value = '';
            }
        });
    }

    // --- BẮT ĐẦU LOGIC SLIDESHOW TRONG KHỐI DOMContentLoaded CHUNG ---

    const slidesTrack = document.querySelector('.slideshow-container .slides-track');
    const slides = document.querySelectorAll('.slideshow-container .slide');
    const dots = document.querySelectorAll('.slideshow-container .dot');
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

    if (container) {
        container.addEventListener('mouseenter', stopTimer);
        container.addEventListener('mouseleave', startTimer);
    }

    if (slides.length > 0) {
        goTo(0);
        startTimer();
    }
});

// Hàm global backTop (Giữ nguyên bên ngoài DOMContentLoaded)
function backTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}