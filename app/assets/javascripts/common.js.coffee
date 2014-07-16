$(document).ready ->
  $("tr").click ->
    href = $(this).attr("href")
    window.location = href  if href

  $(".not-empty a").first().click()

