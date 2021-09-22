$(document).on("click", ".w3_checkboxGroup-parent", function(evt) {
  alert("parent")
  $(evt.target).trigger("updated");
});


var checkboxGroup = new Shiny.InputBinding();

$.extend(checkboxGroup, {
  find: function(scope) {
    return $(scope).find('.w3_checkboxGroup-parent')
  },
  getValue: function(el) {
    var all_radios = $(el).find(".w3_checkboxGroup");
    var res = [];
    for (var i = 0; i < all_radios.length; i++){
      if ($(all_radios[i]).attr("checked")){
        res.push(
          $(all_radios[i]).attr("data-value")
        )
      }
    }
    return res;
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
    $(el).on('updated.checkboxGroup', function(e) {
      console.log("change.checkboxGroup")
      callback();
    });

  },
  unsubscribe: function(el) {
    console.log("unsubscribe")
    $(el).off('.checkboxGroup');
  }
});
Shiny.inputBindings.register(checkboxGroup, 'shiny.checkboxGroup');
