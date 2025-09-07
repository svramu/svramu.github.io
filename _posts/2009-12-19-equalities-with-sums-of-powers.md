---
layout: post
title:  "Equalities with Sums of Powers"
---

Post date: Dec 19, 2009 2:11:53 PM

### Introduction

In my previous birth I aspired to be a mathematician (but in a previous.previous birth, I wanted to be an artist... that is a different story. And in previous.previous.previous...)

Of many 'secret formulas' that I found at that time, one simple and beautiful one continues to make me smile. Having seen enough rediscoveries first hand, I share this more for the joy. But if you do find in some place that they have posted some million dollar prize for this, do alert me (I'll give you a cut). Now a teaser...

1 + 4 + 6 + 7 + 10 + 11 + 13 + 16 + 18 + 19 + 21 + 24 + 25 + 28 + 30 + 31

**=**

264

**=**

2 + 3 + 5 + 8 + 9 + 12 + 14 + 15 + 17 + 20 + 22 + 23 + 26 + 27 + 29 + 32

Did that catch your interest?! No big deal? Oh yeah, you can always find two sets of numbers whose sum is equal. But two equal sized sets of positive integers should get some marks for "cuteness" right? No? At least, note that together it is all the numbers from 1-32, 16 in each set, none repeated! Come on, that should surely raise some tingles from the mathematician in you! Nope? Well, no worries, more surprises up the sleeves...

1<sup>2</sup> + 4<sup>2</sup> + 6<sup>2</sup> + 7<sup>2</sup> + 10<sup>2</sup> + 11<sup>2</sup> + 13<sup>2</sup> + 16<sup>2</sup> + 18<sup>2</sup> + 19<sup>2</sup> + 21<sup>2</sup> + 24<sup>2</sup> + 25<sup>2</sup> + 28<sup>2</sup> + 30<sup>2</sup>  + 31<sup>2</sup> 

**=**

5720

**=**

2<sup>2</sup> + 3<sup>2</sup> + 5<sup>2</sup> + 8<sup>2</sup> + 9<sup>2</sup> + 12<sup>2</sup> + 14<sup>2</sup> + 15<sup>2</sup> + 17<sup>2</sup> + 20<sup>2</sup> + 22<sup>2</sup> + 23<sup>2</sup> + 26<sup>2</sup> + 27<sup>2</sup> + 29<sup>2</sup> + 32<sup>2</sup>

Ah that SHOULD stump you! See the beauty. Same set of 32 sequential numbers split into two sets, each squared, summed, and the answer is same. I cannot stop starring at it for hours together. To preach the convert, here is more...

1<sup>3</sup> + 4<sup>3</sup> + 6<sup>3</sup> + 7<sup>3</sup> + 10<sup>3</sup> + 11<sup>3</sup> + 13<sup>3</sup> + 16<sup>3</sup> + 18<sup>3</sup> + 19<sup>3</sup> + 21<sup>3</sup> + 24<sup>3</sup> + 25<sup>3</sup> + 28<sup>3</sup> + 30<sup>3</sup>  + 31<sup>3</sup> 

**=**

139392

**=**

2<sup>3</sup> + 3<sup>3</sup> + 5<sup>3</sup> + 8<sup>3</sup> + 9<sup>3</sup> + 12<sup>3</sup> + 14<sup>3</sup> + 15<sup>3</sup> + 17<sup>3</sup> + 20<sup>3</sup> + 22<sup>3</sup> + 23<sup>3</sup> + 26<sup>3</sup> + 27<sup>3</sup> + 29<sup>3</sup> + 32<sup>3</sup>

Now, even a math doctor out there should see this as a gem. The same two sets of positive integers, when summed together remains equal, even when you square and cube it! I have missed many a nights just seeing this elegance. 

**History**

OK, let me cut the hype and go for some history, and oh yeah the derivation and proof. 

The above equation is not a one-off case. It is a cute sample of a general rule, which I stumbled upon when trying (dreaming maybe) to solve an OR ([Operation Research](https://en.wikipedia.org/wiki/Operations_research)) Problem. The problem is: If you are given n books, and asked to arrange it into two stacks, so that the stack height difference is minimal, is there an algorithm that will work always? Looks like [this is a NP-complete](https://en.wikipedia.org/wiki/Partition_problem) problem, that is, any know algorithm will take exponentially longer times, as you increase the number of books. Well, I didn't solve this problem (Of course, if I had, I would not be here writing articles on some old number tricks).

But what happened was, while trying to test with easy book thickness, say integers, the above patterns came. Staring point is...

1 2

4 3

That is simple stack right? Surely no big deal for the OR goal, but you can see the direction...

1 + 4  **=**  2 + 3

In general,

(a + d<sub>1</sub>) + (a + d<sub>4</sub>)  =  (a + d<sub>2</sub>) + (a + d<sub>3</sub>)

if,  d<sub>1</sub> + d<sub>4</sub>  =  d<sub>2</sub> + d<sub>3</sub>

This is kind of obvious from above. The key is a's quietly gets cancelled. On the first sight, this a should 'almost' go away even if you square each. 

(a + d1)<sup>2</sup> + (a + d4)<sup>2</sup>  ----  (a + d2)<sup>2</sup> + (a + d3)<sup>2</sup>

So,  d<sub>1</sub><sup>2</sup> + d<sub>4</sub><sup>2</sup> + 2a(d<sub>1</sub> + d<sub>4</sub>)  ----  d<sub>2</sub><sup>2</sup> + d<sub>3</sub><sup>2</sup> + 2a(d<sub>2</sub> + d<sub>3</sub>)

But from above equation in d's,  d<sub>1</sub><sup>2</sup> + d<sub>4</sub><sup>2</sup> ---- d<sub>2</sub><sup>2</sup> + d<sub>3</sub><sup>2</sup>

Whatever this inequality be, it is independent of the 'a'. So if we have proper d's as above, then even squares of them will differ, so if you flip that same d's squares, but with a different starting a, then the total sum should be same for both stacks. 

(a + d<sub>1</sub>) + (a + d<sub>4</sub>) + **(b + d<sub>2</sub>) + (b + d<sub>3</sub>)**  =  (a + d<sub>2</sub>) + (a + d<sub>3</sub>) + **(b + d<sub>1</sub>) + (b + d<sub>4</sub>)**

also

(a + d<sub>1</sub>)<sup>2</sup> + (a + d<sub>4</sub>)<sup>2</sup> + **(b + d<sub>2</sub>)<sup>2</sup> + (b + d<sub>3</sub>)<sup>2</sup>**  =  (a + d<sub>2</sub>)<sup>2</sup> + (a + d<sub>3</sub>)<sup>2</sup> + **(b + d<sub>1</sub>)<sup>2</sup> + (b + d<sub>4</sub>)<sup>2</sup>**

This is neat, and looks like this can be generalized to higher powers. before that some examples...

1 + 4  **=**  2 + 3

1<sup>2</sup> + 4<sup>2</sup>  **----**  2<sup>2</sup> + 3<sup>2</sup>

The difference is 4 and similarly for a different a, but same d's

10 + 13  **=**  11 + 12

10<sup>2</sup> + 13<sup>2</sup>  **----**  11<sup>2</sup> + 12<sup>2</sup> 

### The Pattern

Instead of going more rigorous, we can see the pattern is:

A  |<sub>1</sub> V  |<sub>2</sub>  VA  |<sub>3</sub>  VAAV  |<sub>4</sub>  VAAV AVVA  |<sub>5</sub>

Here say, if A = 14 - 23 then V = 23 - 14, is the reverse. Attaching a ruby script (SumOfPowersEqualities.rb) for generating this logic. You can direct the std out to a html file (say **ruby SumOfPowersEqualities.rb > soap.html**).
}
