-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE acquatec;

USE acquatec;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DOUBLE,
	umidade DOUBLE,
	momento DATETIME,
	fk_aquario INT
);




/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DOUBLE,
	umidade DOUBLE,
	momento DATETIME,
	fk_aquario INT
);  

reate database techplant;
use techplant;


create table login1 (
idLogin int primary key IDENTITY(1,1),
nome varchar (40),
email varchar (40),
senha varchar (40),
confirmar varchar (40),
empresa varchar(40),
tel char (15),
fkEmpresa INT FOREIGN KEY REFERENCES empresa (idEmpresa)
);
create table empresa (
idEmpresa int primary key IDENTITY(1,1),
nomeEmpresa varchar (40)
);
create table Fazenda ( 
idFazenda int primary key IDENTITY(1,1),
nomeFz varchar (40),
fkEmpresa INT FOREIGN KEY REFERENCES empresa (idEmpresa),
) auto_increment = 30;
 
create table lotefz (
idLoteFz int primary key IDENTITY(1,1),
nomeLote varchar (30),
fkFazenda INT FOREIGN KEY REFERENCES fazenda (idFazenda)
);

create table sensor ( 
idSensor int primary key IDENTITY(1,1),
nomeSensor varchar (40),
fkLoteFz INT FOREIGN KEY REFERENCES loteFz (idLoteFz), 
);

create table dadosSensor (
idDados int primary key IDENTITY(1,1),
temperatura decimal (3,1),
umidade decimal (3,1),
hora time,
dataC date,
fkSensor INT FOREIGN KEY REFERENCES Sensor (idSensor),
);
