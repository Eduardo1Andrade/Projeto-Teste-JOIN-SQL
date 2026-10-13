-- criação de tabelas
CREATE TABLE cliente (
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	cidade VARCHAR(200) NOT NULL
);

CREATE TABLE pedido (
	id_pedido SERIAL PRIMARY KEY,
	nome_produto VARCHAR(200) NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	fk_id_cliente INTEGER REFERENCES cliente (id_cliente)
);

--apagar por erros
DROP TABLE pedido;
DROP TABLE cliente;

--checar o banco
SELECT * FROM pedido
SELECT * FROM cliente

--registros
INSERT INTO cliente
(nome, cidade) 
VALUES 
('Ana','Rio de Janeiro'),
('maria', 'Teresina'),
('Akita', 'Piri-piri'),
('Sandra','São Paulo'),
('Antonio','Onigashima'),
('luffy','Xique-Xique'),

INSERT INTO pedido
(nome_produto, preco, fk_id_cliente)
VALUES
('Mesa', 400.00 ,16),
('Teclado Mecânico', 189.90, 16),
('Mouse Sem Fio', 79.90, 17),
('Monitor LED 24 polegadas', 899.99, 18),
('Headset Gamer', 159.50, 19),
('Cadeira de Escritório', 549.00, 20);

-- Joins

SELECT cliente.nome, pedido.nome_produto
FROM cliente
INNER JOIN pedido
ON cliente.id_cliente = pedido.fk_id_cliente;

SELECT cliente.nome, pedido.nome_produto
FROM cliente
LEFT JOIN pedido
ON cliente.id_cliente = pedido.fk_id_cliente;


SELECT  pedido.nome_produto,cliente.nome
FROM pedido
RIGHT JOIN cliente
ON cliente.id_cliente = pedido.fk_id_cliente;


SELECT cliente.nome, pedido.nome_produto
FROM cliente
FULL OUTER JOIN pedido
ON cliente.id_cliente = pedido.fk_id_cliente;

SELECT cliente.nome, pedido.nome_produto
FROM cliente
CROSS JOIN pedido

SELECT
    p1.nome_produto AS produto_1,
    p2.nome_produto AS produto_2,
    p1.fk_id_cliente AS id_cliente
FROM pedido p1
INNER JOIN pedido p2
    ON p1.fk_id_cliente = p2.fk_id_cliente
    AND p1.id_pedido < p2.id_pedido;