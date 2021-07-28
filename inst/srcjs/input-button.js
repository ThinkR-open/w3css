$(document).on("click", ".w3button", function(evt) {
  var el = evt.target;
  while (el.nodeName != "BUTTON"){
    el = el.parentNode;
  }
  el = $(el);
  el.val( parseInt(el.val()) + 1)
  el.trigger("updated");
});

var buttons = new Shiny.InputBinding();

$.extend(buttons, {
  find: function(scope) {
    return $(scope).find('.w3button')
  },
  getValue: function(el) {
    return parseInt($(el).val())
  },
  setValue: function(el, value) {
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    $(el).on('updated.buttons', function(e) {
      callback();
    });

  },
  unsubscribe: function(el) {
    $(el).off('.buttons');
  }
});
Shiny.inputBindings.register(buttons);
