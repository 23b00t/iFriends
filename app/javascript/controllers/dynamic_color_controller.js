import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "map" ]

  connect() {
    console.log("Hello World!")
    console.log("mapToStyles.background_color")
  }
}
