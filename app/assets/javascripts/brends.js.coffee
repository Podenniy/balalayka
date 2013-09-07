$("a#link, a#linK_two ").click ->
  if $("#some_text").is(":visible")
    $("#some_text").hide('blind', 1000)
    $(this).text "Читать"
  else
    $("#some_text").show('blind', 1000)
    $(this).text "Скрыть"
    
  false

 $("a#link ").click ->
   if $(".info").is(":visible")
     $(".info").hide('blind', 1000)
     $(this).text "Читать"


 $("a#linK_two ").click ->
   if $(".info").is(":not(:visible)")
     $(".info").show('blind', 1000)
     $(this).text "Скрыть"