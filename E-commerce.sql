--create table brand
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

-- Sample data for brands
INSERT INTO brand (brand_name) VALUES
('Nike'),
('Apple'),
('Samsung');

--create table product_category
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Sample data for categories
INSERT INTO product_category (category_name) VALUES
('Clothing'),
('Electronics'),
('Footwear');


--create table color
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100) NOT NULL
);

-- Sample data for colors
INSERT INTO color (color_name) VALUES
('Red'),
('Blue'),
('Black');

--create table size_category
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Sample data for size categories
INSERT INTO size_category (category_name) VALUES
('Clothing Sizes'),
('Shoe Sizes');

--create table size_option
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_value VARCHAR(50) NOT NULL,
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Sample data for size options
INSERT INTO size_option (size_value, size_category_id) VALUES
('S', 1),
('M', 1),
('42', 2);

--create table product 
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Sample data for products
INSERT INTO product (product_name, brand_id, category_id, base_price) VALUES
('T-Shirt', 1, 1, 25.00),
('iPhone 14', 2, 2, 999.00),
('Running Shoes', 1, 3, 120.00);

--create table product_item
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    quantity_available INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Sample data for product items
INSERT INTO product_item (product_id, color_id, size_option_id, quantity_available) VALUES
(1, 1, 1, 100),
(2, 3, NULL, 50),
(3, 2, 3, 75);

--create table product_image
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT,
    image_url VARCHAR(500) NOT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id)
);

-- Sample data for product images
INSERT INTO product_image (product_item_id, image_url) VALUES
(1, 'https://example.com/images/tshirt-red-s.jpg'),
(2, 'https://example.com/images/iphone14.jpg'),
(3, 'https://example.com/images/shoes-blue-42.jpg');

--create table product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Sample data for product variations
INSERT INTO product_variation (product_id, variation_name) VALUES
(1, 'Red-Small'),
(2, 'Black-Default'),
(3, 'Blue-42');

--create table attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Sample data for attribute categories
INSERT INTO attribute_category (category_name) VALUES
('Physical'),
('Technical');

--create table attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL
);

-- Sample data for attribute types
INSERT INTO attribute_type (type_name) VALUES
('Text'),
('Number'),
('Boolean');

--create table product_attribute
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    attribute_type_id INT,
    attribute_category_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- Sample data for product attributes
INSERT INTO product_attribute (product_id, attribute_name, attribute_value, attribute_type_id, attribute_category_id) VALUES
(1, 'Material', 'Cotton', 1, 1),
(2, 'Battery Life', '10', 2, 2),
(3, 'Waterproof', 'true', 3, 1);
