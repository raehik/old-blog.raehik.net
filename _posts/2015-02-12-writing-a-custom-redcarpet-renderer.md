---
title: Writing a custom Redcarpet renderer
---

Introduction
------------

When I'm writing I don't like interrupting my train of thought. It
easily occurs when I decide "ooh, this is a nice song, let me Google the
artist" or when I'm experiencing [presque vu](!Wikipedia) and resolve to
find a more fitting word (I had to Google for that word, by the way).
Another of the more irritating issues I've had is linking to pages in my
writing. I frequently link to two websites in particular,
[GitHub](https://github.com) and [Wikipedia](https://en.wikipedia.org).
Having to Google the page I want, click on it, copy the URL and finally
paste it into my terminal is tedious and sometimes I lose focus and end
up browsing the Internet.

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
Kubrick](!Wikipedia)) and a link to the website with the query is formed
in the HTML. By using this simple short syntax, you can link to pages
much more fluidly and with hardly a second's interruption, though using
non-canonical Markdown syntax. (Then again, if you're using Jekyll, you
likely don't care about that.)

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
I tried writing a [Markdown
preprocessor](!GitHub "raehik/mdwiki-preprocess") before and it soon
became clear that I'd have to write a full Markdown parser to understand
where not to convert shortlinks. I chose to write a custom RedCarpet
renderer since it's the converter I use for general use (TODO) and
Jekyll. After a bit of reading on the [RedCarpet GitHub
repo](!GitHub "vmg/redcarpet") I found it reasonably straightforward how
to create one.

The specification for my shortlink renderer follows:

  * Valid shortlinks begin with an identifier string (I'm using Gwern's
    '!') and exist in the hash which maps website names to URLs.
  * Shortlinks are converted to links which combines the query string
    with the website URL.

If possible, I also wanted to implement another feature Gwern's syntax
has, which is that *links with an empty link* (i.e. just a title) are
converted to links pointing to the title. For example:

    [i/relative-img.png]()
    
would be treated as

    [i/relative-img.png](i/relative-img.png)

I don't want to change anything else in the Markdown conversion.

RedCarpet lets you extend the default renderer, and some impressive Ruby
magic allows you to override only the parts of syntax you want to change
(even though the renderer is written in C). To make a new renderer for
shortlinks, I could write this:

    {% highlight ruby %}

    require "redcarpet"

    class HTMLWithShortlinks < Redcarpet::Render::HTML
      def link(link, title, content)
        ...
      end
    end

    {% endhighlight %}

The overridden `link` method needs to check the link for a shortlink,
edit the link to form if one is present and return an `<a>` tag. Pretty
simple!

The only gripe with overriding Redcarpet's HTML renderer is that you
can't use the original method using `super` because, as I mentioned
before, it's written in C with a Ruby API. Luckily in this case it's no
issue, because `<a>` tags are simple to form.


My shortlink renderer
---------------------

My renderer at [raehik/redcarpet-shortlink](!GitHub) does the shortlink
processing and also checks for empty links. I also copied the rest of
Gwern's features such as forming a title for shortlinks and letting you
choose a custom query by setting a title for the shortlink. For example:

    [raehik/redcarpet-shortlink](!GitHub)

would become

    {% highlight html %}

    <a href="https://github.com/raehik/redcarpet-shortlink" title="GitHub: raehik/redcarpet-shortlink">raehik/redcarpet-shortlink</a>

    {% endhighlight %}

while

    [My shortlink renderer](!GitHub "raehik/redcarpet-shortlink")

is converted to

    {% highlight html %}

    <a href="https://github.com/raehik/redcarpet-shortlink" title="GitHub: raehik/redcarpet-shortlink">My shortlink renderer</a>

    {% endhighlight %}

Since the `link` method I wrote must override all of the processing
originally done by the C HTML renderer, I've tried to make sure normal
links are formed identically (or at least correctly). So far I'm quite
sure my renderer hasn't formed a bad link, but I'm not very sure about
HTML-escaping. If you find any bugs, please [create an
issue](!GitHub "raehik/redcarpet-shortlink/issues") on the GitHub repo.

*(Note: I tried to use shortlinks as much as possible in this post.
[Read the source][this-post] if you'd like to see all the occurences.)*

[this-post]: !GitHub "raehik/raehik.me/blob/master/{{ page.path }}"
