---
layout: post
title: "An introduction to Setsura"
date: 2014-10-14 22:48:00
tags: setsura ruby rails
---

We've finally started work proper on the Setsura project. *It's going to
be a challenge.* I'm planning to write posts on the development process,
and talk about the problems we face and how we deal with them.

The original design (before I joined the project) was written in PHP
with some nice accompanying Javascript and CSS. When I probed into what
things we might want this service to do, I suggested Ruby on Rails for a
number of reasons:

  - we could code in a more structured manner
  - developers seem to have gotten tired of PHP (I wouldn't know, I've
    never used it :P)
  - it's the framework for
    [Discourse](https://github.com/discourse/discourse) and some other
    things
  - it's the cool new thing to use

The big thing was that Discourse is built on Rails 3, and that meant
that if we did the project in Rails 3, everything would be a *lot*
simpler (I think?). I later found that there is a decent image booru
software written in Rails 3,
[moebooru](https://github.com/moebooru/moebooru), so that was even
better!

Finally, with some of the integral design choices made, we begin!
