CREATE DATABASE universidade;
USE universidade;

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

-- SELECTS

-- 1
SELECT * FROM cursos;

-- 2
SELECT * FROM alunos;

-- 3
SELECT * FROM professores;

-- 4
SELECT nome, sala 
FROM cursos;

-- 5 
SELECT nome, cidade
FROM coordenadores;

-- 6
SELECT nome, telefone, cidade, estado
FROM alunos;

-- 7 
SELECT * 
FROM coordenadores
WHERE nome LIKE "%Ana Maria%";

-- 8
SELECT *
FROM professores
WHERE estado = "SC";

-- 9
SELECT *
FROM alunos
WHERE cidade = "Criciúma";

-- 10
SELECT *
FROM cursos
WHERE nome LIKE "E%";

-- 11
SELECT *
FROM cursos
WHERE nome LIKE "%Administração%";

-- 12
SELECT *
FROM professores
WHERE nome LIKE "%Silva%";


-- 1 
SELECT professores.nome, cursos.nome
FROM professores, cursos, disciplinas
WHERE professores.coddisciplina = disciplinas.coddisciplina 
AND disciplinas.codcurso = cursos.codcurso;

-- 2
SELECT alunos.nome, alunos.codturma 
FROM alunos;

-- 2(professor)
SELECT alunos.nome, turmas.codturma
FROM alunos, turmas
WHERE alunos.codturma = turmas.codturma;

-- 3
SELECT coordenadores.nome, cursos.nome
FROM coordenadores, cursos
WHERE coordenadores.codcoordenador = cursos.codcoordenador;

-- 4
SELECT professores.nome, professores.telefone, disciplinas.nome, disciplinas.nraulas
FROM professores, disciplinas
WHERE professores.coddisciplina = disciplinas.coddisciplina;

-- 5
SELECT alunos.codaluno, alunos.nome, alunos.telefone, turma.codturma, turmas.ano
FROM alunos, turmas
WHERE alunos.codturma = turmas.codturma;

-- 6 
SELECT coordenadores.nome, coordenadores.cidade, coordenadores.telefone, cursos.codcurso, cursos.nome
FROM coordenadores, cursos
WHERE cursos.codcoordenador = coordenadores.codcoordenador;