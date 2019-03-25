internalHandler = (e)->
  return "Es posible que los cambios realizados se eliminen"

$(document).on 'ready pjax:end', ->
  if location.href.match(/(admin\/post\/new|admin\/post\/([0-9]*)\/edit)/)
    console.log 'ok'
    $(window).on('beforeunload', internalHandler);
  else
    console.log 'nope'
    $(window).off('beforeunload', internalHandler);



