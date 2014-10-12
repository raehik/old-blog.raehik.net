---
layout: post
title: "Record additional full zsh history"
date: 2014-10-12 12:48:15
---

I like to keep my shell history free of duplicates and limited size (so
I don't have to manually rotate it). However, after reading [that
Stephen Wolfram
post](http://blog.stephenwolfram.com/2012/03/the-personal-analytics-of-my-life)
from my [last
post](../../../../2014/10/08/things-that-are-cool-analysing-your-life),
I've realised just how much I want to see my full command history: the
embarrassing misspellings, the endless lines of `cd` and `ls`... It's a
neat idea, I want to be able to analyse how I use my computer(s).

I did **not** want to change how my actual shell history was stored,
since I didn't have a problem with it. So somehow, I would have to store
all commands I type in a separate file, and preferably easily because I
am an incredibly lazy hacker. Hmm. (This is where `zsh` comes in.)

For those of you who use it, it should come as no surprise that `zsh`
does indeed have a feature for this. `zsh` has some special functions
you can define which are run on certain events. The `zshaddhistory`
function is executed *"when a history line has been read interactively,
but before it is executed"* according to its entry in `zshmisc`. Any
time you write a command which `zsh` can parse, this function will be
run, as long as you've defined it.

So all we have to do is get `zshaddhistory` to write the argument it
gets to a file. I'd also like to record the current date and time,
because I want to do more than simply count my commands. This is almost
*too easy*. To your `.zshrc`, add:

    {% highlight bash %}

    zshaddhistory() {
        # prepend the current epoch time
        # $1 includes terminating newline already (see zshmisc(1))
        echo -n "$(date "+%s") $1" >> "$HOME/.zsh_full_history"
    }

    {% endhighlight %}

Now every command you type is logged to `$HOME/.zsh_full_history` along
with the exact time.

I did come across a small problem with this simple approach: when
exiting with Ctrl-D, there is no newline present, but `zsh` still calls
`zshaddhistory` (with an empty argument). The exit line now looks
identical to an empty line, which I have rather a lot of in my command
history. To fix this, we can use another special `zsh` function,
`zshexit`:

    {% highlight bash %}

    # clean up the line when exiting with Ctrl-D                                    
    # if Ctrl-D is hit, there isn't a terminating newline -- so we'll add a  
    # useful message which probably won't ever be written (! specifies an    
    # event, so it'll only work surrounded in quotes                         
    zshexit() {                                                              
        echo "!EXIT!" >> "$HOME/.zsh_full_history"                                
    }  

    {% endhighlight %}

Add that to your `.zshrc` too, and every time you exit the shell,
`!EXIT!` will be added to your full history log. I chose that string
because it's unlikely to ever be added to the history, since the '!'
will cause a parse error. If you ever exit the shell with the `exit`
command, then you'll get this line right after without a date before it.

Some example history could be:

    1413054363 ls
    1413054364 exit
    !EXIT!
    1413054368 !EXIT!
    1413054377 tail $HOME/.zsh_full_history

You can see that there were 2 exits there: the first done using the
`exit` command, and the second 4 seconds after by Ctrl-D. Originally,
all that mattered to me was that Ctrl-D lines could be easily skipped
programatically -- but this also records the time at which you exit a
shell, which might be cool to look at.

... Now I feel it's not complete, that I need to log when shells start
too. This is pretty simple, as you'd imagine: since `.zshrc` is read by
interactive shells on startup, we add just one line to it:

    {% highlight bash %}

    echo "$(date "+%s") !START!" >> "$HOME/.zsh_full_history"

    {% endhighlight %}

And that's that! Now you can be safe in the knowledge that your shell
history is being logged, if that makes you feel safe for any reason.
Eventually I'll write a program to parse and analyse the log to get some
nice figures.

(The examples in this post are not identical to what is in my `.zshrc`:
see
[raehik/dotfiles/home/.zshrc](https://github.com/raehik/dotfiles/blob/master/home/.zshrc)
for my full config.)
