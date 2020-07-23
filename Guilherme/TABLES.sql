CREATE TABLE Usuario ( 
id_usuario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
nome_usuario TEXT(100) NOT NULL, 
email_usuario TEXT(100) NOT NULL, 
cpf_usuario INTEGER(11) NOT NULL, 
data_nascimento DATE NOT NULL
);
 

CREATE TABLE EnderecoUsuario (
id_endereco_usuario INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_usuario INTEGER NOT NULL,
id_endereco INTEGER NOT NULL,
ultimo_endereco INTEGER(1) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);


CREATE TABLE Telefone (
id_telefone INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
id_usuario INTEGER NOT NULL,
ddd INTEGER(2) NOT NULL,
numero INTEGER(9) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);