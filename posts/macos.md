# Running `barf` on MacOS

2023-01-18

The `barf` project was built on Linux and was catered towards Linux users. The core of the project will remain focused on Linux/GNU tools, but that doesn't mean MacOS needs to be left out in the cold.

There are some very minor changes you'll need to make in the main `barf` script if you plan to run it on MacOS.

## Download Packages

This walkthrough assumes that you already have [homebrew](https://brew.sh/) installed on your machine.

You will need to install the GNU versions of both `date` and `sed` in order to avoid breaking things when `barf` tries to build.


    brew install coreutils
    brew install gnu-sed


## The Script Tweaks

Now open the main `barf` file in your project and replace all instances of `sed` with `gsed`.

Then change the following variable:


    published_date=$(date -d $basic_date +%FT%TZ)


to this:


    published_date=$(gdate -d $basic_date +%FT%TZ)


After that everything should work perfectly fine. There is probably a cleaner way to do this, but I like to keep things simple.
