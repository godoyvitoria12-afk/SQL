create database if not exists biblioteca
default character set utf8mb4
default collate utf8mb4_general_ci;

-- CORREÇÃO: Comando essencial para dizer ao MySQL onde criar as tabelas
use biblioteca;
 
create table if not exists usuario(
	matricula int auto_increment,
	nome varchar(30) not null,
	email varchar(50) not null,
	telefone VARCHAR(15) not null,
	cep varchar(9) not null,
	rua varchar(100) not null,
	numero varchar(5),
	bairro varchar(50) not null,
	cidade varchar(100) not null,
	uf char(2) not null,
	nivel_usuario enum('COMUM', 'ADIMIN') default 'COMUM', -- Ajustado para bater com uma das opções do ENUM
	primary key(matricula)
) default charset = utf8mb4;

create table if not exists livros(
	codigo int auto_increment,
	autores varchar(100) not null,
	titulo varchar(100) not null,
	ano year not null,
	editora varchar(30),
	primary key(codigo)
)default charset = utf8mb4;

create table if not exists emprestimo(
	id_emprestimo int auto_increment,
	id_livro int,
	id_usuario int,
	data_saida date not null,
	data_devol date not null,
	FOREIGN KEY(id_usuario) REFERENCES usuario(matricula),
	FOREIGN KEY(id_livro) REFERENCES livros(codigo),
	primary key(id_emprestimo)
-- CORREÇÃO: Era utf8mp4 (com p), mudado para utf8mb4 (com b)
)default charset = utf8mb4;

show tables;
describe emprestimo;

select * from usuario;

USE biblioteca;

-- -----------------------------------------------------
-- POPULANDO A TABELA DE USUÁRIOS (5 Registros)
-- -----------------------------------------------------
INSERT INTO usuario (nome, email, telefone, cep, rua, numero, bairro, cidade, uf, nivel_usuario) VALUES
('Vitória Godoy', 'vitoria.godoy@email.com', '11999998888', '06500-000', 'Av. Principal', '150', 'Centro', 'Santana de Parnaíba', 'SP', 'ADIMIN'),
('Carlos Silva', 'carlos.silva@email.com', '11988887777', '05003-020', 'Rua Palestra Itália', '200', '嶄eia', 'São Paulo', 'SP', 'COMUM'),
('Ana Beatriz Souza', 'ana.souza@email.com', '21977776666', '22020-001', 'Av. Atlântica', '1012', 'Copacabana', 'Rio de Janeiro', 'RJ', 'COMUM'),
('Lucas Rodrigues', 'lucas.rod@email.com', '31966665555', '30140-010', 'Rua da Bahia', '55', 'Lourdes', 'Belo Horizonte', 'MG', 'COMUM'),
('Mariana Costa', 'mari.costa@email.com', '51955554444', '90010-000', 'Rua dos Andradas', '320', 'Centro Histórico', 'Porto Alegre', 'RS', 'COMUM');

-- -----------------------------------------------------
-- POPULANDO A TABELA DE LIVROS (10 Registros)
-- -----------------------------------------------------
INSERT INTO livros (autores, titulo, ano, editora) VALUES
('Machado de Assis', 'Dom Casmurro', 1899, 'Carambaia'),
('J.R.R. Tolkien', 'O Senhor dos Anéis: A Sociedade do Anel', 1954, 'HarperCollins'),
('Palmirinha Onofre', 'A Receita do Sucesso: Bolos e Doces', 2015, 'Melhoramentos'),
('Anthony Bourdain', 'Cozinha Confidencial', 2000, 'Companhia das Letras'),
('Stephen King', 'O Iluminado', 1977, 'Suma');

describe livros;

USE biblioteca;

-- Altera a coluna ano para INT para aceitar qualquer ano histórico
ALTER TABLE livros MODIFY COLUMN ano INT NOT NULL;

insert in to emprestimos 