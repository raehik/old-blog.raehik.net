---
layout: post
title: "ncmpcpp key configuration"
date: 2014-08-29 20:26:28
---

*EDIT: hah, imagine that: just a week after I post this, the Arch Linux repo
       updates to the `0.6_beta2` release, which totally obsoletes this whole
       post. of course, it's not really a bad thing: the new keybinding system
       is a *lot* more flexible. going to make a post on all the improvements,
       so stay tuned!*

`ncmpcpp` is a popular client for `mpd`, a music-playing daemon (literally,
**M**usic **P**layer **D**aemon), which allows a good deal of configuration
and looks okay too.

However, I had some troubles with key configuration. `ncmpcpp` allows you to
bind a maximum of 2 keys to a command, which is nice. You can define a key
by either the character (e.g. 'g', 'F') or a decimal value. But annoyingly, it
doesn't explain where the decimal value *comes* from for each key.

I believe it is *completely undocumented* that **ncmpcpp's key configuration
uses ASCII key codes.** So, if you wanted to bind the Escape key to the
`key_quit` command (mapped to 'q' and 'Q' by default), then you might follow
this procedure:

    $ showkey -a # show ASCII codes

    Press any keys - Ctrl-D wil terminate this program

    ^[       27 0033 0x1b

Ah, so the ASCII code for Escape is 27. (You could alternatively check on a
website such as [ascii-code.com](http://www.ascii-code.com).)

Now go into your `~/.ncmpcpp/keys` file (if it doesn't exist, I suggest copying
the template from `/usr/share/doc/ncmpcpp/keys` -- or grab my one from
[raehik/dotfiles](https://github.com/raehik/dotfiles)!) and add this line:

    key_quit = 27

And that's that. `ncmpcpp` will now quit if you hit Escape instead of 'q'. My
reason for doing this was actually binding 'q' **and** Escape to quit, so my
line looks like this:

    key_quit = 'q' 27
