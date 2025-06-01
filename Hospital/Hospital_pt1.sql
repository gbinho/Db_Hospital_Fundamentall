CREATE TABLE Especialidade (
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    rg VARCHAR(20),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    tipo ENUM('Generalista', 'Especialista', 'Residente') NOT NULL
);

CREATE TABLE Medico_Especialidade (
    id_medico INT,
    id_especialidade INT,
    PRIMARY KEY (id_medico, id_especialidade),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
);

CREATE TABLE Convenio (
    id_convenio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    tempo_carencia INT
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    rg VARCHAR(20),
    id_convenio INT,
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio)
);

CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    id_especialidade INT NOT NULL,
    valor DECIMAL(10,2),
    id_convenio INT,
    numero_carteira VARCHAR(50),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade),
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio)
);

CREATE TABLE Receita (
    id_receita INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    data_emissao DATE NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

CREATE TABLE Medicamento_Receita (
    id_medicamento_receita INT PRIMARY KEY AUTO_INCREMENT,
    id_receita INT NOT NULL,
    nome_medicamento VARCHAR(100) NOT NULL,
    quantidade VARCHAR(50),
    instrucoes_uso TEXT,
    FOREIGN KEY (id_receita) REFERENCES Receita(id_receita)
);

CREATE TABLE Tipo_Quarto (
    id_tipo_quarto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50),
    valor_diario DECIMAL(10,2)
);

CREATE TABLE Quarto (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    numeracao VARCHAR(10),
    id_tipo_quarto INT,
    FOREIGN KEY (id_tipo_quarto) REFERENCES Tipo_Quarto(id_tipo_quarto)
);

CREATE TABLE Internacao (
    id_internacao INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE NOT NULL,
    previsao_alta DATE,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_quarto INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto)
);

CREATE TABLE Enfermeiro (
    id_enfermeiro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    coren VARCHAR(20),
    id_internacao INT NOT NULL,
    FOREIGN KEY (id_internacao) REFERENCES Internacao(id_internacao)
);
