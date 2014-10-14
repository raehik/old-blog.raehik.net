---
layout: post
title: "Record all X11 keystrokes"
date: 2014-10-12 13:00:00
tags: linux graphical
---

This was **NOT** fun to do. For some reason, though implementing a
simple keylogger in Linux takes only a few lines, logging *complete* and
*neat* data turns out to be much harder than it should be, in my
opinion.

Eventually, after searching and researching (and even trying to write my
own solution in C) I found a [Perl solution]() [someone?] posted on Unix and
Linux SE. It's entirely unreadable -- but hey, it works.

I threw it up on my GitHub at [raehik/xinput-keylog](ey b0ss) and made
some changes, mainly to do with altering the logging format & printing
to a file rather than `STDOUT`:

    {% highlight perl %}

    ey b0ss

    {% endhighlight %}

The log format is

    seconds.microseconds press/release xkeycode keyname modifiers

where press = 1 & release = 0, for example

    1413114050.181650 1 111 Up 
    1413114050.266941 0 111 Up 
    1413114051.148741 1 50 Shift_L 
    1413114051.320743 1 38 a Shift
    1413114051.567763 0 38 a Shift
    1413114054.334834 1 37 Control_L Shift
    1413114055.660402 1 40 d Shift,Control
    1413114055.738983 0 40 d Shift,Control
    1413114056.272003 0 50 Shift_L Shift,Control
    1413114056.282852 0 37 Control_L Control

That's the log just for hitting "[Up]A[Ctrl-Shift-D]" -- very detailed.
I got to thinking that if I record to a precision higher than a second &
record button releases as well, I could analyse how I use the keyboard
extensively, maybe even find out which keys I 'lag' on (i.e. release
only after pressing another button). Maybe someone could write a program
for that? I'm too lazy :P
