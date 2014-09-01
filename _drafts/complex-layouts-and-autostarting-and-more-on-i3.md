---
layout: post
title: "Complex layouts, autostarting & more on i3"
date: 2014-09-01 12:04:32
---

`i3` is a fantastic window manager which gives you tons of options for
configuration. Accompanying the useful features is some great documentation.
However, there is one thing the [user's guide](http://i3wm.org/docs/userguide.html)
doesn't go over much: **layouts**.

[Layouts](i3wm.org/docs/layout-saving.html) and autostarting programs allow you
to set out programs in a consistent manner every time you start i3. Since it's
a very new feature in i3 (introduced in v4.8, the latest stable version), it
doesn't have masses of good docs. So, here are some of the things I've done
with [my i3 config](https://github.com/raehik/dotfiles/blob/master/home/.i3/config)
(linked to the latest version on GitHub at [raehik/dotfiles](https://github.com/raehik/dotfiles)).


Autostarting
------------

### Autostart a program on a specific workspace

To perform a command on i3 startup (e.g. bring up a terminal emulator), you use
the `exec` keyword. It's described pretty well in the User's Guide, section
[4.13. Automatically starting applications on i3 startup](http://i3wm.org/docs/userguide.html#_automatically_starting_applications_on_i3_startup).

To start something on a specific workspace, it seems to be recommended that you
use `i3-msg` as such:

    exec --no-startup-id i3-msg 'workspace number x

(The `workspace number` is explained later.)



Begin on a specific workspace (most of the time)
------------------------------------------------

    exec --no-startup-id "i3-msg 'workspace number 1'"

mention how it doesn't work every time for some reason


Layouts
-------

### Creating a layout

    - sometimes it doesn't work???


### Matching programs and layouts


Other
-----

### Remove i3 exit nagbar

It's dumb and I don't like it. Replace:

    bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

With:

    bindsym $mod+Shift+e exec "i3-msg exit"

Now you won't get nagged by i3 every time you try to exit.

    - remove exit nag
    - enable back_and_forth
    - other variables & their use
