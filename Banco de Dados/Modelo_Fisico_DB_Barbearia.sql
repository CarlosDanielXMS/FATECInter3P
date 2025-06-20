CREATE DATABASE ProjetoInter

CREATE TABLE Cliente (
	id			INT				NOT NULL IDENTITY,
	nome		VARCHAR(50)		NOT NULL,
	telefone	VARCHAR(11)		NOT NULL,
	email		VARCHAR(30),
	senha		VARCHAR(20),
	status		SMALLINT		NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(telefone, email),
	CHECK (LEN(senha) > 8),
	CHECK (status IN (1, 2))
)

CREATE TABLE Profissional (
	id				INT				NOT NULL IDENTITY,
	nome			VARCHAR(50)		NOT NULL,
	telefone		VARCHAR(11)		NOT NULL,
	email			VARCHAR(30),
	senha			VARCHAR(20),
	salarioFixo		SMALLMONEY		NOT NULL,
	comissao		DECIMAL(10,2)	NOT NULL,
	status			SMALLINT		NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(telefone, email),
	CHECK (salarioFixo > 0),
	CHECK (comissao >= 0),
	CHECK (LEN(senha) > 8),
	CHECK (status IN (1, 2))
)

CREATE TABLE Servico (
	id			INT				NOT NULL IDENTITY,
	descricao	VARCHAR(50)		NOT NULL,
	valor		MONEY			NOT NULL,
	tempoMedio	INT				NOT NULL,
	status		SMALLINT		NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(descricao),
	CHECK (valor > 0),
	CHECK (tempoMedio > 0),
	CHECK (status IN (1, 2))
)

CREATE TABLE Agenda (
	id			INT			NOT NULL IDENTITY,
	idCliente	INT			NOT NULL,
	dataHora	DATETIME2	NOT NULL,
	tempoTotal  INT			NOT NULL,
	valorTotal	MONEY		NOT NULL,
	status		SMALLINT	NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (idCliente) REFERENCES Cliente,
	CHECK (tempoTotal >= 0),
	CHECK (valorTotal >= 0),
	CHECK (status IN (1, 2, 3))
)

CREATE TABLE Servico_Agendado (
	idAgenda			INT				NOT NULL,
	idServico			INT				NOT NULL,
	idProfissional		INT				NOT NULL,
	valor				MONEY			NOT NULL,
	status				INT				NOT NULL,

	PRIMARY KEY (idAgenda, idServico, idProfissional),
	FOREIGN KEY (idAgenda) REFERENCES Agenda,
	FOREIGN KEY (idServico) REFERENCES Servico,
	FOREIGN KEY (idProfissional) REFERENCES Profissional,
	CHECK (valor >= 0),
	CHECK (status in (1, 2))
)

CREATE TABLE Catalogo (
	idProfissional		INT		NOT NULL,
	idServico			INT		NOT NULL,
	valor				MONEY,
	tempoMedio			INT,
	status				INT		NOT NULL,

	PRIMARY KEY(idProfissional, idServico),
	FOREIGN KEY (idServico) REFERENCES Servico,
	FOREIGN KEY (idProfissional) REFERENCES Profissional,
	CHECK (valor > 0),
	CHECK (tempoMedio > 0),
	CHECK (status IN (1, 2))
)

DROP TABLE Agenda;
DROP TABLE Cliente;
DROP TABLE Profissional;
DROP TABLE Servico;
DROP TABLE Servico_Agendado;
DROP TABLE Catalogo;