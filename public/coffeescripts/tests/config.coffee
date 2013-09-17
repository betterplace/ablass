require.config

  # Initialize the application with the main application file.
  deps: ['test_init']
  paths:
    # JavaScript folders.
    libs:         '../libs'
    plugins:      '../plugins' #Amaze and 3rd party plugins / components
    # Libraries.
    jquery:       '../libs/jquery'
    jquerymobile: '../libs/jquery.mobile-1.3.2.min'
    backbone:     '../libs/backbone.min'
    underscore:   '../libs/underscore.min'
    marionette:   '../libs/backbone.marionette.min'
    jasmine:      '../libs/jasmine/jasmine'
    jasmine_html: '../libs/jasmine/jasmine-html'
    text:         '../libs/requirejs.text' #2.0.1 :- require plug-in which compiles our templates

    #models
    sin: '../models/sin'
    project: '../models/project'

    #views
    sin_view: '../views/sins/sin-view'
    project_view: '../views/projects/item-view'

  shim:
    # Backbone library depends on lodash and jQuery.
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'

    # Marionette depends on jquery, lodash and backbone
    marionette: 
      deps: ['jquery', 'backbone', 'underscore']
      exports: 'Marionette'

    jquerymobile: ['jquery']

    underscore:
      exports: '_'

    jasmine:
      exports: 'jasmine'

    jasmine_html:
      deps: ['jasmine']
      exports: 'jasmine_html'


