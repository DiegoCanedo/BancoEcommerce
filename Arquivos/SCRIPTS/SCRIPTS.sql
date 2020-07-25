
--EXCLUINDO INFORMACOES
DELETE FROM Telefone WHERE id_usuario = 5

SELECT * FROM Categoria c WHERE c.id_categoria = 5

--ATUALIZANDO INFORMACOES
UPDATE Categoria as c 
	SET nome_categoria = 'Brinquedos Adulto', descricao_categoria = 'Brinquedos para o publico adulto', categoria_habilitado = 0
WHERE c.id_categoria = 5

-- VERIFICA TODOS OS PRODUTOS EM ESTOQUE DO USUARIO
SELECT u.nome_usuario ,p.nome_produto , e.id_estoque FROM Usuario u 
LEFT JOIN Produto p on u.id_usuario = p.id_usuario
LEFT JOIN Estoque e on e.id_produto = p.id_produto 
WHERE u.id_usuario  = 5


-- COMPRAS POR CATEGORIA
SELECT c.nome_categoria as Nome_Categoria, 'R$ '|| SUM(p.valor_unitario_produto) as Valor_Unitario, 
pi.quantidade as Quantidade, 'R$ '|| (SUM(p.valor_unitario_produto) *  pi.quantidade) as Total 
FROM Produto p 
INNER JOIN Pedido_Item pi on pi.id_produto  = p.id_produto
INNER JOIN Categoria c on c.id_categoria  = p.id_categoria 
GROUP BY Nome_Categoria
ORDER BY Nome_Categoria DESC

--TOTAL VENDAS
select sum(T1.total) FROM (
SELECT (SUM(p.valor_unitario_produto) *  pi.quantidade) as total
FROM Produto p 
INNER JOIN Pedido_Item pi on pi.id_produto  = p.id_produto
GROUP BY p.id_produto) as T1

--PESQUISA DE VENDA POR ESTADO
SELECT e2.descricao_estado, COUNT(u.id_usuario) 
FROM Usuario u
INNER JOIN Pedido p on p.id_usuario = u.id_usuario 
INNER JOIN Endereco_Usuario eu on eu.id_usuario = u.id_usuario 
INNER JOIN Endereco e on e.id_endereco = eu.id_endereco 
INNER JOIN Bairro b on b.id_bairro = e.id_bairro 
INNER JOIN Cidade c on c.id_cidade = b.id_cidade 
INNER JOIN Estado e2 on e2.id_estado = c.id_estado 
GROUP BY e2.sigla_estado 


--INFORMACOES SOBRE A NOTA FISCAL
--vendedor (nome, endereco)
--comprador (nome, endereco) 
--valor total, valor unitario
-- descricao do item
-- quantidade 

--blldd
SELECT 
	
(SELECT nome_usuario from Usuario u2 where u2.id_usuario = prod.id_usuario) as Nome_Vendedor,
(SELECT cpf_usuario from Usuario u2 where u2.id_usuario = prod.id_usuario) as CPF_Vendedor,
(SELECT Endereco_Vendedor FROM vw_endereco wv WHERE wv.id_usuario = prod.id_usuario LIMIT 1) as Endereco_Vendedor,
(SELECT nome_usuario from Usuario u2 where u2.id_usuario = p.id_usuario) as Nome_Comprador,
(SELECT cpf_usuario from Usuario u2 where u2.id_usuario = prod.id_usuario) as CPF_Comprador,
(SELECT Endereco_Vendedor FROM vw_endereco wv WHERE wv.id_usuario = p.id_usuario LIMIT 1) as Endereco_Comprador,	
	prod.nome_produto as Produto,
	count(pi.quantidade) as Quantidade,
	prod.valor_unitario_produto as Valor_Unitario,
(SELECT Total FROM vw_valor_total_pedido as vw_total where vw_total.id_pedido = p.id_pedido) as Total
	FROM Pedido_Item pi 
	INNER JOIN Produto prod on pi.id_produto = prod.id_produto 
	INNER JOIN Pedido p on p.id_pedido = pi.id_pedido 
	INNER JOIN Usuario u on u.id_usuario = p.id_usuario 
WHERE p.id_pedido = 2
GROUP BY pi.id_produto, pi.quantidade 




  


   



	



















