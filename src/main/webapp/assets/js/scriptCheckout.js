document.addEventListener("DOMContentLoaded", function () {
    console.log("Checkout Script đã tải thành công!");

    // Biến lưu voucher đã áp dụng
    let appliedVoucherCode = "";

    // --- 1. XỬ LÝ NÚT ÁP DỤNG VOUCHER ---
    const btnApplyVoucher = document.getElementById('btn-apply-voucher');
    if (btnApplyVoucher) {
        btnApplyVoucher.addEventListener('click', handleCheckVoucher);
    }

    // --- 2. XỬ LÝ NÚT ĐẶT HÀNG ---
    const btnPlaceOrder = document.getElementById('btn-dat-hang');
    if (btnPlaceOrder) {
        btnPlaceOrder.addEventListener('click', handlePlaceOrder);
    }

    // --- 3. XỬ LÝ NÚT ĐÓNG POPUP ---
    const btnClosePopup = document.getElementById('popup-close');
    if (btnClosePopup) {
        btnClosePopup.addEventListener('click', closePopup);
    }

    // ==========================================
    // HÀM XỬ LÝ ĐẶT HÀNG (QUAN TRỌNG NHẤT)
    // ==========================================
    function handlePlaceOrder(e) {
        e.preventDefault(); // Chặn hành động mặc định (tránh reload trang)
        console.log("Bắt đầu xử lý đặt hàng...");

        const btn = document.getElementById('btn-dat-hang');
        const originalText = btn.innerText;

        // 1. Lấy dữ liệu từ form
        const fullname = document.getElementById('fullname').value.trim();
        const phone = document.getElementById('phone').value.trim();
        const city = document.getElementById('city').value.trim();
        const ward = document.getElementById('ward').value.trim();
        const addressDetail = document.getElementById('address').value.trim();
        const note = document.getElementById('notes').value.trim();

        // 2. Validate cơ bản
        if (!fullname || !phone || !city || !ward || !addressDetail) {
            alert("Vui lòng điền đầy đủ thông tin giao hàng!");
            return;
        }

        const fullAddress = `${addressDetail}, ${ward}, ${city}`;

        // Lấy phương thức thanh toán
        const paymentRadio = document.querySelector('input[name="payment"]:checked');
        const paymentMethod = paymentRadio ? paymentRadio.value : 'cod';

        // 3. Hiệu ứng loading
        btn.innerText = "Đang xử lý...";
        btn.disabled = true;
        btn.style.opacity = "0.7";

        // 4. Chuẩn bị dữ liệu gửi đi
        const params = new URLSearchParams();
        params.append('action', 'placeOrder');
        params.append('fullname', fullname);
        params.append('phone', phone);
        params.append('city', city);
        params.append('address', fullAddress);
        params.append('note', note);
        params.append('voucherCode', appliedVoucherCode);
        params.append('paymentMethod', paymentMethod);

        // 5. Gửi request về Servlet
        fetch('CheckoutServlet', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: params
        })
            .then(response => {
                // Kiểm tra xem phản hồi có phải JSON không
                const contentType = response.headers.get("content-type");
                if (contentType && contentType.indexOf("application/json") !== -1) {
                    return response.json();
                } else {
                    throw new Error("Server không trả về JSON!");
                }
            })
            .then(data => {
                console.log("Kết quả từ Server:", data); // Xem log này

                if (data.status === 'success') {
                    // === KÍCH HOẠT POPUP TẠI ĐÂY ===
                    showSuccessPopup();

                    // Sau 2.5 giây thì về trang chủ
                    setTimeout(() => {
                        window.location.href = "index.jsp"; // Hoặc trang 'thank-you.jsp'
                    }, 2500);
                } else {
                    alert("Lỗi đặt hàng: " + data.message);
                    resetButton(btn, originalText);
                }
            })
            .catch(err => {
                console.error("Lỗi Fetch:", err);
                alert("Có lỗi kết nối. Vui lòng kiểm tra lại console.");
                resetButton(btn, originalText);
            });
    }

    // Hàm hiển thị Popup
    function showSuccessPopup() {
        const popup = document.getElementById('success-popup');
        if (popup) {
            // Bước 1: Hiện khung bao ngoài
            popup.style.display = 'flex';

            // Bước 2: Thêm class để kích hoạt animation (nếu có CSS transition)
            // setTimeout nhỏ để trình duyệt nhận diện thay đổi display trước
            setTimeout(() => {
                popup.classList.add('show');
            }, 10);
        } else {
            console.error("Không tìm thấy ID: success-popup trong HTML");
            alert("Đặt hàng thành công! (Lỗi hiển thị popup)");
        }
    }

    function closePopup() {
        const popup = document.getElementById('success-popup');
        if (popup) {
            popup.classList.remove('show');
            setTimeout(() => {
                popup.style.display = 'none';
            }, 300);
        }
    }

    function resetButton(btn, text) {
        btn.innerText = text;
        btn.disabled = false;
        btn.style.opacity = "1";
    }

    // ==========================================
    // HÀM XỬ LÝ VOUCHER (GIỮ NGUYÊN)
    // ==========================================
    function handleCheckVoucher() {
        const voucherInput = document.getElementById('voucher-input');
        const msgSpan = document.getElementById('voucher-msg');
        const code = voucherInput.value.trim();

        if (!code) {
            msgSpan.innerText = "Vui lòng nhập mã!";
            msgSpan.className = "error-msg";
            return;
        }

        const params = new URLSearchParams();
        params.append('action', 'checkVoucher');
        params.append('code', code);

        fetch('CheckoutServlet', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: params
        })
            .then(res => res.json())
            .then(data => {
                if (data.status === 'success') {
                    appliedVoucherCode = code;
                    msgSpan.innerText = "Áp dụng thành công!";
                    msgSpan.className = "success-msg";

                    // Cập nhật giao diện giá
                    document.getElementById('discount-row').style.display = 'flex';
                    document.getElementById('discount-amount').innerText = '-' + formatCurrency(data.discount);
                    document.getElementById('final-total').innerText = formatCurrency(data.finalPrice);
                } else {
                    appliedVoucherCode = "";
                    msgSpan.innerText = data.message;
                    msgSpan.className = "error-msg";
                    document.getElementById('discount-row').style.display = 'none';

                    // Reset về giá gốc
                    const finalTotalEl = document.getElementById('final-total');
                    const originalPrice = finalTotalEl.getAttribute('data-original');
                    finalTotalEl.innerText = formatCurrency(originalPrice);
                }
            })
            .catch(err => console.error(err));
    }

    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN').format(amount) + 'đ';
    }
});