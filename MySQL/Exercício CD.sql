create database DB_CDS;
use DB_CDS;
drop table estado;

create table artista(
	pk_id_art int primary key auto_increment not null,
    nome_art varchar(100) not null
);

create table gravadora(
	pk_id_grav int primary key auto_increment not null,
    nome_grav varchar(50) not null
);

create table categoria(
	pk_id_cat int primary key auto_increment not null,
    nome_cat varchar(50) not null
);

create table estado(
	pk_sigla_est int primary key auto_increment not null,
    nome_estado char(50) not null
);

create table cidade(
	pk_id_cidade int primary key auto_increment not null,
    fk_sigla_est char(2) not null,
	nome_cid varchar(100) not null
);

create table cliente (
	pk_id_cli int primary key auto_increment not null,
    fk_id_cidade int not null,
    nome_cli varchar(100) not null,
    endereco_cli varchar (200) not null,
    renda_cli decimal(10,2) not null,
    sexo_cli char(1) not null,
    check (sexo_cli in ('F', 'M'))
);

create table conjuge (
	pk_id_cli int primary key auto_increment not null,
    nome_conj varchar(100) not null,
    renda_conj decimal(10,2) not null,
    sexo_conj char(1) not null,
    check (sexo_conj in('F', 'M'))
);

create table funcionário(
	pk_id_func int primary key auto_increment not null,
    nome_func varchar(100) not null,
    end_func varchar(200) not null,
    sal_func decimal (10,2) not null,
    sexo_func char(1) not null,
    check (sexo_fun in('F','M'))
);

create table dependente(
	pk_id_depart int primary key auto_increment not null,
    fk_id_func int not null,
    nome_depart varchar(100) not null,
    sexo_depart char(1) not null,
    check(sexo_depart in('F','M'))
);

create table titulo(
	pk_id_titulo int primary key auto_increment not null,
    fk_id_cat int not null,
    fk_id_grav int not null,
    nome_cd varchar(100) not null,
    valor_cd decimal(10,2) not null,
    qtd_estq int not null
);

create table pedido(
	pk_num_ped int primary key auto_increment not null,
    fk_id_cli int not null,
    fk_id_func int not null,
    data_ped datetime not null,
    valor_ped decimal(10,2) not null
);

create table titulo_pedido(
	fk_num_ped int  not null,
    fk_cod_tit int not null,
    qtd_cd int not null check (qts_cd >=1),
    valor_cd decimal(10,2) not null check (valor_cd > 0)
);

create table titulo_artista(
	fk_id_tit int not null,
    fk_id_art int not null
);
