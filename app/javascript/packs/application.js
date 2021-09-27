// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery') // may be redundant. Also made available in environment.js as a global plugin
window.$ = $
require('select2')
$.fn.select2.defaults.set("theme", "bootstrap");

// Toastr
global.toastr = require('toastr')

// Stylesheets import
import 'bootstrap/dist/js/bootstrap'
import "bootstrap/dist/css/bootstrap"
import 'select2/dist/css/select2.css'
import 'select2-bootstrap-theme/dist/select2-bootstrap'
import "@fortawesome/fontawesome-free/css/all"
import "stylesheets/application"
