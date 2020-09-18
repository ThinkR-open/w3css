var textInput = new Shiny.InputBinding();

$.extend(textInput, {
  find: function(scope) {
    return $(scope).find('.w3_textInput')
  },
  getValue: function(el) {
    return $(el).val()
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
    $(el).on('keyup.textInput', function(e) {
      console.log("change.textInput")
      callback();
    });

  },
  unsubscribe: function(el) {
    console.log("unsubscribe")
    $(el).off('.textInput');
  }
});
Shiny.inputBindings.register(textInput, 'shiny.whatever');
