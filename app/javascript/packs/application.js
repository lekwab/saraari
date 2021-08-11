// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


var jQuery = require("jQuery")
global.s = global.jQuery = jQuery
window.s = window.jQuery = jQuery

require("bootstrap");

import toastr from 'toastr';
toastr.options = {
    progressbar: true
}


require("./includes/propertiesDetails");

Rails.start()
Turbolinks.start()
ActiveStorage.start()
