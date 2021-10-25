// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("@nathanvda/cocoon")
const flatpickr = require("flatpickr")

require("bootstrap/dist/js/bootstrap.min.js")
var jQuery = require('jquery')
// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require('select2')
$.fn.select2.defaults.set("theme", "bootstrap");

// Toastr
global.toastr = require('toastr')

// Stylesheets import
import "bootstrap/dist/css/bootstrap.min.css"
import 'select2/dist/css/select2.css'
import 'select2-bootstrap-theme/dist/select2-bootstrap'
import "@fortawesome/fontawesome-free/css/all"
import 'flatpickr/dist/flatpickr.css'
import "stylesheets/application"