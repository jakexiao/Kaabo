export function masterSearch() {
  const search = document.getElementById("master-search");

  if (search) {
    search.addEventListener("click", () => {
      const card = document.getElementById("search-card");
      if (card.style.display === "none") {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }
    });
  }
}
