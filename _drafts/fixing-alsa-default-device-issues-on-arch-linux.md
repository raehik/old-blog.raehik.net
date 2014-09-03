---
layout: post
title: "Fixing ALSA default device issues on Arch Linux"
date: 2014-08-29 00:20:00
---

On my Lenovo B5400 laptop, I had some issues with ALSA choosing the HDMI audio
device to be the default. *"That's a bit silly"*, I thought, since [Flash can
only use the default device](https://wiki.archlinux.org/index.php/Advanced_Linu
x_Sound_Architecture#HDMI) and in general it makes a bunch of things **really
awkward**.

The Arch Wiki is helpful for this, but also gave me a method which only allows
one application to use the card at a time (see [here](https://wiki.archlinux.or
g/index.php/Advanced_Linux_Sound_Architecture#Alternative_method). However, a
better method is mentioned before that solution:

blablabla, check `/etc/modprobe.d/alsa-base.conf`, point to my `b5400files`
repo, just use Arch Wiki.

explain that this method doesn't change your default *card* -- it changes your
default card *order*, and the 1st card is designated as default.
