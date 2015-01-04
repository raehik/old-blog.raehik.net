---
layout: post
title: "Command sleuthing"
date: 2014-12-08 00:00:49
---

This is a fun story on how I used my computer to jog my memory on where I
left something.

After school one Friday I realised I hadn't seen my earphones & MP3
player for a few days. I was in a bit of a pickle (?), since I hadn't looked
for it properly closer to when I thought I might've lost it (Monday or
Tuesday).

I remembered that I ran a script `mp3` (a symlink to
[raehik/process-scrobble-log](https://github.com/raehik/process-scrobble-log))
to upload my MP3 player's scrobble log quite recently. So, if I could
figure out when I did that, I would have a lower bound for when I had it
last.

I keep a log of all the zsh commands I run at `~/data/zsh_full_history`
(for more on that, see {% post_url 2014-10-12-record-additional-full-zsh-history %}.
Format is simple: Unix time followed by a space, then the full command.
That makes it easy to parse. I started by `grep`ing for my most recent
`mp3` command:

    $ grep mp3 "~/data/zsh_full_history"
    ...
    1234267 mp3
    1234567 grep mp3 "~/data/zsh_full_history"
    (? fix times (find when I actually did it?))

Great, but I can't read Unix times. The `date` command is very versatile
and provides a method for converting Unix times to more human-readable
representations:

    $ date --date='@[1234267]'
    (? real date?)

Okay, now I know that I had MP3 player on [Sunday evening]. (? And so
on...)
