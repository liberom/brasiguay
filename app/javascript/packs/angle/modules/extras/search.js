// Search Results
// -----------------------------------

import $ from 'jquery';
// Chosen
// import 'chosen-js/chosen.css';
import 'chosen-js/chosen.jquery.js';
// Datepicker -> Flatpickr
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.css';
// Range slider
// import 'bootstrap-slider/dist/css/bootstrap-slider.min.css';
import 'bootstrap-slider/dist/bootstrap-slider.min.js';


function initSearch() {

    if (!$.fn.slider) return;
    if (!$.fn.chosen) return;
    // flatpickr does not require a jQuery plugin

    // BOOTSTRAP SLIDER CTRL
    // -----------------------------------

    $('[data-ui-slider]').slider();

    // CHOSEN
    // -----------------------------------

    $('.chosen-select').chosen();

    // DATEPICKER
    // -----------------------------------
    const dp = document.getElementById('datetimepicker');
    if (dp) flatpickr(dp, { dateFormat: 'Y-m-d' });

}

export default initSearch;
