document.addEventListener('DOMContentLoaded', function() {
    
    // 1. Xử lý nút "Cập nhật Trạng thái"
    // Selector MỚI: Sử dụng class CSS trực tiếp: .btn-update-status
    const updateStatusButton = document.querySelector('.btn-update-status');

    if (updateStatusButton) {
        updateStatusButton.addEventListener('click', function(event) {
            // Ngăn chặn hành vi mặc định (nếu là form submit)
            event.preventDefault(); 
            // Hiển thị thông báo theo yêu cầu
            alert('Dữ liệu đã được cập nhật');
        });
    }

    // 2. Xử lý nút "Lưu ghi chú"
    // Selector: Sử dụng class CSS trực tiếp: .btn-save-note (Đã có trong HTML mới nhất)
    const saveNoteButton = document.querySelector('.btn-save-note'); 
    
    if (saveNoteButton) {
        saveNoteButton.addEventListener('click', function(event) {
            // Ngăn chặn hành vi mặc định (nếu là form submit)
            event.preventDefault(); 
            // Hiển thị thông báo theo yêu cầu
            alert('Đã lưu ghi chú');
        });
    }
});