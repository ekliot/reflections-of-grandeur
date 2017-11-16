class TypeQueue
  constructor: (@div, @content) ->
    @cursor = "<a class=\"cursor\">_</a>"
    @span = "<span></span>"
    @p_span  = "<p>#{@span}</p>"
    @queue = []
    @idle  = false

    @div.append( @p_span )
    @lastp = @div.children().last()
    @push( @content["root"] )
    @toggle()

  toggle: () ->
    # if toggling to active
    if @idle
      # remove the cursor while typing
      @lastp.children( ".cursor" ).remove()

      # add the next text target
      @div.append( @p_span )

      @lastp = @div.children().last()
      @idle = false

    # if toggling to idle
    else
      @lastp.append( @cursor )

      # bind onclick to cursor
      @lastp.children( "a.cursor" ).on( 'click', () =>
        @shift()
      )

      @idle = true

  push: ( obj ) ->
    @queue.push( obj )

  shift: () ->
    object = @queue.shift()

    if not object?
      return

    if object.next? and @content[object.next]?
      @queue.push( @content[object.next] )

    @toggle()
    @write(
      object.text,
      object.after ? () -> return
    )

  write: ( subj, cb ) ->
    target = @lastp.children().last()
    typer = @make_typer( target[0] )

    if target[0].getBoundingClientRect().y < 0
      await sleep( 500 )
      $("html, body").animate({ scrollTop: target.offset().top }, 1000);

    if typeof subj is 'string' or subj instanceof String
      subj = subj.split( /(<[^>]*>)/ )

    if subj[0]?
      s = subj.shift()

      if s.match( /(<[^>]*>)/ )
        contents = subj.shift()

        target.append( s + subj.shift() )
        sub_target = target.children().last()

        @make_typer( sub_target[0] ).type( contents, () =>
          sub_target.html( contents )
          @write( subj, cb )

          if sub_target[0].tagName is "A"
            sub_target.click( () ->
              window.open( $( this ).attr( 'href' ), "_blank" )
              return false
            )
        )

      else
        typer.type( s, () =>
          @write( subj, cb )
        )

    else
      @carriage( target )
      cb()
      if @queue.length is 0 then @kill()

  make_typer: ( target ) ->
    return typewriter( target )
              .withAccuracy( 99 )
              .withMinimumSpeed( 30 )
              .withMaximumSpeed( 40 )
              .build()

  carriage: ( target ) ->
    rect = target[0].getBoundingClientRect()
    bottom = rect.y + rect.height + parseInt( $("body").css("padding-bottom") )
    if bottom >= document.documentElement.clientHeight
      $("html, body").animate({ scrollTop: $(document).height() }, 400);
    target.children( "a" ).addClass( "active" )
    @toggle()

  kill: () ->
    @lastp.children( ".cursor" ).remove()
