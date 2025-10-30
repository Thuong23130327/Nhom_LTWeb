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
});