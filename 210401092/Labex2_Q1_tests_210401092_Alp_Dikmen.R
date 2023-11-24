# Dosyayı yükleyin
source_code <- source("C:\\Users\\ibrah\\OneDrive\\Desktop\\Labex2_Q1_210401092_Alp_Dikmen.R")

# Testler
# Test 1.1
exists("spotify_token")

# Test 1.2
class(spotify_token) == "function"

# Test 1.3
is.list(spotify_token())

# Test 1.4
length(spotify_token()) == 2

# Test 1.5
names(spotify_token()) == c("status_code", "token")

# Test 1.6
is.numeric(spotify_token()$status_code)

# Test 1.7
spotify_token()$status_code == 200

# Test 1.8
is.character(spotify_token()$token)

# Test 1.9
class(spotify_token()$token) == "character"

# Test 1.10
startsWith(spotify_token()$token, "Bearer ")

# Test 1.11
nchar(spotify_token()$token) == 122