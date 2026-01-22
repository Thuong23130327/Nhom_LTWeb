document.addEventListener("DOMContentLoaded", function () {
    // Bắt sự kiện click vào nút chọn màu
    const variants = document.querySelectorAll('.item-variant');

    variants.forEach(btn => {
        btn.addEventListener('click', function (e) {
            // Ngăn chặn sự kiện nổi bọt
            e.stopPropagation();

            // Tìm menu bên trong nút vừa click
            const dropdown = this.querySelector('.variant-dropdown');

            // Đóng tất cả cái khác đang mở
            document.querySelectorAll('.variant-dropdown').forEach(d => {
                if (d !== dropdown) d.classList.remove('show');
            });

            // (Ẩn/Hiện) cái hiện tại
            if (dropdown) {
                dropdown.classList.toggle('show');
            }
        });
    });

    // Click ra ngoài khoảng trắng thì đóng menu
    document.addEventListener('click', function () {
        document.querySelectorAll('.variant-dropdown').forEach(d => {
            d.classList.remove('show');
        });
    });
});

// XỬ LÝ AJAX
function selectColor(element, oldVid, newVid) {
    // Ngăn sự kiện click này lan ra ngoài
    if (window.event) window.event.stopPropagation();

    console.log(`Đang đổi biến thể: ${oldVid} -> ${newVid}`);

    // Gọi về Servlet để xử lý logic
    fetch(`cart?action=updateVariant&id=${oldVid}&newVariantId=${newVid}`)
        .then(response => response.text())
        .then(data => {
            // Kiểm tra phản hồi từ Servlet
            if (data.trim() === "success") {
                // Thành công? -> Reload trang để cập nhật lại Giá tiền, Hình ảnh, Tên màu
                window.location.reload();
            } else {
                alert("Lỗi: Không thể cập nhật biến thể. Vui lòng thử lại!");
                console.error("Server response:", data);
            }
        })
        .catch(error => {
            console.error('Lỗi kết nối:', error);
            alert("Mất kết nối đến máy chủ.");
        });
}

// function removeCartItem() {
//
// }