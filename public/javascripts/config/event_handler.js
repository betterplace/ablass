(function() {

  define(["underscore", "backbone"], function(_, Backbone) {
    var eh;
    eh = _.once(function() {
      return _.extend({}, Backbone.Events);
    });
    return eh();
  });

}).call(this);
