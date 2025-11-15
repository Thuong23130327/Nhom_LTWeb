
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

    // Attach buttons robustly: find any .slide-btn and decide by class
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

    // initialize
    goTo(0);
    startTimer();
});
const searchBar = document.querySelector('.searchBar');
const icon = document.querySelector('.searchBar i');

icon.addEventListener('click', () => {
    searchBar.classList.toggle('active');
});