## Contributing teaching materials
To contribute teaching materials:
- prepare teaching materials in a self-contained folder, ideally using `git` while developing the materials
- add folder to Github repository
- add links to the session to `index.md`


### Clone Github repository
```bash
# Clone excelerate-scRNAseq
git clone https://github.com/NBISweden/workshop-biostatistics.git
cd workshop-biostatistics

# Checkout feature branch to work on
git checkout -b session-example
```

### Prepare a self-contained folder
Prepare a folder with teaching materials for a given session, e.g. `session-example`. It is probably easiest to use Markdown for the main document, to be able to display content on Github and NBIS website. However, feel free to use other solutions if you have any other strong preferences.

**e.g. folder structure with .md and .Rmd**

```bash
e.g. session-example
.
+-- session-example-files
|   +-- figures
|       +-- pressure.png
+-- session-example.md
+-- session-example.Rmd
```

*Btw, you get this structure by default if you use R-Studio, New file -> R markdown -> From Template -> GitHub Document (Markdown)*

#### Code and commit
``` bash
 # Code & commit changes while working on the materials
 git add session-feature.md
 git commit -m "commit message"

 # Push to feature when ready
 git push
 ```

 _Note Git commit good practices_

 **Git commits good practices**
 - Commit messages should contain relevant information regarding the feature(s) you add, what type of analyses they can be used for, *etc.*.
 - The subject line should be written in an imperative, e.g. *Fix typos* and be 50 characters or less
 - The body, if any, should be wrapped at 72 characters.
 - The subject and body should be separated by a blank line, start with a capital letter, and the subject line should not end with a period.
 - More about [good commit messages][git-commits]

### Add link(s) to the session to `session-links.md`
_see example under Session Links_

### Add to Github

#### Push feature branch to repo

 ``` bash
  # Push to feature when ready
  git push
  ```

#### Make a pull request to master branch when ready
Go to course repository [https://github.com/NBISweden/workshop-biostatistics.git](https://github.com/NBISweden/workshop-biostatistics.git) and create a pull request

### Questions or feedback?
Create an issue or contact Olga Dethlefsen <<olga.dethlefsen@nbis.se>>

## [Back to main](README.md)

## Course website
https://nbisweden.github.io/workshop-biostatistics/

_*renders from master branch_


[git-commits]: https://chris.beams.io/posts/git-commit/
