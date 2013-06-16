//Replace confirmation dialog with jqueryui modal dialog for multiline and autoresize fixes
function bootStrapConfirmModal(message, element) {

  $("#globalmodal a.btn").not('[data-loading-text]').click( function(e){
    if (!$(this).attr('disabled')){
      $(".modal").modal('hide');
    }
    return false
  });

  $("#globalmodal a.btn[data-loading-text]").click( function(e){
    $("#globalmodal a.btn").not('[data-loading-text]').attr('disabled', true);
  });

  $("#globalmodal a.btn-primary").click( function(e){
    // Do not handle click when element is already disabled by previous click
    if (!$(this).attr('disabled')){
      $.rails.handleLink(element);
    }
  });

  $("#globalmodal .modal-body p").html(message);

  $("#globalmodal").modal('show');

}

$(document).ready(function(){
  // wire up our own custom confirm dialog. Also extend the function to take an element.
  $.rails.confirm = function(message, element) { return bootStrapConfirmModal(message, element); };

  $.rails.allowAction = function(element) {
    var message = element.data('confirm'),
        answer = false, callback;
    if (!message) { return true; }

    if ($.rails.fire(element, 'confirm')) {
      // le extension.
      answer = $.rails.confirm(message, element);
      callback = $.rails.fire(element, 'confirm:complete', [answer]);
    }
    return answer && callback;
  };

  $.rails.handleLink = function(link) {
    if (link.data('remote') !== undefined) {
      $.rails.handleRemote(link);
    } else if (link.data('method')) {
      $.rails.handleMethod(link);
    }
    return false;
  };
});
