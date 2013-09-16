(function() {

  define(['underscore'], function(_) {
    return _.templateSettings = {
      interpolate: /\{\{(.+?)\}\}/g
    };
  });

}).call(this);
