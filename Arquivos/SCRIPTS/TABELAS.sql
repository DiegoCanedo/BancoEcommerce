--SCRIPT CRIACAO DE TABELAS 
--BANCO ECOMMERCE

--BEGIN TRANSACTION;

DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario ( 
id_usuario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
nome_usuario TEXT(100) NOT NULL, email_usuario TEXT(100) NOT NULL, 
cpf_usuario INTEGER(11) NOT NULL, data_nascimento TEXT(10)
);

DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado (
id_estado INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
descricao_estado TEXT(20) NOT NULL,
sigla_estado TEXT(2) NOT NULL
);

DROP TABLE IF EXISTS Cidade;
CREATE TABLE Cidade (
    id_cidade INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    id_estado INTEGER NOT NULL,
    descricao_cidade TEXT(100) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

DROP TABLE IF EXISTS Bairro;
CREATE TABLE Bairro (
    id_bairro INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    id_cidade INTEGER NOT NULL,
    descricao_bairro TEXT(100) NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES Cidade(id_cidade)
);

DROP TABLE IF EXISTS Endereco;
CREATE TABLE Endereco (
    id_endereco INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    id_bairro INTEGER NOT NULL,
    descricao_endereco TEXT(100) NOT NULL,
    cep INTEGER (100) NOT NULL,
    FOREIGN KEY (id_bairro) REFERENCES Bairro(id_bairro)
);

DROP TABLE IF EXISTS Endereco_Usuario;
CREATE TABLE Endereco_Usuario (
id_endereco_usuario INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_usuario INTEGER NOT NULL,
id_endereco INTEGER NOT NULL,
ultimo_endereco INTEGER(1) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

DROP TABLE IF EXISTS Telefone;
CREATE TABLE Telefone (
id_telefone INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_usuario INTEGER NOT NULL,
ddd INTEGER(2) NOT NULL,
numero INTEGER(9) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

DROP TABLE IF EXISTS Categoria; 
CREATE TABLE Categoria (
id_categoria INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
nome_categoria TEXT(100),
descricao_categoria TEXT(200),
categoria_habilitado INTEGER(1)
);

DROP TABLE IF EXISTS Produto;
CREATE TABLE Produto (
id_produto INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_categoria INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
nome_produto TEXT(150) NOT NULL,
marca_produto TEXT(50),
descricao_produto TEXT(200),
url_imagem_produto TEXT,
valor_unitario_produto INTEGER,
FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria),
FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

DROP TABLE IF EXISTS Estoque;
CREATE TABLE Estoque (
id_estoque INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_produto INTEGER NOT NULL,
data_de_fabricacao TEXT(10),
data_de_validade TEXT(10),
quantidade TEXT(100) NOT NULL,
FOREIGN KEY(id_produto) REFERENCES Produto(id_produto)
);

DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido (
id_pedido INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_usuario INTEGER NOT NULL,
data_pedido TEXT (10) NOT NULL,
FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

DROP TABLE IF EXISTS Pedido_Item;
CREATE TABLE Pedido_Item (
id_pedido_item INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_produto INTEGER NOT NULL,
id_pedido INTEGER NOT NULL,
quantidade INTEGER NOT NULL,
FOREIGN KEY(id_produto) REFERENCES Produto(id_produto),
FOREIGN KEY(id_pedido) REFERENCES Pedido(id_pedido)
);


-- VIEW | vw_valor_total_pedido
DROP VIEW IF EXISTS vw_valor_total_pedido;
CREATE VIEW vw_valor_total_pedido
AS 
SELECT 
	(SUM(prod.valor_unitario_produto) *  pi.quantidade) as total, 
	p.id_pedido 
FROM Produto prod 
INNER JOIN Pedido_Item pi on pi.id_produto  = prod.id_produto
INNER JOIN Pedido p on pi.id_pedido = p.id_pedido 
GROUP BY p.id_pedido;


-- VIEW | vw_endereco source
DROP VIEW IF EXISTS vw_endereco;
CREATE VIEW vw_endereco 
AS 
SELECT 
	u.id_usuario,
	(e.descricao_endereco || ', ' || b.descricao_bairro || ', ' || c.descricao_cidade 
	|| ', ' || e2.descricao_estado || ' - ' || e2.sigla_estado ) as Endereco_Vendedor
FROM Usuario u 
INNER JOIN Endereco_Usuario eu on eu.id_usuario = u.id_usuario 
INNER JOIN Endereco e on e.id_endereco = eu.id_endereco 
INNER JOIN Bairro b on b.id_bairro = e.id_bairro 
INNER JOIN Cidade c on c.id_cidade = b.id_cidade 
INNER JOIN Estado e2 on e2.id_estado = c.id_estado
WHERE eu.ultimo_endereco = 1;


--COMMIT;


 



