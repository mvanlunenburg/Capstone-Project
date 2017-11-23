#merge data
#setwd
setwd("C:/Users/Mari van Lunenburg/Desktop/Coursera/R Programming/Capstone Project/final")

#load datasets per ngram
load("nfreq1.f6.RData")
freq1_1 <- freq6
load("nfreq2.f6.RData")
freq1_2 <- freq6
load("nfreq3.f6.RData")
freq1_3 <- freq6
load("nfreq4.f6.RData")
freq1_4 <- freq6
load("nfreq5.f6.RData")
freq1_5 <- freq6
load("nfreq6.f6.RData")
freq1_6 <- freq6
load("nfreq7.f6.RData")
freq1_7 <- freq6
load("nfreq8.f6.RData")
freq1_8 <- freq6
load("nfreq9.f6.RData")
freq1_9 <- freq6
load("nfreq10.f6.RData")
freq1_10 <- freq6

#make list of every 10% data per ngram 
freqs<- list(freq1_1, freq1_2,freq1_3, freq1_4, freq1_5,freq1_6,freq1_7,freq1_8,freq1_9,freq1_10)

#join 10 ngrams
test <- join_all(list(freq1_1, freq1_2,freq1_3, freq1_4, freq1_5,freq1_6,freq1_7,freq1_8,freq1_9,freq1_10), by='word', type='left')

#sum ngram frequencies and rearrange and rename column
Hexagrams  <- transform(test, ACTION = rowSums(test[, 2:11], na.rm = TRUE))
Hexagrams2 <- Hexagrams[,grep("word|ACTION", colnames(Hexagrams))]
colnames(Hexagrams2)[2] <- "freq"

#save
save(Hexagrams2, file="Hexagrams2.RData")
