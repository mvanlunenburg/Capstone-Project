#
# This app gives suggestions for the next word in a phrase. 
# 

#load libraries
suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)))


#load data
unigrams <- readRDS(file="./unigrams.RDS")
bigrams <- readRDS(file="./bigrams.RDS")
trigrams <- readRDS(file="./trigrams.RDS")
quadgrams <- readRDS(file="./quadgrams.RDS")
pentagrams <- readRDS(file="./pentagrams.RDS") 
hexagrams <- readRDS(file="./hexagrams.RDS")

monograms <- readRDS(file="./monograms.RDS")
twograms <- readRDS(file="./twograms.RDS")
threegrams <- readRDS(file="./threegrams.RDS")
fourgrams <- readRDS(file="./fourgrams.RDS")
fivegrams <- readRDS(file="./fivegrams.RDS")
sixgrams <- readRDS(file="./sixgrams.RDS")

#function to predict the next word
predictNextWord <- function(input, monograms, twograms, threegrams, fourgrams, fivegrams, sixgrams){
        input <- tolower(input)
        splitInput <- unlist(strsplit(input, split = " "))
        if (length(splitInput) > 5){
                input2 <- paste(tail(splitInput, 5), collapse = " ")
        } else {
                input2 <- paste(splitInput, collapse = " ")
        }
        sixgramPred <- head(hexagrams[hexagrams$word == input2,]$nextword, 10)
        if (length(sixgramPred > 0)){
                print(sixgramPred)
        } else {
                input2 <- paste(tail(splitInput, 4), collapse = " ")
                fivegramPred <- head(pentagrams[pentagrams$word == input2,]$nextword, 10)
                if (length(fivegramPred > 0)){
                      print(fivegramPred)
                } else {
                        input2 <- paste(tail(splitInput, 3), collapse = " ")
                        fourgramPred <- head(quadgrams[quadgrams$word == input2,]$nextword, 10)
                        if (length(fourgramPred > 0)){
                            print(fourgramPred)
                        } else {
                                input2 <- paste(tail(splitInput, 2), collapse = " ")
                                trigramPred <- head(trigrams[trigrams$word == input2,]$nextword, 10)
                                if (length(trigramPred > 0)){
                                    print(trigramPred)
                                } else {
                                        input2 <- tail(splitInput, 1)
                                        bigramPred <- head(bigrams[bigrams$word == input2,]$nextword, 10)
                                        if (length(bigramPred) > 0){
                                            print(bigramPred)
                                        } else {
                                                unigramPred <- head(unigrams[unigrams$word == input2,]$nextword, 10)
                                                if (length(unigramPred) > 0){
                                                   print(unigramPred)
                                                } else {
                                                        monogramPred <- head(unigrams$word, 10)
                                                        print(monogramPred)
                                                }
                                        }
                                }
                        }
                }
        }
}


#shiny server
shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                textInput <- tolower(text)
                wordPrediction <- predictNextWord(textInput, monograms, twograms, threegrams, fourgrams, fivegrams, sixgrams)[[2]]})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})


