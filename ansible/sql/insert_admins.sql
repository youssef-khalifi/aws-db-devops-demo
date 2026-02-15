-- insert_admins.sql
INSERT INTO admins (username, email, password)
VALUES 
    ('admin1', 'admin1@example.com', 'Password123'),
    ('admin2', 'admin2@example.com', 'Password456')
ON CONFLICT (username, email) DO NOTHING;
