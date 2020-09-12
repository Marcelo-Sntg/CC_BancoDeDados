/*Exercício 01*/
create database exercicioInnerJoin;

/*Exercício 02*/ 
use exercicioInnerJoin;
create table cliente(
	cpf int unique not null primary key,
    nome varchar(60) not null,
    dtNasc date not null
);
create table modelo(
	codMod int unique not null primary key,
    desc_2 varchar(40) not null
);
create table patio(
	num int unique not null primary key,
    ender varchar(40) not null,
    capacidade int not null
);
create table veiculo(
	placa varchar(8) unique not null primary key,
    modelo_codMod int not null,
    cliente_cpf int not null,
    cor varchar(20) not null,
    foreign key(modelo_codMod) references modelo(codMod),
    foreign key(cliente_cpf) references cliente(cpf)
);
create table estaciona(
	cod int unique not null primary key,
    patio_num int not null,
    veiculo_placa varchar(8) not null,
    dtEntrada date not null,
    dtSaida date not null,
    hsEntrada varchar(10),
    hsSaida varchar(10),
    foreign key(patio_num) references patio(num), 
    foreign key(veiculo_placa) references veiculo(placa)
);

/*Exercício 03*/
select v.placa, c.nome from veiculo v inner join cliente c on v.cliente_cpf = c.cpf;

/*Exercício 04*/
select c.cpf, c.nome from veiculo v inner join cliente c on v.cliente_cpf = c.cpf and v.placa = 'jjj-2020';

/*Exercício 05*/ 
select v.placa, v.cor from veiculo v inner join estaciona e on v.placa = e.veiculo_placa and e.cod=1;

/*Exercício 06*/ -- ERRO 
select p.ender, e.dtEntrada, e.dtSaida from estaciona e inner join patio p
inner join veiculo v on 
v.placa = "JEG-1010" and e.veiculo_placa = v.placa;

/*Exercício 07*/
select count(v.placa) as quantidade from veiculo v inner join estaciona e on
v.placa = e.veiculo_placa and v.cor='verde';

/*Exercício 08*/
select c.nome from cliente c inner join veiculo v on
c.cpf = v.cliente_cpf and v.modelo_codMod =1;

/*Exercício 09*/
select * from  veiculo;
select v.placa, e.hsEntrada, e.hsSaida from veiculo v inner join  estaciona e on
v.cor="verde" and e.veiculo_placa = v.placa;

/*Exercício 10*/
select e.* from estaciona e inner join veiculo v on
e.veiculo_placa = v.placa and v.placa = "JJJ-2020";

/*Exercício 11*/
select c.nome from veiculo v inner join cliente c inner join estaciona e on
c.cpf = v.cliente_cpf and e.veiculo_placa = v.placa and e.cod = 2; 

/*Exercício 12*/ 
select c.cpf from veiculo v inner join cliente c inner join estaciona e on
c.cpf = v.cliente_cpf and e.veiculo_placa = v.placa and e.cod = 3; 

/*Exercício 13*/
select m.desc_2 from modelo m inner join veiculo v inner join estaciona e on
 v.placa = e.veiculo_placa and e.cod = 2 and m.codMod = v.modelo_codMod;


 /*Exercício 14*/ 
 select v.placa, c.nome, m.desc_2 from veiculo v inner join cliente c inner join modelo m on
c.cpf = v.cliente_cpf and v.modelo_codMod = m.codMod;