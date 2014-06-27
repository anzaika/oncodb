$(document).ready ->
  $("tr").click ->
    href = $(this).attr("href")
    window.location = href  if href
    return

  $(".not-empty a").first().click()

  return
