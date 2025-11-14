// Chờ cho đến khi toàn bộ HTML được tải xong
document.addEventListener('DOMContentLoaded', function () {
    console.log("DOM đã tải xong, scriptStore.js bắt đầu chạy...");

    // --- Biến Trạng Thái ---
    let currentPage = 1;      // Trang hiện tại
    let currentFilter = 'all';  // Bộ lọc hiện tại

    // --- Lấy các phần tử DOM ---
    // Lấy TẤT CẢ sản phẩm có trong HTML
    const allProducts = document.querySelectorAll('.product-card');

    // Lấy tất cả nút lọc
    // (Tìm các nút .filter-btn NẰM TRONG #filter-buttons)
    const filterButtons = document.querySelectorAll('#filter-buttons .filter-btn');

    // Lấy tất cả nút phân trang
    // (Tìm các nút .page-btn NẰM TRONG #pagination-buttons)
    const pageButtons = document.querySelectorAll('#pagination-buttons .page-btn');

    // Kiểm tra xem có tìm thấy phần tử không
    if (allProducts.length === 0) {
        console.error("Lỗi: Không tìm thấy sản phẩm nào ('.product-card').");
        return; // Dừng script nếu không có sản phẩm
    }
    if (filterButtons.length === 0) {
        console.error("Lỗi: Không tìm thấy nút lọc ('#filter-buttons .filter-btn').");
        return; // Dừng script nếu không có nút lọc
    }
    if (pageButtons.length === 0) {
        console.error("Lỗi: Không tìm thấy nút phân trang ('#pagination-buttons .page-btn').");
        return; // Dừng script nếu không có nút trang
    }

    // --- Hàm chính để cập nhật hiển thị ---
    function updateDisplay() {
        console.log(`Đang cập nhật: Filter=${currentFilter}, Page=${currentPage}`);

        // Lặp qua TẤT CẢ các sản phẩm
        allProducts.forEach(product => {

            // --- Kiểm tra điều kiện ---

            // 1. Kiểm tra Lọc (Filter)
            // (Nếu filter là 'all' HOẶC sản phẩm có class của filter đó)
            const filterMatch = (currentFilter === 'all') || (product.classList.contains(currentFilter));

            // 2. Kiểm tra Trang (Page)
            // Ta tạo ra tên class của trang (ví dụ: 'page-1', 'page-2')
            const pageClassToMatch = 'page-' + currentPage;
            const pageMatch = product.classList.contains(pageClassToMatch);

            // --- Quyết định Ẩn/Hiện ---

            // Nếu cả 2 điều kiện đều đúng -> HIỆN
            if (filterMatch && pageMatch) {
                product.classList.remove('hidden'); // Xóa class .hidden
            }
            // Nếu 1 trong 2 sai -> ẨN
            else {
                product.classList.add('hidden'); // Thêm class .hidden
            }
        });
    }

    // --- Gắn Sự Kiện cho Nút Lọc ---
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            console.log("Đã click nút lọc.");

            // Lấy filter từ nút
            currentFilter = button.getAttribute('data-filter');

            // Khi lọc, luôn quay về trang 1
            currentPage = 1;

            // Cập nhật giao diện nút lọc (active)
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Cập nhật giao diện nút phân trang (chuyển về nút 1)
            pageButtons.forEach(btn => {
                if (parseInt(btn.getAttribute('data-page')) === 1) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            // Gọi hàm để ẩn/hiện sản phẩm
            updateDisplay();
        });
    });

    // --- Gắn Sự Kiện cho Nút Phân Trang ---
    pageButtons.forEach(button => {
        button.addEventListener('click', () => {
            console.log("Đã click nút phân trang.");

            // Lấy số trang từ nút
            currentPage = parseInt(button.getAttribute('data-page'));

            // Cập nhật giao diện nút trang (active)
            pageButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Gọi hàm để ẩn/hiện sản phẩm
            updateDisplay();
        });
    });

    // --- Chạy lần đầu khi tải trang ---
    // Gọi hàm này để ẩn trang 2 và 3 đi, chỉ hiện trang 1
    console.log("Chạy updateDisplay() lần đầu tiên...");
    updateDisplay();
});