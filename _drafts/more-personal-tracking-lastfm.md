---
layout: post
title: "More personal tracking: Last.fm"
date: 2014-12-14 15:34:18
---

Here's another thing I've recently fallen victim to using: Last.fm and
its wonderful scrobbling feature.

[Last.fm](http://www.last.fm) is a big ol' music database (not like
[MusicBrainz](http://musicbrainz.org) in which the killer feature is
being able to record every track you listen to. The verb (and noun) they
term this as (?) is *scrobbling*. A *scrobble* is a track submission,
confirming that yes, you listened to a specific song at a specific time.

I love it so much because, hell, it's more statistics on myself. The
more and deeper I can understand myself the better, in my opinion.
Simple stuff like logging what songs I listen at what time seems like
a thing (?statistic, 'vector', ???) which could be useful to analyse.
Who knows, maybe it'll somehow come in handy for something like [my
recorded commands]({% post_url command-sleuthing %}).

If you're averse to other companies having and using your data but are
interested in scrobbling (i.e. logging music you listen to), then there
are some scrobblers out there which let you keep a local log too. The
main scrobbler I'm using, `mpdscribble`, can record your played songs in
a very simple log file as well as submitting to Last.fm, so there's
something to look at if you're a \*nix user.

If you don't mind Last.fm being an online affair but want a backup of
your data, then you're in luck -- Last.fm provides a very nice, if a bit
slow, full export feature. About 3 days after I asked to export my data
(a measly 750 scrobbles over the past week), I received an email with a
link which only lasts 7 days. Seems a bit cheapskate-y (? careful with
money ), but the data and format you get is incredibly good (?).
Combined Unix timestamps and ISO time formats are what I'm most happy
about!

It seems to be a recent feature, since the zip file your data comes in
includes a `readme.txt` with only the contents `Fill me out`, but
providing it in a JSON format (& with MusicBrainz track IDs!) is a huge
plus.

I'm trying to test Last.fm's export feature, but they take ages to do
it. Boo -- it can't be more than 1,000 short entries in a database, can
it? Hrmph.
