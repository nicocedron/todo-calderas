/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.allowedContent = true;

  // Toolbar groups configuration.
   config.toolbar = [
     { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source'] },
     { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
     // { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
     // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
     { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
     { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'SpecialChar' ] },
     { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'Preview', 'Maximize' ] },
     '/',
     { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
     { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
     { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] }
   ];


};
