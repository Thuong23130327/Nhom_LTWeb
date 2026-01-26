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
// Định dạng tiền Việt
const moneyFormatter = new Intl.NumberFormat('vi-VN');

// Hàm tăng/giảm số lượng
function updateQuantity(btn, id, delta) {
    const row = btn.closest('.cart-item');
    const input = row.querySelector('.quantity-input');

    // Gọi Servlet với mode=ajax
    fetch(`cart?action=add&id=${id}&q=${delta}&mode=ajax`)
        .then(res => {
            if (!res.ok) throw new Error("Lỗi mạng");
            return res.json();
        })
        .then(data => {
            if (data.status === 'success') {
                // Cập nhật input
                if (input) input.value = data.itemQty;

                // Cập nhật tổng tiền
                updateCartSummary(data);

                // Nếu số lượng <= 0, server đã xóa item -> xóa UI
                if (data.itemQty <= 0) {
                    row.remove();
                    checkEmptyCart(data.totalQty);
                }
            }
        })
        .catch(console.error);
}

// Hàm xóa sản phẩm
function removeItem(btn, id) {
    if (!confirm("Bạn có chắc muốn xóa sản phẩm này?")) return;

    const row = btn.closest('.cart-item');

    fetch(`cart?action=delete&id=${id}&mode=ajax`)
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                row.remove(); // Xóa dòng
                updateCartSummary(data);
                checkEmptyCart(data.totalQty);
            }
        })
        .catch(console.error);
}

// Hàm checkbox
function toggleCheck(id) {
    fetch(`cart?action=check&id=${id}&mode=ajax`)
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                updateCartSummary(data);
            }
        })
        .catch(console.error);
}

// Cập nhật tổng tiền&số lượng
function updateCartSummary(data) {
    // Cập nhật giá tổng
    const totalEls = document.querySelectorAll('.subtotal-price');
    totalEls.forEach(el => {
        el.innerText = moneyFormatter.format(data.cartTotal || data.totalPrice) + '₫';
    });

    // Cập nhật số lượng
    const countEls = document.querySelectorAll('.cart-count-display');
    countEls.forEach(el => {
        el.innerText = data.cartQty || data.totalQty;
    });
}

// Cho load lại khi cart rỗngg
function checkEmptyCart(qty) {
    if (qty === 0) location.reload();
}

// XỬ LÝ AJAX
function selectColor(element, oldVid, newVid) {
    // Ngăn sự kiện nổi bọt (click vào con không kích hoạt cha)
    if (window.event) window.event.stopPropagation();

    // Tìm dòng sản phẩm chứa nút này
    const row = element.closest('.cart-item');
    if (!row) return;

    console.log(`Đang request đổi từ ID: ${oldVid} sang ID: ${newVid}`);

    // Gọi AJAX
    fetch(`cart?action=updateVariant&id=${oldVid}&newVariantId=${newVid}`)
        .then(response => {
            if (!response.ok) throw new Error("Lỗi kết nối");
            return response.json();
        })
        .then(data => {
            if (data.status === "success") {
                // Cập nhật Ui
                const imgTag = row.querySelector('.item-img');
                if (imgTag) imgTag.src = data.img;

                const nameTag = row.querySelector('.item-variant span');
                if (nameTag) nameTag.innerText = "Màu: " + data.name;

                const priceTag = row.querySelector('.item-price');
                if (priceTag) priceTag.innerText = new Intl.NumberFormat('vi-VN').format(data.price) + '₫';

                const totalTag = document.querySelector('.subtotal-price');
                if (totalTag) totalTag.innerText = new Intl.NumberFormat('vi-VN').format(data.totalOrder) + '₫';

                // Cập nhật logic nút
                // Nút tăng giảm
                const qtyBtns = row.querySelectorAll('.quantity-btn');
                qtyBtns.forEach(btn => {
                    let oldClick = btn.getAttribute('onclick'); // VD: ...&id=10&q=1
                    let newClick = oldClick.replace(`id=${oldVid}`, `id=${data.newId}`);
                    btn.setAttribute('onclick', newClick);
                });

                // Nút xóa
                const delBtn = row.querySelector('.item-delete');
                if (delBtn) {
                    let oldClick = delBtn.getAttribute('onclick');
                    let newClick = oldClick.replace(`id=${oldVid}`, `id=${data.newId}`);
                    delBtn.setAttribute('onclick', newClick);
                }

                // Nút checkbox
                const checkbox = row.querySelector('input[type="checkbox"]');
                if (checkbox) {
                    let oldClick = checkbox.getAttribute('onclick');
                    if(oldClick) {
                        let newClick = oldClick.replace(`id=${oldVid}`, `id=${data.newId}`);
                        checkbox.setAttribute('onclick', newClick);
                    }
                }

                // Menu đổi biến thể
                const options = row.querySelectorAll('.variant-option');
                options.forEach(opt => {
                    let oldClick = opt.getAttribute('onclick');
                    let newClick = oldClick.replace(`'${oldVid}'`, `'${data.newId}'`);
                    opt.setAttribute('onclick', newClick);
                });

                // Đóng menu
                const dropdown = row.querySelector('.variant-dropdown');
                if (dropdown) dropdown.classList.remove('show');
                row.classList.remove('active-row');

            } else {
                alert("Lỗi: " + data.message);
            }
        })
        .catch(err => {
            console.error(err);
            alert("Có lỗi xảy ra, vui lòng thử lại!");
        });
}

