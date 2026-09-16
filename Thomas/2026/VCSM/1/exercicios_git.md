# Exercícios Conceituais – Git

## 1. Situação-Problema: Perda de Código
**João desenvolveu uma funcionalidade importante, mas esqueceu de realizar commits. O computador apresentou falha e ele perdeu tudo.**

**a) Qual erro profissional João cometeu?**  
João cometeu o erro de não usar o versionamento ativamente. Trabalhou por muito tempo sem registrar "checkpoints" locais de seu progresso no repositório.

**b) Qual comando deveria ter sido usado com frequência?**  
`git commit` (sendo precedido pelo `git add`).

**c) Por que o versionamento evita esse problema?**  
Porque os commits criam registros imutáveis no repositório local. Mesmo se houver falhas, é possível recuperar o progresso salvo até o último commit. Se alinhado ao uso do `git push`, garante-se backup em nuvem imune a falhas locais de hardware.

---

## 2. Fluxo Correto do Git
**Organize corretamente a sequência lógica de uso dos comandos abaixo.**

**Ordem Lógica:**
1. `git init` (Inicia o repositório local)
2. *editar arquivo* (Modificações no Working Directory)
3. `git status` (Útil para verificar o que foi modificado)
4. `git add` (Prepara a modificação na Staging Area)
5. `git commit` (Registra definitivamente e cria o snapshot no Repositório)
6. `git push` (Sincroniza o commit local com o repositório Remoto)

**Por que essa ordem é importante:**  
O Git gerencia o versionamento através de três árvores/estados. O repositório precisa iniciar para rastrear (init); você altera o código cru; prepara conscientemente as mudanças desejadas (add); consolida o pacote de mudanças na história local (commit) e as espelha na rede (push).

---

## 3. Identificação de Etapas
**Classifique as ações abaixo em: (WD) Working Directory / (SA) Staging Area / (R) Repository**

a) **( WD )** Arquivo foi modificado mas ainda não preparado para commit.  
b) **( SA )** Arquivo pronto para ser incluído no próximo commit.  
c) **( R )** Alteração já registrada oficialmente no histórico.

---

## 4. Análise de Commit
**Um desenvolvedor fez o seguinte commit: "alterações"**

**a) Essa mensagem é adequada?**  
Não, é genérica demais. Não descreve qual mudança ocorreu no código nem seu propósito.

**b) Como ela deveria ser escrita profissionalmente?**  
Seguindo o padrão de _Conventional Commits_, uma forma adequada seria:  
`feat: adiciona botão de autenticação no login` ou `fix: corrige validação de formulário`.

**c) Por que a mensagem de commit é importante?**  
Ela provê contexto para outros desenvolvedores da equipe, facilita rastrear histórico durante processos de auditoria ou _rollback_ e evita a necessidade de ler as linhas de código diretamente toda vez que se tentar descobrir o que mudou e por qual razão.

---

## 5. Situação de Equipe
**Maria fez alterações no projeto e executou apenas `git commit`, mas não utilizou `git push`.**

**a) O restante da equipe consegue ver as alterações?**  
Não.

**b) Qual comando faltou?**  
`git push`.

**c) Explique a diferença entre repositório local e remoto.**  
O **repositório local** existe apenas no computador do desenvolvedor e rege a história das edições feitas ali. O **repositório remoto** fica hospedado na internet ou servidor (como GitHub), servindo como a fonte central (Single Source of Truth) para sincronizar o progresso de todos da equipe.

---

## 6. Conflito Conceitual
**Dois desenvolvedores alteraram a mesma linha do código em branches diferentes.**

**a) Em qual momento o conflito pode aparecer?**  
Na hora de tentar unificar o trabalho de ambos; seja no momento de um `git merge` ou de um `git pull`.

**b) Qual comando geralmente está envolvido nesse processo?**  
`git merge`.

**c) O Git resolve conflitos automaticamente sempre? Justifique.**  
Não. Quando edições concorrentes afetam a mesmíssima linha de um arquivo, o Git entende ser impossível definir logicamente qual código prevalece sem destruir a visão de uma das partes. Ele exige a intervenção de um humano para escolher entre elas (ou mesclá-las).

---

## 7. Snapshot
**a) O que é um snapshot no Git?**  
Uma espécia de fotografia ou retrato absoluto do estado inteiro do projeto de arquivos num determinado momento do tempo (na efetuação de um commit).

**b) O Git salva apenas a parte modificada do arquivo ou o estado completo do projeto?**  
Conceitualmente o Git armazena e modela a história como o estado completo do projeto a cada commit (ele gera snapshots). Embora internamente use compressão (objetos tree/blob e ponteiros) para lidar com arquivos não modificados mantendo alta performance, ele funciona gerando versões íntegras e independentes a cada salvamento global.

**c) Por que isso é uma vantagem?**  
Permite que mudar entre versões passadas (checkout de commit antigo) recrie instantaneamente a estrutura exata de toda a pasta do projeto como ela estava naquele milissegundo, e se diferindo da modelagem "delta" onde arquivos passados precisavam ser reconstruídos lentamente a partir das somas de várias modificações (diffs).

---

## 8. Hash
**a) O que é o hash de um commit?**  
Uma sequência única extensa gerada pelo algoritmo criptográfico SHA-1 (ex: `89858623fa...`) que assina, batiza e identifica unicamente aquele commit.

**b) Se um arquivo for alterado, o hash permanece o mesmo?**  
Não. O valor calculado para a hash engloba o conteúdo, dados do autor e data. Uma única letra mudada causa modificação brusca do hash original. 

**c) Qual a importância do hash para segurança do projeto?**  
Ele previne manipulação. Se qualquer dado de forma maliciosa ou por corrupção de sistema for modificado no repositório no passado, esse check-in falhará por possuir uma hash conflitante com sua antiga versão, providenciando integridade absoluta para o histórico audível.

---

## 9. Identificação de Comandos
**( git log )** Mostra histórico  
**( git clone )** Copia repositório existente  
**( git diff )** Mostra diferenças  
**( git pull )** Atualiza projeto local  
**( git branch )** Cria nova ramificação

---

## 10. Estudo de Caso Empresarial
**Uma empresa precisa:**
- **Desenvolver novas funcionalidades**
- **Corrigir erros**
- **Trabalhar em equipe**
- **Manter histórico seguro**
- **Evitar perda de código**

**a) Por que o Git é essencial nesse cenário?**  
Porque atende nativamente todos esses pilares: isolamento sem estragar o ambiente vital (branches), sincronia descentralizada permitindo a colaboração concorrente, geração natural de backups íntegros (remoto + clones locais) e histórico imutável capaz de indicar e responsabilizar autoria de inclusão de regressões.

**b) Qual seria o risco de trabalhar sem versionamento?**  
- Sobrescrita severa, na qual o arquivo upado por um desenvolvedor sobrescreve as edições submetidas há horas de outro dev usando compartilhamento por pasta conectada ou Drive.
- Impossibilidade de desfazer danos imediatamente sem quebrar a operação diária;
- Perda massiva de horas no caso do servidor ou PC principal perecer na falha de drive sem histórico anterior.

**c) Cite três benefícios diretos para a empresa.**  
1. **Produtividade Aumentada:** Desenvolvedores experimentam e revisam recursos de forma paralela via Branchs/Pull Requests.
2. **Segurança e Rollback Imediato:** Qualquer bug lançado em produção pode ser instantaneamente anulado e o código restaurado em questão de segundos com rastreio de culpabilidade (quem o causou).
3. **Backup Robusto em Arquitetura Distribuída:** Cada clone em um PC funciona como espelho de backup total descentralizado independentemente de provedores em nuvem.