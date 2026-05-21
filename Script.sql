create database rootsounds;
use rootsounds;

drop table midia_usuario;
drop table curtida;
drop table comentario;
drop table midia;
drop table usuario;
show tables;


create table usuario(
	idUsuario int primary key auto_increment,
    nome varchar(50) not null unique,
    email varchar(50) not null unique,
    senha varchar(13) not null
);

create table midia(
	idMidia int primary key auto_increment,
    titulo varchar(100) not null unique,
    dataLancamento timestamp default current_timestamp,
    tipo varchar(6) not null,
	album int null,
    capa varchar(500) default 'https://t2.genius.com/unsafe/600x600/https%3A%2F%2Fimages.genius.com%2F30e254b161cb5f849564f7df3fd7bc9d.1000x1000x1.png',
    duracao varchar(31) not null,
    constraint chk_tipo check(tipo = 'Álbum' or tipo = 'Música'),
    foreign key (album) references midia(idMidia)
);

create table comentario(
	idComentario int auto_increment,
    conteudo varchar(500) not null,
    dataComentario timestamp default current_timestamp,
    idUsuario int not null,
    idMidia int not null,
    foreign key (idUsuario) references usuario(idUsuario),
    foreign key (idMidia) references midia(idMidia),
	primary key(idComentario, idUsuario, idMidia)
);

create table curtida(
	idCurtida int auto_increment,
    dataCurtida timestamp default current_timestamp,
    idUsuario int not null,
    idMidia int not null,
    foreign key (idUsuario) references usuario(idUsuario),
    foreign key (idMidia) references midia(idMidia),
    primary key(idCurtida, idUsuario, idMidia)
);

create table midia_usuario(
	idMidia int not null,
    idUsuario int not null,
    foreign key (idMidia) references midia(idMidia),
    foreign key (idUsuario) references usuario(idUsuario),
    primary key(idMidia, idUsuario)
);

/*adicao de usuarios*/
insert into usuario values(default, 'andre', 'andre.pissuto@sptech.school', '123');
insert into usuario values(default, 'miseryswin', 'swin@gmail.com', '123');

/*album sozinho*/
insert into midia values(default, 'se sonhos pudessem ser guardados', default, 'Álbum', null, 'https://t2.genius.com/unsafe/881x0/https%3A%2F%2Fimages.genius.com%2Fb20ab9fae1cb7970e5ed546e66625704.1000x1000x1.png', '27 minutos');

/*musicas do album*/
insert into midia (titulo, dataLancamento, duracao, tipo, album) values
('borboletas (mais do que os olhos podem aguentar)', '2024-10-12 00:00:00', '2:14', 'musica', 1),
('especiarias (arde como fogo)', '2024-10-12 00:00:00', '2:18','musica', 1),
('despertador (eu dormi a tarde inteira esperando vc voltar)', '2024-10-12 00:00:00', '2:16', 'musica', 1),
('espectro (ficou escuro, eu fiquei cego)', '2024-10-12 00:00:00', '2:31', 'musica', 1),
('fadas (cantando pro oceano)', '2024-10-12 00:00:00', '3:35', 'musica', 1),
('gigantes (finais de histórias)', '2024-10-12 00:00:00', '2:35', 'musica', 1),
('feiticeiro (eu merecia essa dança tanto assim?)', '2024-10-12 00:00:00', '3:06', 'musica', 1),
('marinheiro (como foi que entrou água dentro da canoa?)', '2024-10-12 00:00:00', '2:56', 'musica', 1),
('pressa (me deixa voltar só uma semana?)', '2024-10-12 00:00:00', '3:33', 'musica', 1),
('hermético (uma cor e um nome)', '2024-10-12 00:00:00', '1:55', 'musica', 1);

/*musica sozinha*/
insert into midia (titulo, dataLancamento, duracao, tipo, album, capa) values ('O mesmo peso de um elefante', default, '2:37', 'musica', null, 'https://t2.genius.com/unsafe/344x344/https%3A%2F%2Fimages.genius.com%2Fcc5bb575b4779f85a2d5b6012c9ef209.1000x1000x1.png');
 
/*tabela associativa*/
insert into midia_usuario values 
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(11,2),
(12,2);

create view vw_midias as
select 
m.idMidia,
m.titulo,
 year(m.dataLancamento) as 'ano',
 m.duracao, 
 m.tipo,
 m.album,
 m.capa,
 u.nome as 'artista'
 from midia as m
 join midia_usuario as mu on m.idMidia = mu.idMidia
 join usuario as u on mu.idUsuario = u.idUsuario
 where (album is null and tipo = 'album') or (album is null and tipo = 'musica');
 
select * from vw_midias;

insert into midia values(default, '#hellyeah', default, 'album', null,'https://t2.genius.com/unsafe/375x0/https%3A%2F%2Fimages.genius.com%2F479e3ed284e45f103a9b9c4e3dd88457.1000x1000x1.png', '13 minutos e 39 segundos');
insert into midia values(default, 'TESTE', default, 'album', null,'https://static.decorepronto.com.br/public/decorepronto/imagens/produtos/gravura-poster-para-quadros-capa-album-nevermind-da-banda-nirvana-90x60cm-31369.jpg', '13 minutos e 39 segundos');
insert into midia_usuario values(13,2);
insert into midia_usuario values(14,2);

select * from curtida;