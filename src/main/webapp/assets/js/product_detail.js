document.addEventListener('DOMContentLoaded', function() {
    const deleteButton = document.querySelector('.btn-outline-danger.btn-accent');
    const saveButton = document.querySelector('.btn-primary.btn-gradient[type="submit"]');
    const btnReview = document.querySelector('.btn-review');
    const modal = document.querySelector('.review-modal-wrapper');
    const btnCancel = document.querySelector('.btn-group .cancel');
    const overlay = document.querySelector('.over-lay');
    const allStar = document.querySelectorAll('.rating .star');
    const ratingValue = document.querySelector('.rating input');
    const wrapper = document.querySelector('.wrapper');

    function notifyAndRedirect(message) {
        alert(message);
        
        // Chuyển hướng sau 0.5s

        setTimeout(() => {
            window.location.href = 'products.jsp'; 
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
    function addToCart(productId) {
        const qty = document.getElementById('mainQtyInput').value;
        console.log("Thêm vào giỏ:", productId, "Số lượng:", qty);
        alert(`Đã thêm ${qty} sản phẩm vào giỏ hàng!`);
    }

    /**
     * Xử lý Mua ngay
     */
    function buyNow(productId) {
        const qty = document.getElementById('mainQtyInput').value;
        window.location.href = `checkout.jsp?id=${productId}&qty=${qty}`;
    }
    // Mở modal
    btnReview.addEventListener('click', () => {
        modal.classList.add('active');
    });

// Đóng modal (khi bấm Hủy hoặc bấm ra ngoài)
    [btnCancel, overlay].forEach(el => {
        el.addEventListener('click', () => {
            modal.classList.remove('active');
        });
    });
    document.querySelectorAll('.experience-review-item').forEach(item => {
        item.addEventListener('click', function() {
            const category = this.querySelector('.item-title').innerText;
            console.log("Đang lọc các đánh giá về: " + category);

            // Hiệu ứng phản hồi người dùng (Visual Feedback)
            this.style.backgroundColor = "#eef2ff";
            setTimeout(() => {
                this.style.backgroundColor = "transparent";
            }, 300);

            // Tại đây bạn có thể gọi AJAX để load lại danh sách đánh giá theo category
        });
    });
    // 1. Xử lý chọn sao khi viết đánh giá
    const stars = document.querySelectorAll('.rating .star');
    const ratingInput = document.querySelector('input[name="rating"]');

    stars.forEach((star, index) => {
        star.addEventListener('click', () => {
            ratingInput.value = index + 1;
            // Reset tất cả sao
            stars.forEach(s => s.classList.replace('bxs-star', 'bx-star'));
            // Thắp sáng các sao đã chọn
            for (let i = 0; i <= index; i++) {
                stars[i].classList.replace('bx-star', 'bxs-star');
                stars[i].style.color = 'goldenrod';
            }
        });
    });

// 2. Xử lý ẩn/hiện form đánh giá



    if(btnReview && wrapper) {
        wrapper.style.display = 'none'; // Ẩn mặc định
        btnReview.addEventListener('click', () => {
            wrapper.style.display = wrapper.style.display === 'none' ? 'block' : 'none';
        });
    }

    if(btnCancel) {
        btnCancel.addEventListener('click', (e) => {
            e.preventDefault();
            wrapper.style.display = 'none';
        });
    }
});