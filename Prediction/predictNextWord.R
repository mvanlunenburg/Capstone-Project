predictNextWord <- function(input, monograms, twograms, threegrams, fourgrams, fivegrams, sixgrams){
        input <- tolower(input)
        splitInput <- unlist(strsplit(input, split = " "))
        if (length(splitInput) > 5){
                input2 <- paste(tail(splitInput, 5), collapse = " ")
        } else {
                input2 <- paste(splitInput, collapse = " ")
        }
        sixgramPred <- head(Hexagrams[Hexagrams$word == input2,]$nextword, 10)
        if (length(sixgramPred > 0)){
                print("sixgramPred")
                return(sixgramPred)
        } else {
                input2 <- paste(tail(splitInput, 4), collapse = " ")
                fivegramPred <- head(Pentagrams[Pentagrams$word == input2,]$nextword, 10)
                if (length(fivegramPred > 0)){
                        print("fivegramPred")
                        return(fivegramPred)
                } else {
                        input2 <- paste(tail(splitInput, 3), collapse = " ")
                        fourgramPred <- head(Quadgrams[Quadgrams$word == input2,]$nextword, 10)
                        if (length(fourgramPred > 0)){
                                print("fourgramPred")
                                return(fourgramPred)
                        } else {
                                input2 <- paste(tail(splitInput, 2), collapse = " ")
                                trigramPred <- head(Trigrams[Trigrams$word == input2,]$nextword, 10)
                                if (length(trigramPred > 0)){
                                        print("trigramPred")
                                        return(trigramPred)
                                } else {
                                        input2 <- tail(splitInput, 1)
                                        bigramPred <- head(Bigrams[Bigrams$word == input2,]$nextword, 10)
                                        if (length(bigramPred) > 0){
                                                print("bigramPred")
                                                return(bigramPred)
                                        } else {
                                                unigramPred <- head(Unigrams[Unigrams$word == input2,]$nextword, 10)
                                                if (length(unigramPred) > 0){
                                                        print("unigramPred")
                                                        return(unigramPred)
                                                } else {
                                                        monogramPred <- head(Unigrams$word, 10)
                                                        print("monogramPred")
                                                        return(monogramPred)
                                                }
                                        }
                                }
                        }
                }
        }
}
