// Chạy code khi toàn bộ nội dung trang đã được tải
document.addEventListener('DOMContentLoaded', function() {
    
    // Tìm nút "Áp Dụng" trong bộ lọc
    const filterButton = document.querySelector('.filter-btn');

    // Nếu nút tồn tại, thêm sự kiện 'click'
    if (filterButton) {
        filterButton.addEventListener('click', function() {
            // Hiển thị thông báo (vì đây là web tĩnh)
            alert('Chức năng "Lọc" chỉ là giao diện cho đồ án web tĩnh!');
        });
    }

    // Bạn có thể thêm các hiệu ứng khác ở đây nếu muốn
    console.log('Trang Cửa Hàng đã tải xong.');

});