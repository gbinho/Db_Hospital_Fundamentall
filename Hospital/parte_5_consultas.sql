-- PARTE 5 - Consultas

-- 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio
SELECT *, (SELECT AVG(valor) FROM consultas WHERE YEAR(data) = 2020 OR convenio = 'sim') AS media_valor
FROM consultas
WHERE YEAR(data) = 2020 OR convenio = 'sim';

-- 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT * 
FROM internacoes
WHERE data_alta > data_prevista_alta;

-- 3. Receituário completo da primeira consulta registrada com receituário associado
SELECT r.* 
FROM receituarios r
JOIN consultas c ON r.id_consulta = c.id_consulta
ORDER BY c.data ASC
LIMIT 1;

-- 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas NÃO realizadas sob convênio)
-- Consulta de maior valor
SELECT * 
FROM consultas
WHERE convenio = 'nao'
ORDER BY valor DESC
LIMIT 1;

-- Consulta de menor valor
SELECT * 
FROM consultas
WHERE convenio = 'nao'
ORDER BY valor ASC
LIMIT 1;

-- 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação
SELECT i.*, q.numero_quarto, q.valor_diaria, 
       DATEDIFF(i.data_alta, i.data_entrada) AS dias_internado,
       (DATEDIFF(i.data_alta, i.data_entrada) * q.valor_diaria) AS total_internacao
FROM internacoes i
JOIN quartos q ON i.id_quarto = q.id_quarto;

-- 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT i.data_entrada, i.procedimento, q.numero_quarto
FROM internacoes i
JOIN quartos q ON i.id_quarto = q.id_quarto
WHERE q.tipo = 'apartamento';

-- 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data
SELECT p.nome AS paciente, c.data, c.especialidade
FROM consultas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data) < 18
  AND c.especialidade <> 'pediatria'
ORDER BY c.data;

-- 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”
SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada, i.procedimento
FROM internacoes i
JOIN pacientes p ON i.id_paciente = p.id_paciente
JOIN medicos m ON i.id_medico = m.id_medico
JOIN quartos q ON i.id_quarto = q.id_quarto
WHERE m.especialidade = 'gastroenterologia'
  AND q.tipo = 'enfermaria';

-- 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou
SELECT m.nome, m.crm, COUNT(c.id_consulta) AS total_consultas
FROM medicos m
LEFT JOIN consultas c ON m.id_medico = c.id_medico
GROUP BY m.id_medico;

-- 10. Todos os médicos que tenham "Gabriel" no nome
SELECT * 
FROM medicos
WHERE nome LIKE '%Gabriel%';

-- 11. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação
SELECT e.nome, e.cre, COUNT(ie.id_internacao) AS total_internacoes
FROM enfermeiros e
JOIN internacoes_enfermeiros ie ON e.id_enfermeiro = ie.id_enfermeiro
GROUP BY e.id_enfermeiro
HAVING COUNT(ie.id_internacao) > 1;
