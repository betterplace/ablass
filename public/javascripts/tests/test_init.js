(function() {

  require(['underscore', 'jquery', "jasmine", "jasmine_html"], function(_, $, jasmine, jasmine_html) {
    var currentWindowOnload, jasmineEnv, specs, trivialReporter;
    require(["../config/initialize/underscore"], function() {
      return {};
    });
    jasmineEnv = jasmine.getEnv();
    jasmineEnv.updateInterval = 1000;
    trivialReporter = new jasmine.TrivialReporter();
    jasmineEnv.addReporter(trivialReporter);
    jasmineEnv.specFilter = function(spec) {
      return trivialReporter.specFilter(spec);
    };
    currentWindowOnload = window.onload;
    specs = ['models/sin'];
    return require(specs, function(specs) {
      return jasmineEnv.execute();
    });
  });

}).call(this);
