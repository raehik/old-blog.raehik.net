---
title: "Command sleuthing"
---

This is a fun story on how I used my computer and especially my [command
history]({% post_url 2014-10-12-record-additional-full-zsh-history %})
to jog my memory on where I left something.

After school one Friday I worriedly noted that I hadn't seen my
earphones & MP3 player for a few days. I rapidly began to regret my
delay in realisation, since in a few days a small hard case could get
anywhere.

I remembered that I ran a script `mp3` (a symlink to
[raehik/process-scrobble-log](!GitHub) to upload my MP3 player's
scrobble log when I used it recently. So I figured if I could work out
when I did that, I would have a lower bound for the time at which I had
it last.

I keep a log of all the zsh commands I run at `~/data/zsh_full_history`
(see my [full command history post]({% post_url
2014-10-12-record-additional-full-zsh-history %}). Format is simple:
Unix time followed by a space, then the full command. That makes it easy
to parse. I started by `grep`ing for my most recent `mp3` command:

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

Okay, now I know that I had my MP3 player on [Sunday evening]. (? And so
on...)
