import $ from 'jquery';
// WYSIWYG -> Trix
import 'trix';
import 'trix/dist/trix.css';
// Chosen
// import 'chosen-js/chosen.css';
import 'chosen-js/chosen.jquery.js';

function initBlogArticleView() {
    // CHOSEN
    // -----------------------------------

    $('.chosen-select').chosen();
    // WYSIWYG (Trix)
    // -----------------------------------
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
}

export default initBlogArticleView;
