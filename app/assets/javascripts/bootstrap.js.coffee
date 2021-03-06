$(document).on "page:update", ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  templates = "<div class='tooltip' role='tooltip'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>"

  oldTp = $.fn.tooltip
  $.fn.tooltip = (opts) ->
    if typeof opts == "object" && opts.hasOwnProperty("msg_type")
      opts.template = $(templates).addClass("tooltip-#{opts.msg_type}")
      t = $(this).data("bs.tooltip") 
      if t 
        t.options.template = opts.template
        t.options.title = opts.title

      oldTp.call(this, opts)
    else
      oldTp.apply(this, arguments)
