const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");
const signUpBtn = document.getElementById("signUp");
const signInBtn = document.getElementById("signIn");

// Xử lí hiệu ứng
registerBtn.addEventListener("click", () => {
  container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
  container.classList.remove("active");
});

// Xử lí đăng kí, đăng nhập
// Thay vì dùng thẻ a thì phải dùng button để có thể gắn sự kiện xử lý tài khoản sau khi đăng nhập, đăng kí
signUpBtn.addEventListener("click", () =>{
  localStorage.setItem('isLoggedIn', 'true');
    window.location.href = "index.html";
})
signInBtn.addEventListener("click", () =>{
  localStorage.setItem('isLoggedIn', 'true');
    window.location.href = "index.html";
})