INSERT INTO
	clientes(id, nome, lealdade)
VALUES
	(DEFAULT, 'Georgia', 0)
RETURNING 
	*;
-----------------------------------
INSERT INTO
 	pedidos(status, cliente_id)
VALUES
	(
	'Recebido', (
		SELECT id FROM clientes 				
		WHERE clientes.nome = 'Georgia'
	)	
)
;
-----------------------------------
INSERT INTO
 	pedidos(status, cliente_id)
VALUES
('Recebido', (SELECT id FROM clientes WHERE clientes.nome = 'Georgia'));
-----------------------------------
INSERT INTO 
	produtos_pedidos(produto_id, pedido_id)
VALUES
((SELECT id FROM produtos WHERE produtos.nome = 'Big Serial'), 12),
((SELECT id FROM produtos WHERE produtos.nome = 'Varchapa'), 12),
((SELECT id FROM produtos WHERE produtos.nome = 'Fritas'), 12),
((SELECT id FROM produtos WHERE produtos.nome = 'Coca-Cola'), 12),
((SELECT id FROM produtos WHERE produtos.nome = 'Coca-Cola'), 12);
-----------------------------------
SELECT 
	*
FROM
	produtos_pedidos pp
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pr.id = pp.produto_id 
JOIN
	clientes c ON c.id = pe.cliente_id
WHERE
	c.nome = 'Georgia' 
;
-----------------------------------
SELECT
	COUNT(pp)*6
FROM
	produtos_pedidos pp
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN 
	produtos pr ON pr.id = pp.produto_id 
JOIN
	clientes c ON c.id = pe.cliente_id
WHERE 
  c.nome = 'Georgia'
;
-----------------------------------
DELETE FROM
  clientes
WHERE 
  nome = 'Marcelo';

