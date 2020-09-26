/*Exercício a) Figura 1*/
select AVG(salario) as 'Média salarial' from funcionarios;

/*Exercício b) Figura 1*/
select f.primeiro_nome, f.segundo_nome, f.funcao, d.nome from
 funcionarios f inner join departamentos d on
 f.codigo_depto = d.codigo_depto;

/*Exercício c) Figura 1*/
select f.primeiro_nome, f.segundo_nome, f.rg, f.cpf from
funcionarios f inner join departamentos d on
f.codigo_depto = d.codigo_depto and
d.nome = 'TI';

/*Exercício d) Figura 1*/
select primeiro_nome, segundo_nome, salario from funcionarios
where data_nasc >= '1980-01-01' and data_nasc <= '1990-12-31';

/* ----------------------------------- | Figura 2| --------------------------------------*/
/*Exercício a) Figura 2*/
select name, continent from country;

/*Exercício b) Figura 2*/
select name, region, population from country where continent = 'Europe';

/*Exercício c) Figura 2*/
select round(avg(lifeExpectancy)) as 'Expectativa de vida' from country where continent = 'Asia';

/*Exercício d) Figura 2*/
create view dadosAmericaSul as
select Name, headOfState, GovernmentForm, population from country
where continent = 'South America' and population > 2000000;

/*Exercício e) Figura 2*/
create view langEnglish as
select cnt.name, cnt.surfaceArea, cntlg.Language from country cnt inner join countrylanguage cntlg on
cnt.Code = cntlg.CountryCode where cntlg.Language = 'English' and cntlg.IsOfficial = 'T' order by cnt.SurfaceArea;
select * from langenglish;

/*Exercício f) Figura 2*/
alter view langenglish as
select cnt.name, cnt.surfaceArea, cntlg.Language, cntlg.Percentage from country cnt inner join countrylanguage cntlg on
cnt.Code = cntlg.CountryCode where cntlg.Language = 'English' and cntlg.IsOfficial = 'T' order by cnt.SurfaceArea;
select * from langenglish;


