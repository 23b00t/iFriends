import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static values = {
    dates: Array
  }

  // static targets = ['start', 'stop']

  connect() {
    this.datesValue.map(date => console.log(date))
  }
}
