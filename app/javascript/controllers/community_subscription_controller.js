import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { communityId: Number }
  static targets = ["messages", "input"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "CommunityChannel", id: this.communityIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the community with the id ${this.communityIdValue}.`)
    window.scrollTo(0, document.body.scrollHeight)
    console.log(this.inputTarget)
  }

  disconnect(){
    console.log("unsubscribed")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    console.log("reset")
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    window.scrollTo(0, document.body.scrollHeight)
  }

}
