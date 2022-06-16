import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["comment", "form"]

  connect() {
    console.log("displaying")
  }

  displayForm() {
    this.formTarget.classList.remove("d-none")
  }
}
