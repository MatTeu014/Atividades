show databases;
create database hospital;
use hospital;
show tables;
drop database hospital;



-- TABELA PACIENTE --
create table paciente(idpaci int(4) auto_increment primary key, nomepaci varchar(30), idtratFK int(4), iddiagFK int(4), idfunFK int(3), constraint pacientetratamento foreign key paciente(idtratFK) references tratamento(idtrat), constraint pacientediagnostico foreign key paciente(iddiagFK) references diagnostico(iddiag), constraint pacientefuncionario foreign key paciente(idfunFK) references funcionario(idfun));
desc paciente;
insert into paciente values(null, "Jose", 1, 2, 2);
insert into paciente values(null, "Jonas", 5, 5, 1);
insert into paciente values(null, "Irineu", 2, 4, 2);
insert into paciente values(null, "Isabela", 3, 1, 4);
insert into paciente values(null, "Mariana", 4, 3, 6);
select * from paciente;



-- TABELA DIAGNOSTICO --
create table diagnostico(iddiag int(4) auto_increment primary key, pesodiag decimal(6,2), alturadiag decimal(4,2), condicaodiag varchar(30));
desc diagnostico;
insert into diagnostico values(null,55,1.65,"Tosse");
insert into diagnostico values(null,48,1.58,"Pressão alta");
insert into diagnostico values(null,75,1.72,"Febre");
insert into diagnostico values(null,80,1.70,"Dores nas pernas");
insert into diagnostico values(null,45,1.68,"Dor na coluna");
select * from diagnostico;



-- TABELA FUNCIONARIO --
create table funcionario(idfun int(3) auto_increment primary key, nomefun varchar(20), cpffun varchar(15), cargofun varchar(20));
desc funcionario;
insert into funcionario values(null,"Roberto Calos","321.769.352-45","doutor");
insert into funcionario values(null,"Robison Jose","892.678.532-56","enfermeiro");
insert into funcionario values(null,"Emanoel Tulio","108.790.576-30","recepicionista");
insert into funcionario values(null,"Maria Passos","213.450.790-40","enfermeira");
insert into funcionario values(null,"Josefina Azevedo","213.456.321-21","recepicionista");
insert into funcionario values(null,"Claudia Barros","145.782.890-80","doutora");
select * from funcionario;



-- TABELA SALA --
create table sala(idsala int(3), equipamentosala varchar(20), idpaciFK int(4), idfunFK int(3), constraint salapaciente foreign key sala(idpaciFK) references paciente(idpaci), constraint salafuncionario foreign key sala(idfunFK) references funcionario(idfun));
desc sala;
insert into sala values(1, "Ultrassom", 2, 1);
insert into sala values(1, "Monitor Cardiaco", 5, 6);
insert into sala values(2,"Monitor Cardiaco", 4, 4);
insert into sala values(2,"Maca", 3, 2);
insert into sala values(2, "Tripe para soro", 1, 2);
select * from sala;


-- TABELA TRATAMENTO --
create table tratamento(idtrat int(4) auto_increment primary key, idremedFK int(4), fimtrat date, resultadotrat char(8), constraint tratamentoremedio foreign key tratamento(idremedFK) references remedio(idremed));
desc tratamento;
insert into tratamento values(null, 3, "2024-09-21", "positivo");
insert into tratamento values(null, 4, "2024-08-19", "positivo");
insert into tratamento values(null, 2, "2024-07-20", "positivo");
insert into tratamento values(null, 1, "2024-10-13", "negativo");
insert into tratamento values(null, 4, "2024-06-2", "negativo");
select * from tratamento;


-- TABELA REMEDIO --
create table remedio(idremed int(4) auto_increment primary key, nomeremed varchar(30), funcaoremed varchar(20), tarjaremed varchar(8), precoremed decimal(6,2));
desc remedio;
insert into remedio values(null,"paracetamol","febre","amarela", 8.99);
insert into remedio values(null,"acetilcisteina","tosse","amarela", 26.20);
insert into remedio values(null,"furosemida","pressão alta","vermelha", 3.97);
insert into remedio values(null,"ciclobenzaprina","dor","vermelha", 13.99);
select * from remedio;


-- Exercicio 1. Mostrando todo o conteúdo --

select * from paciente;
select * from diagnostico;
select * from funcionario;
select * from sala;
select * from tratamento;
select * from remedio;


-- Exercico 2. Filtragem por período de data --

select * from tratamento where fimtrat like "2024-06%";
select * from tratamento where fimtrat between date("2024-06-01") and date("2024-08-30");
 
 
 -- Exercicio 3. Filtragem por valores maiores --
 
select * from remedio order by precoremed desc;
select max(remedio.precoremed) as "PrecoRemedio" from remedio order by precoremed;


-- Exercicio 4. Filtragem por adição de valores --

select sum(remedio.precoremed) as "Total" from remedio;
select sum(remedio.precoremed) as "Total" from remedio where precoremed > 10;

-- Exercicio 5. Filtragem entre tabelas --

select * from remedio inner join tratamento on remedio.idremed = tratamento.idremedFK order by remedio.idremed;
select * from diagnostico inner join paciente on diagnostico.iddiag = paciente.iddiagFK order by diagnostico.iddiag;

-- Exercicio 6. Filtrando campos de texto -- 

select * from remedio where tarjaremed like "ama%";
select * from funcionario where cargofun like "dout%";






