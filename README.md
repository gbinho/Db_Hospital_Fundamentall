# Db_Hospital_Fundamentall
Atividade onde foi desenvolvido um banco de dados de um hospital.
Sistema de Banco de Dados para Hospital
Este projeto visa a construção de um sistema de banco de dados relacional para um hospital, abrangendo as funcionalidades de:

- Consultas médicas.

- Cadastro de pacientes, médicos, convênios.

- Emissão de receitas.

- Controle de internações.

- Gerenciamento de quartos e enfermagem.

✅ Parte 1 – Modelagem Inicial: Consultas
Requisitos:
- Cadastro de médicos (generalistas, especialistas, residentes), com múltiplas especialidades.

- Cadastro de pacientes e convênios.

- Registro de consultas médicas.

- Emissão informatizada de receitas.

![!\[Diagrama ER\](dia.png))](diagrama_pt1.png)

✅ Parte 2 – Expansão: Internações
Requisitos:
Controle das internações de pacientes.

- Gerenciamento de quartos, tipos e valores.

- Cadastro de profissionais de enfermagem.

- Associação entre médicos, pacientes, quartos e internações.

![!\[Diagrama ER\](dia.png))](diagrama_pt2.png)

PARTE 3 - Alimentando o banco de dados
Nesta etapa, realizamos o povoamento do banco de dados para o sistema hospitalar, seguindo as seguintes atividades:

- Inclusão de 10 médicos com diferentes especialidades.

- Registro de 7 especialidades, sendo elas: Pediatria, Clínica Geral, Gastrenterologia, Dermatologia, Cardiologia, Ortopedia e Neurologia.

- Cadastro de 15 pacientes.

- Registro de 20 consultas, realizadas entre 01/01/2015 e 01/01/2022:

- Alguns pacientes realizaram mais de uma consulta.

- Pelo menos 10 consultas possuem receituário com dois ou mais medicamentos.

- Inclusão de 4 convênios médicos, associados a 5 pacientes e 5 consultas.

- Criação da entidade de relacionamento entre médico e especialidade.

- Criação da entidade de relacionamento entre internação e enfermeiro.

- Ajuste da chave estrangeira entre convênio e médico.

- Inclusão de chaves estrangeiras dentro da tabela de internação (Médico e Paciente).

- Registro de 7 internações, ocorridas entre 01/01/2015 e 01/01/2022:

- Pelo menos 2 pacientes se internaram mais de uma vez.

- Cadastro de ao menos 3 tipos de quartos: Apartamentos, Quartos Duplos e Enfermaria, com valores diferentes.

- Inclusão de 10 profissionais de enfermagem, com cada internação associada a pelo menos 2 enfermeiros.

O povoamento dos dados garante que o banco esteja preparado para os testes e validação da viabilidade do sistema hospitalar.

✅ Modelo Entidade-Relacionamento (MER e DER)
O modelo ER foi projetado para refletir a estrutura lógica e física do sistema, contendo as seguintes entidades principais:

- Médico

- Especialidade

- Paciente

- Convênio

- Consulta

- Receita

- Internação

- Quarto

- Tipo de Quarto

- Enfermeiro


✅ Como usar
1. Clone o repositório.

2. Execute o script SQL script.sql no seu SGBD.

3. Visualize o diagrama no dbdiagram.io usando o código dbdiagram.txt.

