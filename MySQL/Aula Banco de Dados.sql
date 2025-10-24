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
