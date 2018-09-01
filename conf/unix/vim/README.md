# README

To use the vim sytastic linter, you need to install the linter for each
programming language.

- R: lintr
- python: flake8
- julia: Lint
- scala: scala compiler (present when you install scala)
- C++: c++ compiler (no additional packages required)

## Installing the dependencies
```bash
R -e "install.packages('lintr')"
pip install --user flake8
```

## To activate the linter
Writing to the file in vim will activate the linter.

## More
For more, visit https://github.com/vim-syntastic/syntastic
