-- PARTE 4 - Alterando o banco de dados

-- 1. Adiciona a coluna 'em_atividade' na tabela de médicos.
ALTER TABLE medicos
ADD COLUMN em_atividade ENUM('sim', 'nao') DEFAULT 'sim';

-- 2. Atualiza ao menos dois médicos como inativos.
UPDATE medicos
SET em_atividade = 'nao'
WHERE id_medico IN (1, 2);

-- 3. Atualiza os demais médicos como ativos.
UPDATE medicos
SET em_atividade = 'sim'
WHERE id_medico NOT IN (1, 2);
