CREATE DATABASE universidade
USE universidade

CREATE TABLE coordenadores (
    codcoordenador int(5) not null,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    telefone int(10) not null,
    primary key (codcoordenador)
);

CREATE TABLE cursos (
    codcurso int(5) not null,
    nome varchar(50) not null,
    codcoordenador int(5) not null,
    primary key (codcurso),
    foreign key (codcoordenador) references coordenadores(codcoordenador)
);

CREATE TABLE disciplinas (
    coddisciplina int(5) not null,
    nome varchar(50) not null,
    nraulas int(3) not null,
    codcurso int(5) not null,
    primary key (coddisciplina),
    foreign key (codcurso) references cursos(codcurso)
);

CREATE TABLE professores (
    codprofessor int(5) not null,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    telefone int(10) not null,
    coddisciplina int(5) not null,
    primary key (codprofessor),
    foreign key (coddisciplina) references disciplinas(coddisciplina)
);

CREATE TABLE turmas (
    codturma int(5) not null,
    ano int(4) not null,
    periodo varchar(50) not null,
    codcurso int(5) not null,
    primary key (codturma),
    foreign key (codcurso) references cursos(codcurso)
);

CREATE TABLE alunos (
    codaluno int(5) not null,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    telefone int(10) not null,
    codturma int(5) not null,
    primary key (codaluno),
    foreign key (codturma) references turmas(codturma)
);

CREATE TABLE matriculas (
    codmatricula int(5) not null,
    codaluno int(5) not null,
    coddisciplina int(5) not null,
    mediafinal float(4,2) not null,
    primary key (codmatricula),
    foreign key (codaluno) references alunos(codaluno),
    foreign key (coddisciplina) references disciplinas(coddisciplina)
);