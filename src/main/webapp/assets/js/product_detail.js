// Hàm xác nhận chung
function confirmAction(message) {
    return confirm(message);
}

// Xử lý alert sau khi load trang
window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('status') === 'success') {
        alert("Thao tác thành công! AuraSound đã ghi nhận.");
    } else if (urlParams.get('status') === 'fail') {
        alert("Thao tác thất bại. Vui lòng kiểm tra lại.");
    }
}


function updateVariantInfo(select) {
    // 1. Lấy đúng cái Option đang được chọn
    const option = select.options[select.selectedIndex];

    // 2. Lấy dữ liệu (Chỉ parse số, KHÔNG parse chữ)
    const img = option.getAttribute('data-img');
    const price = option.getAttribute('data-price');
    const oldPrice = option.getAttribute('data-oldprice');
    const stock = option.getAttribute('data-stock');
    const sold = option.getAttribute('data-sold');
    const clname = option.getAttribute('data-clname');
    const skuvar = option.getAttribute('data-skuvar');

    if (img) {
        document.getElementById('showImgVar').src = img;
        document.getElementById('current-img-url').value = img;
    }

    // 4. Định dạng tiền tệ cho đẹp (nếu có chỗ hiển thị)
    const formatter = new Intl.NumberFormat('vi-VN');
    const priceDisplay = document.getElementById('sampleNewPrice');
    if (priceDisplay) {
        priceDisplay.innerText = formatter.format(price) + " đ";
    }

    // 5. Đổ dữ liệu vào các ô Input (Sửa lại đúng ID trong HTML của ông)
    document.getElementById('current-variant-id').value = option.value;
    document.getElementById('var-colorName').value = clname || "";
    document.getElementById('var-sku').value = skuvar || "";
    document.getElementById('var-stock').value = stock || "0";
    document.getElementById('var-oldP').value = oldPrice || "0";
    document.getElementById('var-newP').value = price || "0";
    document.getElementById('var-sold').value = sold || "0";
}


function showSample(input) {
    // 1. Lấy dữ liệu từ data attributes
    const img = input.getAttribute('data-img');
    const price = parseInt(input.getAttribute('data-price'));
    const oldPrice = parseInt(input.getAttribute('data-oldprice'));
    const discount = parseInt(input.getAttribute('data-discount'));

    if (img) {
        document.getElementById('sampleImg').src = img;
    }

    // 3. Định dạng tiền tệ (ví dụ: 100,000)
    const formatter = new Intl.NumberFormat('vi-VN');

    // 4. Cập nhật Giá mới
    document.getElementById('sampleNewPrice').innerText = formatter.format(price) + " đ";

    // 5. Xử lý hiển thị Giảm giá và Giá cũ
    const badge = document.getElementById('sampleBadge');
    const oldPriceBlock = document.getElementById('sampleOldPriceBlock');
    const oldPriceText = document.getElementById('sampleOldPrice');
    const discountText = document.getElementById('sampleDiscountText');

    if (discount > 0) {
        badge.style.display = 'block';
        oldPriceBlock.style.display = 'block';
        discountText.innerText = discount;
        oldPriceText.innerText = formatter.format(oldPrice) + " đ";
    } else {
        badge.style.display = 'none';
        oldPriceBlock.style.display = 'none';
    }
}
document.addEventListener("DOMContentLoaded", function() {
    const select = document.getElementById('product-status');
    if (select) updateVariantInfo(select);
});