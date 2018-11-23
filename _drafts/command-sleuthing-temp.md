at school last week somewhen. I deduced
that it must have been on Monday or Tuesday, s I had used it Sunday evening
(worked out by checking my command history for something I knew I did
when I was doing my chores) and I realised I was missing it on Wednesday
(IIRC).

Sad times. I was kinda at a loss. But then I realised I could probably
use my timestamped command history even more.

I doubted that I would've used my earphones on Tuesday, since I didn't
have any lessons I could realistically use them in. So, I found part of
the Unix time which was between 1-2 Dec (more or less) and `grep`ped for
all the commands I did around then:

    grep 14174 ~/data/zsh_full_history

Great, the output was short enough that I could scroll through it. I ran
`school` (netctl profile alias script) in the morning, so I knew that I
did indeed use my laptop at school that day (no surprise).

The best I could hope to get from this realistically was a memory jog.
That's what happened when I saw this:

    1417449405 alsamixer
    1417449407 mpn

According to `date`, that was Monday 1 Dec 15:56:45 GMT 2014. And
suddenly I remembered that I was running a club after school that day!
The atmosphere was super dull, and I was considering playing some music
while we worked... which meant I used my earphones then! And my MP3
player stays with my earphones!

So, if they're still in that room, then it's no wonder nobody picked
them up, tucked in a corner on the teacher's as they might be!

Wow, this history recording feature is way more useful than I could have
ever thought it to be.
