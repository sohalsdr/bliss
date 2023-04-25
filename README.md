# bliss

**Bl**og **i**t **s**imple, **s**tupid!

`bliss` is a moderately minimal blog generator, with a build script below 100 lines of shell. It's forked from Bradley Taunt's [barf](https://git.sr.ht/~bt/barf), and keeps things mostly the same while adding in a few little creature comforts for my own use.

[View the demo site here](https://sohalsdr.github.io/bliss).

---

## Core Features

- Extremely portable
- Automatic, **valid** RSS generation
- Handles both blog posts and normal pages
- No front matter or templating, just create markdown files

---

## Requirements

- rsync
- smu (see below)
- entr (optional)
- standard UNIX tools

---

## Basic Setup

Clone this repo and navigate inside it. Edit the "header.html" and "footer.html" files with your own information, navigation, etc. 

Be sure to edit the **RSS meta url** or else your feed won't validate!

Then, clone and build [Bradley Taunt's version of smu](https://git.sr.ht/~bt/smu):

```sh
git clone https://git.sr.ht/~bt/smu
cd smu
sudo make install
```

Then clone this directory and build:

```sh
make build
```

Your blog content will be in the `docs` directory.

Now you can delete the dummy posts/pages and start making your own!

Media (such as images, videos) are placed in the `public` folder and carried over to the `docs` folder via rsync. You can easily remove this altogether inside the main `bliss` script if you plan to store media elsewhere (or not use any at all).

**Important Note: `bliss`, as configured in this repository, expects to be served from `<domain>/bliss`. You will likely need to change some values in `index.html` if you're serving it from the root of your domain.**

---

## Post Structure

The first line of any markdown file inside your `posts` directory should start with a h1 heading, then a line break, then the date in `YYYY-MM-DD` format.
Like so:

```
# This is the Post Title

2023-01-05
```

Changing this structure or date format will break things or require you to edit the `bliss` script accordingly.

---

## Deploying with GitHub Pages

`bliss` is very easy to deploy to GitHub pages, and can be easily done without any need for Actions.

First of all, build your site, as outlined in the [Basic Setup](#basic-setup) section above.

As `bliss` builds to the `docs` folder of our repository by default, you can simply configure GitHub pages to serve the page from `/docs`. Now, every time you run `make build` and push to the main branch, the site is updated, no fancy Actions or CI setup needed!

---

## FAQs

### How do I test locally?

Inside your project directory run:

```
make watch
cd docs && python3 -m http.server 3003
```

The VSCode [Live Server Extension](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) is also a useful tool for previewing pages.

### Can I use other Markdown parsers?

Of course! Simply edit the main `bliss` script and swap out `smu` with something else. I wouldn't advise doing this if you already have pre-existing content based-off `smu`, since this could break some of your pages.

But give [smu](https://git.sr.ht/~bt/smu) a try - it is very lightweight and fast!

## Can this be run on MacOS?

The upstream `barf` script has a [tutorial for setting up barf on MacOS](https://barf.bt.ht/macos). I haven't tested whether those instructions work with `bliss`, but given the minimal modifications so far theres no reason it shouldn't

---

TODOs

- [ ] Look at adding tag functionality of some kind