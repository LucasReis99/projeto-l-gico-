-- criação do bando de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null unique,
    Address varchar(30),
    constraint unique_cpf_client unique(CPF)
    ); 
    
alter table clients auto_increment=1;
alter table clients modify address varchar(100);

-- criar tabela product(
create table product(
idProduct int auto_increment primary key,
Pname varchar(10),
Classificação_kids bool default false,
Category enum('Eletrônico', 'Vestimento', 'Brinquedos','Alimentos', 'Móveis') not null,
Avaliação float default 0,
size varchar(10)
    ); 
   
-- criar tabela pagamentos   
create table payments(
idClient int,
idPayment int,
typePayment enum ('Boleto', 'Cartão','Dois Cartões'),
limitAvalible float,
primary key(idClient, idPayment)
);   
   
-- criar tabela pedido
create table orders(
		idOrder int auto_increment primary key,
		idOrderClient int,
		orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento', 
		orderDescription varchar (45),
		sendValue float default 10,
        paymentCash bool default false,
		constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
		-- todas as tabelas relacionadas estarão sendo atualizadas:
        on update cascade
); 

-- criar tabela estoque
create table productStorage(
		idProdStorage int auto_increment primary key,
		storageLocation varchar (245),
		quantity int default 0
);  

-- criar tabela fornecedor
create table supplier(
		idSupplier int auto_increment primary key,
		socialName varchar(245) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
        ); 
        
-- criar tabela vendedor/terceiro
create table seller(
        idSeller int auto_increment primary key,
        socialName varchar(245) not null,
        CNPJ char(15),
        CPF char(11),
        location varchar (245),
        contact char(11) not null,
        constraint unique_cpf_seller unique (CPF),
        constraint unique_cnpj_seller unique (CNPJ)
    ); 
    
create table productSeller(
    idPSeller int,
    idPproduct int,
	prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
	constraint fk_product_seller foreign key (idPSeller) references seller (idSeller),
    constraint fk_product_product foreign key (idPproduct) references product (idProduct)
    );
     
create table productOrder(
    idPOproduct int,
    idPOorder int,   
	poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
	primary key (idPOproduct, idPOorder),
	constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
    );
    
create table storageLocation(
    idLproduct int, 
    idLstorage int,   
	location varchar(245) not null,
	primary key (idLproduct, idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProdStorage)
    );
    
create table productSupplier(
    idPsSupplier int, 
    idPsProduct int,   
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier),
    constraint fk_product_supplier_product foreign key (idPsSupplier) references product (idProduct)
    );
    
    show tables;
    desc clients;
    desc product;
    desc productSupplier;
    
    show databases;
    use information_schema;
    show tables;
    desc table_constraints;
    desc referential_constraints;
    select * from referential_constraints;
    
    -- recuperação de todas as constraints que existem dentro do BD que acabaram de ser definidas. 
    select * from referential_constraints where constraint_schema = "ecommerce"; 
    
    show tables;
    use ecommerce; 
    show create table clients;
    desc clients;
    show columns from clients;
    
    -- idClient, Fname, Minit, Lname, CPF, Address
    
    INSERT INTO clients (Fname, Minit, Lname, Cpf, Address)
VALUES 
   ('Maria', 'M', 'Silva', '123456789', 'Rua dois 4, Centro'),
   ('Matheus', 'O', 'Pimentel', '987654321', 'Rua alameda 289, Centro'),
   ('Ricardo', 'F', 'Silva', '45678913', 'Av. vinha 109, Centro'),
   ('Julia', 'S', 'França', '789123456', 'Rua laranjeiras 861, Centro'),
   ('Roberta', 'G', 'Assis', '98745631', 'Av. koller 19, Centro'),
   ('Isabela', 'M', 'Cruz', '654789123', 'Rua das flores 28, Centro');

	
  select * from Clients;
   
    -- idProduct, Pname, classification_kids boolean, category('Eletrônico, 'Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
                     
INSERT INTO product (Pname, classificação_kids, category, avaliação, size) 
VALUES 
   ('Auricular', false, 'Eletrônico', '4', null),
   ('Barbie', true, 'Brinquedos', '3', null),  -- Corrigido de 'Briquedo' para 'Brinquedos'
   ('Body', true, 'Vestimento', '5', null),
   ('Microfone', false, 'Eletrônico', '4', null),
   ('Sofá', false, 'Móveis', '3', '3x57x80');

  select * from product;
 
 
 -- idOrder,idOrderClient, orderStatus,OrderDescription, sendValue, paymentCash
 insert into orders (idOrderClient, orderStatus,OrderDescription, sendValue, paymentCash) values
					(1, null, 'compra via aplicativo',null,1),
					(2, null, 'compra via aplicativo',50,0),
					(3, 'Confirmado',null,null,1),
					(4, null, 'compra via web site',150,0);                        
	select * from orders;
    
    insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values 
    (1,1,2,null),
    (2,1,1,null),
    (3,2,1,null);
    select * from productorder;
    
     insert into productStorage (storageLocation, quantity) values     
		('Rio de Janeiro',1000),
		('Rio de Janeiro',500),
		('São Paulo', 10),
		('São Paulo', 100),
		('São Paulo', 10),
		('Brasíli', 60);
select * from productStorage;
    
-- idLproduct, idLstorage, location 
insert into storageLocation (idLproduct, idLstorage, location) values 
		(1,2,'RJ'),
		(2,6,'GO');
    select * from storageLocation;
    
    -- idSupplier, SocialName,CNPJ,contact
    insert into supplier (SocialName, CNPJ,contact) values
			('Almeida e filhos', 123456789123456, '21985474'),
            ('Eletrônicos Silva', 854519649143457, '21985484'),
            ('Eletrônicos Valma', 934567893934695, '21975474');
     select * from supplier;
     
     
     