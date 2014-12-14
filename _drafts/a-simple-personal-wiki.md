---
layout: post
title: "A simple personal wiki"
date: 2014-12-01 00:35:44
---

Following [my post on vimwiki]({% post_url 2014-11-16-vimwiki-not-enough-markdown %}),
I decided to create my own wiki program thing. It started with two
scripts `mdwiki-preprocess` and `wikify`, the former to preprocess
special wiki syntax and the latter to invoke that and render all the
pages and the rest.

However, I decided that I didn't like it enough in the end, since my
handy wiki syntax meant that my wiki files weren't *actually*
Markdown-only. Links like `[[this]]` don't mean anything in Markdown --
in my wiki, I wanted them to link to the wiki page 'this'. So I stopped
using `mdwiki-preprocess`, though `wikify` kept its usefulness.

But opinions change, e.g. mine on this. I got annoyed at having so much
repetition on links, which was always a problem. The thing that made me
change my mind was seeing [Gwern's](http://gwern.net) syntax for his
website. He invoked a Wikipedia link to his link text by linking it to
`!Wikipedia`, e.g.

    [TV Tropes](!Wikipedia)

would turn into

    [TV Tropes](http://en.wikipedia.org/wiki/TV Tropes)

and Wikipedia converts spaces to underscores, so it works really nicely.
That would save a bunch of time typing things out or copying & pasting
etc., so I wanted to see if I could implement it.

It was surprisingly easy! My personal wiki is now built by [my wikify
script](https://github.com/raehik/wikify) which invokes [my
mdwiki-preprocess script](https://github.com/raehik/mdwiki-preprocess).
They're both pretty ugly (especially the preprocessor, ohgod the Perl)
but they definitely do their job, or at least well enough for me.
which 
