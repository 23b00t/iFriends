import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import 'bootstrap-datepicker';

// Connects to data-controller="calendar"
export default class extends Controller {
  static values = {
    dates: Array
  }

  static targets = [ "startDatePicker", "endDatePicker" ]

  connect() {
    console.log(this.datesValue)
    $(this.startDatePickerTarget).datepicker({
      format: "dd-mm-yyyy",
      todayHighlight: true,
      datesDisabled: ["2023-02-17"]
    });

    $(this.endDatePickerTarget).datepicker({
      format: "dd-mm-yyyy",
      todayHighlight: true,
      datesDisabled: this.datesValue
    });
  }
}
