// app/javascript/calendar.js

import $ from 'jquery';
import 'bootstrap-datepicker';

$(function () {
  $('#start-date-picker').datepicker({
    format: "dd-mm-yyyy",
    todayHighlight: true
  });
});

$(function () {
  $('#end-date-picker').datepicker({
    format: "dd-mm-yyyy",
    todayHighlight: true
  });
});
