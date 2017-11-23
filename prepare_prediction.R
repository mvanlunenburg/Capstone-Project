#setwd
setwd("C:/Users/Mari van Lunenburg/Desktop/Coursera/R Programming/Capstone Project/final")
 
#load data 
load("Unigrams2.RData")
load("Bigrams2.RData")
load("Trigrams2.RData")
load("Fourgrams2.RData")
load("Pentagrams2.RData")
load("Hexagrams2.RData")

#remove ngrams with occurrence < 3
Unigrams <- Unigrams2[Unigrams2$freq > 2,]
Bigrams <- Bigrams2[Bigrams2$freq > 2,]
Trigrams <- Trigrams2[Trigrams2$freq > 2,]
Quadgrams <- Fourgrams2[Fourgrams2$freq > 2,]
Pentagrams <- Pentagrams2[Pentagrams2$freq > 2,]
Hexagrams <- Hexagrams2[Hexagrams2$freq > 2,]

#words as characters
Unigrams$word <- as.character(Unigrams$word)
Bigrams$word <- as.character(Bigrams$word)
Trigrams$word <- as.character(Trigrams$word)
Quadgrams$word <- as.character(Quadgrams$word)
Pentagrams$word <- as.character(Pentagrams$word)
Hexagrams$word <- as.character(Hexagrams$word)

#split ngram into first word(s) and the next word
sixgrams <- do.call(rbind, strsplit(Hexagrams$word, split = " "))
sixgrams <- cbind(apply(sixgrams[, 1:5], 1, function(x) paste(x, collapse = " ")),
                  sixgrams[, 6])
Hexagrams$word <- sixgrams[, 1]
Hexagrams$nextword <- sixgrams[, 2]

fivegrams <- do.call(rbind, strsplit(Pentagrams$word, split = " "))
fivegrams <- cbind(apply(fivegrams[, 1:4], 1, function(x) paste(x, collapse = " ")),
                   fivegrams[, 5])
Pentagrams$word <- fivegrams[, 1]
Pentagrams$nextword <- fivegrams[, 2]

fourgrams <- do.call(rbind, strsplit(Quadgrams$word, split = " "))
fourgrams <- cbind(apply(fourgrams[, 1:3], 1, function(x) paste(x, collapse = " ")),
                   fourgrams[, 4])
Quadgrams$word <- fourgrams[, 1]
Quadgrams$nextword <- fourgrams[, 2]

threegrams <- do.call(rbind, strsplit(Trigrams$word, split = " "))
threegrams <- cbind(apply(threegrams[, 1:2], 1, function(x) paste(x, collapse = " ")),
                    threegrams[, 3])
Trigrams$word <- threegrams[, 1]
Trigrams$nextword <- threegrams[, 2]

twograms <- do.call(rbind, strsplit(Bigrams$word, split = " "))
Bigrams$word <- twograms[, 1]
Bigrams$nextword <- twograms[, 2]

monograms <- Unigrams[,1]


#save documents (total size 7.35 MB)
save(Unigrams, file="Unigrams.RData")
save(Bigrams, file="Bigrams.RData")
save(Trigrams, file="Trigrams.RData")
save(Quadgrams, file="Quadgrams.RData")
save(Pentagrams, file="Pentagrams.RData")
save(Hexagrams, file="Hexagrams.RData")

save(monograms, file="monograms.RData")
save(twograms, file="twograms.RData")
save(threegrams, file="threegrams.RData")
save(fourgrams, file="fourgrams.RData")
save(fivegrams, file="fivegrams.RData")
save(sixgrams, file="sixgrams.RData")



saveRDS(Unigrams, file="Unigrams.RDS")
saveRDS(Bigrams, file="Bigrams.RDS")
saveRDS(Trigrams, file="Trigrams.RDS")
saveRDS(Quadgrams, file="Quadgrams.RDS")
saveRDS(Pentagrams, file="Pentagrams.RDS")
saveRDS(Hexagrams, file="Hexagrams.RDS")

saveRDS(monograms, file="monograms.RDS")
saveRDS(twograms, file="twograms.RDS")
saveRDS(threegrams, file="threegrams.RDS")
saveRDS(fourgrams, file="fourgrams.RDS")
saveRDS(fivegrams, file="fivegrams.RDS")
saveRDS(sixgrams, file="sixgrams.RDS")
