SHOW TABLES;

CREATE VIEW vw_RelatorioGeralConsultas AS 
SELECT 
    consulta.dataHora,
    a.nomeAnimal,
    c.nomeCliente,
    veterinario.nomeVeterinario,
    tiposervico.nomeServico
FROM cliente c
INNER JOIN animal a
    ON a.idCliente = c.idCliente
INNER JOIN consulta 
    ON a.idAnimal = consulta.idAnimal
INNER JOIN veterinario
    ON consulta.idVeterinario = veterinario.idVeterinario
INNER JOIN consultatiposervico 
    ON consultatiposervico.idConsulta = consulta.idConsulta
INNER JOIN tiposervico
    ON tiposervico.idTipoServico = consultatiposervico.idTipoServico;
    
SELECT *FROM vw_RelatorioGeralConsultas
ORDER BY nomeVeterinario, dataHora ASC;
    
SELECT nomeAnimal, nomeservico, nomeVeterinario
FROM vw_relatoriogeralconsultas
WHERE nomeServico='Microchipagem'

SELECT * FROM vw_relatoriogeralconsultas

/*Criação e Uso de Stored Procedure
exibiçao de dados  */

CREATE PROCEDURE ps_RelatorioConsultasPorProcedimento
(
IN procedimento VARCHAR(50)
)
SELECT nomeAnimal, nomeservico, nomeVeterinario
FROM vw_relatoriogeralconsultas
WHERE nomeServico=procedimento



/*Criação e Uso de Stored Procedure
Alteração de dados*/

CREATE PROCEDURE pi_tipoServico
(
IN _nomeServico VARCHAR(50),
IN _valor DECIMAL(10,2)
)
INSERT INTO tiposervico (nomeServico,valor)
VALUES(_nomeServico, _valor)

CALL pi_tipoServico('Raio X',200.00)

SELECT * FROM tiposervico

/*Criar uma view que traga a data da consulta
o nome do pet, o nome do cliente e seu telefone*/

SELECT * FROM consulta 
SELECT * FROM contatotelefonico 

CREATE VIEW vw_informacaoConsulta AS
SELECT 
    consulta.dataHora,
    a.nomeAnimal,
    c.nomeCliente,
    CONCAT(ct.ddi, ' ', ct.ddd, ' ', ct.numero) AS telefone
FROM cliente c
INNER JOIN animal a
    ON a.idCliente = c.idCliente
INNER JOIN consulta 
    ON a.idAnimal = consulta.idAnimal
INNER JOIN contatotelefonico ct
    ON ct.idCliente = c.idCliente;

SELECT * FROM vw_informacaoconsulta

/*OBS:Concat: cocatenar: juntar as informações*/
                     
							/**/
                     
/*Criar uma procedure que traga o nome de todos os
pets, o nome do cliente, e telefone, de acordo
com o tipo de animal. Ex.: Cachorro, Gato, etc... */

CREATE PROCEDURE ps_PetsPorEspecie
(
IN _especie VARCHAR(50)
)
SELECT 
    a.nomeAnimal,
    c.nomeCliente,
    CONCAT(ct.ddi, ' ', ct.ddd, ' ', ct.numero) AS telefone
FROM animal a
INNER JOIN cliente c
    ON a.idCliente = c.idCliente
INNER JOIN contatotelefonico ct
    ON ct.idCliente = c.idCliente
WHERE a.especie = _especie;

CALL ps_PetsPorEspecie('Cachorro')
CALL ps_PetsPorEspecie('Gato')

SELECT * FROM animal