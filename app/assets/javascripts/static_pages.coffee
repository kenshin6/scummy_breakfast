$(document).on 'turbolinks:load', ->
  height = $('.main_content').height()
  $('.sidebar').height height

$(document).on 'turbolinks:load', ->
  title = $('#post_title')
  counter = $('#title_counter')
  max_length = counter.data('maximum-length')
  title.keyup ->
    counter.text ($(this).val().length)
    return
  return

$(document).on 'turbolinks:load', ->
  didScroll = undefined
  lastScrollTop = 0
  delta = 5
  navbarHeight = $('header').outerHeight()

  $(window).scroll (event) ->
    didScroll = true
    return

  # run hasScrolled() and reset didScroll status
  setInterval (->
    if didScroll
      hasScrolled()
      didScroll = false
    return
  ), 250

  hasScrolled = ->
    st = $(this).scrollTop()
    if (Math.abs(lastScrollTop - st) <= delta)
      return
    if st > lastScrollTop and st > navbarHeight
      # Scroll Down
      $('header').removeClass('nav-down').addClass 'nav-up'
    else
      # Scroll Up
      if st + $(window).height() < $(document).height()
        $('header').removeClass('nav-up').addClass 'nav-down'
    lastScrollTop = st
    return
