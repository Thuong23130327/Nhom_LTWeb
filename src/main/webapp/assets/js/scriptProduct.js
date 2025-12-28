
let MainImg = document.getElementById("MainImg");
let smallImgs = document.querySelectorAll(".small-img");
let currentIndex = 0;

function showImg(img, index) {
  MainImg.style.opacity = 0;
  setTimeout(() => {
    MainImg.src = img.src;
    MainImg.style.opacity = 1;
  }, 150);
  currentIndex = index;
  setActiveThumbnail();
  scrollToThumb(index);
}

function setActiveThumbnail() {
  smallImgs.forEach(img => img.classList.remove("active"));
  smallImgs[currentIndex].classList.add("active");
}

function nextImage() {
  currentIndex = (currentIndex + 1) % smallImgs.length;
  showImg(smallImgs[currentIndex], currentIndex);
}

function prevImage() {
  currentIndex = (currentIndex - 1 + smallImgs.length) % smallImgs.length;
  showImg(smallImgs[currentIndex], currentIndex);
}

function scrollToThumb(index) {
  const container = document.getElementById("thumbScroll");
  const imgWidth = smallImgs[0].offsetWidth + 8; // 8px là khoảng cách gap
  const scrollPos = imgWidth * index - container.clientWidth / 2 + imgWidth / 2;
  container.scrollTo({ left: scrollPos, behavior: "smooth" });
}

//
function selectColor(element) {
  const allItems = document.querySelectorAll(".color-item");
  const mainImg = document.getElementById("MainImg");

  // Xóa trạng thái active của các item khác
  allItems.forEach(item => item.classList.remove("active"));

  // Đặt lại trạng thái active cho item được chọn
  element.classList.add("active");

  // Lấy đường dẫn ảnh từ thuộc tính data-img
  const newImg = element.getAttribute("data-img");

  // Hiệu ứng mượt khi đổi ảnh
  mainImg.style.opacity = 0;
  setTimeout(() => {
    mainImg.src = newImg;
    mainImg.style.opacity = 1;
  }, 200);
}

function addToCart(productId) {
  // 1. Lấy số lượng từ ô input id="productQty"
  const qtyInput = document.getElementById('productQty');
  let q = qtyInput ? qtyInput.value : 1;

  let url = "${pageContext.request.contextPath}/CartServlet?id=" + productId + "&q=" + q;

  fetch(url)
      .then(response => response.text()) // Nhận con số tổng (ví dụ: "1") từ Servlet
      .then(newTotal => {
        // 2. Tìm đúng cái ID cart-badge bạn vừa gửi ở trên
        const cartBadge = document.getElementById('cart-badge');

        if (cartBadge) {
          // Thay đổi con số bên trong
          cartBadge.innerText = newTotal;

          // QUAN TRỌNG: Hiện badge lên (vì lúc đầu giỏ trống nó bị display:none)
          cartBadge.style.display = 'inline-block';

          // Hiệu ứng để người dùng biết đã thêm thành công
          cartBadge.style.transform = 'scale(1.3)';
          setTimeout(() => cartBadge.style.transform = 'scale(1)', 200);
        }

        // Thông báo (nếu cần)
        console.log("Đã cập nhật giỏ hàng: " + newTotal);
      })
      .catch(err => console.error("Lỗi giỏ hàng: ", err));
}


//
const modalBtn = document.querySelector(".popup");
const mainmodal = document.querySelector(".main-modal");
const closeBtn = document.querySelector(".close-btn");

// mở modal
modalBtn.addEventListener("click", () => {
  mainmodal.classList.add("active");
});

// đóng modal
closeBtn.addEventListener("click", () => {
  mainmodal.classList.remove("active");
});

//---------------
// đánh giá sp
const allStar = document.querySelectorAll('.rating .star')

allStar.forEach((item, idx)=>{
  item.addEventListener('click', function (){
    allStar.forEach(i=> {
      i.classList.replace('bxs-star','bx-star')
    })
    for(let i=0; i<allStar.length; i++){
      if(i<=idx){
        allStar[i].classList.replace('bx-star', 'bxs-star');
      }
    }
  })
})


const openBtn = document.querySelector('.btn-review');
const wrapper = document.querySelector('.wrapper');
const overLay = document.querySelector('.over-lay');
const cancelBtn = document.querySelector('.btn.cancel');
const submitBtn = document.querySelector('.btn.submit');

// Mở popup
openBtn.addEventListener('click', () => {
    wrapper.classList.add('active');
    overLay.classList.add('active');
});

// Đóng popup khi bấm Cancel
cancelBtn.addEventListener('click', (e) => {
    e.preventDefault();
    wrapper.classList.remove('active');
    overLay.classList.remove('active');
});

// Đóng popup khi bấm Submit
submitBtn.addEventListener('click', (e) => {
    e.preventDefault(); // Ngăn reload trang
    wrapper.classList.remove('active');
    overLay.classList.remove('active');
});




