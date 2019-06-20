#Gather 1000 tweets about the second Scottish Independence Referendum from the UK, and figure out from which parts of the UK they are from.
#Author: Kyle Chan (UNC Chapel Hill)

app_name<-"" # you need your own credentials
consumer_key<-""
consumer_secret<-""
access_token<-""
access_token_secret<-""

library(devtools)
install_github("mkearney/rtweet")

library(rtweet)
twitter_token <- create_token(
  app = app_name,
  consumer_key = consumer_key,
  consumer_secret = consumer_secret)

#lookup using google maps geocode api (https://google-developers.appspot.com/maps/documentation/utils/geocoder/#q%3Duk)
#the lookup_cords function is very unstable, so it's better just to use the API from google directly.

independence<- search_tweets(q="#indyref2", n=1000, geocode = "55.378051,-3.435973,1000mi", type="recent", include_rts=FALSE)
geocoded <- lat_lng(independence)
par(mar = c(0, 0, 0, 0))
{maps::map("world", regions="uk", lwd = .25)
  with(geocoded, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))}
