create database techplant;
use techplant;


create table login (
idLogin int primary key auto_increment,
nome varchar (40),
telefone char (14),
email varchar (40),
senha varchar (40),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa) 
) auto_increment = 10;

select * from empresa;
insert into login (nome, telefone, email, senha, fkEmpresa) values
					('Mateus Souza', '(11)92234-3595', 'mateus@sptech.school.com', 'mateus32', 20),
					('Yudi Martim', '(11)92123-1011', 'rodrigo@sptech.school', 'yudi22', 21),
					('Carlos Miguel', '(11)93030-8080', 'carlos@gmail.com', 'carlos23', 22),
					('Lucas Souza', '(11)94545-5060', 'souza@hotmail.com', 'souza225', 23),
					('Eduardo Silva', '(11)7789-4242', 'eduSilva@outlook.com', 'souza', 20),
					('Pedro Henrique', '(11)7070-3333', 'pedro@outlook.com', 'pedro711', 21),  
					('Tadeu de Lana', '(11)4321-2323', 'tadeu@hotmail.com', 'tadeu44', 22),  
					('Luis Pedro', '(11)7575-2525', 'luis@outlook.com', 'luis7421', 23);
                    

create table empresa (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (40)
) auto_increment = 20;


 insert into empresa (nomeEmpresa) values 
                     ('BRC'),
                     ('Plant'),
                     ('Tech'),
                     ('MISPLANT');



create table Fazenda ( 
idFazenda int primary key auto_increment,
nomeFz varchar (40),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
) auto_increment = 30;

insert into Fazenda (nomeFz, fkEmpresa) values 
               ('Futuro', 20 ),
               ('SDR Cana', 20),
               ('Ardcane', 21),
               ('Plant GDF', 21),
               ('Grupo tech', 22),    
               ('MIS Sudeste', 23),    
               ('Plante Futuro', 21),    
               ('Cana Tech', 22); 


create table lotefz (
idLoteFz int primary key auto_increment,
nomeLote varchar (30),
fkFazenda int,
foreign key (fkFazenda) references fazenda (idFazenda) 
) auto_increment = 40;

select * from fazenda;

insert into lotefz (nomeLote, fkFazenda) values 
              ('Lote 1', 30),
              ('Lote 2', 30),
              ('Lote 3', 31),
              ('Lote 4 ', 31),
			  ('Lote 5', 32),
			  ('Lote 6', 33),
			  ('Lote 7', 34),
			  ('Lote 8', 35),
			  ('Lote 9', 36),
			  ('Lote 10', 37),
			  ('Lote 11', 37);
              
			
create table sensor ( 
idSensor int primary key auto_increment,
nomeSensor varchar (40),
fkLoteFz int, 
foreign key (fkLoteFz) references loteFz (idLoteFz) 
) auto_increment = 50;

select * from sensor;
Insert into Sensor (nomeSensor, fkLoteFz) values 
         ('1S', 40),           
         ('2S', 40),          
         ('3S', 41),          
         ('4S', 42),
         ('5S', 42),
         ('6S', 43),
         ('8S', 44),
         ('9S', 45),
         ('10S', 45),
         ('11S', 46),
         ('12S', 47),
         ('14S', 48),
         ('15S', 49),
         ('16S', 49),
         ('17S', 50);

create table dadosSensor (
idDados int primary key auto_increment,
temperatura decimal (3,1),
umidade decimal (3,1),
hora time,
dataC date,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor) 
) auto_increment = 60;

select * from sensor;
Insert into dadosSensor (temperatura, umidade, hora, dataC, fkSensor) values
         (25.2, 80.5, '13:00', '2022-03-15', 50),
         (35.5, 80.2, '14:00', '2022-03-15', 51),                                        
         (30.1, 80.8, '15:00', '2022-04-20', 52),
         (33.4, 67.5, '16:00', '2022-04-20', 53),
         (29.9, 78.9, '17:00', '2022-04-20', 54),                                        
         (28.8, 42.3, '18:30', '2022-05-10', 55),
         (32.5, 70.5, '10:30', '2022-08-24', 56),
         (26.3, 81.2, '11:40', '2022-02-08', 57),
         (26.8, 68.3, '08:30', '2022-02-08', 58),
         (27.5, 70.1, '09:30', '2022-02-08', 58),
         (28.1, 60.5, '10:10', '2022-06-22', 59),
         (30.1, 70.5, '11:10', '2022-06-22', 59),
         (24.4, 63.1, '14:45', '2022-07-07', 60),
         (26.8, 72.1, '15:45', '2022-07-07', 60),
         (27.7, 55.4, '16:25', '2022-07-07', 61),
         (24.4, 63.1, '17:25', '2022-07-07', 61),
         (31.4, 80.2, '18:35', '2022-08-12', 62),
         (28.1, 78.8, '19:35', '2022-08-12', 62),
         (31.8, 85.3, '20:22', '2022-09-09', 63),
         (32.1, 83.3, '21:22', '2022-09-09', 63),
         (30.7, 77.7, '22:15', '2022-10-19', 64),
         (33.5, 81.2, '23:15', '2022-10-19', 64);
         
         drop database techplant;
         
 select Fazenda.nomeFz, loteFz.nomeLote, sensor.nomeSensor,  dadosSensor.Temperatura, dadosSensor.umidade from Sensor, dadosSensor,
 LoteFz, Fazenda where 
 fkSensor = idSensor and fkLoteFz = idLoteFz and fkFazenda = idFazenda;        
		
         
select * from login;
select * from empresa;
select * from fazenda;
select * from lotefz;
select * from sensor;
select * from dadosSensor;

-- Relação entre a tabela empresa e a tabela login 
select * from login, empresa where fkEmpresa = idEmpresa;

-- Relação entre tabela empresa e tabela fazenda
select * from empresa, fazenda where fkEmpresa = idEmpresa;

-- Relacão entre tabela fazenda e tabela lote
select * from fazenda, lotefz where fkFazenda = idFazenda;

-- Relação entre tabela lote e sensor 
select * from lotefz, sensor where fkLotefz = idLotefz;

-- Relação entre tabela sensor e os dados do sensor
select * from sensor, dadosSensor where fkSensor = idSensor;

-- Relação entre tabela empresa, fazenda e lote
select * from empresa, fazenda, lotefz where fkEmpresa = idEmpresa and fkFazenda = idFazenda; 

-- Relação entre lote, sensor e dadosSensor 
select * from lotefz, sensor, dadosSensor where fkLotefz = idLotefz and fkSensor = idSensor;  

-- Relação entre lote, sensor e dadosSensor, de um sensor específico 
select lotefz.nomeLote, sensor.nomeSensor, dadosSensor.temperatura, dadosSensor.umidade, dadosSensor.hora, dadosSensor.dataC from lotefz, sensor, dadosSensor
 where fkLotefz = idLotefz and fkSensor = idSensor and nomeSensor = '10S'; 
 


 