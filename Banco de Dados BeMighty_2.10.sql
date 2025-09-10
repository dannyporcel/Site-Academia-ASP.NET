	USE MASTER 
GO

-- Banco Arrumar --

IF EXISTS(SELECT 1 FROM SYSDATABASES WHERE NAME = 'BeMighty')
	DROP DATABASE BeMighty

CREATE DATABASE BeMighty
GO
USE BeMighty 


GO
CREATE TABLE tbl_Aluno(
	ID_Aluno int Primary Key identity (1,1),
	nomeAluno varchar(150),
	CPF char (11),
	RG varchar (10),
	dataNasc date,
	Genero varchar (9),
	Logradouro varchar (150),
	numEndereco varchar (10),
	Bairro varchar (150),
	Cidade varchar (150),
	UF char (2),
	CEP varchar (9), 
	Complemento varchar (200),
	DDD1 char (2),
	telefone varchar (14),
	DDD2 char (2), 
	telefone_2 char (12),
	Email varchar (100),
	alSituacao varchar (12),
	dataCadastro date,
	Foto varbinary (max),
	Senha varchar (20),
	ID_Questionario int	
)
GO
CREATE TABLE Fisico_Aluno(
	ID_Fisico_aluno int Primary Key identity,
	Data_Med date,
	Altura decimal (18,2),
	Peso decimal (18,2),
	Bracos decimal (18,2),
	Abdomen decimal (18,2),
	Pernas decimal (18,2),
	ID_Aluno int,
	ID_Professor int
)

CREATE TABLE tbl_Questionario(
	ID_Questionario int Primary Key Identity(1,1),
	Q1 CHAR(3),
	Q2 CHAR(3),
	Q3 CHAR(3),
	Q4 CHAR(3),
	Q5 CHAR(3),
	Q6 CHAR(3),
	Q7 CHAR(3),
	Q8 CHAR(3),
	Q9 CHAR(3),
	Q10 CHAR(3),
	ID_Aluno int
)


GO
CREATE TABLE Ficha_Treino(
	ID_Ficha int Primary Key identity(1,1),
	Segunda varchar(1000),
	Terca varchar(1000),
	Quarta varchar(1000),
	Quinta varchar(1000),
	Sexta varchar(1000),
	Sabado varchar(1000),	
	ID_Aluno int,
	ID_Professor int
)

GO
CREATE TABLE tbl_Exercicios(
	ID_Exercicios Int Primary Key Identity(1,1),
	NomeExerc Varchar (100),
	Descricao Varchar(255)
)

GO
CREATE TABLE tbl_Funcionario(
	CPF char (11),
	Senha varchar (200),
	Cargo Varchar (100),
	ID_Funcionario int Primary Key identity(1,1),
	nomeFuncionario varchar (150),
	RG varchar (10),
	dataNasc date,
	Sexo varchar (9),
	Logradouro varchar (150),
	numEndereco varchar (20),
	Bairro varchar (150),
	Cidade varchar (150),
	UF char (2),
	CEP varchar (9),
	Complemento varchar(200),
	DDD1 char (2),
	telefone varchar (14),	
	DDD2 char (2), 
	telefone_2 varchar (14),
	Email varchar (100),
	funcSituacao varchar (12),
	Foto varbinary (max),
	dataCadastro date	
	
)

GO
CREATE TABLE tbl_Professor (
	CPF varchar (11),
	Senha varchar (200),
	ID_Professor int Primary Key identity(1,1),
	nomeProfessor varchar (150),
	RG varchar (10),
	dataNasc date,
	Sexo varchar (9),
	regCREF varchar (11),
	Logradouro varchar (150),
	numEndereco varchar (20),
	Bairro varchar (150),
	Cidade varchar (9),
	UF char (2),
	CEP varchar (9),
	Complemento varchar (200),
	DDD1 char (2),
	telefone varchar (14),	
	DDD2 char (2), 
	telefone_2 varchar (14),
	Email varchar (100),
	profSituacao varchar (10),
	Foto varbinary (max),
	dataCadastro date	
)

GO
CREATE TABLE tbl_Modalidade(
	ID_Modalidade int Primary Key identity(1,1),
	nomeModal varchar (150),
	descricaoModal text,	
	dataCadastro date,
	modalSituacao varchar (7)	
)

GO
CREATE TABLE tbl_PlanoModal(
	ID_PlanoModal int Primary Key identity(1,1),
	ID_Plano int,
	ID_Modalidade int
)

GO
CREATE TABLE tbl_Plano(
	ID_Plano int Primary Key identity(1,1),
	nomePlano varchar (100),
	PlanoValor decimal (18,2),
	dataCadastro date,
	Observacao nvarchar(max),
	plSituacao varchar (7)	
)

GO
CREATE TABLE tbl_ProfessorModal(
	ID_ProfessorModal int Primary Key identity(1,1),
	ID_Modalidade int,
	ID_Professor int
)

GO
CREATE TABLE tbl_PagamentoPlano(
	ID_PagamentoPlano int Primary Key identity(1,1),
	DataPagamento date,
	DataVencimento date,
	Valor decimal (18,2),
	ID_Aluno int,
	ID_PlanoAluno int
)

GO
CREATE TABLE tbl_PlanoAluno(
	ID_PlanoAluno int Primary KEY identity(1,1),
	nomePlano varchar (100),
	PlanoValor decimal (18,2),
	dataCadastro date,
	Observacao nvarchar(max),
	plSituacao varchar (7),	
	ID_Aluno int,
	ID_Plano int
)

										-- Alters Tables --
										
GO
--Tabela ProfessorModal
alter table tbl_Aluno
	add constraint fk_Questionario foreign key (ID_Questionario) references tbl_Questionario (ID_Questionario)

GO
--Tabela ProfessorModal
alter table tbl_ProfessorModal
	add constraint fk_ModalidadeProfessor foreign key (ID_Modalidade) references tbl_Modalidade (ID_Modalidade)
---------------
GO
alter table tbl_ProfessorModal
	add constraint fk_Prof_Modal foreign key (ID_Professor) references tbl_Professor (ID_Professor)
----------------
GO
--PlanoModal
alter table tbl_PlanoModal
	add constraint fk_Modal_Plano foreign key (ID_Plano) references tbl_Plano (ID_Plano)

GO
alter table tbl_PlanoModal
	add constraint fk_Plano_Modalidade foreign key (ID_Modalidade) references tbl_Modalidade (ID_Modalidade)
----------------
GO
--Tabela PagamentoPlano
alter table tbl_PagamentoPlano
	add constraint fk_Aluno_Pagamento foreign key (ID_Aluno) references tbl_Aluno (ID_Aluno)

GO
alter table tbl_PagamentoPlano
	add constraint fk_Pag_PlanoAluno foreign key (ID_PlanoAluno) references tbl_PlanoAluno (ID_PlanoAluno)
----------------

GO
--Tabela Físico ALuno
alter table Fisico_Aluno
	add constraint fk_Fisico_Aluno foreign key (ID_Aluno) references tbl_Aluno (ID_Aluno)
GO
alter table Fisico_Aluno
	add constraint fk_Fisico_Professor foreign key (ID_Professor) references tbl_Professor (ID_Professor)
----------------
GO
--Tabela Questionário
alter table tbl_Questionario
	add constraint fk_Questionario_Aluno foreign key (ID_Aluno) references tbl_Aluno (ID_Aluno)
----------------

GO
--Tabela Ficha de Treino
alter table Ficha_Treino
	add constraint fk_Ficha_Aluno foreign key (ID_Aluno) references tbl_Aluno (ID_Aluno)
GO
alter table Ficha_Treino
	add constraint fk_Ficha_Prof foreign key (ID_Professor) references tbl_Professor (ID_Professor)
----------------

--PlanoAluno
GO 
alter table tbl_PlanoAluno
	add constraint fk_ID_Plano foreign key (ID_Plano) references tbl_Plano (ID_Plano)
	
GO 
alter table tbl_PlanoAluno
	add constraint fk_ID_Aluno foreign key (ID_Aluno) references tbl_Aluno (ID_Aluno)
	
	
	
---------------------------------------------------------------------------------------
--  inserts

--INSERT MODALIDADE
insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Musculação', 'Performance', '01/01/2019','Ativo') 

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Body Pump','Performance', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Crossfit','Performance', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Running', 'Performance', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Funcional', 'Performance', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Fit dance', 'Ritmo', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Hiit', 'Ritmo', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Zumba', 'Ritmo', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Body Combat', 'Aeróbico', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Spinning', 'Aeróbico', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Jiu-Jitsu', 'A. marcial', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Capoeira', 'A. marcial', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Judô', 'A. marcial', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Muay Thai', 'A. marcial', '01/01/2019', 'Ativo')

insert into tbl_Modalidade (nomeModal, descricaoModal, dataCadastro,modalSituacao) values ('Boxe', 'A. marcial', '01/01/2019', 'Ativo')

select * from tbl_Modalidade


--INSERT PLANO
insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Combate', 120.00, '01/01/2019','Aparelhos livres.', 'Ativo')

insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Ritmo Intenso', 140.00, '01/01/2019', 'Aparelhos livre.', 'Ativo')

insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Perfomance Extrema', 150.00, '01/01/2019', 'Aparelhos livre', 'Ativo')

insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Funcional', 80.00, '01/01/2019', 'Aparelhos livre.', 'Ativo')

insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Crossfit', 100.00, '01/01/2019', 'Aparelhos livre.', 'Ativo')

insert into tbl_Plano(nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao) values ('Básico', 65.00, '01/01/2019', 'Aparelhos livre.', 'Ativo')

select * from tbl_Plano

--INSERT PLANOMODAL
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,1)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,11)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,12)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,13)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,14)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (1,15)

insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (2,6)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (2,7)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (2,8)

insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (3,1)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (3,2)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (3,3)
insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (3,4)

insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (4,5)

insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (5,3)

insert into tbl_PlanoModal(ID_Plano, ID_Modalidade) values (6,1)

select * from tbl_PlanoModal


--INSERT ALUNO

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('admin','99999999999','2654647425 ','10/11/1976','masculino','Rua José Justino Lima','517','Vila Siqueira','São Paulo','SP','02817077','Casa 2','11','282747865','11','988490174','admin@gmail.com','Ativo','01/01/2019', 'admin')
--USE PARA LOGAR NO ASP

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('Brenda Marli dos Santos','07849780850','265464742','10/11/1976','Feminino','Rua José Justino Lima','517','Vila Siqueira','São Paulo','SP','02817077','Casa 2','11','282747865','11','988490174','brenda@gmail.com','Ativo','01/01/2019', '1235')

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('Enrico Mateus Márcio da Luz','93881285830','138429819','16/04/1989','Masculino','Largo Mestre de Aviz','350','Jardim Luzitânia','São Paulo','SP','04031070','não consta','11','263588525','11','991009664','enrico@gmail.com','Ativo','01/01/2019', '1235')

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('Evelyn Clarice Carla Brito','78227334865','444979554','02/05/1962','Feminino','Travessa Waldemar Cordeiro','285','Cohab Monet','São Paulo','SP','05856590','não consta','11','263588525','11','991009664','evelyn@gmail.com','Ativo','01/01/2019', '1235')

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('Benedito Pedro Henrique da Silva','31034785850','121432324','23/02/1989','Masculino','Rua Quintana 753','195','Cidade Monções','São Paulo','SP','04569900','não consta','11','251988505','11','982155599','benedito@gmail.com','Ativo','01/01/2019', '1235')

insert into tbl_Aluno (nomeAluno,CPF,RG,dataNasc,Genero,Logradouro,numEndereco,Bairro, Cidade,UF,CEP, Complemento, DDD1,telefone, DDD2, telefone_2, Email, alSituacao, dataCadastro, Senha)
values('Levi Luís Sales','85745141875','198140563','23/04/1989','Masculino','Avenida República do Líbano 2157','454','Ibirapuera','São Paulo','SP','04502903','não consta','11','263588525','11','991009664','levi@gmail.com','Ativo','01/01/2019', '1235')

select * from tbl_Aluno


--INSERT PlanoAluno

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Combate', 120.00, '01/01/2019','Aparelhos livres.', 'Inativo', 1,1 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Ritmo Intenso', 140.00, '01/01/2019','Aparelhos livres.', 'Ativo', 2,2 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Perfomance Extrema', 150.00, '01/01/2019','Aparelhos livres.', 'Ativo', 3,3 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Funcional', 80.00, '01/01/2019','Aparelhos livres.', 'Ativo', 4,4 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Crossfit', 100.00, '01/01/2019','Aparelhos livres.', 'Ativo', 5,5 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Básico', 65.00, '01/01/2019','Aparelhos livres.', 'Ativo', 6,6 )

insert into tbl_PlanoAluno (nomePlano, PlanoValor, dataCadastro, Observacao, plSituacao, ID_Aluno, ID_Plano) values ('Básico', 65.00, '01/04/2019','Aparelhos livres.', 'Inativo', 1,6 )

select * from tbl_PlanoAluno

--Insert Pagamento Plano

insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 120.00,1,1)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/02/2019', '01/03/2019', 120.00,1,1)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/03/2019', '01/04/2019', 120.00,1,1)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/04/2019', '01/05/2019', 65.00,1,7)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/05/2019', '01/06/2019', 65.00,1,7)
--
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 140.00,2,2)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 140.00,2,2)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 140.00,2,2)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 140.00,2,2)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 140.00,2,2)
--
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 150.00,3,3)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 150.00,3,3)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 150.00,3,3)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 150.00,3,3)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 150.00,3,3)
--
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 80.00,4,4)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 80.00,4,4)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 80.00,4,4)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 80.00,4,4)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 80.00,4,4)
--
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 100.00,5,5)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 100.00,5,5)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 100.00,5,5)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 100.00,5,5)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 100.00,5,5)
--
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 65.00,6,6)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 65.00,6,6)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 65.00,6,6)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 65.00,6,6)
insert into tbl_PagamentoPlano (DataPagamento, DataVencimento, Valor,ID_Aluno,ID_PlanoAluno) values ('01/01/2019', '01/02/2019', 65.00,6,6)
--
select * from tbl_PagamentoPlano

-- INSERT Professor

insert into tbl_Professor (CPF, Senha, nomeProfessor, RG, dataNasc, Sexo, regCREF, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, profSituacao, dataCadastro)
 values('admin','admin','Gustavo Raíz', '311869543','12/12/1982','Masculino', '013895-G/SP', 'Rua Garcia de Orta','698', 'Parque Independência','São Paulo', 'SP','5880290', 'Condominio Rosa','11','323536395', '11', '956565857','gustavo.raiz@gmail.com','Ativo','03/01/2019')
 
 insert into tbl_Professor (CPF, Senha, nomeProfessor, RG, dataNasc, Sexo, regCREF, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, profSituacao, dataCadastro)
 values('77777777777','12345','Kléber Bambam', '285007415','12/12/1982','Masculino', '013897-G/SP', 'Rua Dezesseis','591', 'Santa Luzia','São Paulo', 'SP','65916590', 'não consta','11','9826562400', '11', '98981115520','severino@gmail.com','Ativo','01/01/2019')

--INSERT ProfessorModal

insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (1,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (2,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (3,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (4,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (5,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (6,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (7,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (8,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (9,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (10,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (11,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (12,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (13,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (14,1)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (15,1)
--
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (1,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (2,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (3,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (4,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (5,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (6,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (7,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (8,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (9,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (10,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (11,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (12,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (13,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (14,2)
insert into tbl_ProfessorModal (ID_Modalidade, ID_Professor) values (15,2)
 
-- INSERT Funcionário
 Select * from tbl_Funcionario
insert into tbl_Funcionario (CPF, Senha, Cargo, nomeFuncionario, RG, dataNasc, Sexo, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, funcSituacao, dataCadastro)
 values ('99999999999','12345','Gerente', 'Malu Clara Costa', '364986104','17/04/1989','Feminino','Rua M.M.D.C.','726','Butantã','São Paulo','SP','05510021', 'Não consta','11','996106289','11','936974965','malu@gmail.com','Ativo','01/01/2019')
  
insert into tbl_Funcionario (CPF, Senha, Cargo, nomeFuncionario, RG, dataNasc, Sexo, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, funcSituacao, dataCadastro)
 values ('35835375808','12345','Atendente', 'Julia Cavalcante Costa', '364986104','17/04/1989','Feminino','Rua M.M.D.C.','726','Butantã','São Paulo','SP','05510021', 'Não consta','11','996106289','11','936974965','malu@gmail.com','Ativo','01/01/2019')
 
insert into tbl_Funcionario (CPF,Cargo, nomeFuncionario, RG, dataNasc, Sexo, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, funcSituacao, dataCadastro)
 values ('29512033810','Faxineiro', 'Isabella Tânia Porto', '313249325','18/06/1989','Feminino','Rua Sigma','747','Estância Mirim','São Paulo','SP','04943150', 'Não consta','11','37376621','11','998458038','isabella@gmail.com','Ativo','01/01/2019')
 
insert into tbl_Funcionario (CPF,Cargo, nomeFuncionario, RG, dataNasc, Sexo, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, funcSituacao, dataCadastro)
 values ('45523983853','Zelador', 'Lucas Gael Assunção', '258748047','01/12/1989','Masculino','Travessa Apolinário Raga','516','Jardim Brasil','São Paulo','SP','02222150', 'Não consta','11','39893802','11','95516017','lucasss@gmail.com','Ativo','01/01/2019')
 
insert into tbl_Funcionario (CPF,Cargo, nomeFuncionario, RG, dataNasc, Sexo, Logradouro, numEndereco, Bairro, Cidade, UF, CEP, Complemento, DDD1, telefone, DDD2, telefone_2, Email, funcSituacao, dataCadastro)
 values ('32962288880','Faxineiro', 'Renan Lucas Farias', '452227409','19/11/1989','Masculino','Praça Paulo Jorge de Lima','830','Jardim Guedala','São Paulo','SP','05610050', 'Não consta','11','29605375','11','984397473','renan@gmail.com','Ativo','01/01/2019')
 
--insert Fisico aluno

insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/01/2019',1.80,80.00,34.00,77.00,65.00,1,1)
insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/03/2019',1.80,82.00,32.00,81.00,62.00,1,1)
insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/06/2019',1.80,79.00,33.00,82.00,63.00,1,1)
--
insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/01/2019',1.70,80.00,34.00,77.00,65.00,2,1)
insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/03/2019',1.70,82.00,32.00,81.00,62.00,2,1)
insert into Fisico_Aluno (Data_Med, Altura, Peso, Bracos, Abdomen, Pernas, ID_Aluno, ID_Professor)values('01/06/2019',1.70,79.00,33.00,82.00,63.00,2,1)			


-- INSERT Ficha ALUNO	

insert into Ficha_Treino(Segunda,Terca,Quarta,Quinta,Sexta,Sabado, ID_Aluno, ID_Professor)
 values('Supino - Serie 2 - 10 Rep; Leg press - Serie 2 - 10 Rep; Puxada Alta - Serie 2 - 10 Rep;', '','Mesa Flexora - Serie 2 - 10 Rep; Abdominal - Serie 2 - 10 Rep;','', 'Extensão de Quadril - Serie 2 - 10 Rep; Rosca Biceps - Serie 2 - 10 Rep;','', 1, 1) 

-- INSERT Exercicios

insert into tbl_Exercicios(NomeExerc,Descricao)values('Supino','Voltado ao peitoral')
insert into tbl_Exercicios(NomeExerc,Descricao)values('Leg Press','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Puxada Alta','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Mesa Flexora','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Abdominal','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Extensão de Quadril','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Rosca Biceps','Voltado ao peitoral') 
insert into tbl_Exercicios(NomeExerc,Descricao)values('Triceps plia','Voltado ao peitoral')  
 
-- Inserts QUESTIONARIO--

insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('1','Sim','','Sim','Sim','','Sim','Sim','','','Sim')
insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('2','','','','','','','','','','')
insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('3','Sim','Sim','Sim','Sim','Sim','Sim','Sim','Sim','Sim','Sim')
insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('4','','','','','Sim','','','','','')
insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('5','','','','','Sim','','','','','')
insert into tbl_Questionario (ID_Aluno,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)values ('6','','','','','Sim','','','','','')
	
	
select nomeAluno,a.ID_Aluno,MAX(ID_Fisico_aluno) from Fisico_Aluno a, tbl_Aluno b where a.ID_Aluno = b.ID_Aluno group by a.ID_Aluno,nomeAluno--pega id aluno em ambas tabelas e ainda pega a ultima media pelo id

SELECT ID_Aluno, MAX(ID_Fisico_aluno) FROM Fisico_Aluno GROUP BY ID_Aluno --pegar o ultimo dado fisico registrado e o id_aluno correspondente
	
	