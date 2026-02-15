

INSERT INTO admins (username, email, password)
VALUES 
    ('admin2', 'admin2@example.com', 'Password456'),
    ('admin3', 'admin3@example.com', 'Password789')
ON CONFLICT (username, email) DO NOTHING;
