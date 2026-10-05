// Toggle manual de tema: grava data-theme em <html> + localStorage.
// Sem escolha salva, vale o prefers-color-scheme do CSS. Também injeta o botão,
// para as páginas HTML seguirem intocadas.
(function () {
  var root = document.documentElement;
  var saved = null;
  try { saved = localStorage.getItem("tema"); } catch (e) {}
  if (saved) root.dataset.theme = saved;
  var btn = document.createElement("button");
  btn.className = "tema-btn";
  btn.type = "button";
  btn.setAttribute("aria-label", "Alternar entre tema claro e escuro");
  btn.textContent = "◐";
  btn.addEventListener("click", function () {
    var atual = root.dataset.theme ||
      (window.matchMedia("(prefers-color-scheme: light)").matches ? "light" : "dark");
    var next = atual === "light" ? "dark" : "light";
    root.dataset.theme = next;
    try { localStorage.setItem("tema", next); } catch (e) {}
  });
  document.body.appendChild(btn);
})();
