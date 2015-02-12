---
layout: post
title: "vimwiki: Cool, but not enough Markdown"
date: 2014-11-16 11:14:36
---

I'm having fun with [vimwiki][] at the moment. It's an interesting Vim
plugin which turns your editor into not only a wiki editor, but a viewer
as well. Here's what I mean:

![vimwiki example](/assets/vimwiki-example.png)

[vimwiki]: https://github.com/vimwiki/vimwiki

The coolest thing about vimwiki is its automatic line squashing. All
lines except the current one have their formatting syntax removed,
leaving just the text & formatting. Links are also squashed down into
just the link text, which is *really* cool. I'll admit I don't like
those features all the time -- but it's also pretty undeniably cool for
a Vim plugin.

The other really nice features are the clever new file-making. By simply
hitting Enter on a word in normal mode (or on a selection in visual
mode) you make it a link to a corresponding wiki page. Hitting Enter on
a wiki link follows that link, then you can go back to the previous
file (and keep your cursor location!) by hitting Backspace.

However, I feel it's a little let down by its awkward syntax. vimwiki
comes with its own syntax by default which has some gripes and is just
dissimilar to Markdown enough that I don't feel comfortable using it.
The Markdown support is subpar (even though many of the squashing
features still work partially) and by default overrides Vim's Markdown
syntax highlighting, which works a lot better.

I was quite amused when I found I could fix some of the Markdown issues
by literally `cat`ing the normal Markdown syntax into vimwiki's:

    cat /usr/share/vim/vim74/markdown.vim >> ~/.vim/syntax/vimwiki_markdown.vim

Now headers look nice and links work a bit better.

Overall vimwiki is a really fun plugin, but the time-saving features
could get on your nerves and the Markdown support (which I really want
to use so I'm not limited to vimwiki) isn't perfect yet. You could just
work with a collection of normal Markdown files, and maybe a few
bindings to make new files easier.

In my ideal world, I would write a much simpler plugin which only adds a
few features to Markdown files if they're in a wiki path, and none of
that flashy collapse biz. Someday...
