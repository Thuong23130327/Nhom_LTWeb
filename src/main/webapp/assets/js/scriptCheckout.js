document.addEventListener("DOMContentLoaded", function () {
    // Biến toàn cục lưu mã voucher hợp lệ
    let appliedVoucherCode = "";

    // Áp dụng voucher
    const btnApplyVoucher = document.querySelector('.promo-code button');
    if (btnApplyVoucher) {
        btnApplyVoucher.addEventListener('click', handleCheckVoucher);
    }

    // Click đặt hàng
    const btnPlaceOrder = document.getElementById('btn-dat-hang');
    if (btnPlaceOrder) {
        btnPlaceOrder.addEventListener('click', handlePlaceOrder);
    }

    // Đóng PopUp
    const btnClosePopup = document.getElementById('popup-close');
    if (btnClosePopup) {
        btnClosePopup.addEventListener('click', closePopup);
    }

    // Xử lí voucher
    function handleCheckVoucher() {
        const voucherInput = document.getElementById('voucher-input');
        const msgSpan = document.getElementById('voucher-msg');
        const code = voucherInput.value.trim();

        if (!code) {
            msgSpan.innerText = "Vui lòng nhập mã!";
            msgSpan.className = "error-msg";
            return;
        }

        // Chuẩn bị dữ liệu gửi đi
        const params = new URLSearchParams();
        params.append('action', 'checkVoucher');
        params.append('code', code);

        // Gọi AJAX tới Servlet
        fetch('CheckoutServlet', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: params
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    appliedVoucherCode = code;
                    msgSpan.innerText = "Áp dụng mã thành công!";
                    msgSpan.className = "success-msg";

                    // Hiển thị dòng giảm giá
                    const discountRow = document.getElementById('discount-row');
                    const discountAmt = document.getElementById('discount-amount');
                    const finalTotal = document.getElementById('final-total');

                    if(discountRow) discountRow.style.display = 'flex';

                    // Format tiền VietNam
                    if(discountAmt) discountAmt.innerText = '-' + new Intl.NumberFormat('vi-VN').format(data.discount) + 'đ';
                    if(finalTotal) finalTotal.innerText = new Intl.NumberFormat('vi-VN').format(data.finalPrice) + 'đ';
                } else {
                    appliedVoucherCode = ""; // Reset nếu mã sai
                    msgSpan.innerText = data.message;
                    msgSpan.className = "error-msg";

                    // Ẩn dòng giảm giá
                    const discountRow = document.getElementById('discount-row');
                    if(discountRow) discountRow.style.display = 'none';

                    // Reset tổng tiền về giá gốc
                    const finalTotal = document.getElementById('final-total');
                    const originalTotal = parseFloat(finalTotal.getAttribute('data-original')); // ParseFloat quan trọng
                    finalTotal.innerText = new Intl.NumberFormat('vi-VN').format(originalTotal) + 'đ';
                }
            })
            .catch(err => {
                console.error("Lỗi voucher:", err);
                msgSpan.innerText = "Lỗi kết nối server!";
                msgSpan.className = "error-msg";
            });
    }

    // Xủ lí đặt hàng
    function handlePlaceOrder() {
        const btn = document.getElementById('btn-dat-hang');

        // Lấy dữ liệu input
        const fullname = document.getElementById('fullname').value.trim();
        const phone = document.getElementById('phone').value.trim();
        const city = document.getElementById('city').value.trim();
        const ward = document.getElementById('ward').value.trim();
        const addressDetail = document.getElementById('address').value.trim();
        const note = document.getElementById('notes').value.trim();

        // Kiểm tra thông tin bắt buộc
        if (!fullname || !phone || !city || !ward || !addressDetail) {
            alert("Vui lòng điền đầy đủ các trường bắt buộc (*)");
            return;
        }

        // Địa chỉ
        const fullAddress = addressDetail + ", " + ward;

        // Lấy phương thức thanh toán
        const paymentRadio = document.querySelector('input[name="payment"]:checked');
        const paymentMethod = paymentRadio ? paymentRadio.value : 'cod';

        // UI loading
        const originalText = btn.innerText;
        btn.innerText = "Đang xử lý...";
        btn.classList.add("loading");
        btn.disabled = true;

        // Chuẩn bị dữ liệu
        const params = new URLSearchParams();
        params.append('action', 'placeOrder');
        params.append('fullname', fullname);
        params.append('phone', phone);
        params.append('city', city);
        params.append('address', fullAddress);
        params.append('note', note);
        params.append('voucherCode', appliedVoucherCode);
        params.append('paymentMethod', paymentMethod);

        // Gọi AJAX
        fetch('CheckoutServlet', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: params
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Hiện PopUp
                    const popup = document.getElementById('success-popup');
                    if(popup) popup.style.display = 'flex';

                    // Chuyển hướng về trang chủ sau 2.5 giây
                    setTimeout(() => {
                        window.location.href = "index.jsp";
                    }, 2500);
                } else {
                    alert("Lỗi: " + data.message);
                    resetButton(btn, originalText);
                }
            })
            .catch(err => {
                console.error(err);
                alert("Có lỗi xảy ra khi kết nối server, vui lòng thử lại.");
                resetButton(btn, originalText);
            });
    }

    // Reset nút bấm khi lỗi
    function resetButton(btn, text) {
        btn.innerText = text;
        btn.classList.remove("loading");
        btn.disabled = false;
    }

    // Đóng PopUp
    function closePopup() {
        const popup = document.getElementById('success-popup');
        if(popup) popup.style.display = 'none';
    }
});

function updateItem() {
    $.ajax({
        url: path + "/admin/update-order-status",
        type: "POST",
        data: {
            id: orderId,
            status: newStatus
        },
        success: function (response) {
            if (response.trim() == "true") {
                alert("Cập nhật trạng thái thành công !");
                location.reload();
            } else {
                alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
            }
        },
        error: function () {
            alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
        }
    });
}