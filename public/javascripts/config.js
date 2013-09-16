// Set the require.js configuration for your application.
require.config({

  // Initialize the application with the main application file.
  deps: ['init'],

  paths: {
    // JavaScript folders.
    libs: '../javascripts/libs',
    plugins: '../javascripts/plugins', // Amaze and 3rd party plugins / components

    // Libraries.
    jquery:       '../javascripts/libs/jquery',
    jquerymobile: '../javascripts/libs/jquery.mobile-1.3.2.min',
    backbone:     '../javascripts/libs/backbone.min',
    underscore:   '../javascripts/libs/underscore.min',
    marionette:   '../javascripts/libs/backbone.marionette.min',
    text: '../javascripts/libs/requirejs.text' // 2.0.1 :- require plug-in which compiles our templates
  },

  shim: {

    // Backbone library depends on lodash and jQuery.
    backbone: {
      deps: ['jquery', 'underscore'],
      exports: 'Backbone'
    },

    // Marionette depends on jquery, lodash and backbone
    marionette : {
      deps : ['jquery', 'backbone', 'underscore'],
      exports : 'Marionette'
    },

    jquerymobile : ['jquery'],

    underscore: {
      exports: '_'
    }
  }
});



