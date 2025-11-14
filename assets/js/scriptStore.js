// Chờ cho đến khi toàn bộ HTML được tải xong
document.addEventListener('DOMContentLoaded', function () {


    const favoriteButtons = document.querySelectorAll(".favorite");
    favoriteButtons.forEach(button => {
        button.addEventListener("click", function (event) {
            event.preventDefault();
            this.classList.toggle("active");
        });
    });
    let currentPage = 1;
    let currentFilter = 'all';

    const allProducts = document.querySelectorAll('.product-card');

    const filterButtons = document.querySelectorAll('#filter-buttons .filter-btn');
    const pageButtons = document.querySelectorAll('#pagination-buttons .page-btn');

    if (allProducts.length === 0) {
        console.error("Lỗi: Không tìm thấy sản phẩm nào ('.product-card').");
        return;
    }
    if (filterButtons.length === 0) {
        console.error("Lỗi: Không tìm thấy nút lọc ('#filter-buttons .filter-btn').");
        return;
    }
    if (pageButtons.length === 0) {
        console.error("Lỗi: Không tìm thấy nút phân trang ('#pagination-buttons .page-btn').");
        return;
    }

    function updateDisplay() {
        console.log(`Đang cập nhật: Filter=${currentFilter}, Page=${currentPage}`);

        allProducts.forEach(product => {
            const filterMatch = (currentFilter === 'all') || (product.classList.contains(currentFilter));

            const pageClassToMatch = 'page-' + currentPage;
            const pageMatch = product.classList.contains(pageClassToMatch);
            if (filterMatch && pageMatch) {
                product.classList.remove('hidden'); // Xóa class .hidden
            }
            else {
                product.classList.add('hidden'); // Thêm class .hidden
            }
        });
    }

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            console.log("Đã click nút lọc.");

            currentFilter = button.getAttribute('data-filter');
            currentPage = 1;
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            pageButtons.forEach(btn => {
                if (parseInt(btn.getAttribute('data-page')) === 1) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });
            updateDisplay();
        });
    });
    pageButtons.forEach(button => {
        button.addEventListener('click', () => {
            console.log("Đã click nút phân trang.");            // Lấy số trang từ nút
            currentPage = parseInt(button.getAttribute('data-page'));
            pageButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            updateDisplay();
        });
    });
    console.log("Chạy updateDisplay() lần đầu tiên...");
    updateDisplay();
});