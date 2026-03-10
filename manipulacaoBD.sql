/*Mostra tabelas existentes no BD*/
SHOW TABLES;

/*Buscar dados em determinada tabela */
SELECT * FROM cliente

SELECT nomeCliente, celular, email FROM cliente

SELECT idCliente, nomeCliente FROM cliente 
WHERE idcliente BETWEEN 1 AND 3

SELECT idCliente, nomeCliente FROM cliente 
WHERE idcliente>=1 AND idcliente<=3

SELECT nomeCliente FROM cliente
WHERE nomeCliente = 'Juquinha' /*Juquinha Simões*/

SELECT nomeCliente FROM cliente
WHERE nomeCliente LIKE 'Ju%'


ALTER TABLE cliente

ADD email VARCHAR (20) NOT NULL,
ADD cidade VARCHAR (20) NOT NULL,
ADD estado CHAR(10) NOT NULL,
ADD tipologradouro VARCHAR (30) NOT NULL,
ADD numero VARCHAR (100) NOT NULL,
ADD nomeLogradouro VARCHAR(30) NOT NULL,
ADD complemento VARCHAR (30)

ALTER TABLE cliente 

ADD cep CHAR (40) NOT NULL

/*Inserir dados em determinada*/
INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51'),
('Mariazinha Simões', '99900011122', 'mariasimoes@bol.com.br',
 'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51');
 
 INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51'),

/*Atualizar dados em determinada tabela*/
UPDATE cliente
SET celular='13988776655'
WHERE idcliente=1

UPDATE cliente
SET celular='13988776655'
WHERE idcliente=2

INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Elizabeth Alba', '85899723201', 'elizabeth32@uol.com.br',
'Cubatão', 'SP', '13077788','Rua', 'das Estrelas', '10', 'ap.40')

 INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Francesca', '89899921300', 'franbnt@uol.com.br',
'Rio de Janeiro', 'RJ', '11067678','Rua', 'do Pagode', '10', 'ap.55')

UPDATE cliente
SET nomeCliente ='Francesca Fonseca'
WHERE idcliente=4

/*Atualizar duas informações de qualquer cliente:
celular e email*/
UPDATE cliente
SET celular='1399087968',
    email='Elizabethseria@gmail.com'
    WHERE idcliente=3
    
/*Busca com filtros*/

SELECT nomeCliente, email, cidade, estado FROM cliente 
WHERE cidade ='Santos' OR cidade='Cubatão'

SELECT nomeCliente, email, cidade, estado FROM cliente 
WHERE estado ='SP'

/*Busca ordenada*/
SELECT nomeCliente, cidade FROM cliente
ORDER BY nomecliente DESC

SELECT nomeCliente, cidade FROM cliente
ORDER BY nomeCliente ASC

/*Trazer os clientes de SP em ordem alfabética por nome 
de A a Z*/

SELECT nomeCliente, estado FROM cliente
WHERE estado ='SP'
ORDER BY nomecliente
      
/*Excluir dados de determinada tabela*/

DELETE FROM cliente
WHERE estado='SP'

DELETE FROM cliente
WHERE cidade='Santos' OR cidade='Rio de Janeiro'

DELETE FROM cliente
WHERE idCliente>3 AND idcliente<4

DELETE FROM cliente
WHERE IdCliente=4









    