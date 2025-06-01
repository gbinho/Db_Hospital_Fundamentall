-- povoamento.sql
-- PARTE 3 - Alimentando o banco de dados

-- Inserção de Especialidades
INSERT INTO Especialidade (descricao) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Cardiologia'),
('Neurologia'),
('Ortopedia');

-- Inserção de Médicos
INSERT INTO Medico (nome, cpf, crm) VALUES
('Dr. João Silva', '12345678900', 'CRM001'),
('Dra. Maria Souza', '22345678900', 'CRM002'),
('Dr. Carlos Pereira', '32345678900', 'CRM003'),
('Dra. Fernanda Lima', '42345678900', 'CRM004'),
('Dr. Luiz Costa', '52345678900', 'CRM005'),
('Dra. Ana Rocha', '62345678900', 'CRM006'),
('Dr. Marcos Dias', '72345678900', 'CRM007'),
('Dra. Paula Mendes', '82345678900', 'CRM008'),
('Dr. Fábio Teixeira', '92345678900', 'CRM009'),
('Dra. Simone Barros', '10345678900', 'CRM010');

-- Relacionamento Médico x Especialidade
INSERT INTO Medico_Especialidade (id_medico, id_especialidade) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,1), (9,2), (10,3);

-- Inserção de Pacientes
INSERT INTO Paciente (nome, cpf, data_nascimento) VALUES
('Carlos Almeida', '11111111111', '1980-05-12'),
('Mariana Torres', '22222222222', '1992-08-25'),
('Fernanda Lopes', '33333333333', '1985-03-17'),
('Eduardo Castro', '44444444444', '1975-12-30'),
('Juliana Martins', '55555555555', '1990-11-11'),
('Ricardo Moreira', '66666666666', '1988-06-20'),
('Patrícia Ramos', '77777777777', '1995-09-14'),
('André Barbosa', '88888888888', '1983-04-05'),
('Beatriz Azevedo', '99999999999', '1979-07-22'),
('Tiago Ferreira', '10101010101', '2000-01-15'),
('Larissa Cardoso', '12121212121', '1997-03-23'),
('Lucas Nascimento', '13131313131', '1991-10-10'),
('Gabriela Cunha', '14141414141', '1987-02-02'),
('Rafael Gomes', '15151515151', '1993-05-19'),
('Isabela Pinto', '16161616161', '1984-12-01');

-- Inserção de Convênios
INSERT INTO Convenio (nome, cnpj) VALUES
('Saúde Total', '12345678000100'),
('Vida Plena', '22345678000100'),
('Bem Estar', '32345678000100'),
('Saúde Premium', '42345678000100');

-- Associações Paciente x Convênio
INSERT INTO Paciente_Convenio (id_paciente, id_convenio) VALUES
(1,1), (2,2), (3,3), (4,4), (5,1);

-- Inserção de Consultas
INSERT INTO Consulta (data_consulta, id_paciente, id_medico, descricao) VALUES
('2015-01-15', 1, 1, 'Consulta de rotina.'),
('2016-02-20', 2, 2, 'Avaliação dermatológica.'),
('2017-03-25', 3, 3, 'Exames de rotina.'),
('2018-04-30', 4, 4, 'Consulta para tratamento gástrico.'),
('2019-05-10', 5, 5, 'Consulta cardíaca.'),
('2020-06-15', 6, 6, 'Avaliação neurológica.'),
('2021-07-20', 7, 7, 'Consulta ortopédica.'),
('2021-08-25', 8, 8, 'Consulta pediátrica.'),
('2021-09-30', 9, 9, 'Avaliação clínica geral.'),
('2022-01-01', 10, 10, 'Exames dermatológicos.'),
('2016-02-20', 1, 3, 'Retorno para exames.'),
('2017-03-25', 2, 4, 'Acompanhamento gástrico.'),
('2018-04-30', 3, 5, 'Avaliação cardíaca.'),
('2019-05-10', 4, 6, 'Consulta neurológica.'),
('2020-06-15', 5, 7, 'Tratamento ortopédico.'),
('2021-07-20', 6, 8, 'Consulta pediátrica.'),
('2021-08-25', 7, 9, 'Exames clínicos.'),
('2021-09-30', 8, 10, 'Consulta dermatológica.'),
('2022-01-01', 9, 1, 'Consulta de rotina.'),
('2020-12-10', 10, 2, 'Exames gerais.');

-- Associações Consulta x Convênio
INSERT INTO Consulta_Convenio (id_consulta, id_convenio) VALUES
(1,1), (2,2), (3,3), (4,4), (5,1);

-- Inserção de Medicamentos e Receituários
INSERT INTO Medicamento (nome, descricao) VALUES
('Paracetamol', 'Analgésico e antitérmico'),
('Ibuprofeno', 'Anti-inflamatório e analgésico'),
('Omeprazol', 'Protetor gástrico'),
('Amoxicilina', 'Antibiótico'),
('Loratadina', 'Antialérgico');

-- Receituários em Consultas (10 com 2 ou + medicamentos)
INSERT INTO Receita (id_consulta, id_medicamento, dosagem) VALUES
(1, 1, '500mg'),
(1, 2, '400mg'),
(2, 3, '20mg'),
(3, 1, '500mg'),
(3, 4, '250mg'),
(4, 5, '10mg'),
(4, 2, '400mg'),
(5, 3, '20mg'),
(6, 1, '500mg'),
(6, 5, '10mg'),
(7, 2, '400mg'),
(8, 3, '20mg'),
(9, 4, '250mg'),
(10, 1, '500mg');

-- Tipos de Quarto
INSERT INTO Tipo_Quarto (descricao, valor_diaria) VALUES
('Apartamento', 300.00),
('Quarto Duplo', 200.00),
('Enfermaria', 100.00);

-- Quartos
INSERT INTO Quarto (numero, id_tipo_quarto) VALUES
('101', 1),
('102', 2),
('103', 3);

-- Profissionais de Enfermagem
INSERT INTO Enfermeiro (nome, cpf, coren) VALUES
('Carlos Enfermeiro', '11122233344', 'COREN001'),
('Maria Enfermeira', '22233344455', 'COREN002'),
('José Técnico', '33344455566', 'COREN003'),
('Ana Técnica', '44455566677', 'COREN004'),
('Pedro Enfermeiro', '55566677788', 'COREN005'),
('Juliana Técnica', '66677788899', 'COREN006'),
('Lucas Enfermeiro', '77788899900', 'COREN007'),
('Fernanda Técnica', '88899900011', 'COREN008'),
('Ricardo Enfermeiro', '99900011122', 'COREN009'),
('Patrícia Técnica', '00011122233', 'COREN010');

-- Internações
INSERT INTO Internacao (id_paciente, id_medico, id_quarto, data_entrada, data_prevista_alta, data_efetiva_alta, descricao_procedimentos) VALUES
(1, 1, 1, '2016-01-10', '2016-01-15', '2016-01-14', 'Cirurgia'),
(2, 2, 2, '2017-02-20', '2017-02-25', '2017-02-24', 'Tratamento clínico'),
(3, 3, 3, '2018-03-30', '2018-04-05', '2018-04-04', 'Exames'),
(1, 4, 1, '2019-04-15', '2019-04-20', '2019-04-19', 'Cirurgia'),
(2, 5, 2, '2020-05-10', '2020-05-15', '2020-05-14', 'Tratamento clínico'),
(3, 6, 3, '2021-06-20', '2021-06-25', '2021-06-24', 'Exames'),
(4, 7, 1, '2022-07-25', '2022-07-30', '2022-07-29', 'Observação');

-- Relacionamento Internação x Enfermeiro
INSERT INTO Internacao_Enfermeiro (id_internacao, id_enfermeiro) VALUES
(1,1),(1,2),
(2,3),(2,4),
(3,5),(3,6),
(4,7),(4,8),
(5,9),(5,10),
(6,1),(6,3),
(7,2),(7,4);

