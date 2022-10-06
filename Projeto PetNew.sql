CREATE DATABASE projetopet;

CREATE TABLE clientes(
id TINYINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome_cliente VARCHAR (60) NOT NULL,
cpf_cliente BIGINT NOT NULL,
telefone_cliente VARCHAR (20) NOT NULL,
endereco_cliente VARCHAR (60) NOT NULL,
bairro_cliente VARCHAR (25),
email_cliente VARCHAR (60) NOT NULL,
senha_cliente VARCHAR (20) NOT NULL
);

CREATE TABLE animais(
id TINYINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome_animal VARCHAR (30) NOT NULL,
idade_animal TINYINT NOT NULL,
id_cliente TINYINT NOT NULL,
especie_animal VARCHAR (20) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

CREATE TABLE pedidos(
id SMALLINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
qtd_item TINYINT NOT NULL,
item_pedido VARCHAR (40) NOT NULL,
valor_pedido DECIMAL(6,2),
data_pedido DATETIME NOT NULL,
id_cliente TINYINT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes (id) 
);

CREATE TABLE produtos(
id SMALLINT auto_increment NOT NULL PRIMARY KEY,
nome_produto VARCHAR (30) NOT NULL,
descricao_produto VARCHAR (100) NOT NULL,
valor_unitaniro DECIMAL(6,2)
);
alter table produtos change valor_unitaniro valor_unitario Decimal(6,2);

CREATE TABLE fornecedores(
id SMALLINT auto_increment NOT NULL PRIMARY KEY,
cnpj_fornecedor BIGINT NOT NULL,
nome_empresa VARCHAR (30) NOT NULL,
telefone_fornecedor VARCHAR (20) NOT NULL,
endereco_fornecedor VARCHAR (60) NOT NULL
);

CREATE TABLE item_pedidos(
id SMALLINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
qtd_itens TINYINT NOT NULL,
valor_parcial DECIMAL(8,2),
id_produtos SMALLINT NOT NULL,
id_pedidos SMALLINT NOT NULL,
FOREIGN KEY (id_produtos) REFERENCES produtos (id),
FOREIGN KEY (id_pedidos) REFERENCES pedidos (id)  
);

CREATE TABLE entregadores(
id TINYINT auto_increment not NULL PRIMARY KEY,
nome_entregador VARCHAR (60) NOT NULL,
telefone_entregador VARCHAR (20),
id_pedidos SMALLINT NOT NULL,
FOREIGN KEY (id_pedidos) REFERENCES pedidos (id)
);


CREATE TABLE fornecimentos(
data_fornecido DATETIME NOT NULL,
qntd_produto TINYINT NOT NULL,
id_produtos SMALLINT  NOT NULL,
id_fornecedores SMALLINT NOT NULL,
FOREIGN KEY (id_produtos) REFERENCES produtos (id),
FOREIGN KEY (id_fornecedores) REFERENCES fornecedores (id) 
);

alter table fornecimentos add column id_fornecimentos TINYINT auto_increment primary key not null;

ALTER TABLE fornecimentos
CHANGE id_fornecimentos id tinyint auto_increment;

