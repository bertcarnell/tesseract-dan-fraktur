# Create the .box and .tif files from the "training text" files using
#  JTessBoxEditor

# once the box files are created, they have box created for the spaces
#  this script eliminates them

direct <- file.path("C:","Users","Rob","Documents","Repositories",
                    "tesseract-dan-fraktur","deu_frak_adler")
filenames <- file.path(direct, 
                       c("deu_frak_adler.unifrakturmaguntia.exp0.box",
                         "deu_frak_adler.unifrakturmaguntia.exp1.box",
                         "deu_frak_adler.unifrakturmaguntia.exp2.box"))

for (i in seq_along(filenames))
{
  X <- readLines(filenames[i])
  ind <- which(grepl("^[[:space:]][[:space:]]", X))
  X1 <- X[-ind]
  writeLines(X1, con=filenames[i])
}

