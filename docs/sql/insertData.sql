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



