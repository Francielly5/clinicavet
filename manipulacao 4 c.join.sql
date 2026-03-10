/*Listar 
data consulta 
Nome Animal
Nome Cliente
Nome do Veterinario de todas as consultas realizadas*/

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