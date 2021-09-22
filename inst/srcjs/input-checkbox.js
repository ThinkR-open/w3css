$(document).on("click", ".w3_checkbox", function(evt) {
  $(evt.target).trigger("updated");
});

var checkbox = new Shiny.InputBinding();

$.extend(checkbox, {
  find: function(scope) {
    return $(scope).find('.w3_checkbox')
  },
  getValue: function(el) {
    return $(el).is(":checked")
  },
  setValue: function(el, value) {
    console.log("setValue")
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    console.log("receiveMessage")
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    $(el).on('updated.checkbox', function(e) {
      console.log("change.checkbox")
      callback();
    });

  },
  unsubscribe: function(el) {
    console.log("unsubscribe")
    $(el).off('.checkbox');
  }
});
Shiny.inputBindings.register(checkbox, 'shiny.checkbox');
