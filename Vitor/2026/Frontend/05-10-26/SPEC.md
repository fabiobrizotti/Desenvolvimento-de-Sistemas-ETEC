# SPEC — Site de Questões por Matéria

> Contrato para IAs (e humanos) que forem mexer neste projeto. Leia este arquivo primeiro.

## 1. O quê e porquê
Site estático de revisão para provas: 1 página HTML por matéria, cada questão com
enunciado → alternativas → resolução + porquê da resposta certa.
Sem build, sem dependências: só HTML + 1 CSS global + 1 JS minúsculo
(site/theme.js, só o toggle claro/escuro). Qualquer IA consegue
ler, editar e estender sem toolchain.

## 2. Estrutura (não mudar sem registrar no CHANGELOG)
```
SPEC.md            # este arquivo (contrato)
CHANGELOG.md       # 1 linha por mudança: o quê + porquê
site/index.html    # home: lista as matérias com nº de questões
site/styles.css    # ÚNICO css; páginas não têm <style> próprio
site/theme.js      # ÚNICO js: toggle claro/escuro (data-theme + localStorage); injeta o botão
site/materias/<slug>.html  # 1 por matéria
_transcricoes/     # brutos recebidos (ver README da pasta)
```

## 3. Convenção de questão (obrigatória em toda página de matéria)
```html
<article class="questao" id="qN">
  <h2>Questão NN</h2>
  <blockquote class="apoio">[texto de apoio, se houver]</blockquote>
  <p class="enunciado">[comando da questão]</p>
  <ol class="alternativas" type="A"><li>…</li></ol>  <!-- ou <ul> p/ certo-errado/ordenação -->
  <details class="resolucao">
    <summary>Ver resolução</summary>
    <p><strong>Alternativa correta: X.</strong> [resolução]</p>
    <p class="porque">[porquê da resposta — o que elimina as outras]</p>
  </details>
</article>
```
- Resolução fica em `<details>` fechado: o aluno tenta antes de ver a resposta.
- Questões fora do padrão A–E (ordenar, certo/errado, lacunas): manter o formato
  original da prova, não converter.
- Falta a imagem original? Não inventar: `<!-- sem imagem original -->`.
- Trecho ilegível na transcrição? Transcrever como veio + `<!-- ilegível no original -->`.
- Marcadores de ferramenta de transcrição (`[cite: N]`, `JPG`/`PNG` soltos): remover sempre, são poluição — ver CHANGELOG 2026-10-05.

## 4. Regra de log (obrigatória)
- Toda edição de resposta/resolução entra no CHANGELOG.md: `data — qN matéria — o quê — porquê`.
- Adicionar matéria = nova linha na home + novo `<slug>.html` copiado de uma página existente.
- Dúvida entre dois formatos? Escolher o mais simples e anotar o preterido no CHANGELOG.

## 5. Origem dos dados
Transcrições coladas pelo usuário em 2026-10-05 (30 questões, 7 matérias).
Brutos em `_transcricoes/`. Mapa matéria→questões no CHANGELOG (entrada inicial).
