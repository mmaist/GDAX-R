library(httr)
library(jsonlite)
#GDAX API
#Author: Max Maistros

#GDAX API base URL
url <- "https://api.gdax.com"

getProducts <- function(){
  #Gets a list of available currency pairs for trading.
  url <- httr::modify_url(url, path = "/products")
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}

getProductOrderBook <- function(product_id, level = 1) {
  
  url <- httr::modify_url(url, path = paste("/products/", product_id, "/book", sep = ""), query = list("level" = level))
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(r, "text"))
  
  
  return(as.data.frame(content))
}

getProductTicker <- function(product_id) {
  
  url <- httr::modify_url(url, path = paste("/products/", product_id, "/ticker", sep = ""))
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(r, "text"))
  
  return(as.data.frame(content))
}

getProductTrades <- function(product_id) {
  
  url <- httr::modify_url(url, path = paste("/products/", product_id, "/trades", sep = ""))
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}

getProductHistoricRates <- function(product_id, start = NULL, end = NULL,
                                    granularity = NULL) {
  
  url <- httr::modify_url(url, path = paste("/products/", product_id, "/candles", sep = ""), query = list("start" = start,
                                                                                                          "end" = end,
                                                                                                          "granularity" = granularity))
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}

getProduct24hStats <- function(product_id) {
  
  url <- httr::modify_url(url, path = paste("/products/", product_id, "/stats", sep = ""))
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}

getCurrencies <- function(proxy = NULL) {
  
  url <- httr::modify_url(url, path = "/currencies")
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}

getTime <- function(proxy = NULL) {
  
  url <- httr::modify_url(url, path = "/time")
  
  response <- httr::GET(url)
  
  content <- jsonlite::fromJSON(httr::content(response, "text"))
  
  return(as.data.frame(content))
}
