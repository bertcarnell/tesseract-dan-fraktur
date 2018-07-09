# tesseract-dan-fraktur
## Fraktur training data files for Danish, Swedish, and German in Tesseract OCR

### Original Project

Various training data files for Tesseract OCR (version 3.02)

* `dan_frak/`: Danish written in fraktur script (orthography prior to ca. 1867).
* `deu_frak/`: German written in fraktur script.
* `swe_frak/`: Swedish written in fraktur script. The wordlists for Swedish are from 
[Projekt Runeberg](http://runeberg.org/words/)
* `dan/`: slightly manipulated version of the Danish .traineddata shipped with upstream tesseract
to not output annoying fi- and fl-ligatures all the time. Since tesseract version 3.02, this 
has become outdated. If you have this problem, it is a better solution to upgrade tesseract.

The `*_frak/` directories have a primitive script to compile the data files that only works on
unix-like machines. If you aren't interested in working on training tesseract yourself, just
find the `*.traineddata` that is relevant for your language, save it to your tesseract
installation's data directory and you should be ready for ocr.

### Additional Fraktur Script `deu_frak_adler`

The original `deu_frak` training data was not sufficiently accurate for parsing the Fraktur script in the Reading Adler newspaper.  
As a result, this project aims to create training images, the associated box files, and the best wordlists for parsing obituaries 
and marriage announcements in the Reading Adler.  For more information on the Reading Adler, please see 
this [site](https://chroniclingamerica.loc.gov/lccn/sn83025908/)
