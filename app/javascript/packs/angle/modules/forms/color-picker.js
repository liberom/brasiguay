// Color picker
// -----------------------------------

import $ from 'jquery';
import { APP_COLORS } from '../common/constants';
import Pickr from '@simonwep/pickr';
import '@simonwep/pickr/dist/themes/classic.min.css';

function initColorPicker() {
  var elements = [].slice.call(document.querySelectorAll('.demo-colorpicker'));
  if (!elements.length) return;

  elements.forEach(function(el) {
    var pickr = Pickr.create({
      el: el,
      theme: 'classic',
      default: '#777777',
      components: {
        preview: true,
        opacity: true,
        hue: true,
        interaction: {
          hex: true,
          rgba: true,
          input: true,
          clear: true,
          save: true
        }
      }
    });
    // Keep a reference for external control
    el._pickr = pickr;

    pickr.on('save', (color) => {
      if (!color) return;
      var hex = color.toHEXA().toString();
      if (el instanceof HTMLElement) {
        el.value = hex;
      }
      pickr.hide();
    });
  });

  // Optional: color selectors mapping similar to previous impl
  var selectors = document.getElementById('demo_selectors');
  if (selectors) {
    var colorSelectors = {
      'default': '#777777',
      'primary': APP_COLORS['primary'],
      'success': APP_COLORS['success'],
      'info': APP_COLORS['info'],
      'warning': APP_COLORS['warning'],
      'danger': APP_COLORS['danger']
    };
    // Delegate clicks to set the first pickr instance color
    selectors.addEventListener('click', function(e) {
      var target = e.target.closest('[data-color]');
      if (!target) return;
      var key = target.getAttribute('data-color');
      var val = colorSelectors[key];
      if (!val || elements.length === 0) return;
      var firstEl = elements[0];
      // Find pickr instance bound to first element
      if (firstEl._pickr) {
        firstEl._pickr.setColor(val);
      }
    });
  }
}

export default initColorPicker;
