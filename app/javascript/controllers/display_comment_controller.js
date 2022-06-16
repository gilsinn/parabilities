import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["comment", "form"]

  connect() {
    console.log("displaying")
  }

  displayForm() {
    this.commentTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
