SELECT 
	pedidos.id,
	pedidos.status,
	pedidos.cliente_id,
	produtos.id,
	produtos.nome,
	produtos.tipo,
	produtos.preço,
	produtos.pts_de_lealdade
FROM
	pedidos
INNER JOIN
	produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN
	produtos ON produtos.id = produtos_pedidos.produto_id;
----------------------------------------------------------------
SELECT
	pedidos.id
FROM
	pedidos
JOIN
	produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
JOIN 
	produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
	produtos.nome = 'Fritas';
----------------------------------------------------------------
SELECT
	c.nome gostam_de_fritas
FROM
	produtos_pedidos pp
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pr.id = pp.produto_id 
JOIN
	clientes c ON c.id = pe.cliente_id
WHERE
	pr.nome = 'Fritas';
----------------------------------------------------------------
SELECT
	SUM(pr.preço) AS SOMA
FROM
	produtos_pedidos pp
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pr.id = pp.produto_id 
JOIN
	clientes c ON c.id = pe.cliente_id
WHERE
	c.nome = 'Paula';
----------------------------------------------------------------
SELECT
	count(*) unidades, nome 
FROM
	produtos_pedidos pp
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pr.id = pp.produto_id
GROUP BY nome
ORDER BY nome ASC
;