R --no-save -f generate_image.R
rm Rplots.pdf
rm *-crop.pdf
for i in *pdf; do pdfcrop $i; done
