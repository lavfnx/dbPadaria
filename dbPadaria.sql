show databases;

create database dbPadaria;

use dbPadaria;

create table fornecedores (
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50) not null,
cnpjFornecedor varchar(20) not null,
telefoneFornecedor varchar(20),
emailFornecedor varchar(50) not null unique,
cep varchar(9),
enderecoFornecedor varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado varchar(2)
);

insert into fornecedores (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade, estado) values 
 ("Cláudio Souza", "27.601.792/0001-06", "(11) 78954-8903", "claudiosouza@gmail.com", 05890-005, "Rua Pedro Rivera", 135, "Jardim Iae", "São Paulo", "SP");
 
 select * from fornecedores;

create table produtos (
idProduto int primary key auto_increment,
nomeProduto varchar(50) not null,
descricaoProduto text,
precoProduto decimal(10,2) not null,
estoqueProduto int not null,
categoriaProduto enum ("Pães", "Bolos", "Confeitaria", "Salgados"),
idFornecedor int not null,
foreign key (idFornecedor) references fornecedores(idFornecedor)
);

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values
("Bolo de chocolate", "Bolo de chocolate confeitado, que leva cacau em pó em sua confecção.", 50.00, 5, "Bolos", 1);
insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values
("Pão de queijo", "Pão de queijo de consistência macia e elástica, composto por queijo mussarela e parmesão.", 5.00, 8, "Pães", 1);

select * from produtos where categoriaProduto = "Pães";

select * from produtos where precoProduto <50.00 order by precoProduto asc;


create table clientes (
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente char(14) not null unique,
telefoneCliente char(20),
emailCliente varchar(50) unique,
cep varchar(9) not null,
enderecoCliente varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado varchar(2)
);

insert into clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values 
("Júlia Cardoso", "107.043.680-13", "(11) 34264-8546", "juliacardoso@gmail.com", 04696-180, "Rua Padre Fernando Pedreira de Castro", 685, "Jurubatuba", "São Paulo", "SP");

select * from clientes;

create table pedidos (
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum ("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes(idCliente)
);

insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);

select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table itensPedidos (
iditensPedidos int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references pedidos(idPedido),
idProduto int not null,
foreign key (idProduto) references produtos(idProduto),
quantidade int not null
);

select idPedido from pedidos;

insert into itensPedidos(idPedido, idProduto, quantidade) values (1, 2, 2);
insert into itensPedidos(idPedido, idProduto, quantidade) values (1, 1, 1);

