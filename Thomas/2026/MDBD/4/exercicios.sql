-- ==============================================================
-- 1. SISTEMA DE BIBLIOTECA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe1_biblioteca;
USE exe1_biblioteca;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- ==============================================================
-- 2. ESCOLA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe2_escola;
USE exe2_escola;

CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE atribuicoes (
    id_professor INT NOT NULL,
    id_disciplina INT NOT NULL,
    PRIMARY KEY (id_professor, id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

-- ==============================================================
-- 3. LOJA VIRTUAL
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe3_loja;
USE exe3_loja;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- ==============================================================
-- 4. CLÍNICA MÉDICA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe4_clinica;
USE exe4_clinica;

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_consulta DATETIME NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

-- ==============================================================
-- 5. SISTEMA DE FUNCIONÁRIOS (1:1)
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe5_funcionarios;
USE exe5_funcionarios;

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE crachas (
    id_cracha INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL UNIQUE,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario) ON DELETE CASCADE
);

-- ==============================================================
-- 6. FACULDADE
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe6_faculdade;
USE exe6_faculdade;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_efetivacao DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- ==============================================================
-- 7. SISTEMA DE VENDAS
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe7_vendas;
USE exe7_vendas;

CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL, -- Chave mapeada ficando do lado "N"
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

-- ==============================================================
-- 8. PLATAFORMA DE STREAMING
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe8_streaming;
USE exe8_streaming;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

-- Entidade gerada para registrar o histórico
CREATE TABLE historico_visualizacao (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_filme INT NOT NULL,
    data_assistido DATETIME NOT NULL,
    minuto_parado INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

-- ==============================================================
-- 9. OFICINA MECÂNICA
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe9_oficina;
USE exe9_oficina;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- ==============================================================
-- 10. SISTEMA DE PEDIDOS COM ENTREGA (1:1 condicional)
-- ==============================================================
CREATE DATABASE IF NOT EXISTS exe10_pedidos;
USE exe10_pedidos;

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATETIME NOT NULL
);

CREATE TABLE entregas (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    codigo_rastreio VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);
