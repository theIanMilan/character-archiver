flatpickr(document.querySelector('.datepicker'), {
  altInput: true,
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
  defaultDate: null,
  minDate: new Date().fp_incr(- (100 * 365.25)),
  maxDate: new Date().fp_incr(- (18 * 365.25)) // latest date: 18 years ago from today
});

$('.datepicker').prop('readonly', false)