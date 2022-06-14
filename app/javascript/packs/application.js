// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails, { $ } from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

// $(function() {
//   $('.rating_stars').click(function() {
//     var star = $(this);
//     var rating_type_id = $(this).attr('data-rating_type-id')
//     var stars = $(this).attr('data-stars');

    for(i=1; i<=5, i++;) {
      if(i<= stars){
        $('#' + rating_type_id + '_' + i).addClass('selected');
      } else {
        $('#' + rating_type_id + '_' + i).removeClass('selected');
      }
    }
