---
title: Writing a custom Redcarpet renderer
---

Introduction
------------

When I'm writing I don't like interrupting my train of thought. It
easily occurs when I decide "ooh, this is a nice song, let me Google the
artist" or when I'm experiencing [presque vu](!Wikipedia) and resolve to
find a more fitting word. (I had to Google for that word, by the way.)
Another of the more irritating issues I've had is linking to pages in my
writing. I frequently link to two websites in particular,
[GitHub](https://github.com) and [Wikipedia](https://en.wikipedia.org).
Having to Google the page I want, click on it, copy the URL and finally
paste it into my terminal is tiresome.

[Gwern](http://gwern.net), a writer I follow who writes extensively in
almost uncountable disciplines, keeps the source for his website in a
GitHub repo at [gwern/gwern.net](!GitHub). By checking a few pages I
learn how he frequently links to [five or more Wikipedia pages in one
sentence][gwern-wikibot]: he doesn't write a URL, instead linking to
`(!Wikipedia)`. Clearly there's some clever stuff going on here.

[gwern-wikibot]: http://www.gwern.net/haskell/Wikipedia%20Archive%20Bot

His [Hakyll configuration file][hakyll-conf] has some stuff about so
called ['interwiki links'][hakyll-conf-l117]. The actual processing
happens in [haskell/interwiki-compile.hs][interwiki], and it's... pretty
unreadable if you're like me and don't know Haskell. But the abstract
idea is very simple: rather than linking to a page, you specify the
*website name* and a *query* (e.g. the Wikipedia page on [Stanley
Kubrick](!Wikipedia)) and a link to the website with the
query is formed in the HTML. By using this simple short syntax, you can
link to pages much more fluidly and with hardly a second's interruption,
though using non-canonical Markdown syntax. (Then again, if you're using
Jekyll, you likely don't care about that.)

[hakyll-conf]: !GitHub "gwern/gwern.net/blob/master/hakyll.hs"
[hakyll-conf-l117]: !GitHub "gwern/gwern.net/blob/master/hakyll.hs#L117"
[interwiki]: !GitHub "gwern/gwern.net/blob/master/haskell/interwiki-compile.hs"

Gwern [originally wrote the function][gitit-interwiki] to make it easier
to create links between public [wikis](!Wikipedia "Wiki") on the
Internet. I wanted to generalise it further and allow whatever
'interwiki links' you wanted. I named these links **shortlinks** because
hey, they're links but a bit shorter.

[gitit-interwiki]: !GitHub "jgm/gitit/blob/master/plugins/Interwiki.hs"


Implementation
--------------

Now the question is posed: how to implement shortlink conversion?
Writing a Markdown preprocessor would be a silly idea and I'm not a fan
of the idea after the [last one](!GitHub "raehik/mdwiki-preprocess") I
tried making. I chose to write a custom RedCarpet renderer since it's
the converter I use for general use (TODO) and Jekyll. After a bit of
reading on the [RedCarpet GitHub repo](!GitHub "vmg/redcarpet") it was
reasonably straightforward how to create one.

The specification for my shortlink renderer follows:

  * Valid shortlinks begin with an identifier string (I'm using Gwern's
    '!') and exist in the hash which maps website names to URLs.
  * Shortlinks are converted to links which combines the query string
    with the website URL.

If possible, I also wanted to implement another feature Gwern's syntax
has, which is that *links with an empty link* (i.e. just a title) are
converted to links pointing to the title. For example:

    [i/relative-img.png]()
    
would become

    <a href="i/relative-img.png">i/relative-img.png</a>

instead of

    <a href="">i/relative-img.png</a>

I don't want to change anything else in the Markdown conversion.

Fortunately, RedCarpet lets you extend the default renderer, and some
impressive Ruby magic allows you to override only the parts you want to
change (even though the renderer is written in C). To make a new
renderer for shortlinks, I could write this:

    require "redcarpet"

    class HTMLWithShortlinks < Redcarpet::Render::HTML
      def link(link, title, content)
        ...
      end
    end

The overridden `link` method needs to check the link for a shortlink,
edit the link to form if one is present and return an `<a>` tag. Pretty
simple!

The only gripe with overriding Redcarpet's HTML renderer is that you
can't use the original method using `super` because, as I mentioned
before, it's written in C with a Ruby API. Luckily in this case it's no
issue, because `<a>` tags are simple to form.

My renderer at [raehik/redcarpet-shortlink](!GitHub) does the shortlink
processing, and also checks for empty links -- if a link is empty, we
link it to the content rather than nothing. I also copied the rest of
Gwern's features such as forming a title for shortlinks and letting you
choose a custom query by setting a title for the shortlink.

    e.g.

and so far I think my renderer
hasn't formed a bad link. If you think you've found something, make an
issue.

---

*(Note: I tried to use shortlinks as much as possible in this post.
[Check the source][this-post] to see all the occurences.)*

[this-post]: !GitHub "raehik/raehik.github.io/blob/master/2015-01-10-writing-a-custom-redcarpet-renderer.md"
TODO: post_url or post_title for this-post?
