Use _quarto.yml to specify the content in the book as well as styling.

Render the entire book using the command 

quarto render SM4LS-book

or if in this directrory

quarto render .

This will first run the script prerender.R to temporarily copy directories outside of this directory to here, if they are mentioned in _quarto.yml. It will also copy _quarto.yml to _quarto.yml.bak as a backup and modify _quart.yml to get the directory structure correct. This is in order to keep all assets and figures to be linked properly.

After the pre-render quarto will generate the book and finally the postrender.R is run to clean up. If an error occurs in the middle, manual clean up might be necessary, by manually running postrender.R, but safest is to leave it for next time, as it will be cleaned up by prerender.R. to next time when prerender is run.

If everything runs smoothly this will render the book in docs, with the index file in SM4LS-book and material for the different sessions in separate subdirectories.