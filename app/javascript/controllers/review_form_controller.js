import { Controller } from "stimulus"
import { start } from "turbolinks";

export default class extends Controller {
  static targets = ["submit"]

  connect() {
    console.log('Connected!');
  }

  submitForm(event) {
    console.log(this.element);
    const starInput = this.element.querySelectorAll(".rating-value");
    const starError = this.element.querySelectorAll(".rating-value-error");

    console.log(starInput);
    console.log(starError);
    starInput.forEach((item, index) => {
      if(item.value === ""){
        event.preventDefault();
        starError[index].style.display = "block";
      } else {
        starError[index].style.display = "none";
      }
    })
    // event.preventDefault();
  }


    // const value = event.currentTarget.dataset.stars;
    // this.inputTarget.value = value;

    // const stars = this.element.querySelectorAll('.fa-star');
    // // console.log(stars);
    // stars.forEach((item) => {
    //   if(item.dataset.stars <= value) {
    //     item.classList.add("selected");
    //   } else {
    //     item.classList.remove("selected");
    //   }
    // });

    // console.log(event.currentTarget.dataset.stars)
    // this.element.innerText = "Bingo!"
    // this.element.setAttribute("disabled", "")
}
