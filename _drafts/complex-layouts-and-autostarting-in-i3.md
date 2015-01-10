---
title: Complex layouts & autostarting in i3
---

i3 is a fantastic window manager which gives you tons of options for
configuration. Accompanying the useful features is some great documentation.
However, the [user's guide](http://i3wm.org/docs/userguide.html) currently
doesn't explain layouts in great detail.

By utilising layouts and autostarting, you can start i3 with a fixed set of
programs, which I find extremely useful. Since layouts are a very new feature in i3 (introduced in v4.8, the latest stable version), it
doesn't have masses of good docs. So, here are some of the things I've done
in [my i3 config](https://github.com/raehik/dotfiles/blob/master/home/.i3/config)
to do with layouts & autostarting.

TODO: [Layouts](i3wm.org/docs/layout-saving.html)


Autostarting
------------

### Autostart a program on a specific workspace

To perform a command on i3 startup (e.g. bring up a terminal emulator), you use
the `exec` keyword. It's described pretty well in the User's Guide, section
[4.13. Automatically starting applications on i3 startup](http://i3wm.org/docs/userguide.html#_automatically_starting_applications_on_i3_startup).

To start something on a specific workspace, it seems to be recommended that you
use `i3-msg` as such:

    exec --no-startup-id i3-msg 'workspace number X; exec /path/to/program'

*(The `workspace number` is to do with [naming workspaces](http://i3wm.org/docs/userguide.html#_named_workspaces) -- it means "go to the workspace which begins with number X".)*

I say "seems to be" because I'm not *completely* sure why `exec i3-msg` is
required, rather than just `workspace number x; exec /path/to/program`.

Since that's rather a mouthful (handful?) I set this variable at the start of
the file:

    set $i3_msg exec --no-startup-id i3-msg

so that when I want to start something, I need only type `$i3_msg 'workspace
number X; exec /path/to/program`. In an ideal world,


### append_layout (?)

After you've started a program, you can then apply a layout to it. This means
you can always start a workspace with a certain configuration of windows and
have them be in their correct places (rather than you move windows around each
time manually).

Same as starting programs, prefix the command (`append_layout`) with
`workspace [number] X`:

    exec --no-startup-id i3-msg 'workspace number X; append_layout "/home/user/.i3/workspace-x-layout.json"'

I like to wrap the layout path in double quotes to show what it is, but it
isn't necessary (unless the path has a space in it!)


Begin on a specific workspace (most of the time)
------------------------------------------------

    exec --no-startup-id "i3-msg 'workspace number 1'"

It doesn't work every time, for whatever reason, but it doesn't matter enough
to me to find out why.


Layouts
-------

### Creating a layout

    - sometimes it doesn't work???


### Matching programs and layouts
