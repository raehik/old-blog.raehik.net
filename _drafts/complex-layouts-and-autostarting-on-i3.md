---
layout: post
title: "Complex layouts & autostarting on i3"
date: 2014-08-30 12:04:32
---

`i3` is a fantastic window manager which gives you tons of options for
configuration. Accompanying the useful features is some great documentation.
However, there is one thing the [user's guide](http://i3wm.org/docs/userguide.html)
doesn't go over much: **layouts**.

[Layouts](i3wm.org/docs/layout-saving.html) and autostarting programs allow you
to set out programs in a consistent manner every time you start i3. Since it's
a very new feature in i3 (introduced in v4.8, the latest stable version), it
doesn't have masses of good docs. So, here are some of the things I've done
with [my i3 config](https://github.com/raehik/dotfiles/blob/master/home/.i3/config) (linked to the latest version on GitHub at [raehik/dotfiles](https://github.com/raehik/dotfiles).


Autostart a program on a specific workspace
------------------------------------------


Begin on a specific workspace (most of the time)
------------------------------------------------

    exec --no-startup-id "i3-msg 'workspace number 1'"

mention how it doesn't work every time for some reason


Matching programs and layouts
-----------------------------



Other
-----

    - remove exit nag
    - enable back_and_forth
