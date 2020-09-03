/** Exercício 01 **/
use exerciciofixacao;
create table departamentos(
	codigo_depto int not null,
    nome varchar(30) not null,
    localizacao varchar(30) not null,
    primary key(codigo_depto)
    
);

create table funcionarios(
	codigo_func int not null,
    codigo_depto int not null,
    primeiro_nome varchar(20) not null,
    segundo_nome varchar(20) not null,
    ultimo_nome varchar(20) not null,
    data_nasc date not null,
    cpf varchar(14) not null unique,
    rg varchar(13) not null,
    endereco varchar(60) not null,
	cep varchar(10) not null,
    cidade varchar(30) default 'Itapira',
    fone_res varchar(14),
    fone_cel varchar(15) not null,
    funcao varchar(30) not null,
    salario decimal(8,2) not null,
    primary key(codigo_func),
    foreign key(codigo_depto) references departamentos(codigo_depto)
);

/**Exercício 02**/
select primeiro_nome, segundo_nome from funcionarios order by segundo_nome;

/**Exercício 03**/
select * from funcionarios order by cidade;

/**Exercício 04**/
select * from funcionarios where salario > 1000 order by primeiro_nome, segundo_nome, ultimo_nome;

/**Exercício 05**/
select data_nasc, primeiro_nome from funcionarios order by data_nasc desc;

/**Exercício 06**/
select segundo_nome, primeiro_nome, fone_cel, endereco, cidade from funcionarios order by primeiro_nome, segundo_nome;

/**Exercício 07**/
select sum(salario) as total_salarios from funcionarios;

/**Exercício 08**/
select count(*) as total_funcionarios from funcionarios;

/**Exercício 09**/
select sum(salario) / count(*) as media_salario from funcionarios;

/**Exercício 10**/
select primeiro_nome, segundo_nome, ultimo_nome from funcionarios where cidade = 'itapira' and funcao = 'recepcionista';