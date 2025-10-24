create database banco_livros; /*cria o banco de dados */ /*os códigos são reutilizaveis*/ 
use banco_livros;
drop database banco_livros; /*exclui fisicamente o banco de dados */
drop table tb_livro;

create table tb_livro(
		pk_id_livro int primary key auto_increment not null,
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
        estado_conservacao enum("novo","usado","semi-novo")
);

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
		pk_id_editora int primary key auto_increment not null,
        nome_editora varchar(100) not null,
        quantidade_autores int not null,
        quantidade_obras_editora int not null,
        data_fundacao date not null,
        pais_de_origem varchar(30) not null,
        endereco varchar(150) not null
);

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