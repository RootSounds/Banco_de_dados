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
    duracao varchar(20),
    constraint chk_tipo check(tipo = 'album' or tipo = 'musica'),
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

select * from usuario;
select * from midia;
select * from midia_usuario;



/*adicao de usuarios*/
insert into usuario values(default, 'andre', 'andre.pissuto@sptech.school', '123');
insert into usuario values(default, 'miseryswin', 'swin@gmail.com', '123');

/*album sozinho*/
insert into midia values(default, 'se sonhos pudessem ser guardados', default, 'album', null, '27 minutos');

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
insert into midia (titulo, dataLancamento, duracao, tipo, album) values ('O mesmo peso de um elefante', default, '2:37', 'musica', null);

/*tabela associativa*/
insert into midia_usuario values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1);