export function threadFilter() {
  const filterbutton = document.querySelectorAll(".btn-outline-secondary");

  filterbutton.forEach((button) => {
    button.addEventListener("click", (event) => {
      // event.currentTarget.classList.remove("btn-outline-secondary");
      event.currentTarget.classList.toggle("btn-outline-warning");
    });
  });

  //   const queryString = window.location.search;
  //   if (queryString.includes('likes')) {
  //     document.getElementById('likes').classList.add("btn-outline-warning")
  //   } else if (queryString.includes('comments')) {
  //     document.getElementById('comments').classList.add("btn-outline-warning")
  //   }
}
