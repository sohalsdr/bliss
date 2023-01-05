# barf

barf is an extremely minimal blog generator.

The entire build script is less than 100 lines of shell.

It could *almost* be called "suckless", but probably isnt.

(barf is a modified/forked version of Karl Bartel's fantastic [blog.sh](https://github.com/karlb/karl.berlin). Be sure to check it out since my version does things slightly different.)

## Why 'barf'?

> **barf**
>
> Blogs Are Really Fun

## Core Features

- Extremely portable
- Automatic, **valid** RSS generation
- Handles both blog posts and normal pages
- No front matter or templating, just create markdown files

## Requirements

- rsync
- smu (see below)
- entr (optonal)
- standard UNIX tools

## Basic Setup

Clone this repo and navigate inside it. Edit the "header.html" and "footer.html" files with your own information, navigation, etc. 

Then, clone and build my patched version of smu:

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

## Projects Goals

- The core focus should be to **reduce** the code of this project, not increase it. Overall scope needs to remain small.
- Major tweaks/add-ons should be run by individuals via forks/patches - not put into the barf base

## FAQs

### How do I test locally?

Inside your project directory run:

```
make watch
cd build && python3 -m http.server 3003
```

### Do you plan to add "X"? Can *I* add "X"?

Most likely not. I'm happy with how things are currently. If you want to add something - great! The point of this project is to give others the ability to fork it, tweak it, patch it, and share it as much as they'd like. The core of barf will remain minimal for this reason.

Of course, any patches that can help *reduce* the project's footprint or even speed things up are more than welcome!

### Can I use other Markdown parsers?

Of course! Simply edit the main `barf` script and swap out `smu` with something else. I wouldn't advise doing this if you already have pre-existing content based-off `smu`, since this could break some of your pages.

But give [smu](https://git.sr.ht/~bt/smu) a try - it is very lightweight and fast!

```
MORE FAQs TO COME...
```
