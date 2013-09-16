require ['underscore', 'jquery', "jasmine", "jasmine_html"], (_, $, jasmine, jasmine_html)->

  # Don't forget to re run the initizations of the App
  require ["../config/initialize/underscore"], ()->
    {}

  jasmineEnv = jasmine.getEnv()
  jasmineEnv.updateInterval = 1000
  trivialReporter = new jasmine.TrivialReporter()
  jasmineEnv.addReporter(trivialReporter)
  jasmineEnv.specFilter = (spec)->
    trivialReporter.specFilter(spec)
  currentWindowOnload = window.onload

  specs = [
    'models/sin'
  ]

  require specs, (specs)->
    jasmineEnv.execute();
