
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


