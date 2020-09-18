var inputdate = new Shiny.InputBinding();
$.extend(inputdate, {
  find: function(scope) {
    return $(scope).find('.w3-dateInput')
  },
  getValue: function(el) {
    return $(el).val()
  },
  setValue: function(el, value) {
    debugger;
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    debugger;
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    $(el).on('change.inputdate', function(e) {
      callback();
    });

  },
  unsubscribe: function(el) {
    $(el).off('.inputdate');
  }
});
Shiny.inputBindings.register(inputdate, 'shiny.inputdate');
