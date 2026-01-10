// function selectColor(element) {
//     const allItems = document.querySelectorAll(".color-item");
//     const mainImg = document.getElementById("MainImg");
//
//     // Xóa trạng thái active của các item khác
//     allItems.forEach(item => item.classList.remove("active"));
//
//     // Đặt lại trạng thái active cho item được chọn
//     element.classList.add("active");
//
//     // Lấy đường dẫn ảnh từ thuộc tính data-img
//     const newImg = element.getAttribute("data-img");
//
//     // Hiệu ứng mượt khi đổi ảnh
//     mainImg.style.opacity = 0;
//     setTimeout(() => {
//         mainImg.src = newImg;
//         mainImg.style.opacity = 1;
//     }, 200);
// }
//
// function addToCart(productId) {
//     let q = document.getElementById('quantity').value;
//     let url = "${pageContext.request.contextPath}/CartServlet?id=" + productId + "&q=" + q;
//
//     fetch(url)
//         .then(response => response.text()) // Nhận số lượng từ Servlet gửi về
//         .then(newTotal => {
// // Cập nhật con số trên Navbar bằng ID đã đặt
//             document.getElementById('cart-count').innerText = newTotal;
//
// // Hiển thị thông báo
//             showToast("Đã thêm " + q + " sản phẩm vào giỏ hàng!");
//         })
//         .catch(err => console.error("Lỗi giỏ hàng: ", err));
// }
//
// function showToast(message) {
//     const toast = document.createElement("div");
//     toast.innerHTML = message;
//     toast.style = "position:fixed; bottom:20px; right:20px; background:#28a745; color:#fff; padding:15px; border-radius:8px; z-index:9999;";
//     document.body.appendChild(toast);
//
// // Tự biến mất sau 2 giây
//     setTimeout(() => toast.remove(), 2000);
// }
//
//
// //
// const modalBtn = document.querySelector(".popup");
// const mainmodal = document.querySelector(".main-modal");
// const closeBtn = document.querySelector(".close-btn");
//
// // mở modal
// modalBtn.addEventListener("click", () => {
//     mainmodal.classList.add("active");
// });
//
// // đóng modal
// closeBtn.addEventListener("click", () => {
//     mainmodal.classList.remove("active");
// });
//
// //---------------
// // đánh giá sp
// const allStar = document.querySelectorAll('.rating .star')
//
// allStar.forEach((item, idx) => {
//     item.addEventListener('click', function () {
//         allStar.forEach(i => {
//             i.classList.replace('bxs-star', 'bx-star')
//         })
//         for (let i = 0; i < allStar.length; i++) {
//             if (i <= idx) {
//                 allStar[i].classList.replace('bx-star', 'bxs-star');
//             }
//         }
//     })
// })
//
//
// const openBtn = document.querySelector('.btn-review');
// const wrapper = document.querySelector('.wrapper');
// const overLay = document.querySelector('.over-lay');
// const cancelBtn = document.querySelector('.btn.cancel');
// const submitBtn = document.querySelector('.btn.submit');
//
// // Mở popup
// openBtn.addEventListener('click', () => {
//     wrapper.classList.add('active');
//     overLay.classList.add('active');
// });
//
// // Đóng popup khi bấm Cancel
// cancelBtn.addEventListener('click', (e) => {
//     e.preventDefault();
//     wrapper.classList.remove('active');
//     overLay.classList.remove('active');
// });
//
// // Đóng popup khi bấm Submit
// submitBtn.addEventListener('click', (e) => {
//     e.preventDefault(); // Ngăn reload trang
//     wrapper.classList.remove('active');
//     overLay.classList.remove('active');
// });

function activeSmall(targetSrc) {
    const thumbnails = document.querySelectorAll(".small-img")
    for (const smallImg of thumbnails) {
        smallImg.classList.remove("active");
        if (smallImg.src == targetSrc) {
            smallImg.classList.add("active");
            smallImg.scrollIntoView({
                behavior: 'smooth',
                block: 'nearest',
                inline: 'center'
            });
        }
    }
}

function changeMainImg(targetSrc) {
    const mainImg = document.getElementById("MainImg")
    mainImg.classList.add("hiding");
    mainImg.src = targetSrc;
    mainImg.classList.remove("hiding");
    activeSmall(targetSrc);
}

function scrollImg(direction) {
    const thumbnails = Array.from(document.querySelectorAll(".small-img"))

    const activeThumb = document.querySelector(".small-img.active")
    let curIndex = activeThumb ? thumbnails.indexOf(activeThumb) : 0;
    let newIndex;

    if (direction == 'next') {
        newIndex = curIndex + 1;
        if (newIndex >= thumbnails.length) newIndex = 0;
    } else {
        newIndex = curIndex - 1;
        if (newIndex < 0) newIndex = thumbnails.length - 1;
    }
    const tarImg = thumbnails[newIndex].src;
    changeMainImg(tarImg);


}

function nextImage() {
    scrollImg('next');
}

function prevImage() {
    scrollImg('pre');
}

function selectVariant(e) {
    const id = e.getAttribute("data-id");
    const marketPrice = e.getAttribute("data-marketPrice");
    const stock = e.getAttribute("data-stock");
    const sellPrice = e.getAttribute("data-sellPrice");
    const targetImg = e.getAttribute("data-img");

    changeMainImg(targetImg);

    const formatter = new Intl.NumberFormat('vi-VN');
    document.getElementById("new-price").innerText = formatter.format(sellPrice) + " đ";
    document.getElementById("old-price").innerText = formatter.format(marketPrice) + " đ";

    document.getElementById("selectedVariantId").value = id;
    document.getElementById("stock").innerText = stock;
    const qtyInput = document.querySelector(".product-quantity input");
    qtyInput.value = 1;
    qtyInput.setAttribute("max", stock);
    const listVar = document.querySelectorAll(".color-item")
    for (const eachVar of listVar) {
        eachVar.classList.remove("active");
    }
    e.classList.add("active");
}




