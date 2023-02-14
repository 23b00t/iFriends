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
    const startDatePicker = $(this.startDatePickerTarget);
    const endDatePicker = $(this.endDatePickerTarget);

    startDatePicker.datepicker({
      format: "yyyy-mm-dd",
      todayHighlight: true,
      datesDisabled: this.datesValue,
      startDate: new Date(),
      autoclose: true,
    });

    endDatePicker.datepicker({
      format: "yyyy-mm-dd",
      todayHighlight: true,
      datesDisabled: this.datesValue,
      startDate: new Date(),
      autoclose: true,
    });

    // Set the startDate of endDatePicker on changeDate of startDatePicker
    startDatePicker.on("changeDate", function (e) {
      endDatePicker.datepicker("setStartDate", e.date);
    });
  }
}
