jQuery ->
  $(".calendar-day").on "click", ->
    date = $(this).data("date")
    location.href = "/training_sessions/new?training_session[start_time]=#{date}"
