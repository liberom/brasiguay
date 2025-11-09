// Forms Demo
// -----------------------------------

import $ from 'jquery';
// Chosen
// import 'chosen-js/chosen.css';
import 'chosen-js/chosen.jquery.js';
// Input Mask (no jQuery plugin)
import Inputmask from 'inputmask';
// Datetimepicker
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.css';
// WYSIWYG -> Trix
import 'trix';
import 'trix/dist/trix.css';
// TagsInput (removed due to security advisory GHSA-v2jq-9475-r5g8)
// import 'bootstrap-tagsinput/dist/bootstrap-tagsinput.css';
// import 'bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js';
// Filestyle
import 'bootstrap-filestyle/src/bootstrap-filestyle.min.js';
// Range slider
// import 'bootstrap-slider/dist/css/bootstrap-slider.min.css';
import 'bootstrap-slider/dist/bootstrap-slider.min.js';

function initFormsDemo() {

    if (!$.fn.slider) return;
    if (!$.fn.chosen) return;
    if (!$.fn.filestyle) return;

    // BOOTSTRAP SLIDER CTRL
    // -----------------------------------

    $('[data-ui-slider]').slider();

    // CHOSEN
    // -----------------------------------

    $('.chosen-select').chosen();

    // MASKED
    // -----------------------------------
    var masked = [].slice.call(document.querySelectorAll('[data-masked]'));
    if (masked.length) {
      Inputmask().mask(masked);
    }

    // FILESTYLE
    // -----------------------------------

    $('.filestyle').filestyle();

    // WYSIWYG (Trix)
    // -----------------------------------
    // Replace any textarea.wysiwyg with a Trix editor bound to a hidden input
    var wysis = [].slice.call(document.querySelectorAll('textarea.wysiwyg'));
    wysis.forEach(function(textarea) {
      if (textarea.dataset.trixified) return;
      var id = textarea.id || ('trix_' + Math.random().toString(36).slice(2));
      textarea.id = id;
      var hidden = document.createElement('input');
      hidden.type = 'hidden';
      hidden.id = id + '_hidden';
      hidden.value = textarea.value;
      var editor = document.createElement('trix-editor');
      editor.setAttribute('input', hidden.id);
      textarea.insertAdjacentElement('afterend', editor);
      textarea.insertAdjacentElement('afterend', hidden);
      textarea.style.display = 'none';
      textarea.dataset.trixified = 'true';
    });


    // DATETIMEPICKER
    // -----------------------------------

    // Flatpickr replacements
    const dp1 = document.getElementById('datetimepicker1');
    if (dp1) {
        flatpickr(dp1, { dateFormat: 'Y-m-d' });
    }
    const dp2 = document.getElementById('datetimepicker2');
    if (dp2) {
        flatpickr(dp2, { dateFormat: 'm-d-Y' });
    }

}

export default initFormsDemo;
