-- Exemplo da base 'aula29062020'
use aula29062020;
select * from cliente;
-- A que clientes estão associados os pedidos
select c.cod_cli ,c.nome_cli, p.num_ped from cliente c, pedido p where
 c.cod_cli = p.cod_cli order by c.nome_cli;
 
-- Mesmo exemplo com INNER JOIN
select c.cod_cli, c.nome_cli, p.num_ped from pedido p inner join cliente c on
 c.cod_cli = p.cod_cli order by c.nome_cli;
 
 -- Quais são os clientes que têm os pedidos com prazos de entega superiores a 15 dias
 --  e que estão no Estado de São Paulo ou Rio de Janeiro
 select c.nome_cli, p.num_ped, p.prazo_entr, c.uf from cliente c, pedido p
 where c.cod_cli = p.cod_cli and p.prazo_entr > 15 and c.uf in ('sp','rj');

-- Mesmo exemplo com o INNER JOIN
select c.cod_cli, c.nome_cli, p.num_ped, c.uf from cliente c inner join
 pedido p on c.cod_cli = p.cod_cli and p.prazo_entr > 15 and (c.uf='sp' or c.uf='rj');
 
 
 -- Pedidos dos clientes respectivos do menor para o maior
 select c.cod_cli, c.nome_cli, p.num_ped, p.prazo_entr from 
 cliente c, pedido p where c.cod_cli = p.cod_cli
 order by p.prazo_entr desc;
 -- Mesmo exemplo com o INNER JOIN
 select c.cod_cli, c.nome_cli, p.num_ped, p.prazo_entr from cliente c 
 inner join pedido p on c.cod_cli = p.cod_cli order by p.prazo_entr desc;
 
 -- Exibir os vendedores, por nome, que emitiram os pedidos com prazos de
 -- entrega superiores a 15 dias e que tenham salarios fixos iguais ou superiores
 -- a R$ 1000,00
 select v.nome_vend, v.sal_fixo, p.num_ped, p.prazo_entr from
 vendedor v, pedido p where v.cod_vend = p.cod_vend
 and p.prazo_entr > 15 and v.sal_fixo >= 1000 order by v.nome_vend;
 -- Mesmo exemplo com o INNER JOIN
 select v.nome_vend, v.sal_fixo, p.num_ped, p.prazo_entr from
 vendedor v inner join pedido p on v.cod_vend = p.cod_vend
 and p.prazo_entr > 15 and v.sal_fixo >= 1000 order by v.nome_vend;
 
 -- Exibar a relação dos clientes localizados  no Rio de Janeiro, ordenados alfabeticamente
 -- que têm  pedidos de produto Chapa de Aço com prazos de entrega superiores
 -- a 15 dias
 select c.nome_cli, c.uf, p.num_ped, p.prazo_entr, pr.desc_prod 
 from cliente c, pedido p, produto pr, item_pedido ip where 
 c.cod_cli = p.cod_cli and p.num_ped = ip.num_ped
 and pr.cod_prod = ip.cod_prod
 and c.uf = 'rj' and pr.desc_prod='Chapa de Aço' and 
 p.prazo_entr > 15 order by c.nome_cli;
 
 -- Mesmo exemplo com o INNER JOIN
 select c.nome_cli, c.uf, p.num_ped, p.prazo_entr, pr.desc_prod 
 from cliente c inner join pedido p inner join produto pr
 inner join item_pedido ip on 
  c.cod_cli = p.cod_cli and p.num_ped = ip.num_ped
 and pr.cod_prod = ip.cod_prod
 and c.uf = 'rj' and pr.desc_prod='Chapa de Aço' and 
 p.prazo_entr > 15 order by c.nome_cli;
 
 -- Mostre os nome de todos os vendedores que venderam Chapa de Aço em quantiadade superior a 300Kg
 select distinct(v.nome_vend) from vendedor v, pedido p, produto pr, item_pedido ip where
 v.cod_vend = p.cod_vend and
 p.num_ped = ip.num_ped and
 pr.cod_prod = ip.cod_prod and
 ip.qtd_ped > 300 and 
 pr.desc_prod = 'Chapa de Aço';
 
 -- Mesmo exemplo com o INNER JOIN (Deu erro)
 select distinct(v.nome_vend) from vendedor v inner join pedido p 
 inner join produto pr inner join item_produto ip on
 v.cod_vend = p.cod_vend and
 p.num_ped = ip.num_ped and
 pr.cod_prod = ip.cod_prod and
 ip.qtd_ped > 300 and
 pr.desc_prod = 'Chapa de Aço';
 
 -- Quantos clientes fizeram pedidos com a vendedora Ana Cristina?
 select count(distinct c.cod_cli) from cliente c, vendedor v, pedido p where
 c.cod_cli = p.cod_cli and
 p.cod_vend = v.cod_vend and
 v.nome_vend = 'Ana Cristina';
 select c.*, v.nome_vend from cliente c, vendedor v;
 
 -- Quantos clientes das cidades do Rio de Janeiro e 
 -- Niterói tiveram seus pedidos tirados com a vendedora Ana Cristina
 -- (Deu erro)
 select count(distinct c.cod_cli), c.cidade from cliente c, pedido p, vendedor v where
 c.cod_cli = p.cod_cli and
 v.cod_vend = p.cod_vend and
 c.cidade in ('niteroi','rio de janeiro') and
 v.nome_vend ='Ana Cristina'
 group by c.cidade;
 
 use exemplojoin2;
 -- Exemplos da base de dados 'Exemplo Join 2'
 -- Exemplo com INNER JOIN
 select f.nome, c.nome_cargo from cargo c inner join funcionario f on 
 f.cod_cargo = c.cod_cargo;
 
 -- Exemplo com o LEFT JOIN (Funcionário sem cargo)
 select f.nome, c.nome_cargo from funcionario f left join cargo c on
 f.cod_cargo = c.cod_cargo;
 
 -- Exemplo com o RIGHT JOIN (Cargo sem funcionário)
 select f.nome, c.nome_cargo from funcionario f right join cargo c on
 f.cod_cargo = c.cod_cargo;
 
 -- Exemplo de FULL OUTER JOIN
  select f.nome, c.nome_cargo from funcionario f left join cargo c on
 f.cod_cargo = c.cod_cargo union 
  select f.nome, c.nome_cargo from funcionario f right join cargo c on
 f.cod_cargo = c.cod_cargo;