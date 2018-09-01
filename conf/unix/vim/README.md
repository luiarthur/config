# README

To use the vim sytastic linter, you need to install the linter for each
programming language.

- R: lintr
- python: flake8
- julia: Lint
- scala: scalastyle
- C++: c++ compiler (no additional packages required)

## Installing the dependencies
```bash
R -e "install.packages('lintr')"
pip install --user flake8
```

## To activate the linter
Writing to the file in vim will activate the linter.
In my vimrc, I added a few lines to disable syntax checking
by default for scala, for speed in sbt checks. To re-enable in vim,
do `ctrl-w E`.

## More
For more, visit https://github.com/vim-syntastic/syntastic

## Scalastyle
- Install from scalastyle.org.
- Configure settings in plugin/addon-scala.vim
- Add scalastyle-config.xml to an appropriate place.
