---
title: "Personal wiki using Jekyll"
date: 2015-04-07 16:27:42
---

***tl;dr Want to keep a personal wiki using Jekyll? Check out my
[jekyll-wiki-template][repo] repo on GitHub.***


Intro
-----

I'm not good at remembering lots of things. Either I forget them all, or
I concentrate so hard on keeping them on my mind that I can hardly focus
on other things (it's not that severe, but you get my point).

Around 5 months ago I realised that I might benefit from keeping a
[personal wiki][] of sorts, where I could write whatever information I
wanted and I would know that if I ever needed to **recall** a piece of
knowledge, I'd find it there. I started out on November 15th using
[vimwiki][] because it seemed neat and I use Vim for a large majority of
my electronic work.

[personal wiki]: http://en.wikipedia.org/wiki/Personal_wiki
[vimwiki]: https://github.com/vimwiki/vimwiki

Later, I wrote [my own static site generator][wikify] which was
*incredibly* hacky and thrown together, then eventually moved to Jekyll
after I'd gotten over my Not Invented Here syndrome. I separated my
pages from the template and thus [**jekyll-wiki-template**][repo] was born.

[wikify]: https://github.com/raehik/wikify
[repo]: https://github.com/raehik/jekyll-wiki-template


Development status
------------------

I'm actively working on the wiki template (especially the CSS and
layouting) as I add to my personal wiki. I've got a whole bunch of TODOs
including adding 'templates' like Wikipedia (e.g. biography template,
video game console template, ...) and disambiguation pages/tags.

Trying to streamline the writing process has led me to develop some
useful plugins and other things. The best examples I have are my TOC
generator and my shortlink renderer for Redcarpet.
