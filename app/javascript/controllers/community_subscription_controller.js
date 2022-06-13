import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { communityId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "CommunityChannel", id: this.communityIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribe to the community with the id ${this.communityIdValue}.`)
  }
}
