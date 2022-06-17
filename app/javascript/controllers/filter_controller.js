import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['wrapper']

  connect() {
    console.log("connected filter stimulus")
  }
  slidein(){
    console.log(this.wrapperTarget)
    this.wrapperTarget.classList.toggle("open")
  }


}
