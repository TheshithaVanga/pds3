install.packages("tidytext")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("tm")
install.packages("SnowballC")
install.packages("stopwords")


library(tidytext)
library(dplyr)
library(ggplot2)
library(wordcloud)
library(tm)
library(SnowballC)
library(stopwords)
library(readr)
Corona_test <- read_csv("Corona_NLP_test.csv")
View(Corona_test)

# a Convert the text corpus into tokens.
tokens <- Corona_test %>% 
  unnest_tokens(word, OriginalTweet) 

# b Perform stop word removal.
tokens_stop_removal <- tokens %>%
  anti_join(stop_words)

# c Count Word frequencies
word_frequency <- tokens_stop_removal %>%
  count(word, sort = TRUE)

# d  Create word clouds.
set.seed(1500)
wordcloud(words = word_frequency$word, freq = word_frequency$n, max.words = 1500, random.order =FALSE, colors = brewer.pal(8, "Accent"))
