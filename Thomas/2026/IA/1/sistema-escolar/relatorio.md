# Relatório de Desenvolvimento IA-Assistido (Codex)
**Sistema Escolar - EduManager**

## 1. Avaliação do Uso da IA (Etapa 5: Validação)
- **O sistema atende todos os requisitos?** Sim. Arquitetura MVC inicial e rotas de base funcionais (autenticação e crude base implementados). 
- **Tomada de decisão divergente?** Houve um momento onde o Codex gerou rotas `/api/auth/login` restritas para a API, mas na interface `login.html` havia um apontamento para `/auth/login`. Isso exigiu correção e realinhamento com a Especificação, comprovando a necessidade de testes manuais.
- **Dificuldade Encontradas:** Bloqueio na compilação em código nativo da biblioteca `bcrypt` no Node.js v26 pelo npm scripts. A IA soube propor e realizar autonomamente a substituição para a alternativa pura `bcryptjs`.
- **Ajustes de Prompts?** Sim, foi preciso guiar a IA para consertar divergências de rotas relativas, e acioná-la para fazer a conexão no banco MySQL (XAMPP sem senha).

## 2. Tech Lead Review (Desafio Extra)
Durante a finalização, solicitamos à IA que analisasse o código entregue sob a lente de um Arquiteto de Software, o que gerou as seguintes observações:
1. **Segurança (Implementada):** A sugestão de armazenar as senhas na tabela apenas usando hashes `bcrypt` (criptografia unidirecional) e gerenciar a sessão em stateless via `JWT` foi acolhida na base por alinhar boas práticas.
2. **Camadas de Software (Bugs e Omissões Iniciais):** O sistema não possuía nenhum Middleware ativo checando o login. Aceitamos inserir futuramente para interceptar requisições. 
3. **Persistência de Dados (Sugerido/Omitido):** O tech lead IA ponderou que manipular queries puras (`mysql2`) aumenta o risco de *SQL Injection* e lentidão do design backend. Recomendou uso de Prisma ou Sequelize. Recusamos neste cenário por se tratar de um MVP didático.
4. **Validações:** Sugerida a validação prévia de CPF (schemas) para a API via `Zod`. Recusamos por estender o tempo além da atividade.

## 3. Reflexão Final 
**A eficácia fundamental da IA se dá através do escopo limitante (A Spec). Sem as regras de negócio escritas previamente, o bot "adivinhou" estruturas limitadas ou se perdeu em implementações técnicas excessivas. A responsabilidade real da engenharia não foca apenas na geração das funções, mas em ditar o ritmo arquitetural da Inteligência de forma iterativa, corrigindo seus fluxos, assim como um Senior revisaria algo feito por um programador júnior.**
