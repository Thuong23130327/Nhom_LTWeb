// 1. Bắt sự kiện click vào nút chọn màu (.item-variant)
const variants = document.querySelectorAll('.item-variant');

variants.forEach(btn => {
    btn.addEventListener('click', function (e) {
        // Ngăn chặn sự kiện nổi bọt để không kích hoạt sự kiện click của document
        e.stopPropagation();

        // Tìm menu dropdown bên trong nút vừa click
        const dropdown = this.querySelector('.variant-dropdown');

        // Đóng tất cả các dropdown khác đang mở (tránh mở nhiều cái cùng lúc)
        document.querySelectorAll('.variant-dropdown').forEach(d => {
            if (d !== dropdown) d.classList.remove('show');
        });

        // Toggle (Ẩn/Hiện) cái hiện tại
        if (dropdown) {
            dropdown.classList.toggle('show');
        }
    });
});

// 2. Hàm xử lý khi chọn 1 màu cụ thể
function selectColor(option) {
    // Lấy text của màu vừa chọn (VD: Màu: Đen)
    const colorText = option.innerText;

    // Tìm thẻ cha lớn nhất (.item-variant)
    const parentVariant = option.closest('.item-variant');

    // Tìm thẻ span hiển thị text hiện tại và thay đổi nội dung
    const displayText = parentVariant.querySelector('span'); // hoặc .selected-color nếu bạn đã thêm class
    if (displayText) {
        displayText.innerText = colorText;
    }

}
function removeCartItem(){

}

// 3. Click ra ngoài khoảng trắng thì đóng menu
document.addEventListener('click', function () {
    document.querySelectorAll('.variant-dropdown').forEach(d => {
        d.classList.remove('show');
    });
});