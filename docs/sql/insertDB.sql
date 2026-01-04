USE AuraSound_DB;
SET SQL_SAFE_UPDATES = 0;
UPDATE Temp_Products
SET brandName = TRIM(brandName);

UPDATE Temp_Products
SET brandName = 'Samsung'
WHERE
  brandName IN ('SS', 'SamSung');
  
UPDATE Temp_Products
SET brandName = 'Realme'
WHERE
  brandName IN ('RM', 'RealMe');
  
UPDATE Temp_Products
SET cat_child = 'Tai nghe nhét tai'
WHERE
  cat_child IN ('Nhét tai', 'Airpods', 'Nhét tai/ Minor', 'Nhét tai/ Redmi Buds', 'In-ear');
  
UPDATE Temp_Products
SET cat_child = 'Tai nghe chụp tai'
WHERE
  cat_child IN ('Chụp tai', 'Tai chụp', 'Chụp tai/ Major', 'Chụp tai/ Minor', 'Headphone');
UPDATE Temp_Products
SET cat_child = 'Tai nghe kẹp tai'
WHERE
  cat_child IN ('Kẹp tai', 'Clip-on');
UPDATE Temp_Products
SET cat_child = 'Loa di động'
WHERE
  cat_child IN ('Loa Di động', 'Loa', 'Loa bluetooth');
UPDATE Temp_Products
SET cat_child = 'Loa Karaoke'
WHERE
  cat_child IN ('Loa kéo', 'Karaoke');
  
INSERT INTO Categories (NAME, Categories_id) SELECT DISTINCT
  tp.cat_parent,
  NULL
FROM
  Temp_Products tp
WHERE
  tp.cat_parent IS NOT NULL
  AND tp.cat_parent != ''
  AND NOT EXISTS (SELECT 1 FROM Categories c WHERE c.NAME = tp.cat_parent AND c.Categories_id IS NULL);
INSERT INTO Categories (NAME, Categories_id) SELECT DISTINCT
  tp.cat_child,
  c_parent.id
FROM
  Temp_Products tp
  JOIN Categories c_parent ON tp.cat_parent = c_parent.NAME
WHERE
  tp.cat_child IS NOT NULL
  AND tp.cat_child != ''
  AND c_parent.Categories_id IS NULL
  AND NOT EXISTS (SELECT 1 FROM Categories c WHERE c.NAME = tp.cat_child AND c.Categories_id = c_parent.id);
UPDATE Temp_Products tp
JOIN Categories c_child ON tp.cat_child = c_child.
NAME JOIN Categories c_parent ON tp.cat_parent = c_parent.NAME
SET tp.mapped_cat_id = c_child.id
WHERE
  c_child.Categories_id = c_parent.id;
INSERT INTO brands (`name`) SELECT DISTINCT
  tp.brandName
FROM
  Temp_Products tp
WHERE
  tp.brandName IS NOT NULL
  AND tp.brandName != ''
  AND NOT EXISTS (SELECT 1 FROM brands b WHERE b.NAME = tp.brandName);
UPDATE Products p
JOIN Temp_Products tp ON p.sku = tp.sku
SET p.Categories_id = tp.mapped_cat_id
WHERE
  tp.mapped_cat_id IS NOT NULL;
INSERT IGNORE INTO Products (Brands_id, Categories_id, sku, NAME, description, is_active, created_at) SELECT
  b.id,
  tp.mapped_cat_id,
  tp.sku,
  tp.proName,
  tp.script,
  TRUE,
  NOW()
FROM
  Temp_Products tp
  JOIN Brands b ON tp.brandName = b.NAME
WHERE
  tp.mapped_cat_id IS NOT NULL;
INSERT IGNORE INTO ProductVariants (Products_id, variant_sku, color_name, main_image_url, market_price, sell_price, stock_quantity) SELECT
  p.id,
  CONCAT(
    p.sku,
    '-',
    CASE
      WHEN t.color LIKE '%Trắng%' THEN
        'WHT'
      WHEN t.color LIKE '%Đen%' THEN
        'BLK'
      WHEN t.color LIKE '%Đỏ%' THEN
        'RED'
      WHEN t.color LIKE '%Xanh dương%' THEN
        'BLU'
      WHEN t.color LIKE '%Xanh lá%' THEN
        'GRE'
      WHEN t.color LIKE '%Vàng%' THEN
        'YEL'
      WHEN t.color LIKE '%Xám%' THEN
        'GRY'
      WHEN t.color LIKE '%Bạc%' THEN
        'SLV'
      WHEN t.color LIKE '%Hồng%' THEN
        'PNK'
      WHEN t.color LIKE '%Cam%' THEN
        'ORG'
      WHEN t.color LIKE '%Tím%' THEN
        'PUR'
      WHEN t.color LIKE '%Nâu%' THEN
        'BRN'
      ELSE
        'VAR'
    END
  ),
  t.color,
  t.Image,
  IFNULL(t.basePrice, 0),
  IFNULL(t.sellPrice, 0),
  IFNULL(t.soLuongCon, 0)
FROM
  Temp_variants t
  JOIN Temp_Products tp ON t.sku = tp.sku
  JOIN Products p ON p.sku = tp.sku;
INSERT IGNORE INTO ProductSpecs (Products_id, spec_name, spec_value) SELECT
  p.id,
  ts.SpecName,
  ts.SpecValue
FROM
  Temp_Specs ts
  JOIN Products p ON ts.SKU = p.sku;
INSERT IGNORE INTO ProductGalleries (Products_id, image_url) SELECT
  p.id,
  tg.Image
FROM
  Temp_Gallery tg
  JOIN Products p ON tg.SKU = p.sku;
SET SQL_SAFE_UPDATES = 1;
SELECT
  'Số lượng SP' AS Info,
  COUNT(*) AS Count
FROM
  Products UNION ALL
SELECT
  'Số lượng Biến thể',
  COUNT(*)
FROM
  ProductVariants;
  
  -- check sp vo dung cate chua
  SELECT 
    c.id, 
    c.name AS Ten_Category, 
    IFNULL(parent.name, '--- GỐC ---') AS Category_Cha,
    COUNT(p.id) AS So_Luong_SP
FROM Categories c
LEFT JOIN Categories parent ON c.Categories_id = parent.id
LEFT JOIN Products p ON p.Categories_id = c.id
GROUP BY c.id, c.name, parent.name
ORDER BY c.id;

   
   SELECT p.id, p.sku, p.name 
FROM Products p
LEFT JOIN ProductVariants pv ON p.id = pv.Products_id
WHERE pv.id IS NULL;

-- sai loai:
