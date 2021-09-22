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
     if (data.label){
      $(`label[for="${$(el).attr("id")}"]`).text(data.label);
    }

    if (data.placeholder){
      $(el).attr("placeholder", data.placeholder)
    }

    if (data.value){
      $(el).val(data.value)
    }

    if (data.min){
      $(el).attr("min", data.min)
    }

    if (data.max){
      $(el).attr("max", data.max)
    }

    if (data.step){
      $(el).attr("step", data.step)
    }
  },

  subscribe: function(el, callback) {
    $(el).on('keyup.numericInput', function(e) {
      callback();
    });
  },

  unsubscribe: function(el) {
    $(el).off('.numericInput');
  }

});

Shiny.inputBindings.register(numericInput, 'shiny.numericInput');

