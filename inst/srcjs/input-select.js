var selectInput = new Shiny.InputBinding();

$.extend(selectInput, {

  find: function(scope) {
    return $(scope).find('.w3-select')
  },

  getValue: function(el) {
    return $(el).val()
  },

  setValue: function(el, value) {
    console.log("setValue")
    // JS code to set value
  },

  receiveMessage: function(el, data) {
     console.log(data)
    if (data.choices){
      $(el).empty();
      data.choices.map(x => {
        var val = $('<option></option>').attr("value", x).text(x);
        $(el).append(val)
      })
    }
  },

  subscribe: function(el, callback) {
    $(el).on('keyup.selectInput', function(e) {
      callback();
    });
  },

  unsubscribe: function(el) {
    $(el).off('.selectInput');
  }

});

Shiny.inputBindings.register(selectInput, 'shiny.selectInput');

