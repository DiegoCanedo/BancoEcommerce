

INSERT INTO Usuario ( nome_usuario, email_usuario, cpf_usuario, data_nascimento) VALUES 
( 'Guilherme de Oliveira Teixeira','gteixeira14@yahoo.com.br', 12345678900, 27032020),
( 'Diego Gonçalves Duarte Canedo','diego.canedo86@gmail.com', 12345678901, 27032020),
( 'Leonardo Von Seehausen Lichtenberger','leo_seehausen@hotmail.com', 12345678902, 27032020),
( 'Ruan De Almeida Marques','ruanmarques.reng@gmail.com', 12345678903, 27032020),
( 'Raul Gabrich','SNPETT14@firjan.com.br', 12345678904, 27032020);


INSERT INTO Estado ( drescricao_estado ) VALUES
('Rio de Janeiro')
('São Paulo')
('Minas Gerais')
('Paraná')
('Santa Catarina');


INSERT INTO Cidade (id_estado, descricao_cidade) VALUES
(1,'Petropolis')
(2,'Teresópolis')
(3,'Nova Friburgo')
(4,'Três Rios')
(5,'Resende');


INSERT INTO Bairro (id_cidade, descricao_bairro) VALUES
(1,'Quitandinha')
(2,'Bingen')
(3,'Centro')
(4,'Alto da Serra')
(5,'Itaipava');


INSERT INTO Endereco (id_bairro, descricao_endereco, cep) VALUES
(1, 'Rua 1 de maio', 25001001)
(2, 'Rua 2 de maio', 25001002)
(3, 'Rua 3 de maio', 25001003)
(4, 'Rua 4 de maio', 25001004)
(5, 'Rua 5 de maio', 25001005);


INSERT INTO EnderecoUsuario ( id_usuario, id_endereco, ultimo_endereco) VALUES 
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
('Alimentos','Produtos alimenticios em geral',1)
('Eletronicos','Produtos eletronicos em geral',1)
('Brinquedos Infantis','Brinquedos para a criançada',1)
('Móveis','Móveis de diversos tipos e gostos',1)
('Brinquedos Adulto','Produtos alimenticios em geral',0);


INSERT INTO Produto (id_categoria, id_usuario, nome_produto, marca_produto, url_imagem_produto, 
					 descricao_produto, valor_unitario_produto) VALUES
(1,1,'Biscoito Negresco', 'Negresco Biscoito Recheado','Nestlé','https://qualquer.com.br/QUALQUER_BISCOITO.jpg', 2.99)
(1,1,'Biscoito Mabel', 'Biscoito Rosquinha Leite Mabel Pacote 700g','Mabel','https://qualquer.com.br/QUALQUER_BISCOITO_MABEL.jpg', 9,49)
(3,2,'Mesinha didática', 'Mesinha Didática Infantil Com Cadeiras','Poliplac','https://qualquer.com.br/QUALQUER_MESINHA.jpg', 120)
(4,3,'Armario de cozinha', 'Armario planejado em MDF','DELANO','https://qualquer.com.br/QUALQUER_ARMAIO.jpg', 2400.00)
(1,4,'Biscoito Negresco', 'Negresco Biscoito Recheado | Nestlé','Nestlé','https://qualquer.com.br/OUTRO_BISCOITO.jpg', 1.50);


INSERT INTO Estoque ( id_produto, data_de_fabricacao, data_de_validade, quantidade ) VALUES
(1, 01/01/2018, 27/12/2018, 10)
(2, 01/02/2018, 28/12/2018, 10)
(3, 01/03/2018, 29/12/2018, 10)
(4, 01/04/2018, 30/12/2018, 10)
(5, 01/05/2018, 31/12/2018, 10);


INSERT INTO Pedido_Item (id_produto, id_pedido, quantidade) xVALUES
(1,1,3)
(2,1,8)
(4,2,1)
(5,3,3)
(3,4,1)



 

INSERT INTO Pedido ( id_usuario, data_pedido ) VALUES
(1, 01/01/2018)
(2, 01/02/2018)
(3, 01/03/2018)
(4, 01/04/2018)
(5, 01/05/2018)

 




