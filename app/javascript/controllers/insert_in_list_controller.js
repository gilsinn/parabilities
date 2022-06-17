import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["items", "form"]
  static values = { position: String }

  connect(){
    console.log("insert_in_list stimulus connected")
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          console.log(data.inserted_item)
          this.itemsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
