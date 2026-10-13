
# Explicando Joins
## INNER JOIN
1. o que é: retorna registros comuns a 2 tabelas
2. quando é usado: apenas em registros que possuam relação nas duas tabelas
3. utiliza a condição definida em `ON` para comparar os registros. Se não houver correspondência, o registro não aparece no resultado.
4. `SELECT cliente.nome, pedido.nome_produto`
	`FROM cliente`
	`INNER JOIN pedido`
    `ON cliente.id_cliente = pedido.fk_id_cliente;` 

## LEFT JOIN
1. o que é : retorna todos os registros da tabela à esquerda do comando e os registros correspondentes da tabela à direita.
2. Quando deve ser utilizado: quando é necessário manter todos os registros da tabela principal, mesmo que não exista correspondência na outra tabela
3. como funciona :retorna todos os registros da tabela à esquerda, preenchendo com `NULL` os dados ausentes da tabela à direita.
4. 
`SELECT cliente.nome, pedido.nome_produto`
`FROM cliente`
`LEFT JOIN pedido`
`ON cliente.id_cliente = pedido.fk_id_cliente;`

## RIGHT JOIN
1. O que é: retorna todos os registros da tabela à direita do comando e os registros correspondentes da tabela à esquerda.
2. Quando deve ser utilizado: quando é necessário manter todos os registros da tabela à direita, mesmo que não tenham correspondência na tabela à esquerda.
3. 
`SELECT  pedido.nome_produto,cliente.nome`
`FROM pedido`
`RIGHT JOIN cliente`
`ON cliente.id_cliente = pedido.fk_id_cliente;`

## FULL OUTER JOIN
1. O que é: retorna todos os registros das duas tabelas, combinando aqueles que possuem correspondência e mantendo também os que não possuem.
2. Quando deve ser utilizado: quando se deseja identificar tanto as correspondências quanto os registros sem relacionamento em qualquer uma das tabelas.
3. 
`SELECT cliente.nome, pedido.nome_produto`
`FROM cliente`
`FULL OUTER JOIN pedido`
`ON cliente.id_cliente = pedido.fk_id_cliente;`

## CROSS JOIN
1. O que é: combina cada registro da primeira tabela com todos os registros da segunda, formando o produto cartesiano.
2. como funciona: não exige uma condição de relacionamento entre as tabelas. O número de linhas resultantes é o produto da quantidade de linhas das duas tabelas.
3. 
`SELECT cliente.nome, pedido.nome_produto`
`FROM cliente`
`CROSS JOIN pedido`

## SELF JOIN 
1. O que é: consiste em combinar uma tabela com ela mesma, utilizando aliases para diferenciar as duas referências à mesma tabela.
2. Quando pode ser utilizado: em situações nas quais registros de uma tabela possuem relações com outros registros da própria tabela, como funcionários e seus gerentes, categorias e subcategorias ou hierarquias organizacionais.
3. 
`SELECT`
    `p1.nome_produto AS produto_1,`
    `p2.nome_produto AS produto_2,`
    `p1.fk_id_cliente AS id_cliente`
`FROM pedido p1`
`INNER JOIN pedido p2`
    `ON p1.fk_id_cliente = p2.fk_id_cliente`
    `AND p1.id_pedido < p2.id_pedido;`


* cada resultado está respectivamente ligado em Results