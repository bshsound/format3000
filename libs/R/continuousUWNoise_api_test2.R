## Initiate R-functions
## Create the url

get_uri <- function(service) {
  paste0(
    "https://underwaternoise.ices.dk/continuous/api/",
    service
  )
}

## Get a token
token <- function(user,pw) {
  res <-
    httr::POST(
      get_uri("token"),
      body =
        list(
          UserName = user,
          password = pw
        ),
      encode = "form"
    )
  
  res_content <- httr::content(res)
  
  res_content$result$token
}

## Get a list of file screenings 
getListFileScreenings <- function(jwt) {
  res <-
    httr::GET(
      get_uri("getListFileScreenings"),
      httr::add_headers(Authorization = paste("Bearer", jwt))
    )
  
  # return list of submissions
  httr::content(res)
}

## Upload a file
UploadFile <- function(fname, jwt) {
  file <- httr::upload_file(fname)
  
  res <-
    httr::POST(
      get_uri("UploadFile"),
      httr::add_headers(Authorization = paste("Bearer", jwt)),
      body = list(fileToUpload = file)
    )
  
  message(httr::content(res))
  
  # return response
  res
}



user <- "basan"
pw <- "Frba2706"
## Gets javascript web token
jwt <- token(user,pw)


list=screenings <- getListFileScreenings(jwt)
capture.output(list,file = 'TEST.txt')
