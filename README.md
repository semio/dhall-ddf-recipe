# Generate DDF recipe with Dhall

This repo contains types/functions for writing [DDF
recipe](https://ddf-utils.readthedocs.io/en/latest/recipe.html) with
[Dhall language](https://dhall-lang.org/). You can find examples in
[examples/](https://github.com/semio/dhall-ddf-recipe/tree/master/examples)
directory.

## issues

- input key order and comments are lost in the output file
- we should only write comments at the top of input files. (otherwise
  they will be removed by the formattor)
