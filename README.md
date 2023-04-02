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
- entr (optonal)
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

Your blog content will be in the `build` directory.

Now you can delete the dummy posts/pages and start making your own!

Media (such as images, videos) are placed in the `public` folder and carried over to the "build" folder via rsync. You can easily remove this altogether inside the main `bliss` script if you plan to store media elsewhere (or not use any at all).

---

## Post Structure

The first line of any markdown file inside your `posts` directory should start
with a h1 heading, then a line break, then the date in `YYYY-MM-DD` format.
Like so:

```
# This is the Post Title

2023-01-05
```

Changing this structure or date format will break things or require you to edit
the `bliss` script accordingly.

---

## FAQs

### How do I test locally?

Inside your project directory run:

```
make watch
cd build && python3 -m http.server 3003
```

### Can I use other Markdown parsers?

Of course! Simply edit the main `bliss` script and swap out `smu` with something else. I wouldn't advise doing this if you already have pre-existing content based-off `smu`, since this could break some of your pages.

But give [smu](https://git.sr.ht/~bt/smu) a try - it is very lightweight and fast!

## Can this be run on MacOS?

The upstream `barf` script has a [tutorial on setting up barf on MacOS](https://barf.bt.ht/macos). I haven't tested whether those work with `bliss`, but given the minimal modifications so far theres no reason it shouldn't
