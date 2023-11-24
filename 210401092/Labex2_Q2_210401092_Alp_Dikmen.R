library(httr)

spotify_search_artist <- function(artist_name) {
  token <- httr::POST(
    url = "https://accounts.spotify.com/api/token",
    body = list(
      grant_type = "client_credentials",
      client_id = Sys.getenv("SPOTIFY_ID"),
      client_secret = Sys.getenv("SPOTIFY_SECRET")
    ),
    encode = "form",
    config = add_headers('Content-Type' = 'application/x-www-form-urlencoded')
  )$access_token
  
  response <- httr::GET(
    url = "https://api.spotify.com/v1/search",
    query = list(q = artist_name, type = "artist"),
    add_headers(Authorization = paste("Bearer", token))
  )
  
  status_code <- httr::http_status(response)
  
  search_results <- httr::content(response)$artists
  result_data <- data.frame(artist = search_results$items$name, id = search_results$items$id)
  
  list(
    status_code = as.numeric(status_code),
    search_results = result_data
  )
}