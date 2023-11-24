

source_code <- source("C:\\Users\\ibrah\\OneDrive\\Desktop\\Labex2_Q2_210401092_Alp_Dikmen.R")

# Test 2.1
exists("spotify_search_artist")

# Test 2.2
class(spotify_search_artist) == "function"

# Test 2.3
result <- spotify_search_artist("The Doors")
print(result)

# Test 2.4
print(length(result))

# Test 2.5
print(names(result)[1]) 

# Test 2.6
print(class(result$status_code))

# Test 2.7
print(result$status_code == 200)

# Test 2.8
print(names(result)[2])

# Test 2.9
print(class(result$search_results))

# Test 2.10
print(ncol(result$search_results) == 2)

# Test 2.11
print(colnames(result$search_results) == c("artist", "id"))

# Test 2.12
print(result$search_results[1, "id"] == "22WZ7M8sxp5THdruNY3gXt")