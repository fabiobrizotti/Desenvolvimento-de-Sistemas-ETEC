-- Arquivo congregando os 10 micro-databases baseados no MDBD/3

-- ==============================================================
-- 1. SISTEMA DE CADASTRO DE ALUNOS
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe1_cadastro_alunos;
USE exe1_cadastro_alunos;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    serie VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(150) UNIQUE
);

-- ==============================================================
-- 2. SISTEMA DE PRODUTOS DE UMA LOJA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe2_produtos_loja;
USE exe2_produtos_loja;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- ==============================================================
-- 3. CLÍNICA MÉDICA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe3_clinica_medica;
USE exe3_clinica_medica;

CREATE TABLE especialidades (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    id_especialidade INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    FOREIGN KEY (id_especialidade) REFERENCES especialidades(id_especialidade)
);

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL
);

-- ==============================================================
-- 4. SISTEMA DE BIBLIOTECA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe4_biblioteca;
USE exe4_biblioteca;

CREATE TABLE leitores (
    id_leitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    ano_publicacao INT
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_leitor INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_leitor) REFERENCES leitores(id_leitor),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- ==============================================================
-- 5. SISTEMA DE LOJA ONLINE
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe5_loja_online;
USE exe5_loja_online;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data DATE NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- ==============================================================
-- 6. SISTEMA DE ACADEMIA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe6_academia;
USE exe6_academia;

CREATE TABLE planos (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    id_plano INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
);

CREATE TABLE instrutores (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE treinos_presencas (
    id_presenca INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_instrutor INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

-- ==============================================================
-- 7. APLICATIVO DE TRANSPORTE
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe7_app_transporte;
USE exe7_app_transporte;

CREATE TABLE motoristas (
    id_motorista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnh VARCHAR(20) UNIQUE NOT NULL,
    placa_carro VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE passageiros (
    id_passageiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    pagamento_padrao VARCHAR(50)
);

CREATE TABLE corridas (
    id_corrida INT AUTO_INCREMENT PRIMARY KEY,
    id_motorista INT NOT NULL,
    id_passageiro INT NOT NULL,
    origem VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_motorista) REFERENCES motoristas(id_motorista),
    FOREIGN KEY (id_passageiro) REFERENCES passageiros(id_passageiro)
);

CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_corrida INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    FOREIGN KEY (id_corrida) REFERENCES corridas(id_corrida)
);

-- ==============================================================
-- 8. SISTEMA DE EVENTOS
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe8_sistema_eventos;
USE exe8_sistema_eventos;

CREATE TABLE palestrantes (
    id_palestrante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_palestrante INT NOT NULL,
    nome_evento VARCHAR(200) NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_palestrante) REFERENCES palestrantes(id_palestrante)
);

CREATE TABLE participantes (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE inscricoes (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_participante INT NOT NULL,
    data_inscricao DATE NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_participante) REFERENCES participantes(id_participante)
);

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_inscricao INT NOT NULL,
    FOREIGN KEY (id_inscricao) REFERENCES inscricoes(id_inscricao)
);

CREATE TABLE certificados (
    id_certificado INT AUTO_INCREMENT PRIMARY KEY,
    id_inscricao INT NOT NULL,
    FOREIGN KEY (id_inscricao) REFERENCES inscricoes(id_inscricao)
);

-- ==============================================================
-- 9. SISTEMA ESCOLAR COMPLETO
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe9_sistema_escolar;
USE exe9_sistema_escolar;

CREATE TABLE anos_letivos (
    id_ano INT AUTO_INCREMENT PRIMARY KEY,
    ano YEAR NOT NULL
);

CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    nome_mat VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);

CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_ano INT NOT NULL,
    sala VARCHAR(10),
    FOREIGN KEY (id_ano) REFERENCES anos_letivos(id_ano)
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);

CREATE TABLE frequencias_notas (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(4, 2),
    faltas INT DEFAULT 0,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

-- ==============================================================
-- 10. PLATAFORMA DE STREAMING
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe10_streaming;
USE exe10_streaming;

CREATE TABLE planos_assinatura (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_plano INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos_assinatura(id_plano)
);

CREATE TABLE filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    duracao INT, -- minutos
    genero VARCHAR(50)
);

CREATE TABLE series (
    id_serie INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    qtd_temporadas INT DEFAULT 1
);

CREATE TABLE episodios (
    id_episodio INT AUTO_INCREMENT PRIMARY KEY,
    id_serie INT NOT NULL,
    titulo VARCHAR(200),
    temporada INT,
    FOREIGN KEY (id_serie) REFERENCES series(id_serie)
);

CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE historico_visualizacao (
    id_hist INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_filme INT,
    id_episodio INT,
    data_assistido DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
    FOREIGN KEY (id_episodio) REFERENCES episodios(id_episodio)
);
