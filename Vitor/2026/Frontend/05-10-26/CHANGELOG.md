# CHANGELOG — o que mudou e porquê

- 2026-10-05 — criadas `site/index.html`, `site/styles.css` e 7 páginas de matéria — carga inicial das 30 questões.
- 2026-10-05 — mapa: versionamento-codigo-mensageria=q1,2,3,4,12; programacao-mobile=q5,6,7,8,9; programacao-backend=q10,11,13; programacao-frontend=q14,15,16,17; banco-de-dados=q18,19,20,21,22; inteligencia-artificial=q23,24,25,26; projeto-multidisciplinar=q27,28,29,30.
- 2026-10-05 — q8 sem enunciado de imagem (só alternativas/resolução no original) — página marca `<!-- sem imagem original -->`, sem inventar texto.
- 2026-10-05 — q15 fragmento de código veio ilegível ("Categoria ` `") — transcrito como veio + comentário, sem adivinhar o HTML.
- 2026-10-05 — resolução em `<details>` fechado em vez de texto aberto — porquê: aluno tenta responder antes de ver o gabarito.
- 2026-10-05 — sem JS e sem `_transcricoes/prova-01.md` duplicado — porquê: YAGNI; fonte é a conversa de 2026-10-05, `_transcricoes/README.md` aponta isso. Adicionar JS só quando pedirem busca/filtro.
- 2026-10-05 — removidos todos os ` [cite: N]` das 6 páginas (q9–q30) — porquê: rastros da ferramenta de transcrição, não fazem parte da prova; SPEC atualizado com regra de sempre remover esses marcadores.
- 2026-10-05 — redesign visual só via `site/styles.css` (HTML/texto intocados) — porquê: pedido do usuário; direção taste-skill (dark editorial, 1 acento âmbar, raio único 16px, hero à esquerda, bento na home) + minimalist/high-end (mono p/ nº da questão, hairlines, hover físico, reduced-motion).
- 2026-10-05 — tema claro via `prefers-color-scheme` (tokens, acento âmbar escurecido p/ contraste AA) — porquê: pedido do usuário; sem JS, segue o sistema; theme lock mantido (1 tema por visita).
- 2026-10-05 — botão manual de tema (`site/theme.js`, data-theme + localStorage, botão ◐ injetado via JS) — porquê: pedido do usuário; 1 linha de `<script>` por página, HTML/texto intocados; SPEC atualizado (exceção mínima ao "sem JS").
- 2026-10-05 — paleta do tema claro refeita pelo `minimalist-ui` (warm monochrome: fundo #f7f6f3, texto #211e19, mudo #787774, hairline #EAEAEA, code pastel #FBF3DB) — porquê: tons frios anteriores quebravam o lock de 1 temperatura; mantém 1 acento (âmbar escurecido p/ contraste AA).
