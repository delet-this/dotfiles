PDF=$1
exiftool -overwrite_original -all= $PDF 
qpdf --linearize --replace-input $PDF
