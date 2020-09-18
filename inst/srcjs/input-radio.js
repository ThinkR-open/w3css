$(document).on("click", ".w3-radio", function(evt) {
  var el = $(evt.target);
  var local_radios = $(el).parent().parent().find(".w3-radio");
  for (var i = 0; i < local_radios.length; i++){
      $(local_radios).removeAttr("checked")
  }
  el.attr("checked", "true");
  el.trigger("change");
});

$(document).on("click", ".w3-radio-parent", function(evt) {
  console.log("après");
    debugger;
  var el = $(evt.target);
  el.trigger("change");
});


const checkboxBinding = new Shiny.InputBinding();

$.extend(checkboxBinding, {
  find: function(scope) {
    return $(scope).find(".w3-radio-parent");
  },
  getValue: function(el) {
    var all_radios = $(el).find(".w3-radio");
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
    $(el).value(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.checkboxBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".checkboxBinding");
  }
});

Shiny.inputBindings.register(checkboxBinding);
