// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function display_combobox_aux_field() {
  var sel_val = $('#field_field_type').val();
  
  if (sel_val == 'select_tag')
    $('#combobox_aux_field').show();
  else
    $('#combobox_aux_field').hide();
}