&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # TJ Ragam - An Overview

An Indian style music palyer
*S V Ramu (2002-06-30)*

A PoPP archive explanatory article, for [TJRagam](PoPP%20-%20TJ%20Ragam.html)

**About Sound**

Sometime back my uncle wrote a nice program (in Pascal) that played a specially coded text file as pleasing Carnatic music. It behaved very similar to the BASIC's play command, which took a string of linearized western notation (with sharps and flats) and played it with the system's default speaker (that small puny one). That was the first time when I thought about the scientific angle of music.

Very simply put, music that we hear, has three aspects to it. The Pitch, Volume and Timbre. *Volume* as we know is the loudness. The *Pitch* is the most important aspect of sound that makes us enjoy music. This is the granule of any melody. Another name for pitch is frequency, which is just the number of beats per second. It is measured in Hertz (Hz) which is again just the cycles per second. The *Timbre* is the quality that differentiates a song played with different instruments. There is whole lot of physics due to Helmholtz which says that Timbre is just a particular combination of pitches or frequencies. The fourth aspect that is not exactly a quality of sound, but crucial for music is the timing. How long a note (pitch) has to play, or not play, is a vital factor.

On some other occasion, we can discuss the nuances of these three in detail. For now, we'll see the above three aspect's relevance in this program (TJ Ragam). Long back I simulated my uncle's program first in QB and then in C. Both our programs, were for the small diagnostic speaker that comes with all PC. This speaker can only produce one type of simple timbre (meaning that it cannot play a range of instruments, without some sophisticated software to aid). The sound command available on BASIC, Pascal and C, was a very simple one. You can only say what frequency to play, and for how long. But this is enough to produce all the melodies of world!

**About Music**

The basic music theory is that, human mind can easily recognize and produce frequencies that are separated by an *Octave*. A *Note* is a sound of one frequency (Hz). Two notes are separated by an octave, if the second's frequency is twice (2) that of the former. It seems the smallest difference in frequency that an untrained ear can discern is a *Semi-Tone* which is 12th root of two (^12 root-of 2 = 1.05946..). That is if I shout at 100hz frequency, then a note of 200hz is its octave, and a note of 100×1.05946 is its next semitone. Why this 12th root? It seems that our ear curiously analyses sounds in geometric progression. That is, if 100hz is the base frequency, the next semitone is 105.9463 (100×1.05946) and NOT 101.05946 (which is 100+1.05946). Yes, we have to multiply this semi-tone difference to get the next note, and not add. While trying to arrive at this minimal discernable distance, people used the widely know difference, namely an octave, and tested how much they have to divide that by (geometrically). And that number of divisions of an octave is 12. This is the base for all modern instruments, and is called the equitonic scale. Of course a trained voice can produce lovely frills which are lot smaller than a semitone. But for a notation based recording of songs, 12 semitones seems more than enough. Rest is the magic that is left to the virtuosity of the musician.

An interesting pitfall discovered by my uncle in those early years was that, if we forget to multiply and instead add this 12th root of 2, we get some gibberish of sound.

You would have heard that there are just 7 notes in music. Well, human ear can hear anywhere between 20hz to 20,000hz, so there are in fact 1000s of notes possible. But if you use the above fact that we can only differentiate a semitone, and that the musical frequencies progress in a geometrical fashion, then there are not that many notes after all. Combine with this the fact that a note separated by an octave sounds identical for melodic purposes, then what we have is only the twelve notes of the octave. I read in an human cognition study that we can remember only seven random things (+2 or -2) at a time. Something like saying that we have a L1 (or L2) cache for only 7 random things. Maybe that is why we say that there are seven colors in the rainbow, seven days in a week and maybe seven notes in music. The point is, all naturally occurring music in the world contain only 5-7 notes, and rarely 4 (too simple) or 8 (too complex) notes. Note that 8 = 12-4, and 7=12-5. So a given melody (Raga in Indian context, and a scale in western) usually contains only 7 out of the possible 12 notes in an octave.

**The Indian Carnatic music**

Carnatic music is the classical South Indian music. This is not very different but from the Hindustani music of north, but is very distinct to an Indian ear. Indian music is (I think most eastern music are) melody based, unlike the western music which is polyphonic. That is, using many instruments. In western, the importance is lot more on the harmony of different notes and less on the complexity of the melodic sequences. That is why there are symphonies with 50 - 60 instruments in western classical. Of course there are piano concerts too, but a piano is an orchestra by itself. Indian music is simple in that sense, and puts its focus on the melodic combinations. Essentially this means, that a single singer or an instrument is an orchestra by itself. Of course instruments do accompany for effects, but always in the same note or the octave (the simplest of harmonies).

Sometime back when I tried to sing with a choir group; alone, I could easily repeat every single voice of that 7-person harmony. But when I tried to merge with other 6 people it was a disaster. The Indian mind accustomed to hear only octave based harmonies are initially incapable of adjusting to other multiples of semitones. Of course there are many orchestral maestros in India too, and with study every body can sing anything (within friends at least).

Melody being the major focus, the notation for Indian music is linear. For western, to notate the simultaneous playing of different notes, you need the 5-lined staff notation. In India, you just need one linear sequence of letters to symbolize the notes. Of course, we can write western music in linear form too, if we code each chord with a separate symbol.

The melodic pattern in a given song in Indian classical music is very formally recorded. A name is given to each of these. A **Ragam** (or Raga) is the name given to a distinct melodic pattern. There are thousands of named ragams in Indian music. Of course only few hundreds are in use in any particular point of time. The theory of Indian Raga structure is elaborate, and we'll go into that some other time.

**The Notes and their timings in TJRagam**

The TJRagam (so you know why this name), uses the traditional Indian notation (albeit in English) with some minor modifications, for computerish concreteness. These notes are,

s r R g G m M p d D n N

Which is equivalent to the western (if I may streamline this way),

C D D# E E# F F# G A A# B B#

*   Why these peculiar letters, instead of the straight forward ABCD of western? Only historic and cultural reasons. But this conditioning is deep enough to consider a seperate interpreter instead of forcing every body to think in ABCD..FG (in fact CDEFGAB). This SRGMPDNS is pronounced as Sa Re Ga Ma Pa Da Ni >Sa.

s-r- g-m-

gmmp \[gm-p] \[p-dn]

>s-<n-d-p-

m-m- \[gm-p] p-

pdn- >s-< n-

\[s-- r-- g-]....

\[s-- r-- g-]....

.... ....

.... ....

*   Before going to upper octave, we use the **>** (greater than) symbol and before going to lower octave we use the **<** (less than) symbol. Note that we can use these symbols multiple times to denote very low or very high octaves. In the traditional method they use one dot (or more) above or below the letter to denote upper or lower octaves respectively. But for computers this BASIC-style notation would be lot easier. We do not need the # (sharp) or flat symbol as the upper case and lower case SRGMPDN is just enough to notate all the twelve note. There is a small twist here which we will see while analyzing *Mela*.
*   So what remains is the need for notating timings in music. We have two ways to do that. Traditionally, maybe scientifically even, timings in music is talked about in multiples of two! For example if we want to play two notes, SR, in the duration of one note, say S, we can write it as [SR], which means each note is halved. We can bundle the notes in more and more square brackets to achieve minute resolutions. Remember that halving means, half of what we start with; if we start with double the normal note as basic, halving will only produce usual normal note. *Timing and frequency in music is only relative*. If our base frequency or the base beat is different, the pitch, duration and experience of the whole song would be very different, and yet the melodic structure would remain same. To extend a note, we use - (hyphen). Note here that SS is different from S-, the former has a break in it, while the latter doesn't. This elongation technique allows some flexibility from the strictly doubling mode of the [] (square brackets). I think we can never notate that we want to play 1/3 of the given note in any notation, without changing the base timing of the whole song! (Need to explore this further).
*   Relevant silence is music too. The **.** (dot) is used as the silent note. You can use the [] and -, here too, for timing.
*   Any other character is ignored in the song file.

**Other musical guidelines**

Other musical guidelines required are the Volume, base Speed (Tempo), base Pitch, the instruments set, and the seven note combination available by default for the given song. Due to MIDI framework we can also specify polyphonic music, and the instrument channel for that.

/This is a comment\

Enclosing some text inside / (forward slash) and \ (backward slash) omits that text from parsing. Useful for hiding some notes while testing.

{Pitch:1+; Tempo:200;}

The *Pitch* and the *Tempo* tag is to specify the basic frequency and the basic time chunk. For now it is relative to a hardcode value. Latter we must change it to be based on Hertz and Second, maybe.

{Instruments:108,55,48;}

This *Instruments* tag is an extension of the MIDI framework which specifies that we have to tell what all indexed list of instruments we can avail during a song, and then specify this index as the instrument of the given *Channel*. There can be only utmost 16 channels, which means that only sixteen instruments can be used at a time.

{Track:0;}

There can be as many *Track*s as we need. Thus infinite polyphony is theoretically possible.

{Mela:10; Volume:120; Channels:0,0;}

The *Volume* tag specifies the volume of course. Again this is relative to an hardcoded value, and we need to include some relevant unit. The *Channel* is as discussed in the Instruments tag. The numbers specified in the channel should correspond to the 1-based ordering of the Instruments tag. Note that 0 is used for percussion instruments (drums, bells etc.) which we can discuss in detail, some other time. *Mela* is the raga number in the Carnatic *Melakarta* model which is a number ranging from 1-72; where only the small case is used for the default notes and upper case for the outside note. 0 is used for the free form notes writing, where small case is always the smaller note and upper case the higher. Again we have to discuss this in detail some other time. I also feel that we might have to allow writing the notes themselves instead of the number to specify a raga.

**About the program**

Well that is some very very rough and quick overview. Each aspect of these could be an article in its own right. But this is good for a start.

The program is written using the Java MIDI packages, which allows, unlike the early C based programs that I was talking about, to specify and play different instruments (both melodic and percussive). NOTE: For now the program is completely off beat (skewed timings) when played in the present zipped format. It plays beautifully in my JEdit setting, but I don't know, when and why it falters. I wish I can cure this malady sooner. Of course it will be cured, and till then you can checkout the .sng format, suggest some changes if need be, and maybe browse the code. Oh yeah, you can hear the physically recorded .mp3 file in the download link below. The MIDI allows recording our song, into a .mid format, which can be played in most machines in the world. Unfortunately, due to some hack I've done for tempo, this is too skewed for now.

Stay tuned, more to come!

**A sample composition**

You can [download this sample music](http://tattvum.com/Articles/2002/2002-06/2002-06-30/Ramu-TJRagam-0.1-Sample.zip) as .sng file and as record .mp3 file. You can see below the same song rendered in color. (I'll publish this JEdit mode file, with the next release).

/This is a comment\

{Pitch:1+; Tempo:200;}

{Instruments:108,55,48;}

{Track:0;}

{Mela:10; Volume:120; Channels:0,0;}

<<

m-m- m-m-

gmmp \[gm-p] \[p-dn]

\[gmmp]\[gmmp] \[gm-p] \[ndpm]

m-m- \[gm-p] \[p-dn]

mmm- \[ndpm] \[p-dn]

\[gn- gn- gg]\[gmmp] \[p-dn]

\[ndpm]g- \[gmpd] n-

\[npdm pmnd ndpm ndpm]

\[mpnd dpdn ndpm ndpm]

\[[gmmp] \[p-dn]]\[p-dn]\[[gmmp] \[p-dn]]\[p-dn]

\[npdm pmnd ndpm ndpm]

\[gn- gn- gg]\[gmmp]\[p-dn]

mmm- \[ndpm] \[p-dn]

\[n-nd]\[d-dp]\[p-pm]\[m-mg]

\[nnnd]\[dddp]\[pppm]\[mmmg]

m-m- m-m-

{Track:1;}

{Mela:36; Volume:120; Channels:1,3;}

>

s-r- g-m-

gmmp \[gm-p] \[p-dn]

>s-<n-d-p-

m-m- \[gm-p] p-

pdn- >s-< n-

\[s-- r-- g-]....

\[s-- r-- g-]....

.... ....

.... ....

s-rg s-rg

\[npdm pmnd >s--- ----<]

\[gn- gn- gg]\[gmmp]\[p-dn]

mmm- \[ndpm] \[p-dn]

\[n-nd]\[d-dp]\[p-pm]\[m-mg]

\[nnnd]\[dddp]\[pppm]\[mmmg]

s-r- g-m-

>s--- ---<

{Track:2;}

{Mela:36; Volume:120; Channels:2;}

>

.... ....

.... ....

.... ....

.... ....

.... ....

.... ....

.... ....

\[npdm pmnd >s --- ----<]

\[>s --- ----< >s --- ----<]

.... ....

.... ....

.... ....

.... ....

.... ....

.... ....

.... ....
}