// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require moment
//= require bootstrap-datetimepicker
//= require chosen-jquery
//= require jquery.tokeninput
//= require_tree .


$(document).ready(function(){
    $('.datetimepicker').datetimepicker({format: 'DD-MM-YYYY hh:mm'});

    $("#message_receiver_tokens").tokenInput("/contacts.json", {
        crossDomain: false,
        prePopulate: $(this).data("pre"),
        theme: "facebook",
        hintText: 'Type in an email',
        noResultsText: 'No contact found with given email',
        preventDuplicates: true
    });
});

(function() {
    if (typeof window['CKEDITOR_BASEPATH'] === "undefined" || window['CKEDITOR_BASEPATH'] === null) {
        window['CKEDITOR_BASEPATH'] = "/assets/ckeditor/";
    }
}).call(this);