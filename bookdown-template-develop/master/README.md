# Docker container for easy developing of Bookdown.io themes

As you might already know [Bookdown](http://bookdown.io/) is a tool to generate HTML documentation from Markdown files. Structure is given by JSON files which are called `bookdown.json`. One of those is the starting point, we call that the main bookdown file.

This image should help you in the process of developing your own bookdown theme by regenerating your documentation on every change of the mounted templates and providing a webserver that serves your rendered documentation at http://localhost:8080/.

Let's see an example first and explain later:

```
docker run -it \
    -v $(pwd):/app \
    -v $(pwd)/../dev/my-bookdown-theme/templates:/templates \
    -p 8080:8080 \
    -e TOC_SUBLIST_LEVEL=4 
    asperling/bookdown-template-develop \
    docs/bookdown.json
```


Derive a new container based on this image.  
```
docker run -it 
…
asperling/bookdown-template-develop
```

Mount your source code where your markdown and json files coexist with your source files.

```
-v $(pwd):/app
```

Mount your custom templates which need developing.

```
-v $(pwd)/../dev/my-bookdown-theme/templates:/templates
```

Configure port mapping. You can change at least the post of the host. With the following mapping you can access your documentation at http://localhost:8080/

```
-p 8080:8080
```

Pass some environment variables if needed. Some themes do make use of them.

```
-e TOC_SUBLIST_LEVEL=4 
```

Finally set the main bookdown file, usually to be found in the directory which you have mounted to the `/app` directory on the containers fs.

```
docs/bookdown.json
```

**Have fun!**