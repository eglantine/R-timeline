# Remove this line once packages are installed
install.packages(c("twitteR","RJSONIO")

library(twitteR)
library(RJSONIO)
library(ROAuth)
load("~/R/R-timeline/twitCred.RData")
registerTwitterOAuth(twitCred)

# Run only once
tweets <- homeTimeline(n=200)
TLframe <- do.call("rbind", lapply(tweets, as.data.frame))
TLframe <- TLframe[order(TLframe$id),]
TLframe <- TLframe[!duplicated(TLframe$id),]
write.table(TLframe, "~/R/R-timeline/savedTimeline", append=FALSE,sep="\t",qmethod="double")

# Run everytime
savedTL <- read.table("~/R/R-timeline/savedTimeline",header=T,sep="\t",fill=T,quote="\"", allowEscapes=TRUE)
tweets <- homeTimeline(sinceID=max(savedTL$id),n=200)
TLframe <- do.call("rbind", lapply(tweets, as.data.frame))
TL <- rbind (TLframe,savedTL)
TL <- TL[order(TL$id),]
TL <- TL[!duplicated(TL$id),]
write.table(TL, "~/R/R-timeline/savedTimeline", append=FALSE,sep="\t",qmethod="double")