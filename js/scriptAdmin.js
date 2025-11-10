document.addEventListener("DOMContentLoaded", function() {
    
    const sidebarMenu = document.getElementById('sidebar-menu');
    const mainTitle = document.getElementById('main-title');

    // Xử lý chuyển trang trên Navbar
    // Về trang chủ
    const navbarBrand = document.querySelector('.navbar-brand');
    if(navbarBrand) {
        navbarBrand.addEventListener('click', function(e) {
            window.location.href = "index.html";
        });
    }
    const logoutLink = document.querySelector('[href = "login.html"]');
    if(logoutLink) {
        logoutLink.addEventListener('click', function(e) {
            window.location.href = "login.html";
        });
    }

    // Xử lý chuyển đổi giao diện của admin
    if(sidebarMenu) {
        sidebarMenu.addEventListener('click', function(e) {
            const link = e.target.closest('.nav-link');
            if(!link) return;

            e.preventDefault();

            // Lấy target và tên mục
            const targetSectionId = link.getAttribute('data-target');
            const sectionName = link.textContent.trim();

            // Cập nhật Sidebar Active
            document.querySelectorAll('#sidebar-menu .nav-link').forEach(item => {
                item.classList.remove('active');
            });
            link.classList.add('active');

            // Cập nhật tiêu đề chính(Title)
            let iconClass = '';
            if (targetSectionId === 'admin') iconClass = 'chart-area';
            else if (targetSectionId === 'users') iconClass = 'users';
            else if (targetSectionId === 'orders') iconClass = 'shopping-cart';
            else if (targetSectionId === 'products') iconClass = 'box';
            else if (targetSectionId === 'reports') iconClass = 'chart-line';
            else iconClass = 'info-circle';

            mainTitle.innerHTML = `<i class="fas fa-${iconClass}"></i> ${sectionName}`;

            // Hiển thị/ẩn nội dung chính
            document.querySelectorAll('.content-section').forEach(section => {
                section.classList.remove('active');
            });
            const targetSection = document.getElementById(targetSectionId);
            if(targetSection) {
                targetSection.classList.add('active');
            }
        });
    }
});