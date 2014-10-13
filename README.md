# My Portfolio homepage

This is the source code for my portfolio website. Its a list of
my projects and websites, with descriptions and screenshots.

It started as a simple `.html` page but slowly evolved into
something more complex.

Please take a couple of minutes to read through the next session,
it'll explain everything.

## What the...?

This project uses several web technologies that, in the end, will
output a plain `.html`/`.css`/`.js` website with no external
dependencies.

Here's a quick summary of the tools I use:

| tool | what does it do |
| ---- | --------------- |
| **grunt**  | A "JavaScript Makefile"; it automates common tasks such as "copy this file here" or "upload finished site to server" |
| **jekyll** | A static site generator; it takes several HTML files as input, joins them in order and spits the final website |

So if you want to modify this website, make sure you have installed
the tools first. If you're _completely_ new to the terms above, please
skim through [this awesome `grunt` tutorial][tutorial].

## Installing dependencies

This is a once-in-a-lifetime step. Since you're (hopefully) gonna use
these tools on your future websites, no need to worry about this
section anymore.

`grunt` is a command-line tool. To get it, you must first install `npm`
(the JavaScript thing that installs `node` libraries).

* If you're on **Windows**, go to [its website][npm] and get the installer for it
* If you're on **Mac OS X**, a simple `homebrew install npm` should do it
* If you're on **Linux**, use your distro package manager - for example `pacman -S nodejs`

Now, independently of your OS, open the terminal and type the following
command - it will install `grunt`:

    $ npm install -g grunt-cli

Great, halfway there! Now you only need to make sure you have `jekyll`.

It is also a command-line tool. To get it, you must first install `gem`
(the thing that installs Ruby libraries).

* If you're on **Windows**, download [the RubyInstaller][rubyinstall]
  and simply follow its instructions. Make sure to _check the option that
  includes Ruby tools on your **PATH**_.
* If you're on **Mac OS X**, consider yourself lucky - it already comes
  by default!
* If you're on **Linux**, again, use your distro package manager - for example
  `pacman -S ruby`.

Independently of your OS, open the terminal again and type the following
command - it will install `jekyll`:

    $ gem install jekyll

Aaand _now_ you're set up!

## First-time setup

Okay, you have the tools, time to work on this website!

Clone this repository to get everything:

    $ git clone https://github.com/alexdantas/doodlemeat.homepage/

After that, type the following command on your terminal:

    $ npm install

This downloads all the libraries that I use on this website and places
them on the `node_modules` directory. It takes a few seconds, but once
it ends, the bad part is done.

Time to actually edit the website!

## How to edit this website

Normally you'd expect a bunch of `.html` files, but things here are a little
bit more complicated than that.

(insert explanation here)

To view the website right now, simply type the following:

    $ grunt preview

Then, open your web browser and go to `localhost:1337`. _Ta-da_, there's the
website!

(more explanation)

If you simply want to build the website, the following should compile
everything into the directory `output/`:

    $ grunt

Then you can do whatever with what's inside there, the output site has no
external dependencies!
You can just put the `output/` directory on your web server and... done!

## Directory hierarchy

Here's what every file and directory means and does:

| file | description |
| ---- | ----------- |
| `package.json`      | Contains metadata for the website. Completely harmless, used by `npm` to install dependencies |
| `Gruntfile.js`      | All the tasks for `grunt`, the "JavaScript Makefile" |
| `jekyll-config.yml` | Configuration file for `jekyll`, contains site-wide metadata values, such as title and description |
| `node_modules/`     | Only gets created when you set up `npm`, contains all the locally installed libraries |
| `source/`           | Whole source code for the website, contains all the `jekyll` project files |
| `source/_includes`  | Partial html files that are included into others, for example the footer, or navbar |
| `source/_layouts`   | General layouts for html files, so we don't have to type the same things over and over |

[tutorial]:    http://24ways.org/2013/grunt-is-not-weird-and-hard/
[npm]:         https://npmjs.org/
[rubyinstall]: http://rubyinstaller.org/

