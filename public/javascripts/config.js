(function() {

  require.config({
    deps: ['init'],
    paths: {
      libs: '../javascripts/libs',
      plugins: '../javascripts/plugins',
      jquery: '../javascripts/libs/jquery',
      jquerymobile: '../javascripts/libs/jquery.mobile-1.3.2.min',
      backbone: '../javascripts/libs/backbone.min',
      underscore: '../javascripts/libs/underscore.min',
      marionette: '../javascripts/libs/backbone.marionette.min',
      text: '../javascripts/libs/requirejs.text'
    },
    shim: {
      backbone: {
        deps: ['jquery', 'underscore'],
        exports: 'Backbone'
      },
      marionette: {
        deps: ['jquery', 'backbone', 'underscore'],
        exports: 'Marionette'
      },
      jquerymobile: ['jquery'],
      underscore: {
        exports: '_'
      }
    }
  });

}).call(this);
