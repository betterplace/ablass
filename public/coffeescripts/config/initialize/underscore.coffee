define ['underscore'], ( _ )-> 

  _.templateSettings = 
      interpolate: /\{\{(.+?)\}\}/g