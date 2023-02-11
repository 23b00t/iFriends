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
    $(this.startDatePickerTarget).datepicker({
      format: "yyyy-mm-dd",
      todayHighlight: true,
      datesDisabled: this.datesValue,
      startDate: new Date()
    });

    $(this.endDatePickerTarget).datepicker({
      format: "yyyy-mm-dd",
      todayHighlight: true,
      datesDisabled: this.datesValue,
      startDate: new Date()
    });
  }
}
