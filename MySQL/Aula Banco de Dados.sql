create database banco_livros; /*cria o banco de dados */ /*os códigos são reutilizaveis*/ 
use banco_livros;
drop database banco_livros; /*exclui fisicamente o banco de dados */
drop table tb_livro;

create table tb_livro(
		id_livro int auto_increment not null,
        nome_livro varchar(100),
        numero_paginas int,
        genero_livro enum('suspense','terror','ficção cientefica', 'comédia','ação','romance','infantil','juvenil','LGBT+'),
        preco decimal(8,2),
        capa_dura enum('mole', 'paraná', 'cartão', 'roller','comum'),
        data_leitura date,
        tipo_livro enum("físico", "digital", "audio book"),
        idioma enum("português", "espanhol", "inglês", "francês", "alemão", "chinês", "coreano", "mandarim"),
        avaliacao_livro enum("maravilhoso","ótimo", "bom", "regular", "ruim", "péssimo","não sei"),
        status_livro enum ('lido','lendo', 'não lido', 'desisti', 'na lista'),
        edicao varchar(30),
        estado_conservacao enum("novo","usado","semi-novo"),
        id_autor int,
        id_editora int,
        constraint pk_id_livro primary key (id_livro)
);

alter table tb_livro 
add constraint fk_id_editora foreign key (id_editora) references tb_editora(id_editora),
add constraint fk_id_autor foreign key (id_autor) references tb_autor(id_autor);

describe tb_livro; /*exibe a estrutura da tabela*/
select * from tb_livro; /* exibe o conteúdo da tabela */

insert into tb_livro
(nome_livro, numero_paginas,genero_livro,preco,capa_dura,data_leitura, tipo_livro, idioma,avaliacao_livro,status_livro,edicao,estado_conservacao)values
("O pequeno príncipe",144,"infantil",15.00,"mole","2025-10-21","físico","português", "ótimo", "lido","10º Edição","novo"),
("Conectadas",320,"romance",28.96,"comum","2025-10-21","físico","português","bom","na lista","1º Edição","novo"),
("A paciente silenciosa",364,"terror",39.80,"comum","2025-10-21","físico","português","ótimo","lido","2º Edição","novo"),
("Verity",320,"romance",28.96,"comum","2024-10-21","físico","português","bom","lido","1º Edição","novo"),
("Suicidas",430,"suspense",45.65,"comum","2025-10-21","físico","português","não sei","na lista","1º Edição","novo"),
("Uma Família Feliz",352,"suspense",45.40,"comum","2025-10-21","físico","português","maravilhoso","lido","1º Edição","novo"),
("Um de Nós Está Mentindo",384,"suspense",34.74,"comum","2025-10-21","físico","português","ruim","lido","1º Edição","novo"),
("Jartar Secreto",368,"suspense",38.77,"comum","2025-10-21","físico","português","não sei","na lista","1º Edição","novo"),
("A Empregada",304,"suspense",44.90,"comum","2025-10-21","físico","português","não sei","na lista","6º Edição","novo"),
("Um de Nós Está Mentindo",384,"suspense",34.74,"comum","2025-10-21","físico","português","ruim","lido","3º Edição","novo"),
("A jogada do Amor",384,"romance",39.71,"comum","2025-10-21","físico","português","bom","lido","1º Edição","novo"),
("1974",415,"ação",34.74,"comum","2025-10-21","físico","português","não sei","não lido","10º Edição","usado");


create table tb_editora(
		id_editora int auto_increment not null,
        nome_editora varchar(100) not null,
        quantidade_autores int not null,
        quantidade_obras_editora int not null,
        data_fundacao date not null,
        pais_de_origem varchar(30) not null,
        endereco varchar(150) not null,
        id_livro int,
        id_autor int,
        constraint pk_id_editora primary key (id_editora)
);
SHOW CREATE TABLE tb_editora;


alter table tb_editora

add constraint fk_idautor foreign key (id_autor) references tb_autor(id_autor),
add constraint fk_id_livro foreign key (id_livro) references tb_livro(id_livro);

/*LEMBRANDO: os nomes das FKs não podem ser iguais em cada tabela, precisa mudar!! */


drop table tb_editora;
describe tb_editora;
select * from tb_editora;

insert into tb_editora(nome_editora,quantidade_autores,quantidade_obras_editora,data_fundacao,pais_de_origem,endereco)values
("Principes",20,60,"2005-01-01","Brasil","R. José Albino Pereira, 54 - Jardim Alvorada, Jandira - SP, 06612-001"),
("Rocco",300,800,"1975-01-01","Brasil","R. Dom Diniz, 56 - Jardim Luzitania, São Paulo - SP, 04032-080"),
("Companhia das Letras", 240,650,"1986-01-01","Brasil","R. Bandeira Paulista,702 - Cj. 32 - Itaim Bibi - São Paulo - SP - CEP:04532-002"),
("Saraiva",200,200,"1914-12-13","Brasil","R. Henrique Schaumann,270, Pinheiros,São Paulo"),
("Globo Livros",300,300,"2001-01-01","Brasil","R. Marques de Pombal, 25 - Centro, Rio de Janeiro - RJ, 20230-240" ),
("Alt",500,1200,"2011-06-29","Brasil","R. Marquês de Pombal, 25 - 2ºandar - Centro, Rio de Janeiro - RJ"),
("Galera Record",50,230,"2007-01-01","Brasil","R. Argentina, 120 - São Cristóvão, Rio de Janeiro - RJ, 20.921-380" ),
("Intrínseca",680,800,"2003-01-01","Brasil","Avenida das Américas, 500 - Barra da Tijuca, Rio de Janeiro - RJ" ),
("Hachette Livre",200,2300,"1826-01-01","França","Vances, França: Immeuble Louis Hachette - 58 rue Jean Bleuzen - CS 70007 - 92178 Vances CEDEX" ),
("Pearson",700,20000,"1844-01-01","Reino Unido","Av. Jose Luiz Mazzali, 450, Santo Antonio, Louveira - SP" );

delete from tb_livro where pk_id_livro = 7;
delete from tb_livro where genero_livro ="suspense";

select * from tb_livro;

start transaction; /*Habilita comandos de retorno */ 
delete from tb_livro;

rollback; /*Ctrl Z no comando */

commit; /*salva oficial, não tem rollback que volte a ação = confirma a execução do delete */

update tb_livro set nome_livro = "Verity: Uma trágica história de amor" where pk_id_livro = 4;
update tb_livro set numero_paginas = 290 where pk_id_livro = 3;

alter table tb_editora add column cnpj char(18) not null; /*criando uma coluna dentro de uma tabela*/
describe tb_editora;
select * from tb_editora;

update tb_editora set cnpj = "56.887.499/0001-65" where pk_id_editora = 1; /*inserindo valor dentro dessa coluna criada*/

alter table tb_editora drop column cnpj; /*deletando uma coluna dentro de uma tabela*/

alter table tb_editora modify column cnpj char(20); /*modifica o tipo a estrutura do campo na tabela*/


create table tb_autor(
		id_autor int primary key auto_increment not null,
        nome_autor varchar(100) not null,
        data_nasc date not null,
        quantidade_obras_autor int not null,
        nacionalidade varchar(30) not null,
		genero_autor enum("feminino", "masculino", "não-binário")
);

drop table tb_autor;

CREATE TABLE `banco_livros`.`tb_autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nome_autor` VARCHAR(100) NOT NULL,
  `data_nasc_autor` DATE NOT NULL,
  `quant_obras_autor` INT NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `genero_autor` ENUM("F", "M", "NB", "outro") NOT NULL,
  
	id_livro int,
	id_editora int,
	constraint pk_id_autor primary key (id_autor)
  );

alter table tb_autor
add constraint fk_id_editora foreign key (id_editora) references tb_editora(id_editora),
add constraint fk_id_livro foreign key (id_livro) references tb_livro(id_livro);
  
  
select * from tb_autor;
  
insert into tb_autor (nome_autor,data_nasc_autor,quant_obras_autor, nacionalidade, genero_autor)values
('Rafael Montes', '1990-09-22', 7, 'Brasileira', 'M'),
('Clarice Lispector', '1920-12-10', 25, 'Brasileira', 'F'),
('Machado de Assis', '1839-06-21', 50, 'Brasileira', 'M'),
('J.K. Rowling', '1965-07-31', 15, 'Britânica', 'F'),
('George Orwell', '1903-06-25', 10, 'Britânica', 'M'),
('Agatha Christie', '1890-09-15', 85, 'Britânica', 'F'),
('Chimamanda Ngozi Adichie', '1977-09-15', 12, 'Nigeriana', 'F'),
('Haruki Murakami', '1949-01-12', 25, 'Japonesa', 'M'),
('Stephen King', '1947-09-21', 65, 'Americana', 'M'),
('Conceição Evaristo', '1946-11-29', 10, 'Brasileira', 'F'),
('Neil Gaiman', '1960-11-10', 40, 'Britânica', 'M');

alter table tb_autor add column cpf char(11) not null;

update tb_autor set nome_autor = "Clarice Mudança" where pk_id_autor = 2;

alter table tb_autor 
change column nacionalidade nacionalidade_autor varchar(45) not null;

alter table tb_autor drop column quant_obras_autor;

update tb_autor set nome_autor = "Jujutsu Kaizen" where pk_id_autor = 11;

alter table tb_autor add column premiacoes int not null;

start transaction;

delete from tb_autor;
select * from tb_autor;

rollback;

drop table tb_livro;