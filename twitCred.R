# Remove this line once package is installed
install.packages("ROAuth")

library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/access_token"
authURL = "https://api.twitter.com/oauth/authorize"
consumerKey = ""
consumerSecret = ""
twitCred <- OAuthFactory$new(consumerKey=consumerKey,consumerSecret=consumerSecret,
                             requestURL=requestURL,accessURL=accessURL)
twitCred$handshake()

# Here, R will return a token. Open your browser, log into the Twitter account you want to use and go to
# https://api.twitter.com/oauth/authorize?oauth_token=
# Followed by the token. Yes, you have to write the token manually, but you must to this only once per account.
# Twitter will return a six digits PIN, type it into your R console. You're done!

registerTwitterOAuth(twitCred)
save(twitCred,"~/R/R-timeline/twitCred.RData")