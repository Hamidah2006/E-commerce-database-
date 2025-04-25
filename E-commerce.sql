--create table brand
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

--create table product_category
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

--create table color
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100) NOT NULL
);

--create table size_category
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

--create table size_option
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_value VARCHAR(50) NOT NULL,
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

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

--create table product_image
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT,
    image_url VARCHAR(500) NOT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id)
);

--create table product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

--create table attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

--create table attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL
);

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
