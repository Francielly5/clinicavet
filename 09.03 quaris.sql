/* Criar tabelas com PK */
CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL,
email VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8),
tipoLogradouro VARCHAR(15) NOT NULL, 
nomeLogradouro VARCHAR(60) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(30)
)



/*exclui a tabela e respectivos dados*/
DROP TABLE cliente

/*Criando tabela sem FK */ 
CREATE TABLE contatoTelefonico (
idContatoTelefonico INT PRIMARY KEY, 
idcliente INT NOT NULL, /*deveria ser FK*/ 
ddi VARCHAR(5) NOT NULL,
ddd VARCHAR(5) NOT NULL,
numero CHAR(9) NOT NULL
)

/*Alterando a tabela anterior adicionando a FK*/
ALTER TABLE contatotelefonico
ADD CONSTRAINT ck_contatoTelefonico_Cliente
FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
 
/*Criando tabela com FK*/
CREATE TABLE Animal(
idAnimal INT PRIMARY KEY AUTO_INCREMENT,
idcliente INT NOT NULL, 
nomeAnimal VARCHAR(50) NOT NULL,
especie VARCHAR(50) NOT NULL,
raca VARCHAR(50) NOT NULL,
peso DECIMAL(5,2),
porte CHAR(1), 
sexo CHAR(1),
anoNascimento INT NOT NULL,
CONSTRAINT ck_sexoAnimal CHECK (sexo='M' OR sexo='F'),
CONSTRAINT ck_porteAnimal CHECK (porte IN ('P','M','G')),
CONSTRAINT fk_Animal_Cliente FOREIGN KEY (idcliente) 
REFERENCES cliente(idcliente)
)

CREATE TABLE TipoServico(
idTipoServico INT PRIMARY KEY AUTO_INCREMENT,
nomeServico VARCHAR(50) NOT NULL,
valor DECIMAL(10,2) NOT NULL
)

CREATE TABLE Veterinario(
idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
nomeVeterinario VARCHAR(50) NOT NULL,
crmv VARCHAR(20) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL,
especialidade VARCHAR(50)
)

CREATE TABLE Consulta (
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idAnimal INT NOT NULL,
idVeterinario INT NOT NULL,
dataHora DATETIME NOT NULL,
pago BIT NOT NULL, /*0 ou 1*/
formaPagto VARCHAR(50) NOT NULL,
qtdVezes TINYINT,
valorTotal DECIMAL(10,2) NOT NULL,
valorPago DECIMAL(10,2),
CONSTRAINT fk_Consulta_Animal FOREIGN KEY (idAnimal)
REFERENCES animal(idAnimal),
CONSTRAINT fk_Consulta_Veterinario FOREIGN KEY (idVeterinario)
REFERENCES veterinario(idVeterinario),
CONSTRAINT ck_qtdVezes CHECK 
(qtdVezes IN (1,2,3,4,5,6,7,8,9,10)),
CONSTRAINT ck_formaPgto CHECK 
(formaPagto IN ('DINHEIRO','PIX','DÉBITO','CRÉDITO','OUTROS'))
)

CREATE TABLE ConsultaTipoServico(
idConsultaTipoServico INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idtipoServico INT NOT NULL,
valorServico DECIMAL(10,2),
CONSTRAINT fk_ConsultaTipoServico_tipoServico FOREIGN KEY 
(idtipoServico) REFERENCES tipoServico(idtipoServico),
CONSTRAINT fk_ConsultaTipoServico_Consulta FOREIGN KEY 
(idConsulta) REFERENCES Consulta(idConsulta)
)

SHOW TABLES 

/*foram criadas as tabelas a cima*/ 


CREATE DATABASE clinicavet;

CREATE TABLE animal;
 
SHOW TABLES;
 
SELECT * FROM animal;

SELECT * FROM cliente;

SELECT*FROM veterinario;
 
INSERT INTO cliente 

(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)

VALUES 

('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',

'Santos', 'SP', '1311077888','Rua', 'das Margaridas', '50', 'ap.51'),

('Mariazinha Simões', '99900011122', 'mariasimoes@bol.com.br',

'Santos', 'SP', '1311077888','Rua', 'das Margaridas', '50', 'ap.51');
 
 
INSERT INTO animal (idCliente, nomeanimal, especie,

raca, peso, porte, sexo, anoNascimento)

VALUES 

(1,'Bidu','Cachorro','Beagle',12.3,'M','M',2020),

(2,'Penélope','Gato','Frajola',8.82,'M','F',2021),

(2,'Tom','Gato','Frajola',9.22,'M','M',2019),

(1,'Cofap','Cachorro','Basset',9.11,'P','M',2018);
 
 
INSERT INTO veterinario

(nomeVeterinario,crmv,celular,especialidade)

VALUES

('Beatriz Costa', '12345SP','13988745265','Cirurgia Veterinaria'),

('Agamenom Mendes','54321RJ', '219854615322', 'Ortopedia Veterinaria'),

('José Manuel Lopez', '54874SP', '1398565412', 'Cardiologia Veterinaria');
 
 SELECT * FROM veterinario 
 
INSERT INTO tipoServico (nomeServico , valor)

SELECT * FROM tiposervico 
VALUES 

('Banho/Tosa' , 90.00),

('Castração' , 200.00),

('Vacina' , 150.00),

('MicroChipagem' , 300.00),

('Ultrasom', 350.00);
 
INSERT INTO consulta

(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)

VALUES((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,

NOW(),1,'Cartão',1,150.00,150.00);
 
INSERT INTO consulta

(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)

VALUES((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,NOW(),1,'Pix',1,90.00,90.00);
 
INSERT INTO consultatiposervico 

(idconsulta, idTipoServico, valorServico)

VALUES

(1,3,150.00),

(2,1,90.00);
 


SELECT * FROM consultatiposervico 


SHOW TABLES
 
SELECT * FROM consultatiposervico 
SELECT * FROM consulta
SELECT*FROM consulta
 SELECT * FROM veterinario 
 
INSERT INTO consulta (idAnimal, idVeterinario, datahora, pago, formapagto, qtdvezes, valortotal, valorpago)

VALUES

(1, 2, '2026-03-10 14:30:00', 0, 'Dinheiro', '0', 90.00, NULL),

(2, 2, '2026-01-25 09:00:00', 1, 'Pix', '0', 150.00, 150.00), 

(3, 2, '2026-03-29 18:00:00', 0, 'Crédito', '2', 300.00, NULL);

SELECT * FROM consulta 
SELECT * FROM animal
 SELECT * FROM consultatiposervico
 select * FROM tiposervico
 
INSERT INTO consultatiposervico (idconsulta,idtiposervico, valorservico)

VALUES

(9, 1, 90.00), 

(10, 3, 150.00), 

(11, 4, 300.00);   /* */

SELECT * FROM consultatiposervico
SELECT *  FROM animal
SELECT * FROM consulta
 SELECT * FROM consultatiposervico
INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)

VALUES

(1, 3, '2026-03-03 10:00', 1, 'PIX', '0', 350.00, 350.00),

(2, 3, '2026-03-04 12:00', 1, 'Crédito', 2, 150.00, 150.00)

INSERT INTO consultatiposervico(idConsulta, idTipoServico, valorServico)

VALUES

(21, 5, 350.00),

(22, 3, 150.00);
 
insert into consulta(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
 
values
 
(1,1,'2026-03-14 13:00:00', 1,'dinheiro',1,'300.00','300.00'),
 
(2,3,'2026-03-14 16:30:00', 1,'credito',3,'300.00','300.00'),
 
(3,3,'2026-03-17 08:10:00', 1,'pix',1,'150.00','150.00');

insert into consultatiposervico(idConsulta,idTipoServico ,valorServico )
 
values
 
(26,4,'300.00'),
 
(27,4,'300.00'),
 
(28,3,'150.00');
       
       
                                 /***************************************/
                                 
SELECT consulta.datahora,
a.nomeAnimal,
c.nomeCliente,
veterinario.nomeVeterinario,
tiposervico.nomeservico
FROM cliente c
INNER JOIN animal a
ON c.idCliente = a.idCliente
INNER JOIN consulta 
ON a.idanimal = consulta.idAnimal
INNER JOIN veterinario
ON consulta.idVeterinario = veterinario.idVeterinario
INNER JOIN consultatiposervico
ON consultatiposervico.idConsulta = consulta.idConsulta
INNER JOIN tipoServico
ON tiposervico.idTipoServico = consultatiposervico.idTipoServico;


                                 /**************************************/
                                 
                                 
                              
/* Listar nome veterinário, data que consultou, animal atendido, considerando todos os veterinários;*/
select veterinario.nomeVeterinario,
consulta.dataHora,
animal.nomeAnimal
FROM veterinario
LEFT JOIN consulta
ON veterinario.idVeterinario = consulta.idVeterinario
left JOIN Animal 
ON animal.idAnimal = consulta.idAnimal

                                              /**********************************************/
                                              
/* Trazer a quantidade de consultas executadas na clínica ao longo de todo o período */

SELECT COUNT(idconsulta) AS 'Qtd de consultas'FROM consulta;

                                           /**********************************/
         
/* Trazer o serviço mais caro da clínica */

SELECT * FROM tiposervico
SELECT MAX(valor) FROM tiposervico


                                    /**************************************/
												
SELECT consulta.datahora,

a.nomeAnimal,

c.nomeCliente,

veterinario.nomeVeterinario,

tiposervico.nomeservico

FROM cliente c

INNER JOIN animal a

ON c.idCliente = a.idCliente

INNER JOIN consulta 

ON a.idanimal = consulta.idAnimal

INNER JOIN veterinario

ON consulta.idVeterinario = veterinario.idVeterinario

INNER JOIN consultatiposervico

ON consultatiposervico.idConsulta = consulta.idConsulta

INNER JOIN tipoServico

ON tiposervico.idTipoServico = consultatiposervico.idTipoServico;


/* Listar nome veterinário, data que consultou, animal atendido, considerando todos os veterinários;*/

select veterinario.nomeVeterinario,

consulta.dataHora,

animal.nomeAnimal

FROM veterinario

LEFT JOIN consulta

ON veterinario.idVeterinario = consulta.idVeterinario

left JOIN Animal 

ON animal.idAnimal = consulta.idAnimal

/* Trazer a quantidade de consultas executadas na clínica ao longo de todo o período */

SELECT COUNT(idconsulta) AS 'Qtd de consultas'FROM consulta;

/* Trazer o serviço mais caro da clínica */

SELECT * FROM tiposervico

SELECT MAX(valor) FROM tiposervico
                                           /********************************/
                                               
                                               
  /* Trazer o serviço mais barato da clínica */

  SELECT MIN(valor) FROM tipoServico
                                    
                                       /********************************/
																		 
/* Trazer a média dos valores dos serviços*/

SELECT AVG(valor) AS 'Média de valores' FROM tiposervico               
                                  
                                   /********************************/
                                   
/*Trazer o faturamento bruto da clínica*/

SELECT SUM(valorservico) AS 'faturamento' FROM consultatiposervico    

                                 /*****************************/
								  
/*Trazer a quantidade de consultas que ocorreram com cada animalzinho
Ex.: Bidu --------- 3 consultas
     Penélope ----- 2 consultas*/
	  
SELECT nomeAnimal, COUNT(idConsulta) AS 'Qtd de consultas'
FROM consulta
INNER JOIN  animal
ON consulta.idanimal = animal.idAnimal /* quando quero trazer apenas um da tabela*/
GROUP BY nomeAnimal /* quando quer todos da tabela, trazendo tambem ON, sendo apenas para um da tabela ou para ter todos*/


                            /********************************/
                                    
/*Trazer a quantidade de consultas que ocorreram com cada animalzinho
Ex.: Bidu --------- 3 consultas
     Penélope ----- 2 consultas
	  ordenado pela quantidade de consultas da maior quantidade para a menor*/
	  
SELECT nomeAnimal, COUNT(idConsulta) AS 'Qtd de consultas'
FROM animal left join consulta
ON consulta.idanimal = animal.idAnimal /* quando quero trazer apenas um da tabela*/
GROUP BY nomeAnimal /* quando quer todos da tabela, trazendo tambem ON, sendo apenas para um da tabela ou para ter todos*/
ORDER BY  COUNT(idconsulta) DESC 
                                  /******************************/
      
/*Trazer a quantidade de consultas que ocorreram com cada animalzinho
Ex.: Bidu --------- 3 consultas
     Penélope ----- 2 consultas
	  ordenado pela quantidade de consultas da maior quantidade para a menor
	  considerando apenas animais que tiveram mais que 3 consultas*/
	  
SELECT nomeAnimal, COUNT(idConsulta) AS 'Qtd de consultas'
FROM animal left join consulta
ON consulta.idanimal = animal.idAnimal /* quando quero trazer apenas um da tabela*/
GROUP BY nomeAnimal /* quando quer todos da tabela, trazendo tambem ON, sendo apenas para um da tabela ou para ter todos*/
HAVING COUNT(idconsulta)>3
ORDER BY  COUNT(idconsulta) DESC  