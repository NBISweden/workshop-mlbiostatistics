## Contributing teaching materials

#### Prepare a self-contained folder with teaching materials for a given session, e.g. session-[description]
It is probably easiest and most common to use Markdown for the main document, to be able to display content on Github and NBIS website. However, feel free to use other solutions if you have any other strong preferences, students can in principle download the entire repo and work locally as well.

**e.g. with Markdown**

```bash
e.g. session-example
.
+-- session-example_files
|   +-- figure-gmf
|       +-- pressure.png
+-- session-example.md
+-- session-example.Rmd
```

*Btw, you get this structure by default if you use R-Studio, New file -> R markdown -> From Template -> GitHub Document (Markdown)*


#### Add to GitHub

```bash
# Clone workshop-biostatitcs
git clone https://github.com/NBISweden/workshop-biostatistics.git
cd workshop-biostatistics

# Checkout draft branch to work on
git checkout -b draft

# Code, commit changes and push to draft when ready
git push

# Go to GitHub to make double-check draft and make a Pull request to master branch when ready

```

#### Git commits good practices
- Commit messages should contain relevant information regarding the feature(s)
you add, what type of analyses they can be used for, *etc.*.
- The subject line should be written in an imperative, e.g. *Fix typos* and be 50 characters or less
- The body (if any) should be wrapped at 72 characters.
- The subject and body should be separated by a blank line, start with a capital letter, and the subject line should not end with a period.
- More about [good commit messages][git-commits]


[git-commits]: https://chris.beams.io/posts/git-commit/
