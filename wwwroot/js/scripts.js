(function($) {
  // Make the entire green button clickable to the survey in the header.
  $('.survey-banner').click(function(e) {
    e.preventDefault();
    window.open($(this).find('a').attr('href'), '_blank');
  });
})(jQuery);