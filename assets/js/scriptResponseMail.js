document.addEventListener('DOMContentLoaded', function () {
    const responseForm = document.getElementById('responseForm');
    // Khởi tạo đối tượng Modal của Bootstrap
    const successModal = new bootstrap.Modal(document.getElementById('successModal'), {});
    const modalMessage = document.getElementById('modalMessage');
    // Đường dẫn chuyển hướng về giao diện chính MailBox (admin.html dựa trên nút "Quay lại Hộp thư")
    const mailboxURL = 'admin.html'; 

    if (responseForm) {
        responseForm.addEventListener('submit', function (e) {
            e.preventDefault(); // Ngăn chặn form gửi đi mặc định

            // 1. Hiển thị thông báo
            // Nội dung thông báo theo yêu cầu người dùng
            modalMessage.textContent = "Phản hồi đã được gửi tới người dùng"; 
            successModal.show(); // Hiển thị modal

            // 2. Đặt thời gian chờ để chuyển hướng (3 giây)
            setTimeout(() => {
                successModal.hide(); // Tùy chọn: Ẩn modal
                window.location.href = mailboxURL; // Chuyển hướng về giao diện chính
            }, 3000); // 3000ms = 3 giây
        });
    }
});