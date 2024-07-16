CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(15)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
