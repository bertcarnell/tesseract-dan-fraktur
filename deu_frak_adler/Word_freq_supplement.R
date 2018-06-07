# Copyright 2018 Robert Carnell

require(tm)

sysinfo <- Sys.info()
if (tolower(sysinfo["sysname"]) == "windows" && tolower(sysinfo["user"]) == "rob")
{
  repository <- file.path("C:", "Users", "Rob", "Documents", "Repositories", "tesseract-dan-fraktur")
} else
{
  stop("Repository not recognized")
}

filelist <- file.path(repository, "deu_frak_adler", 
                      c("deu_frak_adler_UnifrakturMaguntia.training3.txt",
                        "deu_frak_adler_UnifrakturMaguntia.training2.txt"))
uris <- URISource(filelist, encoding="UTF-8", mode="text")
Y <- VCorpus(uris, readerControl=list(language="de"))
tdm <- TermDocumentMatrix(Y, list(removePunctuation = TRUE, tolower=FALSE, removeNumbers=TRUE))

obit_list <- Terms(tdm)
Encoding(obit_list) <- "UTF-8"
stopifnot(all(Encoding(obit_list) == "UTF-8"))
temp <- numeric(nTerms(tdm))
temp[tdm$i[tdm$j == 1]] <- tdm$v[tdm$j == 1]
temp[tdm$i[tdm$j == 2]] <- temp[tdm$i[tdm$j == 2]] + tdm$v[tdm$j == 2]

word_list <- readLines(file.path(repository, "deu_frak_adler", "word_list"), encoding="UTF-8")
word_freq <- readLines(file.path(repository, "deu_frak_adler", "frequency_list"), encoding="UTF-8")
word_freq_word <- sapply(strsplit(word_freq, " "), function(x) x[1], USE.NAMES=FALSE)

und_freq <- as.numeric(gsub("und ", "", word_freq[grep("^und ", word_freq)]))
my_und_freq <- temp[which(obit_list == "und")]
temp <- temp * und_freq / my_und_freq

ind <- which(obit_list %in% word_list)
output <- c(word_list, obit_list[-ind])
output <- gsub("\u0092", "'", output)
writeLines(output, 
           con=file(file.path(repository, "deu_frak_adler", "word_list_aug"), encoding="UTF-8"))

ind <- which(obit_list %in% word_freq_word)
output <- c(word_freq, paste(obit_list[-ind], temp[-ind]))
output <- gsub("\u0092", "'", output)
writeLines(output, 
           con=file(file.path(repository, "deu_frak_adler", "frequency_list_aug"), encoding="UTF-8"))

closeAllConnections()


