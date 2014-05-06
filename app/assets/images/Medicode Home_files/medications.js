(function() {
  jQuery(function() {
    var refreshTooltips;
    refreshTooltips = function() {
      if ($('.emergency-field').length) {
        $('.emergency-field').tooltip();
        return $('.remove_fields').tooltip();
      }
    };
    refreshTooltips();
    $('form').on('click', '.remove_fields', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
      return event.preventDefault();
    });
    return $('form').on('click', '.add_fields', function(event) {
      var regexp, time;
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $(this).before($(this).data('fields').replace(regexp, time));
      event.preventDefault();
      return refreshTooltips();
    });
  });

}).call(this);
