create database pokemon;
use pokemon;
drop table tb_pokemon;

select * from treinador;
select * from tb_pokemon;
select * from fazenda;
select * from equipe;

CREATE TABLE `pokemon`.`treinador` (
  `id_Treinador` INT NOT NULL AUTO_INCREMENT,
  `id_pokemon` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `id_fazenda` INT NOT NULL,
  `nome_treinador` VARCHAR(50) NOT NULL,
  `data_nasc_treinador` DATE NOT NULL,
  `aparencia_treinador` VARCHAR(100) NOT NULL,
  `gostos_treinador` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Treinador`));
  
	alter table treinador
add constraint id_equipe foreign key(id_equipe) references equipe(id_equipe),
  add constraint id_pokemon foreign key(id_pokemon) references tb_pokemon(id_pokemon),
  add constraint id_fazenda foreign key(id_fazenda) references fazenda(id_fazenda);
  
UPDATE treinador SET id_equipe = 1 WHERE id_equipe = 0;
  
select * from treinador;

insert into treinador(id_pokemon, id_fazenda,nome_treinador,data_nasc_treinador,aparencia_treinador,gostos_treinador)values
(4,1,"Mayara","2006-07-21","mulher de cabelos longos cacheados pretos, parda, altura baixa, olhos escuros","gosta da cor Amarelo"),
(7,2,"Ana Caroline", "2006-09-21", "mulher de cabelos médio cacheado castanho, pele clara, alta e olhos escuros", "gosta da cor Azul");
  
  CREATE TABLE `pokemon`.`tb_pokemon` (
  `id_pokemon` INT NOT NULL AUTO_INCREMENT,
  `id_treinador` INT,
  `id_fazenda` INT,
  `id_equipe` INT,
  `nome_pokemon` VARCHAR(45) NOT NULL,
  `forma` VARCHAR(50) NOT NULL,
  `tipo_1` ENUM("Grass", "Fire", "Water", "Bug", "Normal", "Flying", "Poison", "Electric", "Ground", "Fairy", "Fighting", "Psychic", "Rock", "Ghost", "Ice", "Dragon", "Dark", "Steel") NOT NULL,
  `tipo_2` ENUM("Grass", "Fire", "Water", "Bug", "Normal", "Flying", "Poison", "Electric", "Ground", "Fairy", "Fighting", "Psychic", "Rock", "Ghost", "Ice", "Dragon", "Dark", "Steel", "No have") NOT NULL,
  `HP` INT NOT NULL,
  `ataque` INT NOT NULL,
  `defesa` INT NOT NULL,
  `ataque_especial` INT NOT NULL,
  `defesa_especial` INT NOT NULL,
  `agilidade` INT NOT NULL,
  `geracao` INT NOT NULL,
  PRIMARY KEY (`id_pokemon`));
  
  select * from tb_pokemon;
  
/* dados já inseridos
("Wormadam","Plant Cloak","Bug","Grass",60,59,86,79,105,36,4),
("Miltank","","Normal","No have",95,80,105,40,70,100,2),
("Giratina","Altered Forme","Ghost","Dragon",150,100,120,100,120,90,4);
("","","","",,,,,,,) --> modelo para inserir os valores */

insert into tb_pokemon(nome_pokemon,forma,tipo_1,tipo_2,HP,ataque,defesa,ataque_especial,defesa_especial,agilidade,geracao)values
("Charizar","","Fire","Flying",78,84,78,109,85,100,1),
("Weedle","","Bug","Poison",40,35,30,20,20,50,1),
("Pikachu","","Electric","No have",35,55,40,50,50,90,1),
("Muk","","Poison","No have",105,105,75,65,100,50,1),
("Jynx","","Ice","Psychic",65,50,35,115,95,95,1),
("Igglybuff","","Normal","Fairy",90,30,15,40,20,15,2),
("Lavitar","","Rock","Ground",50,64,50,45,50,41,2),
("Raikou","","Electric","No have",90,85,75,115,100,115,2),
("Stunky","","Poison","Dark",63,63,47,41,41,74,4),
("Castform","Sunny Form","Fire","No have",70,70,70,70,70,70,3),
("Garchomp","","Dragon","Ground",108,130,95,80,85,102,4),
("Darmanitan","Zen Mode","Fire","Psychic",105,30,105,140,105,55,5);

  
  alter table tb_pokemon
add constraint id_equipe_pok foreign key(id_equipe) references equipe(id_equipe),
add constraint id_treinador foreign key(id_treinador) references treinador(id_treinador),
add constraint id_fazenda_pok foreign key(id_fazenda) references fazenda(id_fazenda);
  
  CREATE TABLE `pokemon`.`equipe` (
  `id_equipe` INT NOT NULL AUTO_INCREMENT,
  `id_treinador` INT NULL,
  `id_pokemon` INT NULL,
  `nome_equipe` VARCHAR(45) NOT NULL,
  `qtds_pokemon` INT NOT NULL,
  PRIMARY KEY (`id_equipe`));

alter table equipe
  add constraint id_treinador_equipe foreign key(id_treinador) references treinador(id_treinador),
  add constraint id_pokemon_equipe foreign key(id_pokemon) references tb_pokemon(id_pokemon);
  
  insert into equipe(nome_equipe,qtds_pokemon)values
  ("Equipe May", 7), ("Equipe Carol", 7);
  
  update equipe set qtds_pokemon = 6;
  select * from equipe;






CREATE TABLE `pokemon`.`fazenda` (
  `id_fazenda` INT NOT NULL AUTO_INCREMENT,
  `id_treinador` INT,
  `id_pokemon` INT,
  `nome_fazenda` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(80) NOT NULL,
  `capacidade` INT NOT NULL,
  PRIMARY KEY (`id_fazenda`));

alter table fazenda
  add constraint id_treinador_faz foreign key(id_treinador) references treinador(id_treinador),
  add constraint id_pokemon_faz foreign key(id_pokemon) references tb_pokemon(id_pokemon);

select * from fazenda;
  
insert into fazenda(nome_fazenda, localidade,capacidade) values
("Fazenda Mayara", "Zona Leste do Mapa", 40),
("Fazenda Caroline", "Zona Sul do Mapa", 70);

