var numericInput = new Shiny.InputBinding();

$.extend(numericInput, {

  find: function(scope) {
    return $(scope).find('.w3_numericInput')
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
    $(el).on('keyup.numericInput', function(e) {
      console.log("change.numericInput")
      callback();
    });
  },

  unsubscribe: function(el) {
    console.log("unsubscribe")
    $(el).off('.numericInput');
  }

});

Shiny.inputBindings.register(numericInput, 'shiny.numericInput');

