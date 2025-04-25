# E-commerce Platform Database Design

This project contains the Entity-Relationship Diagram (ERD) and SQL schema design for a comprehensive e-commerce platform database.

## Project Structure

- **ERD Diagram:** A visual representation of all entities, their attributes, and relationships.
- **SQL File:** `ecommerce.sql` includes the creation of all tables required for the e-commerce platform.

## Tables Included

1. **brand** – Stores brand names
2. **product_category** – Categorizes products (e.g., clothing, electronics)
3. **color** – Stores available colors
4. **size_category** – Groups size options (e.g., clothing, shoe sizes)
5. **size_option** – Stores size values (e.g., S, M, L, 42)
6. **product** – Main product data (name, base price, brand, category)
7. **product_item** – Represents specific variations (color, size)
8. **product_image** – Stores product images for each item
9. **product_variation** – Stores named variations (e.g., Red-Large)
10. **attribute_category** – Groups custom attributes (e.g., physical, technical)
11. **attribute_type** – Data types for attributes (e.g., text, number, boolean)
12. **product_attribute** – Custom attributes for products (e.g., material, weight)
