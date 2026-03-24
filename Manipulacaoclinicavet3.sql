USE clinicavetfrann

SHOW TABLES;

/* Buscar dados em determinada tabela */

SELECT * FROM cliente;

SELECT nomeCliente, celular, email FROM cliente;

SELECT idCliente, nomeCliente FROM cliente
WHERE idCliente BETWEEN 1 AND 3;

SELECT idCliente, nomeCliente FROM cliente
WHERE idCliente >= 1 AND idCliente <= 3;

SELECT nomeCliente FROM cliente
WHERE nomeCliente = 'Juca';

SELECT nomeCliente FROM cliente
WHERE nomeCliente LIKE 'Ju%';

SELECT nomeCliente FROM cliente
WHERE nomeCliente LIKE '%inha%';

/* Inserir dados em determinada tabela */

INSERT INTO cliente
(nomeCliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51'),
('Mariazinha Simões', '99900011122', 'mariasimoes@bol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51');

INSERT INTO cliente
(nomeCliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51');

/* Atualizar dados em determinada tabela */

UPDATE cliente
SET celular = '13998776655'
WHERE idCliente = 1;

UPDATE cliente
SET celular = '13955678897'
WHERE idCliente = 2;

INSERT INTO cliente
(nomeCliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES
('Pedro Fonseca','88799855687','Pedrocaseca@uol.com.br','Cubatão','SP','22234523','Av','Das Flores','44','apto.33'),
('Karina Fondeladre','88799844687','Karinaholl@uol.com.br','Rio de Janeiro','RJ','22223523','Av','Dos Tiroteios','21',NULL);

UPDATE cliente
SET celular = '1355667756'
WHERE idCliente = 3;

UPDATE cliente
SET celular = '44966778899'
WHERE idCliente = 4;

UPDATE cliente
SET celular = '12944556677', email = 'PedroFonseca2@gmail.com'
WHERE idCliente = 3;

/* Busca com filtros */

SELECT nomeCliente, email, cidade FROM cliente
WHERE cidade = 'Santos' OR cidade = 'Cubatão';

/* Lista ordenada */

SELECT nomeCliente, cidade FROM cliente
ORDER BY nomeCliente;

/* Trazer os clientes de SP em ordem alfabética */

SELECT nomeCliente, cidade, estado FROM cliente
WHERE estado = 'SP'
ORDER BY nomeCliente;

/* Excluir dados de determinada tabela */

DELETE FROM cliente
WHERE idCliente > 3 AND idCliente < 4;

ALTER TABLE contatotelefonico
MODIFY idContatoTelefonico INT NOT NULL AUTO_INCREMENT;

INSERT INTO contatotelefonico
(idCliente, ddi, ddd, numero)
VALUES
(1,'55','13','998776655'),
(2,'55','13','955678897'),
(3,'55','12','944556677');

DELETE FROM contatotelefonico;

SELECT * FROM contatotelefonico;

SELECT nomeCliente, cidade, estado FROM cliente;

SELECT * FROM cliente;

SELECT * FROM contatotelefonico;

SELECT nomeCliente, ddi, ddd, contatotelefonico.numero
FROM cliente
INNER JOIN contatotelefonico
ON cliente.idCliente = contatotelefonico.idCliente;

SELECT * FROM animal;

SELECT * FROM cliente;

INSERT INTO animal (idCliente, nomeanimal, especie,
raca, peso, porte, sexo, anoNascimento)
VALUES 
(1,'Bidu','Cachorro','Beagle',12.3,'M','M',2020),
(2,'Penélope','Gato','Frajola',8.82,'M','F',2021),
(2,'Tom','Gato','Frajola',9.22,'M','M',2019),
(4,'Cofap','Cachorro','Basset',9.11,'P','M',2018);
 
 SELECT * from animal

/* FAZER OS VETERINARIOS*/

SELECT * FROM veterinario 

INSERT INTO veterinario
(nomeVeterinario, crmv, celular, especialidade)
VALUES 
('Beatriz Costa', '12345SP','13988745265','Cirurgia Veterinaria'),
('Agamenom Mendes','54321RJ', '219854615322', 'Ortopedia Veterinaria'),
('José Manuel Lopez', '54874SP', '1398565412', 'Cardiologia Veterinaria');

INSERT INTO veterinario
(nomeVeterinario, crmv, celular, especialidade)
VALUES
('Gabriel da Silva', '13076/SP', '13996676512', 'Patologia Veterinaria'),
('Pamela Silveira', '32013/SP', '11991376982', 'Cirugia Veterinaria'),
('Bruna Gomes', '60491/BA', '85996676512', 'Dermatologia Veterinaria');

UPDATE veterinario
SET nomeVeterinario = 'José Manuel Lopez Mendoza'
WHERE idveterinario = '3'
                              /**/
										
/*Fazer tipo serviço*/


INSERT INTO tipoServico  ( nomeServico , valor )
VALUES 
( 'Banho/Tosa' , 90.00),
( 'Castração' , 200.00),
( 'Vacina' , 150.00),
( 'MicroChipagem' , 300.00),
( 'Ultrasom', 350.00);

SELECT * FROM tipoServico
                              
DROP TABLE tiposervico  
                                 /**/
/* fazendo do insert consulta*/

SELECT * FROM animal 

SELECT * FROM veterinario

SELECT * FROM consulta

 DROP TABLE 

UPDATE animal
SET nomeAnimal = 'Bidu'
WHERE idAnimal = '1'

DELETE FROM animal
WHERE nomeAnimal = 'Bidu'

SELECT * FROM animal 
SELECT * FROM consulta

INSERT INTO consulta 
(idAnimal, idVeterinario, datahora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
(
(SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),
1,
NOW(),
1,
'Cartão',
1,
150.00,
150.00
);



SELECT * FROM consultatiposervico
SELECT * FROM tiposervico

INSERT INTO consultatiposervico 
( idconsulta,idtipoServico, valorServico)
VALUES
(9,1,90.00);
(10,3,150.00)
           /**/
			  SELECT * FROM consulta 
INSERT INTO consulta (idanimal, idVeterinario, datahora, pago, formapagto, qtdvezes, valortotal, valorpago)
VALUES
(13, 2, '2026-03-10 14:30:00', 0, 'Dinheiro', '0', 90.00, NULL),
(14, 2, '2026-01-25 09:00:00', 1, 'Pix', '0', 150.00, 150.00), 
(15, 2, '2026-03-29 18:00:00', 0, 'Crédito', '2', 300.00, NULL);

INSERT INTO consultatiposervico (idconsulta,idtiposervico, valorservico)
VALUES
(3, 1, 90.00), 
(4, 3, 150.00), 
(5, 4, 300.00)			    
                           /**/

INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
(2, 3, '2026-03-03 10:00', 1, 'PIX', 1, 350.00, 350.00),
(3, 3, '2026-03-04 12:00', 1, 'Credito', 2, 150.00, 150.00)
INSERT INTO consultatiposervico(idConsulta, idTipoServico, valorServico)
VALUES
(6, 5, 350.00),
(7, 3, 150.00)
                               /**/

insert into consulta(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtVezes, valorTotal, valorPago)

values

(1,1,'2026-03-14 13:00:00', 'S','dinheiro',1,'300.00','300.00'),

(2,3,'2026-03-14 16:30:00', 'S','credito',3,'300.00','300.00'),

(3,3,'2026-03-17 08:10:00', 'S','pix',1,'150.00','150.00');
 
insert into consultatiposervico(idConsulta, valorServico, idTipoServico)

values

(8,'300.00',4),

(9,'300.00',4),

(10,'150.00',3)
                                 /**/
SELECT consulta.dataHora,
a.nomeAnimal,
c.nomeCliente,
veterinario.nomeVeterinario
FROM cliente c
INNER JOIN animal a
ON c.idCliente = a.idcliente
INNER JOIN consulta
ON a.idAnimal = consulta.idAnimal
INNER JOIN veterinario
ON consulta.idVeterinario = veterinario.idVeterinario 


                                        /**/
                                        








