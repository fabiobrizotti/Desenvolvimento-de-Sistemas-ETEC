-- Criar Banco e Usar
CREATE DATABASE IF NOT EXISTS clinica_medica;
USE clinica_medica;

-- ====================================================================
-- TABELAS INDEPENDENTES
-- ====================================================================

CREATE TABLE convenios (
    id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE especialidades (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE salas (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    bloco VARCHAR(50)
);

CREATE TABLE exames (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor_cobrado DECIMAL(10, 2) NOT NULL
);

-- ====================================================================
-- TABELAS DEPENDENTES
-- ====================================================================

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_convenio INT NULL,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_convenio) REFERENCES convenios (id_convenio) ON DELETE SET NULL
);

CREATE TABLE prontuarios (
    id_paciente INT PRIMARY KEY,
    tipo_sanguineo VARCHAR(5) NOT NULL,
    alergias TEXT,
    observacoes TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente) ON DELETE CASCADE
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    id_especialidade INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_especialidade) REFERENCES especialidades (id_especialidade) ON DELETE RESTRICT
);

CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_sala INT NOT NULL,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    status ENUM('Agendada', 'Realizada', 'Cancelada') NOT NULL DEFAULT 'Agendada',
    FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente) ON DELETE RESTRICT,
    FOREIGN KEY (id_medico) REFERENCES medicos (id_medico) ON DELETE RESTRICT,
    FOREIGN KEY (id_sala) REFERENCES salas (id_sala) ON DELETE RESTRICT
);

CREATE TABLE consulta_exames (
    id_consulta INT NOT NULL,
    id_exame INT NOT NULL,
    resultado TEXT,
    data_realizacao DATE,
    PRIMARY KEY (id_consulta, id_exame),
    FOREIGN KEY (id_consulta) REFERENCES consultas (id_consulta) ON DELETE CASCADE,
    FOREIGN KEY (id_exame) REFERENCES exames (id_exame) ON DELETE RESTRICT
);

-- ====================================================================
-- MASSAS DE DADOS (INSERTS PARA TESTE E VALIDAÇÃO)
-- ====================================================================

-- 1. Populando Tabelas Base
INSERT INTO convenios (nome) VALUES
('Unimed'),
('Bradesco Saúde'),
('Amil');

INSERT INTO especialidades (nome) VALUES
('Cardiologia'),
('Ortopedia'),
('Pediatria');

INSERT INTO salas (numero, bloco) VALUES
('101', 'Bloco A'),
('102', 'Bloco A'),
('201', 'Bloco B');

INSERT INTO exames (nome, valor_cobrado) VALUES
('Hemograma Completo', 50.00),
('Eletrocardiograma', 150.00),
('Raio-X de Tórax', 80.00);

-- 2. Populando Pacientes (Massa com e sem convenio)
INSERT INTO pacientes (id_convenio, nome, cpf, data_nasc, telefone) VALUES
(1, 'Maria Silva', '12345678901', '1985-05-20', '11999998888'),
(2, 'João Souza', '10987654321', '1990-10-15', '11988887777'),
(NULL, 'Ana Paula', '11122233344', '2005-02-10', '11777776666');

-- 3. Populando Prontuários (1:1 com pacientes)
INSERT INTO prontuarios (id_paciente, tipo_sanguineo, alergias, observacoes) VALUES
(1, 'O+', 'Dipirona', 'Paciente hipertensa controlada'),
(2, 'A-', NULL, 'Nenhuma observação relevante'),
(3, 'AB+', 'Frutos do mar', 'Asma na infância');

-- 4. Populando Médicos
INSERT INTO medicos (id_especialidade, nome, crm) VALUES
(1, 'Dr. Carlos Mendes', 'CRM-SP-12345'),
(2, 'Dr. Roberto Alves', 'CRM-SP-54321'),
(3, 'Dra. Fernanda Gomes', 'CRM-SP-99887');

-- 5. Populando Consultas
INSERT INTO consultas (id_paciente, id_medico, id_sala, data_consulta, hora_consulta, status) VALUES
(1, 1, 1, '2023-11-10', '09:00:00', 'Realizada'),
(2, 2, 3, '2023-11-12', '14:30:00', 'Realizada'),
(3, 3, 2, '2023-11-20', '10:00:00', 'Agendada'),
(1, 1, 1, '2023-12-05', '09:00:00', 'Agendada'),
(2, 1, 1, '2023-11-01', '11:00:00', 'Cancelada');

-- 6. Populando Tabela Associativa de Exames
-- Exame para a primeira consulta (Dr. Carlos pediu o Hemograma e o Eletro à paciente Maria)
INSERT INTO consulta_exames (id_consulta, id_exame, resultado, data_realizacao) VALUES
(1, 1, 'Tudo dentro dos padrões normais', '2023-11-12'),
(1, 2, 'Ritmo cardíaco sinusal normal', '2023-11-12');

-- Exame para a segunda consulta (Dr. Roberto pediu o Raio-X ao paciente João)
INSERT INTO consulta_exames (id_consulta, id_exame, resultado, data_realizacao) VALUES
(2, 3, 'Sem fraturas visíveis ou lesões aparentes', '2023-11-13');
