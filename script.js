const searchBar = document.querySelector('.searchBar');
const icon = document.querySelector('.searchBar i');

icon.addEventListener('click', () => {
    searchBar.classList.toggle('active');
});// Tìm các phần tử
let menuIcon = document.getElementById('menu-icon');
let tabBar = document.getElementById('TabBarRight');
let overlay = document.getElementById('menu-overlay'); // TÌM LỚP MỜ MỚI

// Thêm sự kiện "click" vào icon menu
menuIcon.onclick = () => {
    // Bật/tắt class 'active' cho menu
    tabBar.classList.toggle('active');
    
    // Bật/tắt class 'active' cho LỚP MỜ
    overlay.classList.toggle('active');
};

// (TÙY CHỌN CAO CẤP): Đóng menu khi click vào lớp mờ
overlay.onclick = () => {
    tabBar.classList.remove('active');
    overlay.classList.remove('active');
};