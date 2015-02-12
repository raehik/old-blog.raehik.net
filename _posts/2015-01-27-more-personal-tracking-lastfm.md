---
title: "More personal tracking: Last.fm"
---

In my quest for further methods of [logging things I do][], I came
across [Last.fm](http://www.last.fm) a couple months ago, and I have
some (good) things to say about it. 

[logging things I do]: {% post_url 2014-10-08-things-that-are-cool-analysing-your-life %}

Last.fm is a big ol' music database (not as elaborate as
[MusicBrainz](http://musicbrainz.org) with a killer feature: being able
to make a log of every track you listen to. The verb used for this is
*scrobbling*. A *scrobble* is a message you send to Last.fm confirming
that you listened to a certain song at a certain time.

If you're averse to giving corporations 'personal' (somewhat) data, you
can use a local scrobbler. There are a few Last.fm scrobblers around
which can keep a local log too. The main scrobbler I'm using,
[mpdscribble][], can record songs [MPD](http://www.musicpd.org/) plays
in a very simple log file as well as submitting to Last.fm and other
audioscrobblers, so there's something to look at if you use MPD.

[mpdscribble]: http://manpages.ubuntu.com/manpages/utopic/man1/mpdscribble.1.html

If you don't mind Last.fm holding your data but like keeping backups of
your, then you're in luck. They provide a very nice - if rather slow -
[data export service][]. About 3 days after I requested my archive (only
having accrued a measly <1000 scrobbles over the week I'd had my account
for), I received an email with a link which lasts only [7 days][]. Seems
a bit stingy, but they kindly provide separate CSV and JSON files, and
timestamp using combined Unix times and ISO time formats which makes me
feel warm inside :)

[data export service]: http://www.last.fm/settings/dataexporter
[7 days]: https://www.youtube.com/watch?v=nEi02bHQ4rU&t=30s

*(Note: The export feature seems to be recent, since the zip file your
data comes in includes a `readme.txt` with only the contents `Fill me
out`. They also mention on the export page that it's experimental.
Hopefully it'll be improved eventually!)*

Scrobbling appeals to me greatly because, hell, it's more statistics
about myself. I like to think I might have a use for all my data one
day. Who knows -- maybe it'll somehow come in handy like [recorded shell
commands][].

[recorded shell commands]: post_url command-sleuthing
