---
title: "Recording screen & audio on Linux and converting to a half-decent GIF"
date: 2016-02-05 23:06:10
---

TODO: links

Here's the deal: Linux doesn't have many screen recorders or screencasters.
There's the popular SimpleScreenRecorder, recordMyDesktop and a few other
GUI-based apps. For CLI-inclined folk most suggest using FFmpeg's x11grab input.
This post will walk through using x11grab and choosing recording options for
your own requirements step by step. I'll also go through converting videos to
GIFs, targeting terminal sessions or simple/small/static-ish screencasts.

Note that though a lot of this can be applied to streaming, this is not a
*dedicated* streaming guide. I'll add some pointers just as soon as I try it out
myself: otherwise check out the [FFmpeg streaming guide][ff-stream].

[ff-stream]: https://trac.ffmpeg.org/wiki/StreamingGuide


Recording desktop to a video file
---------------------------------

*Disclaimer: Much of this has been mutilated from FFmpeg's own wiki pages on
[H264][ff-h264] and [desktop capturing][ff-desktop].*

### x11grab usage

FFmpeg's x11grab input will grab the image you see on your display, with
optional size and offset parameters. Default syntax looks something like this:

    ffmpeg -f x11grab -r 60 -s 1920x1080 -i $DISPLAY+100,200 rec.mkv

Options work as follows:

  * `-f x11grab`: use the x11grab input device
  * `-r 60`: record at 60 FPS. In my experience, the `-framerate` and
    `-filter:v fps=` options give delay and weird timings at the start of the
    recording, while `-r` has always worked.
  * `-s 1920x1080`: use an area of 1920x1080. Default is 640x480 (for my build
    anyway).
  * `-i $DISPLAY+100,200`: record X display $DISPLAY (usually `:0`) at (100,
    200) from the top left corner (i.e. 100px x-offset, 200px y-offset)

The `-s` option determines what area FFmpeg will record, in the format
`<width>x<height>`. If you want to record the whole screen, use your full
resolution with no offsets (explained later).  Without `-s`, FFmpeg (or my build
at least) will record a tiny 640x480 window.

The `-i` option takes an argument in the format `$DISPLAY+$X,$Y` where `$X` and
`$Y` are the x and y offsets respectively from the top left corner (they can be
omitted if you want to record from that corner). You can also add an X screen
number after `$DISPLAY` like `:0.0+100,200`, but as mentioned in [Gilles' answer
on Unix & Linux SE][ul-se-x] these are rarely used.

[ul-se-x]: http://unix.stackexchange.com/questions/17255/is-there-a-command-to-list-all-open-displays-on-a-machine


### On-the-fly encoding

Some computers might not be able to handle encoding a stream of their full
screen and perform normally as well. Or you might want to make sure that
recording uses as few resources as possible. The best approach for solving these
problems is to encode to x264 with a fast preset, then potentially re-encode
later for higher compression (you can keep quality when doing this). Add these
options on to your command:

    ... -c:v libx264 -preset ultrafast ...


### Lossless encoding

This is surprisingly possible, even with a weaker computer. The x264 codec takes
two options to do with quality: `-qp` and `-crf` (constant rate factor). The
[FFmpeg H264 wiki page][ffmpeg-h264] says that `-qp` is recommended for lossless
encoding, so throw `-qp 0` on to the end of your x264 options:

    ... -c:v libx264 -preset ultrafast -qp 0 ...


### Recording audio

Use the PulseAudio capture device:

    ... -f pulse -i default -c:a copy ...

If you want, you can encode the sound rather than copying the stream directly by
using e.g. `-c:a libvorbis` or `-c:a flac`, but this may introduce further
performance overhead (which we're trying to reduce for the most part).


### Putting it all together

The following command will:

  * record audio losslessly (copies PCM stream directly from Pulse)
  * record 1366x768 from top left at 60 FPS
  * encode the video losslessly and quickly using h264

<!---->

    ffmpeg -f x11grab -r 60 -s 1366x768 -i $DISPLAY \
           -f pulse -i default -c:a copy \
           -c:v libx264 -preset ultrafast -qp 0 \
           rec.mkv


Re-encoding a finished recording
--------------------------------

After recording, it can be useful to re-encode with a slower preset to obtain
better compression, thus a much smaller filesize. Re-encode audio to whatever
format you want -- I'm using FLAC to stay lossless -- and re-encode video with
the same `-qp` setting but with a slower preset:

    ffmpeg -i rec.mkv -c:a flac -c:v libx264 -qp 0 -preset veryslow rec-reencode.mkv


Converting to a GIF
-------------------

First, 



Optimising (certain) GIFs
-------------------------

### tl;dr

`gifsicle` is a great tool for easily optimising GIFs. The `-O3` option will
perform several optimisations and can reduce the size of screencasts or highly
static GIFs quite dramatically:

    gifsicle -O3 rec.gif -o rec-optimised.gif


### Explanation

GIFs are unlike videos in that each frame can last for a *variable amount
of time*. When FFmpeg converts videos to GIFs, however, it doesn't take that
into account -- frames are added to the GIF according to the frame rate
specified. Recent optimisations in FFmpeg as explained here TODO
http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html 


Notes
-----

  * Be technical: explain how GIF frames/delays work (simply), why they're a
    pain to convert to video & somewhat vice versa
  * Aim at users like me


Resources
---------

[ff-h264]: https://trac.ffmpeg.org/wiki/Encode/H.264
[ff-desktop]: https://trac.ffmpeg.org/wiki/Capture/Desktop

I got much of my information from these pages:

  * http://www.imagemagick.org/Usage/anim_opt/#removedups
  * http://mokagio.github.io/tech-journal/2015/03/16/osx-from-screengrap-to-gif.html
  * http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
  * https://blog.imgur.com/2015/02/17/tech-tuesday-the-basics-of-converting-gif-delays-to-video-frames/
