CREATE DATABASE hospital;
USE hospital;

-- Tabelas novas

CREATE TABLE Tipo_Quarto (
    id_tipo_quarto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

CREATE TABLE Quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    id_tipo_quarto INT,
    FOREIGN KEY (id_tipo_quarto) REFERENCES Tipo_Quarto(id_tipo_quarto)
);

CREATE TABLE Enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    coren VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Internacao (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    id_paciente INT,
    id_medico_responsavel INT,
    id_quarto INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico_responsavel) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto)
);

CREATE TABLE Internacao_Enfermeiro (
    id_internacao INT,
    id_enfermeiro INT,
    PRIMARY KEY (id_internacao, id_enfermeiro),
    FOREIGN KEY (id_internacao) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (id_enfermeiro) REFERENCES Enfermeiro(id_enfermeiro)
);

-- Supondo que as tabelas Paciente e Medico já existem no modelo anterior
