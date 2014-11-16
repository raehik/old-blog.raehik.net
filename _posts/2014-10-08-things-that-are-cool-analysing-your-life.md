---
layout: post
title: "Things that are cool: Analysing your life"
date: 2014-10-08 12:44:01
---

Stephen Wolfram's post [The Personal Analytics of My Life](http://blog.stephenw
olfram.com/2012/03/the-personal-analytics-of-my-life/) is super interesting.
He presents and analyses a *wealth* of data he has collected on himself. Some
sources go back to 1989: he has archived a total of **23 years of email**!

I think it's incredible to be able to summarise bits of your life. As Mr.
Wolfram puts it, it is *"in an effort at “self awareness”"*. It's something I
really want to do. Some systems are easy to implement, too, e.g. recording your
shell history.

But at the same time, it's kinda sad. From my 10,000 line shell history file,
weThese are the most run commands in my
shell (note: the history file only stores the most recent 10,000 lines):

    history -n 0 | sort -h | uniq -c | sort -hr | head -n10
       2613 ls
        322 git s
        285 cd
        252 ll
        237 cd ../
        134 rmvim
        125 ncmpcpp
         88 git push
         87 sh .fehbg
         77 la

(If you were wondering, `ll` and `la` are both aliases for `ls` (see [my
.shellrc](https://github/com/raehik/dotfiles/blob/master/home/.shellrc)).)

Yes: almost *a third* of my commands involve listing the current directory's
contents. One of my scripts [`rmvim`](https://github.com/raehik/rmvim) is also
quite common. (wording?) (more)

I will endeavour to get something running to record and store data on my shell
commands, and probably post about what I did plus how & why.
