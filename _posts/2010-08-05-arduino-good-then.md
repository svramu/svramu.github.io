---
layout: post
title:  "Arduino? Good. Then?"
---

Post date: Aug 05, 2010 10:35:3 AM

At last, after an year of drooling, confusion, latter some desperation, and then some desperado, I'm into micro-controllers now! [Arduino](https://www.arduino.cc/) to be precise, and Atmel's [ATMega168](https://goog_1082880848) if you want the heart of it. Come to think of it, one year is pretty quick in my time scale of learning new stuff. I have languished far longer to learn some other things. All the same, the journey has just began, and miles to go before I can be an happy camper in the embedded electronic world.

Oh yea, I sure don't know why I tread this new long path of micro-controllers now (mid-life crisis? but then I have had one 'crisis' after another all my life), and surely not sure how much focus I'm willing to give it. Did I knew that, when I was a toddler (young at 20) doing Fibonacci series with BASIC? Nah! It never seem to change, you scratch an itch, that leads to something, then something, then you just wonder how you have been with out. I'm quite sure it will not lock out my other interests (it is bit scary you know?! I think about circuits, motors, in the middle of the night).

I'll grow over it, just a new wife, will mellow. I still love Software (pays me) and Math (entertains me), and I expect electronics to be somewhere between that range.

### How it all started

It was early last year, when the surprisingly genial Shankar popped out of blue, who coaxed me (well, I was already seeking a distraction from java) to help with some C coding (not even C++) for some embedded project he was doing with his colleagues (thus got to know, tele faceless, all the same good friend Vimalendra). It was some Client-Server code, so I dusted my C, pointers (ouch), and took care of the software part alone. Hardware used by his team was weird for my soft brain. [iMote](https://embedded.seattle.intel-research.net/wiki/index.php?title=Intel_Mote_2). I figured out that it is some wireless popular board, but that is about it on the hardware side. Anyway the association went interesting, as I glimpsed the challenge of VoIP, in all its toughness (latency is the key enemy). I must write about it separately sometimes.

In a lull moment, when the above project was over (just a week, but it looked like eons), I was kind of embarrassed that I know nothing about this iMote. Then, as you know with internet searches, the inner-you comes into play, and shapes your search. Was iMote costly?! And even all others in that league were costly. So how does a old Java guy like me color a search? I searched for "open hardware", and soon I was listening to the deafening praise of Arduino, from everywhere.

### Enter Arduino

Arduino is cool. The then $50 pricing (or was it?) by itself was luring for me (now has gone to $35). What added to my surprise was, long long time back, a distant cousin of mine, who is into embedded systems, commented, that the embedded programming requires costly hardware, as you need to use UV to burn some EPROM. My stingy brain stopped its dream right there. I specialize in the art of 'pay no money to learn'. And why do I love Open Source? Its a free lunch (ok beer) stupid, and hence the party.

So when I saw this $50 tag on a true blood micro-controller development board, I was desperate to get it. More searches, and found that it is lot cheaper (Rs.1200) in India somewhere north, if you sacrifice some elegance and some comforts. Can I? Oh sure. Now the greed took over.. how low can the board cost? Give up USB support (requires FTDI chip), in exchange for serial port (MAX232 will do), you slash Rs.500-700. Wow, and trade ATMega168 to its less endowed sibling ATMega 8, you can shave another 50 Indian rupiah. Well where can I get it, I want it somewhere nearby in my city (ok ok my village), I have no intention of travelling on some pilgrimage to just get this. I was in fact prepared to make the board from scratch (naive fool's dare).

When I searched for "arduino chennai", then I saw Simple Lab's workshop post in some forum. But I was already in mood to go low tech.

### Going back in time and friendship for help

Looks like this electronic itch is nothing new for me. I found that my old comrade Senthil has already bought me a full shebang of starter kit for me, and that too some 5-10 years back! Breadboard, wires, led, preset-potentiometers, some transistors, a neat desktop power supply with variable voltage, even a manual multimeter. Man, isn't it true, that "You see it when you believe it". All this was with me all along, and I never even glimpsed it.

It all came back to my mind in a flood. Long long time back, he used to show his "Disco light", with just LED, Transistor, Diode, Capacitor and Resistor, a pair of each. Give some regulated low volt power to it, and the two LED started blinking alternatively. Why?! There ended my whole quest for electronics. Many years latter I learnt this "disco" was one of the famed pinnacle of analog electronic physics (called oscillators). Everywhere I looked I only saw differential equation nightmare. Of course I love math, but it is one thing to know what calculus is, and it is another to live and breath it. Now I know, that for a software guy like me, analogue electronics is a whole new world. I took the burning stick from the wrong end and threw it with shock.

What was the 'right' end then? Embedded system. It is all software, but you use little of electronics to connect with the hard world. That was the luring dose for me. Bits and bytes don't scare me, but voltage do. So what I see in Arduino was the necessary graded ramp into the world of electronics, and hopefully robotics (ok don't laugh).

### The failed first step

So, wide-eyed, I vowed to make my Arduino myself, from scratch. Convinced Senthil to buy me the ATMega, max232, the capacitors, parallel post female plug. I'm going to make it and program it with parallel port, nothing less. Oh I'm also going to solder it myself, so I bought a cheap soldering iron, I checked with him to give me a short quick course on soldering (he he). BTW, while I'm at it, let me also make the purchase as economical as it can be be. So there I was in famed geek town called Ritche street, with Senthil. Stupid, and naive I might be, but you cannot blame me for diligence. I researched each part of the schematics and component on Internet for 3-4 months.

So what happened then? I had mistakenly bought ATMega16 with 40 pins, instead of the intended 28 pin DIP version of ATMega168. Just missed that last 8, but that gave me dozen extra pins to scratch my head with. I also realized that solder does not stick even if I ram the rod inside the board (my condescending well wishers and so many youtube videos latter clarified, that you should not put your lead solder on the iron, but on the pin, and pray - yet to try). My IC on breadboard jumped out, as I didn't push it enough, in the fear of harming the pins. And that max232 chip with some four capacitors, just confused me to no end.

So what of it all? The 40 pin is now sleeping in my box, awaiting resurrection or a decent burial. It just reminded me of my school lab session on Vernier Calipers (VC). Some good teacher corrected me, that with VC, you cannot write the results with ending 3rd decimal zero, as that is pseudo precision. When the instrument itself is capable of only measuring 2 decimal places of a milli meter, adding a 3rd zero is a falsity. If you are new to a subject, more planning will not lead you to a flying start, it will just make your failure a glorious one. Well, it was so for me, but that was an essential slap to be more focused on incremental improvements. Also, I did learn a good deal of theory, though it burned me some 400 Indian bucks in the process.

### Seeing light at the end of the breadboard

So I renewed my link with Prakash of Simple Labs, whom I found while searching for Arduino in Chennai. Last year, he sold me a cute serial ATMega8 board for Rs.490. Man, was I happy when I saw those blinken' LEDs!!

After all this hunt, this was ecstasy for me. Here I can just hook up the professional board to the serial board, install software, write and send code over wire to the little chip out there, and the lights blink as I dictated (oh yea a couple blew up). This was inexplicably satisfying for me and novel. As a software professional, I always deal in abstract. Yea there is this GUI, but it is all virtual. The software GUI sure gets the job done, but all it can crank up is more information. The sweet hard world outside the software purview is blissfully untouched. Now, that can all change. I can break and confuse even the hardware. With micro-controllers, I'm one with the world. My software has a reality, good or evil as I choose, and good or bad as I'm capable of. This kind of completes a loop for me. I remember proudly saying my erstwhile employer, during an interview, that I want to Simplify and Automate everything. Young, and fresh from coding 1000 lines, that was dreamable. But after millions of lines of code, and rewrites, unachievable deadlines, missed customer requirement, I painfully realize how fragile the code can be, how little its reach in solving the real world problems is.

Oh yes, my electronics cannot cure the world of poverty. But I'm sure a happy man, and I'm hooked to know more. And you know what, I made the blinking 'Disco' light again, now with Arduino. Also not just two LEDs, but three, and all permutations of it. I'm still no wiser on oscillators, or differential equations, but there it was the 3 blinking LEDs, in complex patterns, as I wrote in code.

### Then the lull

I hardly learn from mistakes. So what I do after this milestone of making LED blink? I made more LEDs to blink. And more. For a whole year, my new arduino, did nothing, dusty, and once in a while powered some LED. Why? I was researching on motors, parallel programmers. Oh yes, the same old parallel programmers. I still wanted to build the arduino on a bread board. There were some quite descriptive pages on that, but I never came close, as I still have to put the bootloader into a fresh ATMega, and for that I need a parallel programmer, which I did build (taking 2 hours, and countless youtube videos, to solder 6 resistors with the pin and wires), but which doesn't seem to be working. Stuck again.

So what do you do when you are stuck? I dream on. I told Senthil I want to make a full project. Saw my son's new Rubik's cube, so I said, it would be cute to build a Cube Solver. I was so happy about the idea's novelty. When checked, looks like every man and his dog, do Rubik's cube solver as their "I've arrived" project. Well rediscovery is nothing new to me, it is in fact a kind of mark of fitness. So there I go tap tap and do the only thing I know, code the logic. In Arduino you can write C++ and call it as a header file. Neat, so there was the code, and I tested it with 20 random virtual turns, which it solves with 200-300 moves (tested over 100,000 trials). 300? Well that will take eons with a crude machine, and I'll have no audience. So I learnt the god's algorithm and the lore, and it seems you can solve with 21 moves max practically, if you do some nifty algorithm. Well, well, all this software is fine, where is the hardware? You are building an electronic project or the same old abstract software stuff? But for that I need motors, I need to bend metals to hold the cube...

In one dingy cafe corner, Senthil rubbed it in "you'll take 6 months to know motors". Truth is more painful. Yes, I was going nowhere.

### The workshop and the grant

So again back to Prakash, and a helper stint in a [workshop](https://www.simplelabs.co.in/drupal/embedx) one weekend, my gloom has given way a bit. All lessons learnt? I wish life is that simple. Collecting my pieces, but thanks to Simple Labs, I can now light up an LCD, show the room temperature. A small consolation.

Oh yea I dream more now (does it ever stop?). How about a color sensor based Master mind game? Oh yea, as usual others have done it already, but still a worthy goal. And I want my motors. Motors are scary because it needs extra things like controllers, else my board can burn (no never), and motors ain't cheap. But for all things moving, motors are the key movers.

So, people who can, do it; who cannot, will teach; and who cannot even do that, will write about it. And here I'm story telling, what I know best. Go man, stop whining, fire some motors, blend the software cloud with arduino, make some net connected gadget... (dream on).
}
