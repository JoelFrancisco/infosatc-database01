create database academia;
use academia;

-- creates

create table atividade (
  idatividade int(5) not null,
  nome varchar(50) not null,
  primary  key (idatividade)
);

create table instrutor (
  idinstrutor int(5) not null,
  rg varchar(12) not null,
  nome varchar(50) not null,
  datanascimento date not null,
  titulacao varchar(50) not null,
  primary key (idinstrutor)
);

create table turma (
  idturma int(5) not null,
  horario time not null,
  duracao int(5) not null,
  datainicio date not null,
  datafim date not null,
  idatividade int(5) not null,
  idinstrutor int(5) not null,
  primary key (idturma),
  foreign key (idatividade) references atividade(idatividade),
  foreign key (idinstrutor) references instrutor(idinstrutor)
);

create table aluno (
  idaluno int (5) not null,
  datamatricula date not null,
  nome varchar(50) not null,
  endereco varchar(45) not null,
  telefone int(9) not null,
  datanascimento date not null,
  altura float not null,
  peso int(3) not null,
  idturma int(5) not null,
  primary key (idaluno),
  foreign key (idturma) references turma(idturma)
);

create table matricula (
  idaluno int(5) not null,
  idturma int(5) not null,
  primary key (idaluno, idturma)
);

-- inserts atividade
insert into atividade (idatividade, nome) 
values (1, "musculacao");

insert into atividade (idatividade, nome)
values (2, "yoga");

insert into atividade (idatividade, nome)
values (3, "zumba");

-- inserts instrutor
insert into instrutor (idinstrutor, rg, nome, datanascimento, titulacao)
values (1, '112345679012', "Antonio Carlos", "1990-01-12", "professor musculacao");

insert into instrutor (idinstrutor, rg, nome, datanascimento, titulacao)
values (2, '522486790120', "Sandra Regina", "1983-10-02", "professor zumba");

insert into instrutor (idinstrutor, rg, nome, datanascimento, titulacao)
values (3, '912335669182', "Pedro de Oliveira", "1980-03-22", "professor yoga");

-- inserts turma
insert into turma (idturma, horario, duracao, datainicio, datafim, idatividade, idinstrutor)
values (1, "19:30:00", 120, "2020-12-10", "2021-5-10", 1, 2);

insert into turma (idturma, horario, duracao, datainicio, datafim, idatividade, idinstrutor)
values (2, "16:45:00", 90, "2020-11-15", "2021-3-10", 2, 3);

insert into turma (idturma, horario, duracao, datainicio, datafim, idatividade, idinstrutor)
values (3, "18:00:00", 60, "2021-01-13", "2021-6-10", 3, 1);

-- inserts aluno
insert into aluno (idaluno, datamatricula, nome, endereco, telefone, datanascimento, altura, peso, idturma)
values(1, "2020-12-10", "José", "Criciuma", 123456789,"1973-10-21", 1.75, 70, 1);

insert into aluno (idaluno, datamatricula, nome, endereco, telefone, datanascimento, altura, peso, idturma)
values(2, "2020-11-15", "Adalberto", "Criciuma", 987654321,"1990-08-10", 1.73, 72, 2);

insert into aluno (idaluno, datamatricula, nome, endereco, telefone, datanascimento, altura, peso, idturma)
values(3, "2021-01-13", "Luiz", "Ararangua", 999999999,"2000-02-10", 1.82, 82, 3);

-- insert matricula
insert into matricula (idaluno, idturma)
values(1, 1);

insert into matricula (idaluno, idturma)
values(2, 2);

insert into matricula (idaluno, idturma)
values(3, 3);

-- Selects

-- a
select idinstrutor, nome
from instrutor
where (YEAR(curdate())-YEAR(datanascimento)<40);

-- b
select nome, datanascimento
from instrutor
where titulacao = "professor musculacao";

-- c
select idatividade, nome
from atividade;

-- d
select nome, endereco, telefone
from aluno
where endereco like "Criciuma";

-- e 
select nome, datanascimento, peso, altura
from aluno
where datamatricula like "2020%";

-- f
select idaluno, nome, peso
from aluno
where peso > 80;

-- g
select idaluno, nome, altura 
from aluno  
where altura > 1.70
and peso > 70;

-- h
select idturma, horario, datainicio
from turma
where datainicio like "2020%";

-- i 
select horario, duracao, datainicio
from turma
where datainicio like "2020-11%";

-- j
select horario, datainicio, datafim
from turma
where datafim like "2021-05%";

-- k 
select idturma, horario, duracao
from turma 
where (horario >= '19:00:00') and (horario <= '22:00:00');

-- l
select idturma, horario, duracao
from turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome = "musculacao";

-- m
select horario, datainicio, datafim
from turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome = "yoga";

-- n 
select horario, datainicio, duracao
from turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome = "zumba"
and horario >= '18:00:00'
and horario <= '23:00:00';

-- o
select idturma, datainicio, datafim
from turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome like 'yoga'
and datainicio like '2020-11%';

-- p
select idturma, datainicio, duracao
from turma, atividade, instrutor
where turma.idatividade = atividade.idatividade
and turma.idinstrutor = instrutor.idinstrutor
and instrutor.nome like "Sandra Regina"
and atividade.nome = "musculacao";

-- q
select aluno.nome, peso, altura
from aluno, turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome = "musculacao"
and YEAR(curdate())-YEAR(datanascimento) > 40;

-- r
select aluno.nome, datanascimento, peso, altura
from aluno, turma, atividade
where turma.idatividade = atividade.idatividade
and atividade.nome = "musculacao"
and datamatricula like "2020%";

-- s
select aluno.nome, telefone, peso, altura
from aluno, turma, atividade, instrutor
where turma.idatividade = atividade.idatividade
and turma.idinstrutor = instrutor.idinstrutor
and atividade.nome = "musculacao"
and instrutor.nome like "Antonio Carlos";


