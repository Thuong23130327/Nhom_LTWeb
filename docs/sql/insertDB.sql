USE AuraSound_DB;

-- Thêm brand từ tên brand trong bảng SP vô brands
INSERT IGNORE INTO brands (`name`) SELECT DISTINCT
  brandName
FROM
  temp_products
WHERE
  brandName IS NOT NULL
  AND brandName != '';
SELECT
  *
FROM
  brands;
INSERT IGNORE INTO categories (`name`) SELECT DISTINCT
  category
FROM
  temp_products
WHERE
  category IS NOT NULL
  AND category != '';
SELECT
  *
FROM
  categories;
SELECT
  *
FROM
  products;
INSERT IGNORE INTO Categories (NAME) SELECT DISTINCT
  category
FROM
  temp_products
WHERE
  category IS NOT NULL
  AND category != '';
SELECT
  *
FROM
  categories;
-- Thêm cột ID vào bảng tạm
ALTER TABLE Temp_Products ADD COLUMN Brands_id INT,
ADD COLUMN Categories_id INT;
-- Cập nhật Brands_id
UPDATE Temp_Products AS tp
INNER JOIN Brands AS b ON tp.brandName = b.NAME
SET tp.Brands_id = b.id;
-- Cập nhật Categories_id
UPDATE Temp_Products AS tp
INNER JOIN Categories AS c ON tp.category = c.NAME
SET tp.Categories_id = c.id;
SELECT
  *
FROM
  temp_products;
INSERT IGNORE INTO Products (Brands_id, Categories_id, sku, NAME, description) SELECT
  tp.Brands_id,
  tp.Categories_id,
  tp.sku,
  tp.proName,
  tp.script
FROM
  Temp_Products AS tp
WHERE
  tp.Brands_id IS NOT NULL
  AND tp.Categories_id IS NOT NULL;
SELECT
  *
FROM
  products;
DROP TABLE productvariants;
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
      WHEN t.color LIKE '%Xanh lá%' THEN
        'GRE'
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
  Temp_variants AS t
  JOIN Products AS p ON t.sku = p.sku
WHERE
  t.sku IS NOT NULL
  AND t.sku <> ''
  AND t.color IS NOT NULL
  AND t.color <> ''
  AND NOT EXISTS (SELECT 1 FROM ProductVariants pv WHERE pv.Products_id = p.id AND pv.color_name = t.color);
SELECT
  *
FROM
  productvariants;
INSERT INTO ProductSpecs (Products_id, spec_name, spec_value) SELECT
  p.id,
  ts.SpecName,
  ts.SpecValue
FROM
  Temp_Specs AS ts
  INNER JOIN Products AS p ON ts.SKU = p.sku;
INSERT INTO ProductGalleries (Products_id, image_url) SELECT
  p.id,
  tg.Image
FROM
  Temp_Gallery AS tg
  INNER JOIN Products AS p ON tg.SKU = p.sku;
SELECT
  *
FROM
  productgalleries;
SELECT
  *
FROM
  productspecs;