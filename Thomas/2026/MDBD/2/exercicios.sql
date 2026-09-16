-- ==========================================
-- EXERCÍCIO 1: LOJA DE ARTIGOS ESPORTIVOS
-- ==========================================
CREATE DATABASE IF NOT EXISTS loja_esportes;
USE loja_esportes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE produtos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    modelo VARCHAR(50),
    cor VARCHAR(30),
    tamanho VARCHAR(10)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    codigo_produto INT NOT NULL,
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE RESTRICT,
    FOREIGN KEY (codigo_produto) REFERENCES produtos (codigo) ON DELETE RESTRICT
);

-- ==========================================
-- EXERCÍCIO 2: CLÍNICA VETERINÁRIA
-- ==========================================
CREATE DATABASE IF NOT EXISTS clinica_vet;
USE clinica_vet;

CREATE TABLE tutores (
    id_tutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE animais (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_tutor INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50),
    idade INT,
    FOREIGN KEY (id_tutor) REFERENCES tutores (id_tutor) ON DELETE CASCADE
);

CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    id_tutor INT NOT NULL,
    data_consulta DATETIME NOT NULL,
    motivo TEXT NOT NULL,
    valor_cobrado DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES animais (id_animal) ON DELETE RESTRICT,
    FOREIGN KEY (id_tutor) REFERENCES tutores (id_tutor) ON DELETE RESTRICT
);

-- ==========================================
-- EXERCÍCIO 3: PLATAFORMA DE CURSOS ONLINE
-- ==========================================
CREATE DATABASE IF NOT EXISTS cursos_online;
USE cursos_online;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Ativa', 'Concluída', 'Cancelada') NOT NULL DEFAULT 'Ativa',
    forma_pagamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos (id_curso) ON DELETE RESTRICT
);
