-- Drop existing tables
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Order_Detail;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS User;

-- Recreate tables
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    authority VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE Game (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Order_Detail (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    game_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (game_id) REFERENCES Game(game_id)
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    user_id INT,
    rating INT,
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (game_id) REFERENCES Game(game_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert Users
INSERT INTO User (username, authority, password) VALUES
('user0', 'ROLE_USER', 'password'),
('admin0', 'ROLE_ADMIN', 'password');

-- Insert Games
INSERT INTO Game (title, genre, price) VALUES
('The Legend of Zelda', 'Adventure', 59.99),
('Super Mario Bros.', 'Platformer', 49.99);

-- Insert Orders
INSERT INTO `Order` (order_date, user_id) VALUES
('2023-10-01', 1),
('2023-10-02', 2);

-- Insert Order Details
INSERT INTO Order_Detail (order_id, game_id, quantity, total_price) VALUES
(1, 1, 1, 59.99),
(2, 2, 2, 99.98);

-- Insert Reviews
INSERT INTO Review (game_id, user_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Amazing game!', '2023-10-03'),
(2, 2, 4, 'Classic and fun!', '2023-10-04');