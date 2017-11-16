app = window.App = {}

sleep = ( ms ) ->
  new Promise ( resolve ) ->
    window.setTimeout resolve, ms

write_to = ( who, msg ) ->
  if who is 'bob'
    target = App.bob
  else
    target = App.me

  until target.idle
    await sleep(200)

  target.toggle()
  target.write( msg, () -> return )

content_pre = {
  root: {
    text: "It's that aloneness that made it clear."
    next: "alone"
  }
  alone: {
    text: "That shared <a href=\"https://en.wikipedia.org/wiki/Weird_Tales\">weirdness</a>. The confidence in being different, of not giving into the norms and pressures and conformity."
    next: "society"
  }
  society: {
    text: "Seeing the system is built on 'us' vs 'them', that the society we find ourselves in is <a href=\"https://en.wikipedia.org/wiki/Portal:Robert_E._Howard/Selected_quote/1\">unnatural</a>, perverse, ignoble."
    next: "bullshit"
  }
  bullshit: {
    text: "This is all bullshit sentimentality, though."
    next: "compare"
  }
  compare: {
    text: "Who am I to compare myself to him?"
    next: "patterns"
  }
  patterns: {
    text: "The human mind tries to find patterns, and as a computer scientist with a love of math and puzzles and obsessive compulsions, who is more keen to find a pattern than I?"
    next: "vain"
  }
  vain: {
    text: "This pattern feels vain, a desperate grasping at some kind of meaning to my own life through the lens of stronger, more successful and driven men than I."
    next: "fool"
  }
  fool: {
    text: "I am a fool to think..."
    next: "fiction"
  }
  fiction: {
    text: "But that's fiction, isn't it?"
    next: "reimagine"
  }
  reimagine: {
    text: "To reimagine our life as something different, to see a greatness that could never be our own?"
    next: "bitter"
  }
  bitter: {
    text: "But this isn't fiction, it's a sobering reality: I can't, and very well never should, be quite the same as someone else."
    next: "betray"
  }
  betray: {
    text: "Wouldn't <i>being someone</i>, to <i>envy</i> them, betray that 'noble' notion of being alone and different, anyways?"
    next: "envy"
  }
  envy: {
    text: "It's hard for me to call this envy, really."
    next: "thatlife"
  }
  thatlife: {
    text: "It's not that I want that life <i>for</i> me, but..."
    next: "cocktail"
  }
  cocktail: {
    text: "It's this cocktail of sloth and pride, perhaps, that's gotten me wherever I am now."
    next: "better"
  }
  better: {
    text: "It's just, I want to see myself better."
    next: "myhands"
  }
  myhands: {
    text: "It's in my hands to get there, but sometimes I need proof that I'm not alone."
    next: "greater"
  }
  greater: {
    text: "And I see my own quirks and demons in nobody greater than myself, more than I do in him."
    next: "end"
  }
  end: {
    text: ""
    after: () ->
      $( "#Precursor" ).toggleClass( "hidden" )
      $( "#Reflections" ).animate( { opacity: 1 }, 700 )
  }
}

content_bob = {
  root: {
    text: "Robert E. Howard spun his yarn on an <a href=\"https://onanunderwood5.blogspot.com/2012/08/the-underwood-no-5.html\">Underwood No. 5.</a>"
    next: "typewriters"
  }
  typewriters: {
    text: "There's something remarkable about typewriters. All old tech, really."
    next: "strangeadmiration"
  }
  strangeadmiration: {
    text: "It's strange, admiring the pragmatic simplicity of times past."
    next: "oldreverence"
    after: () ->
      write_to( "me", "Whatever happened to the honest tools of an artisan?" )
  }
  oldreverence: {
    text: "It's one of those things I think we share, <a href=\"https://en.wikipedia.org/wiki/Portal:Robert_E._Howard/Selected_quote/6\">a reverence for the old</a>."
    next: "naivenostalgia"
  }
  naivenostalgia:{
    text: "Whether it's from a naive nostalgia or academic curiosity for the mystique."
    next: "methinks"
  }
  methinks: {
    text: "It comes down to a dissatisfaction with the present, I might think."
    next: "insecurity"
    after: () ->
      write_to( 'me', "Crom knows there's little to be satisfied with today." )
  }
  insecurity: {
    text: "And it shows, in his work, an insecurity in not only the world, but in himself."
    next: "wanderingtexan"
  }
  wanderingtexan: {
    text: "His youth was a meandering one, between Texan boomtowns."
    next: "indomitable"
    after: () ->
      write_to( 'bob', "<span class=\"quote\">\"I'll say one thing about an oil boom; it will teach a kid that Life's a pretty rotten thing as quick as anything I can think of.\"</span>" )
      write_to( 'me', "Traveling between countries was certainly chaotic, but nothing so indelicate as Howard's youthhood travels." )
      write_to( 'me', "Nonetheless, by that dispossessive existence, I've never known roots, or allegiance to town or country, only a transient, wandering state." )
      write_to( 'me', "Howard's Texan roots were the bread and butter of his storytelling, something I may indeed find envy in." )
  }
  indomitable: {
    text: "But this life forged in him a spirit indomitable."
    next: "avarice"
  }
  avarice: {
    text: "It would seem that most of all, it was <a href=\"https://www.reddit.com/r/Cimmeria/comments/6euou6/robert_e_howard_on_reading/\">an avarice</a> for the written word that enthralled him in his youth."
    next: "intoxicated"
  }
  intoxicated: {
    text: "<a href=\"https://upload.wikimedia.org/wikipedia/commons/0/03/REH_Schlitz.PNG\">Intoxicated</a>, and estranged by curious passions, Howard's aloneness was yet punctuated by <a href=\"https://upload.wikimedia.org/wikipedia/commons/5/5e/REH_Three_Swords.PNG\">companionship</a>."
    next: "fellowships"
    after: () ->
      write_to( 'me', "A beautiful thing, friendship, to those that can find it - and to those that cannot." )
  }
  fellowships: {
    text: "Such tight-knit fellowships are the stuff of legends."
    next: "lovecraft"
  }
  lovecraft: {
    text: "And he was a fortunate man, to find even greater peers among his <a href=\"http://www.hplovecraft.com/life/friends.aspx\">contemporaries</a>."
    next: "scarceface"
    after: () ->
      write_to( 'me', "At times I wonder, of the people I have yet to cross, would any friendship be as enriching as these?" )
  }
  scarceface: {
    text: "But those that knew his face were scarce yet."
    next: "rarefew"
  }
  rarefew: {
    text: "It's the rare few that want to put up with your eccentricity, your family problems, your marriage to work and the dreams and fantasies that to all onlookers are exhibits of naught but a serious affliction of the mind, if not soul."
    next: "rednails"
  }
  rednails: {
    text: "Who, today, would want to befriend the man that recites (screams) his short stories about <a href=\"http://gutenberg.net.au/ebooks06/0600771h.html\">Aztec gang wars</a> outside the drug store while you buy a soda?"
    next: ""
  }
  friendlyfaces: {
    text: "Even the best of us need those friendly faces to soothe ill spirits."
    next: "motherscomforts"
  }
  motherscomforts: {
    text: "Once, his mother's poetic comforts eased such troubled countenance."
    next: "dimmed"
    after: () ->
      write_to( 'me', "It would be my mother's own efforts that opened my mind to a world and people worth my admiration." )
  }
  dimmed: {
    text: "In her illness, the light guided him faded, and so his world became dimmer yet."
    next: "caretaker"
    after: () ->
      write_to( 'me', "I don't recall much of my own mother's illness, but for a dusky haze of scattered memories." )
  }
  caretaker: {
    text: "He had become her guardian, her caretaker, in the youthful days meant to be spent living free."
    next: "suicide"
    after: () ->
      write_to( 'me', "I wish, pointlessly, I could have been a better son." )
  }
  suicide: {
    text: "In losing her, he would <a href=\"https://en.wikipedia.org/wiki/Automatic_Colt_Pistol\">lose himself</a>."
    next: "successmeaning"
    after: () ->
      write_to( 'me', "I have yet to find again who I was, those years before." )
  }
  successmeaning: {
    text: "All the success he had by that point meant nothing."
    next: "frightfullove"
    after: () ->
      write_to( 'me', "Can I hope to be fulfilled by success, or is it just a hollow promise to distract me from my own terrors?" )
  }
  frightfullove: {
    text: "A frightful thing, to love someone."
    next: "vulnerable"
  }
  vulnerable: {
    text: "It makes you vulnerable."
    next: ""
    after: () ->
      write_to( 'bob', "You risk losing it." )
  }
}

content_me = {
  root: {
    text: "I type, undeserving of pleasant analogies to more noble crafts, on a Lenovo Z50-70."
    next: "lookup"
  }
  lookup: {
    text: "I had to look that up, it's not exactly memorable."
    next: "thisthing"
  }
  thisthing: {
    text: "<span class=\"scratchthat\">I hate this thing, really.</span>"
    next: "scratchthat"
  }
  scratchthat: {
    text: "No, scratch that."
    next: "ashamedof"
    after: () ->
      $(".scratchthat").css( 'text-decoration', 'line-through' )
  }
  ashamedof: {
    text: "I'm ashamed of this thing. It's vulgar, victim to <a href=\"http://money.cnn.com/2015/02/19/technology/security/lenovo-superfish/index.html\">corporate malpractice</a> and <a href=\"https://www.networkworld.com/article/3236064/servers/minix-the-most-popular-os-in-the-world-thanks-to-intel.html\">secrets hidden</a> in the Frankenstein's monster of parts and components."
    next: "redeemthis"
  }
  redeemthis: {
    text: "I've tried to redeem it - exorcised it of the Windows software parcelled with it like some gypsy's curse."
    next: "archlinux"
  }
  archlinux: {
    text: "It runs only Arch Linux now. Yeah, I know how that sounds."
    next: "braggadocious"
  }
  braggadocious: {
    text: "Some would say that's <a href=\"https://github.com/henry-malinowski/arch_linux_iq_meme\">braggadocious</a> or <a href=\"http://i0.kym-cdn.com/photos/images/original/001/170/302/c4b.png\">conceited</a>, but I don't see that - it's the only option I have, really, to try keep my withering grip on integrity."
    next: "dontcare"
    after: () ->
      write_to( 'bob', "A fiery independence burned in him, to <a href=\"https://en.wikipedia.org/wiki/Character_of_Robert_E._Howard#Resentment_of_authority\">shun</a> authority and subservience." )
  }
  dontcare: {
    text: "It's not about being better than 'them', it's about readjusting the standard for what <i>we</i>, as users and craftsmen, deserve to have: ownership of our own tools."
    next: "wheredoes"
  }
  wheredoes: {
    text: "But where does that get me?"
    next: "distractfrom"
  }
  distractfrom: {
    text: "I try to find ways to distract myself from my own inadequecies and insecurities, to consume myself in wistfulness and dissatisfaction with everthing but myself because to look within myself and acknowledge those faults might shatter these delusions of grandeur."
    next: "notwrong"
  }
  notwrong: {
    text: "It's all true, though."
    next: "awful"
  }
  awful: {
    text: "There will always be awful people doing and awful things."
    next: "beone"
  }
  beone: {
    text: "So I have to make <a href=\"https://thoughtcatalog.com/ryan-holiday/2017/03/dont-waste-time-arguing-what-a-good-man-is-be-one/\">changes in myself</a>, because to do anything else <i>would</i> be delusional."
    next: "displace"
    after: () ->
      write_to( 'bob', "Howard had a very prectical approach to the enemies he expected: he lifted weights, boxed, and carried a gun." )
  }
  displace: {
    text: "That struggle makes us grow, but it displaces us, too."
    next: "noplace"
  }
  noplace: {
    text: "We stop to look around and we see there's no place for us where we came from."
    next: "outskirts"
  }
  outskirts: {
    text: "We find ourselves on the outskirts of what was once normal. Estranged."
    next: "naturallyweird"
    after: () ->
      write_to( 'bob', "<span class=\"quote\">\"Never the less, it is no light thing to enter into a profession absolutely foreign and alien to the people among which one's lot is cast; a profession which seems as dim and faraway and unreal as the shores of Europe.\"</span>" )
  }
  naturallyweird: {
    text: "It's just what comes naturally to us. We're <a href=\"https://upload.wikimedia.org/wikipedia/commons/c/cf/REH_TCS_Spear_%26_Fang.PNG\">naturally weird</a>."
    next: "thinkourselves"
  }
  thinkourselves: {
    text: "And so we think to ourselves, if we aren't accepted here, then where?"
    next: "lookaround"
  }
  lookaround: {
    text: "We're left only with the choice to change our circumstance, in fantasy or reality. To find or make a world accepting of our <a href=\"https://en.wikipedia.org/wiki/Robert_E._Howard\'s_health#Eccentric_behavior\">deviance</a>."
    next: "dreamedandfound"
    after: () ->
      write_to( 'bob', "<span class=\"quote\">\"He’s trying to tell people he’s a writer and writers have a right to be odd. Since they think he’s crazy, anyway, he’ll show them just how crazy he can be.\" - Novalyne Price</quote>" )
  }
  dreamedandfound: {
    text: "But found or dreamed, those fantasies..."
    next: "realfantasy"
  }
  realfantasy: {
    text: "They're real, too."
    next: "woven"
  }
  woven: {
    text: "They're stitched, a collage of those threads picked from our own lives or those fantasies already familiar."
    next: "conversion"
    after: () ->
      write_to( 'bob', "<span class=\"quote\">\"We like to come here where there are big rocks and caves so we can play make-believe. Some day I am going to be an author and write stories about pirates and maybe cannibals. Would you like to read them?\"</span>" )
  }
  # root: {
  conversion: {
    text: "They are not quite <i>di</i>versions from reality so much as they are... <i>con</i>versions. <a href=\"https://en.wikipedia.org/wiki/Portal:Robert_E._Howard/Selected_quote/2\">Convergences</a>, really."
    next: "thereverse"
  }
  thereverse: {
    text: "One could think that the reverse would be true."
    next: "dreammaker"
  }
  dreammaker: {
    text: "That our own lives are a tapestry in and of themselves, stitched for perpetuity, our realities woven from threads drawn from our experiences."
    next: "kernel"
  }
  kernel: {
    text: "They all have meaning, and those fantasies all carry with them a kernel of reality with them, from somebody, somewhere, someplace."
    next: "weirdhome"
  }
  weirdhome: {
    text: "And these things, now woven, we carry with us everywhere. They give our weirdness a home."
    next: "guidance"
  }
  guidance: {
    text: "Almost a hundred years ago a crazy man wrote fantastical, thrilling tales about make-believe worlds that feel so real, their characters still guide and teach me today."
    next: "bycrom"
    after: () ->
      write_to( 'bob', "In no small part, I suspect those same tales gave meaning to the world he lived in, and helped him battle those very same demons." )
  }
  bycrom: {
    text: "It's hard to express how ridiculous that is."
    next: ""
    after: () ->
      write_to( 'me', "Thankfully, someone else <a href=\"http://www.wealdcomics.com/?chapters=by-crom-the-zine\">already</a> <a href=\"http://www.wealdcomics.com/?chapters=by-crom-the-collected-by-crom\">has</a>." )
  }
}

window.onload = ->
  setInterval(
    () -> $(".cursor").toggleClass( "blink" ),
    200
  )

  app.pre = new TypeQueue $("#Q_Pre"), content_pre
  app.bob = new TypeQueue $("#Q_Bob"), content_bob
  app.me  = new TypeQueue $("#Q_Me"), content_me
