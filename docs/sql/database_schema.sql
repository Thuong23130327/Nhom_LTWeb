CREATE
DATABASE AuraSound_DB DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE
AuraSound_DB;

-- LIÊN QUAN SẢN PHẨM
-- Thương hiệu
CREATE TABLE Brands
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    NAME     VARCHAR(255) NOT NULL,
    logo_url VARCHAR(255) NULL
);

-- Loại
CREATE TABLE Categories
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    NAME          VARCHAR(100) NOT NULL,
    Categories_id INT NULL,
    FOREIGN KEY (Categories_id) REFERENCES Categories (id)
);

-- Sản phẩm
CREATE TABLE Products
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    Brands_id     INT                NOT NULL,
    Categories_id INT                NOT NULL,
    sku           VARCHAR(50) UNIQUE NOT NULL,
    NAME          VARCHAR(255)       NOT NULL,
    description   TEXT NULL,
    avg_rating    DECIMAL(2, 1) DEFAULT 5.0,
    sold_count    INT           DEFAULT 0,
    is_active     BOOLEAN       DEFAULT TRUE,
    created_at    DATETIME      DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Brands_id) REFERENCES Brands (id),
    FOREIGN KEY (Categories_id) REFERENCES Categories (id)
);

-- biến thể
CREATE TABLE ProductVariants
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    Products_id    INT                NOT NULL,
    variant_sku    VARCHAR(50) UNIQUE NOT NULL,
    color_name     VARCHAR(100) NULL,
    main_image_url VARCHAR(255) NULL,
    market_price   DECIMAL(10, 2)     NOT NULL,
    sell_price     DECIMAL(10, 2)     NOT NULL,
    stock_quantity INT DEFAULT 0,
    sold_quantity  INT DEFAULT 0,
    FOREIGN KEY (Products_id) REFERENCES Products (id)
);
-- Thông số
CREATE TABLE ProductSpecs
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    Products_id INT          NOT NULL,
    spec_name   VARCHAR(100) NOT NULL,
    spec_value  VARCHAR(255) NOT NULL,
    FOREIGN KEY (Products_id) REFERENCES Products (id)
);

-- Ảnh sp
CREATE TABLE ProductGalleries
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    Products_id INT          NOT NULL,
    image_url   VARCHAR(255) NOT NULL,
    sort_order  INT DEFAULT 0,
    FOREIGN KEY (Products_id) REFERENCES Products (id)
);

-- LIÊN QUAN USER + LIST
CREATE TABLE Users
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    email         VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255)        NOT NULL,
    full_name     VARCHAR(150) NULL,
    phone         VARCHAR(20) NULL,
    avatar_url    VARCHAR(255) NULL,
    role          ENUM ('Customer', 'Admin') DEFAULT 'Customer',
    is_locked     BOOLEAN  DEFAULT FALSE,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE UserAddresses
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    Users_id       INT          NOT NULL,
    recipient_name VARCHAR(150) NOT NULL,
    phone          VARCHAR(20)  NOT NULL,
    address        VARCHAR(255) NOT NULL,
    city           VARCHAR(100) NOT NULL,
    is_default     BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (Users_id) REFERENCES Users (id)
);
CREATE TABLE ContactMails
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    Users_id      INT NULL,
    sender_name   VARCHAR(150) NOT NULL,
    sender_email  VARCHAR(255) NOT NULL,
    sender_phone  VARCHAR(20),
    message       TEXT         NOT NULL,
    reply_content TEXT NULL,
    STATUS        ENUM ('New', 'Replied') DEFAULT 'New',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Users_id) REFERENCES Users (id)
);

CREATE TABLE ContactReplies
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    contact_id  INT  NOT NULL,
    sender_type ENUM('User', 'Admin') NOT NULL,
    message     TEXT NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contact_id) REFERENCES ContactMails (id) ON DELETE CASCADE
);

-- 3. Liên quan SALES & ORDER
CREATE TABLE Vouchers
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    CODE            VARCHAR(50) UNIQUE NOT NULL,
    discount_amount DECIMAL(10, 2)     NOT NULL,
    min_order_value DECIMAL(10, 2) DEFAULT 0.00,
    usage_limit     INT NULL,
    end_date        DATETIME           NOT NULL,
    created_at      DATETIME       DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Orders
(
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    Users_id             INT NULL,
    Vouchers_id          INT NULL,
    order_code           VARCHAR(50) UNIQUE NOT NULL,
    order_date           DATETIME       DEFAULT CURRENT_TIMESTAMP,
    STATUS               ENUM ('Pending', 'Shipping', 'Completed', 'Cancelled') DEFAULT 'Pending',
    payment_status       ENUM ('Unpaid', 'Paid', 'Refunded') DEFAULT 'Unpaid',
    total_products_price DECIMAL(10, 2)     NOT NULL,
    shipping_fee         DECIMAL(10, 2) DEFAULT 0.00,
    discount_amount      DECIMAL(10, 2) DEFAULT 0.00,
    final_amount         DECIMAL(10, 2)     NOT NULL,
    FOREIGN KEY (Users_id) REFERENCES Users (id),
    FOREIGN KEY (Vouchers_id) REFERENCES Vouchers (id)
);
CREATE TABLE OrderShippings
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    Orders_id      INT UNIQUE   NOT NULL,
    recipient_name VARCHAR(150) NOT NULL,
    phone          VARCHAR(20)  NOT NULL,
    address        VARCHAR(255) NOT NULL,
    city           VARCHAR(100) NOT NULL,
    note           TEXT NULL,
    FOREIGN KEY (Orders_id) REFERENCES Orders (id)
);
CREATE TABLE OrderItems
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    Orders_id          INT            NOT NULL,
    ProductVariants_id INT            NOT NULL,
    quantity           INT            NOT NULL,
    price_at_purchase  DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Orders_id) REFERENCES Orders (id),
    FOREIGN KEY (ProductVariants_id) REFERENCES ProductVariants (id),
    UNIQUE KEY uk_order_variant (Orders_id, ProductVariants_id)
);

-- 4. CỤM REVIEW
CREATE TABLE Reviews
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    Products_id INT NOT NULL,
    Users_id    INT NOT NULL,
    rating      INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    COMMENT     TEXT NULL,
    is_visible  BOOLEAN  DEFAULT TRUE,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Products_id) REFERENCES Products (id),
    FOREIGN KEY (Users_id) REFERENCES Users (id)
);
CREATE TABLE ReviewGalleries
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    Reviews_id INT          NOT NULL,
    image_url  VARCHAR(255) NOT NULL,
    FOREIGN KEY (Reviews_id) REFERENCES Reviews (id)
);

-- Banner QC - slider
CREATE TABLE Banners
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    image_url   VARCHAR(255) NOT NULL,
    target_url  VARCHAR(255) NULL,
    title       VARCHAR(100) NULL,
    description TEXT NULL,
    sort_order  INT      DEFAULT 0,
    is_active   BOOLEAN  DEFAULT TRUE,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo các bảng tạm
CREATE TABLE Temp_Products
(
    sku           VARCHAR(50),
    proName       VARCHAR(255),
    brandName     VARCHAR(255),
    category      VARCHAR(255),
    script        TEXT,
    mapped_cat_id INT,
    cat_parent    VARCHAR(100),
    cat_child     VARCHAR(100)
);
CREATE TABLE Temp_Specs
(
    SKU       VARCHAR(50),
    SpecName  VARCHAR(255),
    SpecValue VARCHAR(255)
);
CREATE TABLE Temp_Gallery
(
    SKU   VARCHAR(50),
    Image VARCHAR(255)
);
CREATE TABLE Temp_variants
(
    sku        NVARCHAR (50),
    color      NVARCHAR (50),
    basePrice  DECIMAL(10, 2),
    sellPrice  DECIMAL(10, 2),
    soLuongCon INT,
    Image      NVARCHAR (255)
);
SELECT DISTINCT temp_products.brandName
FROM temp_products
WHERE brandName IS NOT NULL
  AND brandName != '';
  
  ALTER TABLE ProductVariants
ADD COLUMN is_default BOOLEAN DEFAULT FALSE;