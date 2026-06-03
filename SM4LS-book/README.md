Use _quarto.yml to specify the content in the book as well as styling.

Render the entire book using the command 

quarto render SM4LS-book

or if in this directrory

quarto render .

This will first run the script prerender.R to temporarily copy any directories outside of this directory to here. This is in order to keep all assets and figures to be linked properly. After the pre-render quarto will generate the book and after this the postrender.R is run to clean up. If an error occurs in the middle manual clean up is necessary, either by manually running postrender.R or by deleting copied directories and moving the original backed-up _quarto.yml from _quarto.yml.bak to _quarto.yml.

If everything runs smoothly this will render the book in docs, with the index file in SM4LS-book and material for the different sessions in separate subdirectories.