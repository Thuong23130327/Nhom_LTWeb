document.addEventListener('DOMContentLoaded', function() {
    const deleteButton = document.querySelector('.btn-outline-danger.btn-accent');
    const saveButton = document.querySelector('.btn-primary.btn-gradient[type="submit"]');

    function notifyAndRedirect(message) {
        alert(message);
        
        // Chuyển hướng sau 0.5s

        setTimeout(() => {
            window.location.href = 'products.html'; 
        }, 500);
    }

    // --- Xử lý sự kiện cho nút XÓA SẢN PHẨM ---
    
    if (deleteButton) {
        deleteButton.addEventListener('click', function(event) {
            event.preventDefault(); 
            
            // Thông báo
            // Dùng notifyRedirect thay vì alert để sau 1 khoảng thời gian sẽ chuyển hướng 

            notifyAndRedirect("Đã xóa sản phẩm");
        });
    }

    // --- Xử lý sự kiện cho nút LƯU THAY ĐỔI ---

    if (saveButton) {
        const productForm = saveButton.closest('form');
        if (productForm) {
            productForm.addEventListener('submit', function(event) {
                event.preventDefault(); 
                
                // Thông báo
                // Dùng notifyRedirect thay vì alert để sau 1 khoảng thời gian sẽ chuyển hướng 

                notifyAndRedirect("Đã lưu sản phẩm");
            });
        }
    }
});