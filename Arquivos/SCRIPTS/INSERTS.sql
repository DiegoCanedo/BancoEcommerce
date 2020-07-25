--SCRIPT CRIACAO DE REGISTROS 
--BANCO ECOMMERCE

PRAGMA foreign_keys = off;
BEGIN TRANSACTION;


INSERT INTO Usuario ( nome_usuario, email_usuario, cpf_usuario, data_nascimento) VALUES 
( 'Guilherme de Oliveira Teixeira','gteixeira14@yahoo.com.br', 12345678900, 27032020),
( 'Diego Gonçalves Duarte Canedo','diego.canedo86@gmail.com', 12345678901, 27032020),
( 'Leonardo Von Seehausen Lichtenberger','leo_seehausen@hotmail.com', 12345678902, 27032020),
( 'Ruan De Almeida Marques','ruanmarques.reng@gmail.com', 12345678903, 27032020),
( 'Raul Gabrich','SNPETT14@firjan.com.br', 12345678904, 27032020);


INSERT INTO Estado ( descricao_estado, sigla_estado ) VALUES
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'),
('Minas Gerais', 'MG'),
('Paraná', 'PR'),
('Santa Catarina', 'SC');


INSERT INTO Cidade (id_estado, descricao_cidade) VALUES
(1,'Petropolis'),
(1,'Teresópolis'),
(1,'Nova Friburgo'),
(1,'Três Rios'),
(1,'Resende');


INSERT INTO Bairro (id_cidade, descricao_bairro) VALUES
(1,'Quitandinha'),
(1,'Bingen'),
(1,'Centro'),
(1,'Alto da Serra'),
(1,'Itaipava');


INSERT INTO Endereco (id_bairro, descricao_endereco, cep) VALUES
(1, 'Rua 1 de maio', 25001001),
(2, 'Rua 2 de maio', 25001002),
(3, 'Rua 3 de maio', 25001003),
(4, 'Rua 4 de maio', 25001004),
(5, 'Rua 5 de maio', 25001005);


INSERT INTO Endereco_Usuario ( id_usuario, id_endereco, ultimo_endereco) VALUES 
( 1, 1, 1),
( 2, 1, 1),
( 3, 1, 1),
( 4, 1, 1),
( 5, 1, 1);

 
INSERT INTO Telefone ( id_usuario, ddd, numero) VALUES 
( 1, 24, 22001122),
( 2, 24, 22112233),
( 3, 24, 22223344),
( 4, 24, 22334455),
( 5, 24, 22445566);


INSERT INTO Categoria (nome_categoria, descricao_categoria, categoria_habilitado) VALUES
('Alimentos','Produtos alimenticios em geral',1),
('Eletronicos','Produtos eletronicos em geral',1),
('Brinquedos Infantis','Brinquedos para a criançada',1),
('Móveis','Móveis de diversos tipos e gostos',1),
('Brinquedos Adulto','Produtos alimenticios em geral',1);


INSERT INTO Produto (id_categoria, id_usuario, nome_produto, marca_produto, descricao_produto, url_imagem_produto, 
					  valor_unitario_produto) VALUES
(1,1,'Biscoito Negresco','Nestlé', 'Negresco Biscoito Recheado','https://qualquer.com.br/QUALQUER_BISCOITO.jpg', 2.99),
(1,1,'Biscoito Mabel', 'Mabel','Biscoito Rosquinha Leite Mabel Pacote 700g','https://qualquer.com.br/QUALQUER_BISCOITO_MABEL.jpg', 9.49),
(3,2,'Mesinha didática','Poliplac', 'Mesinha Didática Infantil Com Cadeiras','https://qualquer.com.br/QUALQUER_MESINHA.jpg', 120),
(4,3,'Armario de cozinha', 'DELANO','Armario planejado em MDF','https://qualquer.com.br/QUALQUER_ARMAIO.jpg', 2400.00),
(1,4,'Biscoito Negresco', 'Nestlé','Negresco Biscoito Recheado | Nestlé','https://qualquer.com.br/OUTRO_BISCOITO.jpg', 1.50);


INSERT INTO Estoque ( id_produto, data_de_fabricacao, data_de_validade, quantidade ) VALUES
(1, '01/01/2018', '27/12/2018', 10),
(2, '01/02/2018', '28/12/2018', 10),
(3, '01/03/2018', '29/12/2018', 10),
(4, '01/04/2018', '30/12/2018', 10),
(5, '01/05/2018', '31/12/2018', 10);

 
INSERT INTO Pedido ( id_usuario, data_pedido ) VALUES
(1, '01/01/2018'),
(2, '01/01/2018'),
(3, '01/01/2018'),
(4, '01/01/2018'),
(5, '01/01/2018');


INSERT INTO Pedido_Item (id_produto, id_pedido, quantidade) VALUES
(1,1,3),
(2,1,8),
(4,2,1),
(5,3,3),
(3,4,1);



--COMMIT;
--ROLLBACK;

 




