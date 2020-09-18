var editableList = new Shiny.InputBinding();

$.extend(editableList, {
  find: function(scope) {
    console.log("find")
    return $(scope).find('.w3-uleditable')
  },
  getValue: function(el) {
    let res = {};
    let lis = $(el).children();
    for (var i = 0; i < lis.length; i++){
      let child = $(lis[i]).find(".w3-licontent");
      res[$(lis[i]).attr("name")] = $(child).text()
    }
    return res;
  },
  setValue: function(el, value) {
    console.log("plop")
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    console.log("receiveMessage")
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    $(el).on('keyup.editableList', function(e) {
      console.log("change")
      callback();
    });

  },
  unsubscribe: function(el) {
    $(el).off('.editableList');
  }
});

Shiny.inputBindings.register(editableList, 'shiny.editableList');
