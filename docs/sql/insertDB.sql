USE AuraSound_DB;

-- brands
INSERT INTO brands (`name`)
SELECT DISTINCT tp.brandName
FROM temp_products tp
WHERE tp.brandName IS NOT NULL AND tp.brandName != ''
AND NOT EXISTS (SELECT 1 FROM brands b WHERE b.name = tp.brandName);

-- categories
INSERT INTO categories (`name`)
SELECT DISTINCT tp.category
FROM temp_products tp
WHERE tp.category IS NOT NULL AND tp.category != ''
AND NOT EXISTS (SELECT 1 FROM categories c WHERE c.name = tp.category);

-- products
INSERT IGNORE INTO Products (Brands_id, Categories_id, sku, NAME, description)
SELECT 
    b.id,
    c.id,
    tp.sku,
    tp.proName,
    tp.script
FROM Temp_Products tp
JOIN Brands b ON tp.brandName = b.NAME
JOIN Categories c ON tp.category = c.NAME
WHERE tp.brandName IS NOT NULL 
  AND tp.category IS NOT NULL;
  
-- ProductVariants
INSERT IGNORE INTO ProductVariants (Products_id, variant_sku, color_name, main_image_url, market_price, sell_price, stock_quantity)
SELECT 
    p.id,
    CONCAT(p.sku, '-', 
        CASE 
            WHEN t.color LIKE '%Trắng%' THEN 'WHT'
            WHEN t.color LIKE '%Đen%' THEN 'BLK'
            WHEN t.color LIKE '%Đỏ%' THEN 'RED'
            WHEN t.color LIKE '%Xanh dương%' THEN 'BLU'
            WHEN t.color LIKE '%Vàng%' THEN 'YEL'
            WHEN t.color LIKE '%Xám%' THEN 'GRY'
            WHEN t.color LIKE '%Bạc%' THEN 'SLV'
            WHEN t.color LIKE '%Hồng%' THEN 'PNK'
            WHEN t.color LIKE '%Cam%' THEN 'ORG'
            WHEN t.color LIKE '%Tím%' THEN 'PUR'
            WHEN t.color LIKE '%Nâu%' THEN 'BRN'
            WHEN t.color LIKE '%Xanh lá%' THEN 'GRE'
            ELSE 'VAR'
        END
    ),
    t.color,
    t.Image,
    IFNULL(t.basePrice, 0),
    IFNULL(t.sellPrice, 0),
    IFNULL(t.soLuongCon, 0)
FROM Temp_variants t
JOIN Products p ON t.sku = p.sku
WHERE t.sku IS NOT NULL AND t.sku <> ''
  AND t.color IS NOT NULL AND t.color <> '';
  
-- ProductSpecs
INSERT IGNORE INTO ProductSpecs (Products_id, spec_name, spec_value)
SELECT p.id, ts.SpecName, ts.SpecValue
FROM Temp_Specs ts
JOIN Products p ON ts.SKU = p.sku;

-- ProductGalleries
INSERT IGNORE INTO ProductGalleries (Products_id, image_url)
SELECT p.id, tg.Image
FROM Temp_Gallery tg
JOIN Products p ON tg.SKU = p.sku;

SELECT 'Products' as TableName, COUNT(*) as Total FROM Products
UNION ALL
SELECT 'Variants', COUNT(*) FROM ProductVariants;

SELECT * FROM products;
SELECT * FROM brands;
SELECT * FROM products;