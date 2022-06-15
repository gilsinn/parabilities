import { Controller } from "stimulus"
import { start } from "turbolinks";

export default class extends Controller {
  static targets = ["input"]

  // connect() {
  //   console.log('Connected!');
  // }

  rate(event) {
    // console.log(this.element)
    const value = event.currentTarget.dataset.stars;
    this.inputTarget.value = value;

    const stars = this.element.querySelectorAll('.fa-star');
    // console.log(stars);
    stars.forEach((item) => {
      if(item.dataset.stars <= value) {
        item.classList.add("selected");
      } else {
        item.classList.remove("selected");
      }
    });

    // console.log(event.currentTarget.dataset.stars)
    // this.element.innerText = "Bingo!"
    // this.element.setAttribute("disabled", "")
  }
}
