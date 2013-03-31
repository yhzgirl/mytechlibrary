function initAutocomplete() {
  $("#term").autocomplete({
    source: "/search_on_title",
    minLength: 2, 
    delay: 500
  });  
}

jQuery(initAutocomplete);
