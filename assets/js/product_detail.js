document.addEventListener('DOMContentLoaded', function() {
    // Lấy các nút cần thiết
    const deleteButton = document.querySelector('.btn-outline-danger.btn-accent');
    const saveButton = document.querySelector('.btn-primary.btn-gradient[type="submit"]');

    // Hàm thông báo đơn giản và chuyển hướng
    function notifyAndRedirect(message) {
        // Thông báo đơn giản nhất
        alert(message);
        
        // Chờ 3 giây (3000ms) rồi chuyển hướng
        setTimeout(() => {
            window.location.href = 'products.html'; 
        }, 500);
    }

    // --- 1. Xử lý sự kiện cho nút XÓA SẢN PHẨM ---
    if (deleteButton) {
        deleteButton.addEventListener('click', function(event) {
            event.preventDefault(); 
            
            // Giả lập hành động xóa thành công và thông báo
            notifyAndRedirect("Đã xóa sản phẩm");
        });
    }

    // --- 2. Xử lý sự kiện cho nút LƯU THAY ĐỔI (trên form submit) ---
    if (saveButton) {
        const productForm = saveButton.closest('form');
        if (productForm) {
            productForm.addEventListener('submit', function(event) {
                event.preventDefault(); 
                
                // Giả lập hành động lưu thành công và thông báo
                notifyAndRedirect("Đã lưu sản phẩm");
            });
        }
    }
});