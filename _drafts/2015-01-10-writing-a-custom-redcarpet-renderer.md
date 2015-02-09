---
title: Writing a custom Redcarpet renderer
---

Introduction
------------

When I'm writing I don't like interrupting my train of thought. It
easily occurs when I decide "ooh, this is a nice song, let me Google the
artist" or when I'm experiencing [presque vu](!Wikipedia "Tip of the
tongue") and resolve to find a more fitting word. One of the more
irritating issues I've found is linking to pages in my writing. I often
link to two websites in particular, [GitHub](https://github.com) and
[Wikipedia](https://en.wikipedia.org). Having to Google the page I want,
click on it, copy the URL and finally paste it into my terminal is
tiresome.

[Gwern](http://gwern.net), a writer who writes extensively in almost
uncountable disciplines, keeps the source for his website in a GitHub
repo at [gwern/gwern.net](!GitHub). By checking a few pages I learn how
he frequently links to [five or more Wikipedia pages in one
sentence](http://www.gwern.net/haskell/Wikipedia%20Archive%20Bot): he
doesn't write a URL. He just links to an arcane `(!Wikipedia)` page for
each link. Clearly there's some clever stuff going on here.

His [Hakyll configuration
file](!GitHub "gwern/gwern.net/blob/master/hakyll.hs") has some stuff
about so called ['interwiki
links'](!GitHub "gwern/gwern.net/blob/master/hakyll.hs#L117"). The
actual processing is held in `haskell/interwiki-compile.hs`, and it's...
pretty unreadable if you're like me and don't know Haskell. But the
abstract idea is very simple: rather than linking to a page, you specify
the website name and a query (e.g. the page on [Stanley
Kubrick](!Wikipedia) from Wikipedia) and a link to the website is formed
in the HTML. So it stays clean and simple (TODO: link that to the song
lol) (if not immediately obvious (TODO: as in you don't know full URL)).
(TODO: not great lol)

Gwern originally wrote the function to make it easier to create links
between public [wikis](!Wikipedia "Wiki") on the Internet (TODO:
history? I forget where the original file was). I wanted to generalise
it further and allow whatever 'interwiki links' you wanted, like Gwern's
`customInterwikiMap`. I named these links **shortlinks** because hey,
they're links but a bit shorter.


Implementation
--------------

Now the question is posed: how to implement this? I don't want to write
a Markdown preprocessor to find and convert each shortlink: we all know
how well [that](!GitHub "raehik/mdwiki-preprocess") went (or I do at
least). I chose to write a custom RedCarpet renderer since it's the
converter I use for general use (TODO) and Jekyll. After a bit of
reading it was reasonably straightforward how to create one.





---

*(Note: I tried to use shortlinks as much as possible in this post.
[Check the source][this-post] to see all the occurences.)*

[this-post]: !GitHub "raehik/raehik.github.io/blob/master/2015-01-10-writing-a-custom-redcarpet-renderer.md"
TODO: post_url or post_title for this-post?
