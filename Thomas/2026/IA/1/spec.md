# Specification — Sistema Escolar

---

## 1. Nome do Projeto
**EduManager** — Sistema de Gerenciamento Escolar

---

## 2. Objetivo
Centralizar e automatizar a gestão acadêmica de uma escola, permitindo o controle de alunos, professores, turmas, disciplinas e notas em uma única plataforma web.

---

## 3. Problema
Escolas dependem de planilhas, cadernos e processos manuais para controlar matrículas, frequência e notas. Isso gera erros, retrabalho e dificuldade de acesso às informações por parte de professores e coordenadores.

---

## 4. Público-alvo
- Coordenadores pedagógicos
- Professores
- Secretaria escolar

---

## 5. Personas

| Persona | Perfil | Necessidade |
|---|---|---|
| **Coordenador** | Gestor da escola, acesso total | Visualizar desempenho geral, gerenciar usuários |
| **Professor** | Responsável por disciplinas | Lançar notas e registrar frequência da turma |
| **Secretaria** | Apoio administrativo | Matricular alunos, cadastrar turmas e disciplinas |

---

## 6. Funcionalidades

- Cadastrar, editar, excluir e pesquisar **alunos**
- Cadastrar, editar, excluir e pesquisar **professores**
- Cadastrar, editar, excluir **turmas** e **disciplinas**
- Associar professores a disciplinas/turmas
- Matricular alunos em turmas
- Registrar e consultar **notas** por aluno/disciplina
- Registrar e consultar **frequência** por aluno/aula
- Gerar **relatório de desempenho** por aluno e por turma
- Controle de acesso por perfil (Coordenador, Professor, Secretaria)
- Login e logout com autenticação

---

## 7. Fluxo do Sistema

```
Login → Dashboard (visão geral)
  ├── Secretaria: Aluno > Cadastro/Matrícula | Turmas | Disciplinas
  ├── Professor: Turma > Lançar Notas | Registrar Frequência
  └── Coordenador: Relatórios | Gestão de Usuários
```

---

## 8. Regras de Negócio

1. Não permitir cadastro de aluno duplicado (mesmo CPF ou matrícula).
2. Um aluno só pode ser matriculado em uma turma por período/ano letivo.
3. Notas devem estar no intervalo de **0 a 10**.
4. Apenas **Coordenador** pode excluir registros de alunos e professores.
5. Professor só pode lançar notas nas disciplinas às quais está vinculado.
6. Frequência mínima para aprovação: **75%**.
7. Aluno só é aprovado se média final ≥ **5,0** e frequência ≥ **75%**.

---

## 9. Requisitos Funcionais (RF)

| ID | Requisito |
|---|---|
| RF01 | O sistema deve permitir CRUD completo de alunos |
| RF02 | O sistema deve permitir CRUD completo de professores |
| RF03 | O sistema deve permitir CRUD de turmas e disciplinas |
| RF04 | O sistema deve permitir a matrícula de alunos em turmas |
| RF05 | O sistema deve permitir o lançamento e edição de notas |
| RF06 | O sistema deve permitir o registro de frequência por aula |
| RF07 | O sistema deve gerar relatório de desempenho por aluno |
| RF08 | O sistema deve gerar relatório por turma |
| RF09 | O sistema deve autenticar usuários com login e senha |
| RF10 | O sistema deve controlar acesso por perfil de usuário |

---

## 10. Requisitos Não Funcionais (RNF)

| ID | Requisito |
|---|---|
| RNF01 | Interface responsiva (desktop e tablet) |
| RNF02 | Código organizado em camadas (MVC) |
| RNF03 | Banco de dados relacional |
| RNF04 | Senhas armazenadas com hash (bcrypt) |
| RNF05 | Tempo de resposta das APIs < 300ms |
| RNF06 | Sistema acessível via navegador, sem instalação |

---

## 11. Tecnologias

| Camada | Tecnologia |
|---|---|
| Front-end | HTML, CSS, JavaScript (vanilla) |
| Back-end | Node.js + Express |
| Banco de dados | MySQL |
| Autenticação | JWT + bcrypt |
| Ambiente | dotenv, nodemon |

---

## 12. Estrutura de Pastas

```
sistema-escolar/
├── src/
│   ├── config/
│   │   └── db.js           # Conexão com MySQL
│   ├── controllers/
│   │   ├── alunoController.js
│   │   ├── professorController.js
│   │   ├── turmaController.js
│   │   ├── disciplinaController.js
│   │   ├── notaController.js
│   │   ├── frequenciaController.js
│   │   └── authController.js
│   ├── models/
│   │   ├── aluno.js
│   │   ├── professor.js
│   │   ├── turma.js
│   │   ├── disciplina.js
│   │   ├── nota.js
│   │   ├── frequencia.js
│   │   └── usuario.js
│   ├── routes/
│   │   ├── alunos.js
│   │   ├── professores.js
│   │   ├── turmas.js
│   │   ├── disciplinas.js
│   │   ├── notas.js
│   │   ├── frequencias.js
│   │   └── auth.js
│   ├── middlewares/
│   │   └── auth.js         # Verificação de JWT e perfil
│   └── views/              # HTML estático servido pelo Express
│       ├── login.html
│       ├── dashboard.html
│       ├── alunos.html
│       ├── professores.html
│       ├── turmas.html
│       ├── notas.html
│       └── relatorios.html
├── public/
│   ├── css/
│   └── js/
├── .env
├── .gitignore
├── package.json
├── server.js
└── database.sql            # Script de criação do banco
```

---

## 13. Banco de Dados

### Tabelas e Atributos

```sql
-- Usuários do sistema
usuarios (id, nome, email, senha_hash, perfil ENUM('coordenador','professor','secretaria'), created_at)

-- Alunos
alunos (id, nome, cpf UNIQUE, matricula UNIQUE, data_nascimento, email, telefone, created_at)

-- Professores
professores (id, nome, cpf UNIQUE, email, telefone, usuario_id FK, created_at)

-- Turmas
turmas (id, nome, ano_letivo, turno ENUM('manha','tarde','noite'))

-- Disciplinas
disciplinas (id, nome, carga_horaria)

-- Turma_Disciplina (Professor vinculado a disciplina em turma)
turma_disciplinas (id, turma_id FK, disciplina_id FK, professor_id FK)

-- Matrículas
matriculas (id, aluno_id FK, turma_id FK, ano_letivo, data_matricula)

-- Notas
notas (id, aluno_id FK, turma_disciplina_id FK, bimestre INT, valor DECIMAL(4,2), created_at)

-- Frequência
frequencias (id, aluno_id FK, turma_disciplina_id FK, data DATE, presente BOOLEAN)
```

### Relacionamentos
- `usuario` 1:1 `professor`
- `turma` N:M `disciplina` via `turma_disciplinas` (com professor)
- `aluno` N:M `turma` via `matriculas`
- `aluno` 1:N `notas`
- `aluno` 1:N `frequencias`

---

## 14. APIs (Rotas Principais)

| Método | Rota | Descrição | Perfil |
|---|---|---|---|
| POST | `/auth/login` | Autenticação | Todos |
| GET | `/alunos` | Listar alunos | Todos |
| POST | `/alunos` | Cadastrar aluno | Secretaria, Coord. |
| PUT | `/alunos/:id` | Editar aluno | Secretaria, Coord. |
| DELETE | `/alunos/:id` | Excluir aluno | Coordenador |
| GET | `/professores` | Listar professores | Todos |
| POST | `/professores` | Cadastrar professor | Secretaria, Coord. |
| GET | `/turmas` | Listar turmas | Todos |
| POST | `/turmas` | Criar turma | Secretaria, Coord. |
| POST | `/matriculas` | Matricular aluno | Secretaria |
| GET | `/notas/:aluno_id` | Notas do aluno | Todos |
| POST | `/notas` | Lançar nota | Professor |
| POST | `/frequencias` | Registrar frequência | Professor |
| GET | `/relatorios/aluno/:id` | Relatório do aluno | Todos |
| GET | `/relatorios/turma/:id` | Relatório da turma | Coord., Secretaria |

---

## 15. Interface

| Tela | Descrição |
|---|---|
| **Login** | Formulário email + senha, sem cadastro público |
| **Dashboard** | Cards com totais: alunos, turmas, professores; alertas de alunos em risco |
| **Alunos** | Tabela pesquisável com botões de ação (editar/excluir), botão "Novo Aluno" |
| **Professores** | Idem alunos |
| **Turmas** | Lista de turmas com disciplinas vinculadas |
| **Lançar Notas** | Selecionar turma > disciplina > bimestre; tabela de alunos com campo de nota |
| **Frequência** | Selecionar aula/data; marcar presença por aluno (checkbox) |
| **Relatórios** | Filtro por aluno ou turma; tabela de médias e % de frequência; destaque para reprovação |

Layout: sidebar com menu por perfil. Paleta neutra (azul escuro + branco). Responsivo via CSS Flexbox/Grid.

---

## 16. Critérios de Aceitação

- [ ] Login funciona e redireciona por perfil
- [ ] CRUD de alunos funciona sem duplicatas (CPF/matrícula únicos)
- [ ] Professor consegue lançar notas apenas nas suas turmas/disciplinas
- [ ] Sistema bloqueia nota fora do intervalo 0–10
- [ ] Relatório exibe média final e % de frequência corretamente
- [ ] Sistema indica alunos em risco (média < 5 ou frequência < 75%)
- [ ] Todas as senhas são armazenadas com hash
- [ ] Interface funciona em telas ≥ 768px
- [ ] APIs respondem com status HTTP correto (200, 201, 400, 401, 404)

---

*Specification aprovada em: ___/___/2026*
*Equipe: ___________________________*
