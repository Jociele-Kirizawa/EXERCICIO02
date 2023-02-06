CREATE DATABASE banco;
USE banco;

CREATE TABLE cliente(
id_cliente INT NOT NULL IDENTITY (1,1),
nome_cliente VARCHAR (30) NOT NULL,
sobrenome_cliente VARCHAR (100) NOT NULL,
endereco_cliente VARCHAR (100) NOT NULL,
cidade_cliente VARCHAR(40) NULL, 
cep_cliente VARCHAR(10) NULL, 
uf_cliente CHAR(2) NULL,
telefone_cliente VARCHAR (20) NOT NULL,
email_cliente VARCHAR (30) NOT NULL,
CONSTRAINT PK_id_cli PRIMARY KEY (id_cliente)

);
CREATE TABLE funcionario(
id_funcionario INT NOT NULL IDENTITY (1,1),
id_cliente INT NOT NULL,
nome_funcionario VARCHAR (30) NOT NULL,
sobrenome_funcionario VARCHAR (100) NOT NULL,
setor_funcionario VARCHAR (20) NOT NULL,
gestor VARCHAR (50) NOT NULL,
data_admissao DATE NOT NULL,
CONSTRAINT PK_id_func PRIMARY KEY (id_funcionario),
CONSTRAINT FK_id_cli FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente),
);

CREATE TABLE ligacao(
id_ligacao INT NOT NULL IDENTITY (1,1),
id_funcionario INT NOT NULL,
id_cliente INT NOT NULL,
data_ligacao DATE NOT NULL,
reclamacao VARCHAR (200) NOT NULL,
problemas VARCHAR (200) NOT NULL,
duvidas VARCHAR (200) NOT NULL,

CONSTRAINT PK_id_lig PRIMARY KEY (id_ligacao),
CONSTRAINT FK_id_cli_lig FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente),
CONSTRAINT FK_id_func_lig FOREIGN KEY (id_funcionario)
		REFERENCES funcionario (id_funcionario),

);

CREATE TABLE num_ligacao(
num_ligacao INT NOT NULL IDENTITY (1,1),
id_ligacao INT NOT NULL,
id_cliente INT NOT NULL,
CONSTRAINT PK_num_lig PRIMARY KEY (num_ligacao),
CONSTRAINT FK_id_cli_num FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente),
CONSTRAINT FK_id_ligacao FOREIGN KEY (id_ligacao)
		REFERENCES ligacao (id_ligacao),

);