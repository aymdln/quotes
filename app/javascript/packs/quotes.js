export function clickQuote() {
  const rows = document.querySelectorAll(".row");

  rows.forEach((row) => {
    row.addEventListener("click", (event) => {
      window.location = event.srcElement.parentNode.dataset.link;
    });
  });
} 