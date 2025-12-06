package models;

public class user {
    public class User {
        // 1. Fields (Các thuộc tính)
        private int id;
        private String username;
        private String email;
        private String firstName;
        private String lastName;
        private String passwordHash; // Lưu trữ mật khẩu đã được mã hóa (không lưu mật khẩu thô!)

        // 2. Constructor (Hàm khởi tạo)
        // Constructor mặc định (không có tham số)
        public User() {
        }

        // Constructor đầy đủ tham số
        public User(int id, String username, String email, String firstName, String lastName, String passwordHash) {
            this.id = id;
            this.username = username;
            this.email = email;
            this.firstName = firstName;
            this.lastName = lastName;
            this.passwordHash = passwordHash;
        }

        // 3. Getters và Setters (Các phương thức truy cập và sửa đổi)

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getFirstName() {
            return firstName;
        }

        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }

        public String getLastName() {
            return lastName;
        }

        public void setLastName(String lastName) {
            this.lastName = lastName;
        }

        // Lưu ý: Thường không có setter cho passwordHash sau khi tạo,
        // mà dùng một phương thức riêng (ví dụ: updatePassword) để đảm bảo bảo mật.
        public String getPasswordHash() {
            return passwordHash;
        }

        public void setPasswordHash(String passwordHash) {
            this.passwordHash = passwordHash;
        }

        // 4. Phương thức tiện ích (Tùy chọn)

        // Ví dụ: Lấy tên đầy đủ
        public String getFullName() {
            return firstName + " " + lastName;
        }

        // Ghi đè phương thức toString() để dễ dàng in thông tin đối tượng
        @Override
        public String toString() {
            return "User{" +
                    "id=" + id +
                    ", username='" + username + '\'' +
                    ", email='" + email + '\'' +
                    ", fullName='" + getFullName() + '\'' +
                    '}';
        }
    }
}
