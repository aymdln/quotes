export function clickQuote() {
  const rows = document.querySelectorAll(".row");
  const noAddress = document.getElementById("no-address");

  noAddress.addEventListener("click", (event) => {
    // console.log(event.currentTarget.dataset.link)
    location(event.currentTarget.dataset.link);
  });
  rows.forEach((row) => {
    row.addEventListener("click", (event) => {
      location(event.srcElement.parentNode.dataset.link);
    });
  });
}
const location = (link) => {
  window.location = link
}

