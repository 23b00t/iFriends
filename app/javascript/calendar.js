// app/javascript/calendar.js

import $ from 'jquery';
import 'bootstrap-datepicker';

$(function () {
  $('#start-date-picker').datepicker({
    format: "dd-mm-yyyy",
    todayHighlight: true,
    datesDisabled: JSON.parse($('input[name="disabled_dates"]').val())
  });
});

$(function () {
  $('#end-date-picker').datepicker({
    format: "dd-mm-yyyy",
    todayHighlight: true
  });
});
