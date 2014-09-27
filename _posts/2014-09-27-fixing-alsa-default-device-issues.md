---
layout: post
title: "Fixing ALSA default device issues"
date: 2014-09-27 13:34:37
---

On my Lenovo B5400 laptop, I had some issues with ALSA choosing the HDMI audio
device to be the default. *"That's a bit silly"*, I thought, since [Flash can
only use the default device](https://wiki.archlinux.org/index.php/Advanced_Linu
x_Sound_Architecture#HDMI) and in general it makes a bunch of things **really
awkward**. I just wanna get the right device to be default!

The Arch Wiki provides a helpful solution: however, it also provides a **bad**
solution (which I initially chose because it was simpler) which only allows
**one** application to use the device at a time (see [here](https://wiki.archli
nux.org/index.php/Advanced_Linux_Sound_Architecture#Alternative_method), due to
it selecting a default card by *"addressing hardware directly"*. [A better
method](https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture#
Set_the_default_sound_card) is mentioned before that solution.

In short, create a `*.conf` file in `/etc/modprobe.d` (e.g. `/etc/modprobe.d/
alsa-base.conf`) and set your preferred sound card order. I won't repeat the
Arch Wiki, but I will point to my modprobe config file: [raehik/b5400files](
https://github.com/raehik/b5400files/blob/master/etc/modprobe.d/alsa-base.conf)

I use `index=-2` to make sure the card which used to be made default (HDMI
audio) is never chosen as the first/primary/default card. Safe and simple
solution.
