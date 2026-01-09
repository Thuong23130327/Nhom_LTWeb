INSERT INTO Users (email, password_hash, full_name, role, is_locked, created_at) 
VALUES 
(
    'admin@gmail.com', 
    '202cb962ac59075b964b07152d234b70', -- 123
    'Administrator', 
    'Admin', 
    0, 
    NOW()
);
SELECT
    *
FROM
    products
WHERE
    Categories_id = 1
   OR Categories_id IN (SELECT id FROM categories WHERE Categories_id = 1);
SELECT
    *
FROM
    products
WHERE
SELECT
    Products_id
FROM
    productvariants
WHERE
    id = 5;
SELECT
    *
FROM
    brands;
SELECT
    *
FROM
    productvariants
WHERE
    Products_id = 1;
SELECT
    *
FROM
    productgalleries SELECT
  *
FROM
    ProductGalleries
WHERE
    Products_id = 1
ORDER BY
    sort_order;
-- XỬ LÝ TRÙNG ẢNH
DELETE t1
FROM
  productgalleries t1
  INNER JOIN productgalleries t2
WHERE
  t1.id > t2.id
  AND -- Xóa thằng ID lớn (bản sao 713 trở đi)
  t1.Products_id = t2.Products_id
  AND -- Trùng sản phẩm
  t1.image_url = t2.image_url; -- Trùng link ảnh (Thay 'thumbnail' bằng tên cột link ảnh của bạn)
SELECT
    products_id,
    image_url,
    COUNT(*)
FROM
    productgalleries
GROUP BY
    products_id,
    image_url
HAVING
    COUNT(*) > 1;
-- Trùng spec
UPDATE productspecs
SET spec_name = TRIM(spec_name);
DELETE t1
FROM
  productspecs t1
  INNER JOIN productspecs t2
WHERE
  t1.id > t2.id
  AND -- Giữ lại dòng cũ (ID nhỏ), xóa dòng mới (ID lớn)
  t1.Products_id = t2.products_id
  AND -- Trùng sản phẩm
  t1.spec_name = t2.spec_name
  AND -- Trùng tên thông số (Ví dụ: 'Trọng lượng')
  t1.spec_value = t2.spec_value; -- Trùng giá trị thông số

DELETE t1
FROM
  productspecs t1
  INNER JOIN productspecs t2
WHERE
  t1.id > t2.id
  AND t1.products_id = t2.products_id
  AND t1.spec_name = t2.spec_name;
ALTER TABLE productspecs ADD CONSTRAINT unique_spec_per_product UNIQUE (products_id, spec_name);



