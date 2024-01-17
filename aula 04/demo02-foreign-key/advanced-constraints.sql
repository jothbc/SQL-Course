CREATE TABLE p3 (
    order_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
drop table p3;


CREATE TABLE p6 (
    idade INT CHECK (idade >= 18),
    nome VARCHAR(50)
);
drop table p6;