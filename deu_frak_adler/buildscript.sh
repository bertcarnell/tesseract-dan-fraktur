# directions at https://github.com/tesseract-ocr/tesseract/wiki/Training-Tesseract-3.03%E2%80%933.05

# box files were created by hand for each tif

# create the training files .tr
tesseract deu_frak_adler.unifrakturmaguntia.exp0.tif deu_frak_adler.unifrakturmaguntia.exp0 box.train
tesseract deu_frak_adler.unifrakturmaguntia.exp1.tif deu_frak_adler.unifrakturmaguntia.exp1 box.train
tesseract Reading_Adler_1798-07-31_[2]_Obituary.tif deu_frak_adler.adlerfont.exp0 box.train
tesseract Reading_Adler_1800-06-17_[3]_Marriage.tif deu_frak_adler.adlerfont.exp1 box.train
tesseract Reading_Adler_1804-08-07_[3]_Marriage.tif deu_frak_adler.adlerfont.exp2 box.train
tesseract Reading_Adler_1810-08-21_[2]_Obituary.tif deu_frak_adler.adlerfont.exp3 box.train
tesseract Reading_Adler_1816-05-07_[2]_Obituary.tif deu_frak_adler.adlerfont.exp4 box.train
tesseract Reading_Adler_1842-02-22_[2]_Obituary.tif deu_frak_adler.adlerfont.exp5 box.train
tesseract Reading_Adler_1876-12-12_[2]_Obituary.tif deu_frak_adler.adlerfont.exp6 box.train

# create the unicharset file
unicharset_extractor *.box

# training
## create shaptetable, inttemp, pffmtable, dan_frak_adler.unicharset
mftraining -F font_properties -U unicharset -O deu_frak_adler.unicharset *.tr
## create normproto
cntraining *.tr

# Augment the dictionary data
Rscript Word_freq_supplement.R

# Dictionary Data
wordlist2dawg frequency_list_aug deu_frak_adler.freq-dawg deu_frak_adler.unicharset
wordlist2dawg word_list_aug deu_frak_adler.word-dawg deu_frak_adler.unicharset
wordlist2dawg number deu_frak_adler.number-dawg deu_frak_adler.unicharset
wordlist2dawg punc deu_frak_adler.punc-dawg deu_frak_adler.unicharset

# put it all together
combine_tessdata deu_frak_adler.

# copy to tesseract
# must use sudo
cp deu_frak_adler.traineddata /usr/share/tesseract-ocr/tessdata





