export function type_filter() {
  const filter = document.getElementById("type-filter");
  if (filter) {
    filter.addEventListener("click", (event) => {
      const card = document.getElementById("type-card");
      if (card.style.display === "none") {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }

      const save = document.getElementById("save-type");

      let preferences = [];

      save.addEventListener("click", (event) => {
        card.style.display = "none";
        if (document.getElementById("defaultCheck1").checked == true) {
          preferences.push(document.getElementById("defaultText1").innerHTML);
        }
        if (document.getElementById("defaultCheck2").checked == true) {
          preferences.push(document.getElementById("defaultText2").innerHTML);
        }
        if (document.getElementById("defaultCheck3").checked == true) {
          preferences.push(document.getElementById("defaultText3").innerHTML);
        }
        if (document.getElementById("defaultCheck4").checked == true) {
          preferences.push(document.getElementById("defaultText4").innerHTML);
        }

        document.querySelectorAll(".theme").forEach((theme) => {
          let hasit = false;
          preferences.forEach((preference) => {
            if (theme.dataset.type.includes(preference)) {
              hasit = true;
            }
          });

          if (hasit == false) {
            theme.style.display = "none";
          } else {
            theme.style.display = "";
          }

          filter.innerHTML = `Type (${preferences.length})`;
        });
      });
    });
  }
}
