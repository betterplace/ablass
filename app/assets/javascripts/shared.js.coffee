$ ->
  $("a").each ->
    $(this).click ->
      window.location=$(this).prop('href')
      return false
