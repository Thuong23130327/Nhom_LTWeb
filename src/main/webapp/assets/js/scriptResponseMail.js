document.addEventListener('DOMContentLoaded', function () {
    const responseForm = document.getElementById('responseForm');

    // Khởi tạo đối tượng Modal của Bootstrap

    const successModalElement = document.getElementById('successModal');

    // Kiểm tra xem Bootstrap đã được load chưa

    if (typeof bootstrap !== 'undefined' && successModalElement) {
        const successModal = new bootstrap.Modal(successModalElement, {});
        const modalMessage = document.getElementById('modalMessage');
        
        // Đường dẫn chuyển hướng về giao diện chính MailBox.
        // Dựa trên các file của bạn, chúng ta sẽ chuyển về admin.jsp

        const mailboxURL = '../admin/mailBox.jsp'; 

        if (responseForm) {
            responseForm.addEventListener('submit', function (e) {
                e.preventDefault(); // Ngăn chặn form gửi đi mặc định

                // 1. Hiển thị thông báo

                modalMessage.textContent = "Phản hồi đã được gửi tới người dùng"; 
                successModal.show(); // Hiển thị modal

                // 2. Đặt thời gian chờ để chuyển hướng (3 giây)

                setTimeout(() => {
                    successModal.hide(); // Ẩn modal trước khi chuyển hướng
                    
                    // Chuyển hướng

                    window.location.href = mailboxURL; 
                }, 3000); // 3000ms = 3 giây
            });
        }
    } else {
        console.error("Lỗi: Bootstrap JS không được tải hoặc Modal ID không đúng.");
    }
});