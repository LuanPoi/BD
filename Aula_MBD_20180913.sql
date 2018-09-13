create database dbaeroporto;
use dbaeroporto;
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
#modelo físico
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
create table endereco(
	codigo int,
	rua varchar(200),
    numero int,
    complemento varchar(200),
    cep int,
    cidade varchar(200),
    pais varchar(200),
		primary key (codigo)
);

create table passageiro(
	codigo int,
    cpf int,
    passaporte int,
    enderecoCod int,
		primary key (codigo),
        foreign key (enderecoCod) references endereco(codigo)
);

create table classe(
	codigo int,
    descricao varchar(30),
		primary key (codigo)
);

create table aeroporto(
	codigo int,
    sigla varchar(3),
    nome varchar(50),
		primary key (codigo)    
);

create table voo(
	codigo int,
    dataHora datetime,
    origemCod int,
    destinoCod int,
		primary key (codigo),
        foreign key (origemCod) references aeroporto(codigo),
        foreign key (destinoCod) references aeroporto(codigo)
);

create table reserva(
	codigo int,
    assento varchar(4),
    preco int,
    passageiroCod int,
    classeCod int,
    vooCod int,
		primary key (codigo),
        foreign key (passageiroCod) references passageiro(codigo),
        foreign key (classeCod) references classe(codigo),
        foreign key (vooCod) references voo(codigo)
    
);
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
#População
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
insert into endereco(codigo,rua,numero,complemento,cep,cidade,pais)
values ();

insert into passageiro(codigo,cpf,passaporte,enderecoCod)
values();

insert into classe(codigo,descricao)
values();

insert into aeroporto(codigo,sigla,nome)
values();

insert into voo(codigo,dataHora,origemCod,destinoCod)
values();

insert into reserva(codigo,assento,preco,passageiroCod,classeCod,vooCod)
values();
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
#Clausulas select
#*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|*****|
#---- 1) Quais são os países dos passageiros dos voos que saem do aeroporto de Guarulhos (GRU) em primeiro de outubro de 2018?
select
from
where
	dataHora = "1/10/2018"
SELECT      a.pais
FROM  aeroporto.voo as v    inner join  aeroporto.reserva as r on v.ID = r.voo_id    inner join  aeroporto.passageiro as p on r.passageiro_id = p.ID    inner join  aeroporto.address as a on a.id = p.address_id;

#---- 2) Quais são os passageiros com necessidades especiais que devem sair do aeroporto Antônio Carlos Jobim (GIG) em 10 de outubro de 2018?
