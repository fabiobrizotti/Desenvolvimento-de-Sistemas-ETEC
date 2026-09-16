USE clinica_medica;

-- ==========================================
-- Parte 1 — SELECT de todas as colunas e de colunas específicas
-- ==========================================

-- 1. Escreva um SELECT que traga todas as colunas de todos os médicos cadastrados (use *).
SELECT * FROM medicos;

-- 2. Escreva o mesmo SELECT do exercício anterior, mas agora listando cada coluna pelo nome, em vez de usar *.
SELECT id_medico, id_especialidade, nome, crm FROM medicos;

-- 3. Liste apenas o nome e o telefone de todos os pacientes.
SELECT nome, telefone FROM pacientes;

-- 4. Liste apenas o id e o valor de cada tipo de exame cadastrado.
SELECT id_exame, valor_cobrado FROM exames;

-- 5. Liste o fk_id_consulta, o fk_id_tipo_exame e o resultado de todos os exames solicitados.
SELECT id_consulta, id_exame, resultado FROM consulta_exames;

-- ==========================================
-- Parte 2 — WHERE com comparação simples
-- ==========================================

-- 6. Liste todos os pacientes cujo CPF seja igual a um CPF específico de sua escolha.
SELECT * FROM pacientes WHERE cpf = '12345678901';

-- 7. Liste todas as consultas cujo status seja igual a 'agendada'.
SELECT * FROM consultas WHERE status = 'Agendada';

-- 8. Liste todos os tipos de exame cujo valor seja maior que 100.
SELECT * FROM exames WHERE valor_cobrado > 100;

-- 9. Liste todos os pacientes nascidos a partir de 01/01/1995 (use >=).
SELECT * FROM pacientes WHERE data_nasc >= '1995-01-01';

-- ==========================================
-- Parte 3 — WHERE com LIKE
-- ==========================================

-- 10. Liste todos os pacientes cujo nome comece com a letra 'C'.
SELECT * FROM pacientes WHERE nome LIKE 'C%';

-- 11. Liste todos os médicos cujo nome contenha a palavra 'Silva' em qualquer posição.
SELECT * FROM medicos WHERE nome LIKE '%Silva%';

-- 12. Liste todos os tipos de exame cujo nome termine com a letra 'a'.
SELECT * FROM exames WHERE nome LIKE '%a';

-- ==========================================
-- Parte 4 — WHERE com YEAR(), MONTH() e DAY()
-- ==========================================

-- 13. Liste todos os pacientes nascidos no ano de 1990 (use YEAR()).
SELECT * FROM pacientes WHERE YEAR(data_nasc) = 1990;

-- 14. Liste todos os pacientes nascidos a partir do ano 2000, inclusive.
SELECT * FROM pacientes WHERE YEAR(data_nasc) >= 2000;

-- 15. Liste todas as consultas que aconteceram no mês 09 (setembro), independente do ano.
SELECT * FROM consultas WHERE MONTH(data_consulta) = 9;

-- 16. Liste todos os pacientes nascidos no dia 15 de qualquer mês.
SELECT * FROM pacientes WHERE DAY(data_nasc) = 15;

-- 17. Liste todos os pacientes nascidos no mês 06 (junho) E no ano 1995 ao mesmo tempo.
SELECT * FROM pacientes WHERE MONTH(data_nasc) = 6 AND YEAR(data_nasc) = 1995;

-- ==========================================
-- Parte 5 — WHERE com BETWEEN e IN
-- ==========================================

-- 18. Liste todas as consultas com data_hora entre 01/09/2026 e 10/09/2026.
SELECT * FROM consultas WHERE data_consulta BETWEEN '2026-09-01' AND '2026-09-10';

-- 19. Liste todos os tipos de exame com valor entre 50 e 150.
SELECT * FROM exames WHERE valor_cobrado BETWEEN 50 AND 150;

-- 20. Liste todas as consultas cujo status seja 'agendada' OU 'realizada', usando IN.
SELECT * FROM consultas WHERE status IN ('Agendada', 'Realizada');

-- 21. Liste todos os pacientes nascidos entre 01/01/1990 e 31/12/1999.
SELECT * FROM pacientes WHERE data_nasc BETWEEN '1990-01-01' AND '1999-12-31';

-- ==========================================
-- Parte 6 — Combinando WHERE, LIKE e AND
-- ==========================================

-- 22. Liste os tipos de exame com valor maior que 100 E cujo nome contenha a letra 'o'.
SELECT * FROM exames WHERE valor_cobrado > 100 AND nome LIKE '%o%';

-- 23. Liste os pacientes nascidos a partir de 2000 E cujo nome comece com a letra 'A'.
SELECT * FROM pacientes WHERE YEAR(data_nasc) >= 2000 AND nome LIKE 'A%';

-- 24. Liste as consultas com status 'agendada' E que aconteçam no mês 09.
SELECT * FROM consultas WHERE status = 'Agendada' AND MONTH(data_consulta) = 9;

-- ==========================================
-- Parte 7 — Encontre e corrija o erro
-- ==========================================

-- Comando com erro 1:
-- SELECT * FROM paciente WHERE data_nascimenton >= '1990-01-01';
-- O que estava errado: A tabela chama-se `pacientes` neste schema. O nome da coluna também continha um "n" no final e referia "data_nascimento" quando neste esquema padronizou-se "data_nasc".
SELECT * FROM pacientes WHERE data_nasc >= '1990-01-01';

-- Comando com erro 2:
-- SELECT * FROM paciente WHERE data_nascimento >= LIKE '2000%';
-- O que estava errado: Tabelas e colunas com nome incorreto e o operador >= foi erroneamente mesclado com LIKE inviabilizando a query sintaticamente.
SELECT * FROM pacientes WHERE data_nasc LIKE '2000%';

-- Comando com erro 3:
-- SELECT * FROM tipo_exame WHERE valor > 100 AND LIKE '%e%';
-- O que estava errado: Tabela/coluna incorreta no contexto mas, sintaticamente, faltou informar qual coluna recebe a verificação do comando pós LIKE '%e%'.
SELECT * FROM exames WHERE valor_cobrado > 100 AND nome LIKE '%e%';

-- Comando com erro 4:
-- SELECT * FROM paciente WHERE YEAR (data_nascimento) => 2000;
-- O que estava errado: Erro clássico de dar espaço na função (embora aceite caso a configuração permita) e principalmente inverter `>=` para `=>`. Também arrumadas os nomes de tabela e colunas.
SELECT * FROM pacientes WHERE YEAR(data_nasc) >= 2000;
