

--SCRIPT CRIACAO DE TABELAS 
--BANCO ECOMMERCE

DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario ( 
id_usuario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
nome_usuario TEXT(100) NOT NULL, email_usuario TEXT(100) NOT NULL, 
cpf_usuario INTEGER(11) NOT NULL, data_nascimento TEXT(10)
);

CREATE TABLE Estado (
id_estado INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
descricao_estado TEXT (20) NOT NULL,
);

CREATE TABLE Cidade (
    id_cidade INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    descricao_cidade TEXT(100) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

CREATE TABLE Bairro (
    id_bairro INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    descricao_bairro TEXT(100) NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES Cidade(id_cidade)
);

CREATE TABLE Endereco (
    id_endereco INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
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
descricao_produto TEXT(200),
valor_unitario_produto INTEGER,
FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria),
FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Estoque (
id_estoque INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_produto INTEGER NOT NULL,
data_de_fabricacao TEXT(10),
data_de_validade TEXT(10),
quantidade TEXT(100) NOT NULL,
FOREIGN KEY(id_produto) REFERENCES Produto(id_produto)
);

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



 



