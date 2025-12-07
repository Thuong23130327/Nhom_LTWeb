CREATE DATABASE aurasound_DB;
USE aurasound_DB;
-- LIÊN QUAN SẢN PHẨM
-- Thương hiệu (brand id, tên brand, link logo brand, ngày tạo)
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    logo_url VARCHAR(512),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Loại
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    parent_id INT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES Categories(category_id)
);
-- Sản phẩm
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    name nVARCHAR(255) NOT NULL,
    description TEXT,
    avg_rating DECIMAL(3, 2) DEFAULT 5.00,
    sold_count INT DEFAULT 0,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
-- biến thể
CREATE TABLE ProductVariants (
    variant_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    variant_sku VARCHAR(150) UNIQUE NOT NULL,
    color_name VARCHAR(100) NOT NULL,
    main_image_url VARCHAR(512),
    market_price DECIMAL(10, 2) NOT NULL,
    sell_price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    sold_quantity INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- Thông số
CREATE TABLE ProductSpecs (
    spec_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    spec_name VARCHAR(255) NOT NULL,
    spec_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- Ảnh sp
CREATE TABLE ProductGallery (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    image_url VARCHAR(512) NOT NULL,
    sort_order INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- LIÊN QUAN USER + LIST
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name nVARCHAR(255),
    phone VARCHAR(20),
    avatar_url VARCHAR(512),
    role ENUM('Customer', 'Admin') DEFAULT 'Customer',
    is_locked BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UserAddresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    recipient_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(512) NOT NULL,
    city VARCHAR(255) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE UserLists (
    list_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    list_type ENUM('CART', 'WISHLIST') NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    UNIQUE KEY unique_user_list_type (user_id, list_type)
);

CREATE TABLE UserListItems (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    list_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT DEFAULT 1,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (list_id) REFERENCES UserLists(list_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id),
    UNIQUE KEY unique_list_variant (list_id, variant_id)
);

CREATE TABLE ContactMails (
    mail_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_name VARCHAR(255) NOT NULL,
    sender_email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    reply_content TEXT,
    status ENUM('New', 'Replied') DEFAULT 'New',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. CỤM SALES & ORDER
CREATE TABLE Vouchers (
    voucher_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) UNIQUE NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    min_order_value DECIMAL(10, 2) DEFAULT 0.00,
    usage_limit INT,
    end_date DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    voucher_id INT NULL,
    order_code VARCHAR(100) UNIQUE NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipping', 'Completed', 'Cancelled') DEFAULT 'Pending',
    payment_method ENUM('COD', 'Banking') NOT NULL,
    payment_status ENUM('Unpaid', 'Paid', 'Refunded') DEFAULT 'Unpaid',
    total_products_price DECIMAL(10, 2) NOT NULL,
    shipping_fee DECIMAL(10, 2) DEFAULT 0.00,
    discount_amount DECIMAL(10, 2) DEFAULT 0.00,
    final_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (voucher_id) REFERENCES Vouchers(voucher_id)
);

CREATE TABLE OrderShipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE NOT NULL,
    recipient_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(512) NOT NULL,
    city VARCHAR(255) NOT NULL,
    note TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
);

-- 4. CỤM REVIEW
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    is_visible BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE ReviewGallery (
    img_id INT PRIMARY KEY AUTO_INCREMENT,
    review_id INT NOT NULL,
    image_url VARCHAR(512) NOT NULL,
    FOREIGN KEY (review_id) REFERENCES Reviews(review_id)
);