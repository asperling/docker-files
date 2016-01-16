# Docker container for generating Bookdown.io based documentation

As you might already know [Bookdown](http://bookdown.io/) is a tool to generate HTML documentation from Markdown files. Structure is given by JSON files which are called `bookdown.json`. One of those is the starting point, we call that the main bookdown file.

Use this image to generate your Bookdown based documentation using an adapted version of [tobiju/bookdown-bootswatch-templates](https://github.com/asperling/bookdown-bootswatch-templates).

Let's see an example first and explain later:

```
docker run -it \
    -v $(pwd):/app \
    -e TOC_SUBLIST_LEVEL=4 \
    -e CSS_BOOTSWATCH=superhero \
    -e CSS_PRISM=coy
    asperling/bookdown \
    docs/bookdown.json
```

Derive a new container based on this image.

```
docker run -it
…
asperling/bookdown
```

Mount your source code where your markdown and json files coexist with your source files.

```
-v $(pwd):/app
```

Pass some environment variables to choose your variant of choice. See down below for a complete list of options.

```
-e TOC_SUBLIST_LEVEL=4 \
-e CSS_BOOTSWATCH=superhero \
-e CSS_PRISM=coy
```

Finally set the main bookdown file, usually to be found in the directory which you have mounted to the `/app` directory on the containers fs.

```
docs/bookdown.json
```

**Have fun!**

## List of available options

### CSS_BOOTSWATCH

One of

* cerulean
* cosmo
* cyborg
* darkly
* flatly
* journal
* lumen
* paper
* readable
* sandstone
* simplex
* slate
* spacelab
* superhero
* united
* yeti

Visit [bootswatch.com](https://bootswatch.com/) to see how the styles look like.

### CSS_PRISM

One of

* prism
* dark
* funky
* okaidia
* twilight
* coy
* atom-dark
* base16-ateliersulphurpool.light
* cb
* ghcolors
* hopscotch
* pojoaque
* xonokai

Visit [prismjs.com](http://prismjs.com/) / [prism-styles](https://github.com/PrismJS/prism-themes) to see how the Prism styles look like.
