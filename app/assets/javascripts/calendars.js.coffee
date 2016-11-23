jQuery ->
$(".calendar-day").on "click", ->
    date = $(this).data("date")
    location.href = "/training_sessions/new[start_time]=#{date}"
