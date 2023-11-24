library(httr)


spotify_token <- function() {
  client_idd <- Sys.getenv("SPOTIFY_ID")
  client_secrett <- Sys.getenv("SPOTIFY_SECRET")
  
  # Token almak için gerekli endpoint
  token_url <- "https://accounts.spotify.com/api/token"
  
  # Token isteği için gerekli body
  token_body <- list(
    grant_type = "client_credentials",
    client_id = client_idd,
    client_secret = client_secrett
  )
  
  # POST isteği gönderme
  headers = c(
    'Content-Type' = 'application/x-www-form-urlencoded'
  )
  
  token_response <- httr::POST(
    url = token_url,
    body = token_body,
    encode = "form",
    config = add_headers(headers)
  )
  
  # HTTP status code kontrolü
  status_code <- status_code(token_response)
  
  # Token değerini alma
  token_value <- httr::content(token_response)$access_token
  
  # Döndürülecek liste
  result <- list(
    status_code = status_code,
    token = paste("Bearer", token_value)
  )
  
  return(result)
}