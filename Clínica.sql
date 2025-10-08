
CREATE DATABASE Clinica;
USE Clinica;

CREATE TABLE Paciente(
	Num_Beneficiário 			int,
	Nome 						varchar(100),
    Logradouro					varchar(200),
    Número 						int,
    CEP 						char(8),
    Complemento 				varchar(255),
    Telefone 					varchar(11),
    PRIMARY KEY (Num_Beneficiário)
);

CREATE TABLE Médico(
	Código 						int,
    Nome 						varchar(100),
    Logradouro 					varchar(200),
    Numero 						int,
    CEP 						char(8),
    Complemento 				varchar(255),
    Contato 					varchar(11),
    EspecialidadeID				int,
    PRIMARY KEY (Código),
    FOREIGN KEY (EspecialidadeID) REFERENCES Especialidade(ID)
);

CREATE TABLE Especialidade(
	ID 							int,
    Especialidade 				varchar(100),
    PRIMARY KEY (ID)
);

CREATE TABLE Consulta(
	PacienteNum_Beneficiário	int,
    MédicoCódigo 				int,
	Data_hora 					datetime,
    Observação 					varchar(255),
    PRIMARY KEY (Data_hora),
    FOREIGN KEY (PacienteNum_Beneficiário) REFERENCES Paciente(Num_Beneficiário),
    FOREIGN KEY (MédicoCódigo) REFERENCES Médico(Código)
);

INSERT INTO Paciente VALUES (
	-- 99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', 922229999
    -- 99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', 9234450987
    -- 99903, 'Maria Elisa', 'Av. Águia de Haia', 1188, '06987020', 'Apto 1208', 912348765
    -- 99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', 945674312
    -- 99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', 912095674
);

INSERT INTO Médico VALUES (
	-- 100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', 915689456, 1
	-- 100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', 923235454, 1
    -- 100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', 963698585, 2
    -- 100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', 932458745, 3
);

INSERT INTO Especialidade VALUES (
	-- 1, 'Otorrinolaringologista'
    -- 2, 'Urologista'
    -- 3, 'Geriatra'
    -- 4, 'Pediatra'
);

INSERT INTO Consulta VALUES (
	-- 99901, 100002,'2021-09-04 13:20','Infecção Urina'
    -- 99902, 100003,'2021-09-04 13:15','Gripe'
    -- 99901, 100001,'2021-09-04 12:30','infecção Garganta'
);

ALTER TABLE Médico 
ADD dia_atendimento varchar(13);

UPDATE Médico
SET dia_atendimento = 'Segunda-Feira'
WHERE Código = 100001;

UPDATE Médico
SET dia_atendimento = 'Segunda-Feira'
WHERE Código = 100003;

UPDATE Médico
SET dia_atendimento = 'Quarta-Feira'
WHERE Código = 100002;

UPDATE Médico
SET dia_atendimento = 'Quinta-Feira'
WHERE Código = 100004;

DELETE FROM Especialidade
WHERE ID = 4;

UPDATE Médico
SET Logradouro = 'Av. Bras Leme', Numero = 876, CEP = '02122000', Complemento = 'Apto 504'
WHERE Código = 100003;


 ALTER TABLE Consulta
 ALTER COLUMN Observação varchar(200);


SELECT * FROM Paciente;
SELECT * FROM Médico;
SELECT * FROM Especialidade;
SELECT * FROM Consulta;
