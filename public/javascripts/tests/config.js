(function() {

  require.config({
    deps: ['test_init'],
    paths: {
      libs: '../libs',
      plugins: '../plugins',
      jquery: '../libs/jquery',
      jquerymobile: '../libs/jquery.mobile-1.3.2.min',
      backbone: '../libs/backbone.min',
      underscore: '../libs/underscore.min',
      marionette: '../libs/backbone.marionette.min',
      jasmine: '../libs/jasmine/jasmine',
      jasmine_html: '../libs/jasmine/jasmine-html',
      text: '../libs/requirejs.text',
      sin: '../models/sin',
      project: '../models/project',
      sin_view: '../views/sins/sin-view',
      project_view: '../views/projects/item-view'
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
      },
      jasmine: {
        exports: 'jasmine'
      },
      jasmine_html: {
        deps: ['jasmine'],
        exports: 'jasmine_html'
      }
    }
  });

}).call(this);
