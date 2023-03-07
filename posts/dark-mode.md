# Supporting Basic Dark Mode

2023-03-07

The default `barf` site generator now supports basic dark mode functionality. This has been achieved by including the standard `color-scheme` meta tag in the core `header.html` file:

```
<meta name="color-scheme" content="dark light">
```

This change also ships with some minor updates to the default `blockquote` design. You can see an example below:

> This is a really *cool* blockquote

## Minor Caveat

Unfortunately, Safari still has minor `ahref` / link color issue when defaulting to browser dark mode. If this is a problem for your own build of `barf`, take a look at a [solution I wrote about here](https://bt.ht/safari-default-dark-mode/).

Personally, I can't be bothered to add that extra code to this project. The Safari team needs to get their shit together and fix such a simple bug. Plus, you shouldn't be using Safari anyway - it's proprietary garbage.