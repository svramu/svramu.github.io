&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Why Calculus?

Volume of Sphere & Calculus: From a layman's point of view

*S V Ramu (2000-11-20 -Version 2.0-)*

**Volume of Sphere**

Have you ever wondered about the volume of Sphere? Without Calculus?! Sphere has been a solid of awe, from the time immemorial. It is the perfect *solid*! But, as much as the Circle (The *perfect figure*), its nature is hard to grasp.

We will try to find its Volume in a pristine way, in an attempt to recapture the original impetus that drove mathematicians and laymen alike, to discover the nexus between *Discrete* and *Continuous*, *Finite* and *Infinite*. And, eventually, Newton's genius crystallized all these efforts into a supreme mechanism, called *Calculus*.

**The Concept of Limit**

It was Xeno, who first expressed the enigma of *infinity* and hence the *limit*, through his famous *Achilles Paradox*. It goes something like this...

*Once a tortoise challenged Achilles (a then famous Greek runner and Olympic champion), that he cannot beat it in a running race! All it requested for is a meter of handicap for him (i.e. It'll start a meter ahead of him in the race). The reasoning was, if he has the one-meter handicap, and if they start the race at the same time, then in the time that Achilles takes to cover that distance of one meter, the tortoise would have covered some distance (however small it may be). And, arguing in the same way, while Achilles cover this gap, it would have gone some more distance! And so on... Hence Achilles can never overtake the tortoise, as it will always be ahead due to his handicap!*

This story is almost clichéd, yet the inspiration behind it is as fresh as ever. In fact the details of this story can be varied and yet the paradox will remain. For example, the handicap distance can be anything other than zero; it doesn't matter! The Tortoise could have been a snail!

Let us analyze and solve this riddle (an obvious fallacy isn't it?). To that end let us assume some values to aid our calculations (it is easy to prove that our assumptions are inconsequential). Lets say, that the tortoise is half as fast as Achilles (of course preposterous, but this will greatly simplify our calculations). So, it is one meter ahead at the beginning, and it moves half a meter while Achilles cover that one meter, and then quarter of a meter and so on. The total distance covered by the tortoise will be,

1/2 + 1/4 + 1/8 + 1/16 + 1/32 + 1/64 + ...

Now the puzzle is, if the sum of this series is infinity, it means that Achilles can never win, because then, Achilles would be forever catching up with the tortoise! But, of course this is not true in reality! So, what is wrong? See closely! Does the sum of this series equals infinity? How to prove this, without resorting to some hi-fi math? But, how can the sum of infinite things (however small), can be anything but infinity?!

Consider, a one-meter stick. Break it into two. Put one piece into your pocket, and break the other half into two. Again, do the same, keep one of the resulting quarter piece in your pocket and break the remaining quarter into two again. And continue doing this ad infinitum. Will this infinite process of breaking-into-two result in a stick that is larger than what we started (i.e. One meter)? Never! That is the clue. In fact, the total length of the pieces in your pocket can never be more than One! Thus we can say, that *after* the infinite steps, the total size in the pocket will be *exactly* equal to One! Thus, 1/2 + 1/4 + 1/8 + 1/16 + 1/32 + 1/64 + ... = 1

Hence the *proof*! The simple fact is that the tortoise will be ahead of Achilles, for only a distance of One meter after the start, after which Achilles will out run it. (In reality, the tortoise cannot manage the lead for even few centimeters, as its speed is many times slower than even us).

The resolution of this paradox was the first step in comprehending the nature of infinity. From here on, the possibility of *convergent infinite series* was an established fact.

**Sum to 'n' Squares**

Let us push this *Zero Prerequisites* idea to its extreme. The goal is to explain the *Spirit* of Calculus (solving standard problems is the easiest part!) to the first man you meet on the road. In that vein, let us digress into a slightly different area, also interesting and relevant. (You can safely skip this gray section, if you know and enjoy the formula for *sum to n squares*)

Let us look at the sum of first *n* natural numbers (1,2,3...), their squares, their cubes etc. This branch is also very interesting and has the history of being analyzed by the best of minds. Look at this...

1 + 2 + 3 + 4 + 5 + ... + n = ?

What is the sum of this series? One thing is clear; the value of the sum should only depend on *n*, as the series is completely defined by the final *n*. Just to tease, let me tell the answer first and then derive it. The sum of this series is,

1 + 2 + 3 + 4 + 5 + ... + n = n(n+1)/2

Many of you should have seen this. But how is this true? How can the human mind conjure such fantastic short-form for a lengthy series? Remember this *formula* holds good for any length of the above series! Sum it up to 10, or 100, or 10,000,000 it doesn't matter! All you need is *n*, the final number in the series, and you plug that number in place of *n*, and lo! You have the answer. For example,

1 + 2 + 3 + ... + 98 + 99 + 100 = 100(100+1)/2 = 5050

There is an interesting anecdote with respect to this problem. It is said, that Galois was given this problem when he was 10 years old. Apparently, the teacher of his class was worried that the kids were too restless and bored. So, she asked them to sum all the numbers up to 100. As they had learnt to add and subtract only recently, she expected them to take long time to finish this task. Not true for Galois! He noticed an interesting pattern. Consider the following,

1 + 2 + 3 + ... + 98 + 99 + 100 = S (say!)

also,

100 + 99 + 98 + ... + 3 + 2 + 1 = S (of course!)

Now, what is so interesting in this? Let us see...

1 + 100 = 101

1 + 100 = 101

2 + 99 = 101

3 + 98 = 101

4 + 97 = 101

...

This is the beauty! Adding 1 to 100 in either way should result in the same sum, right? So, if summing 1 to 100 equals S, summing 100 to 1 (in reverse) should also be S. Hence, summing both together should be equal 2S, right? That is...

(1 + 100) + (2 + 99) + (3 + 98) + ... + (98 + 3) + (99 + 2) + (100 + 1) = 2S

Thus,

101 + 101 + 101 + ... (100 times this way) = 101 x 100 times = 10100 = 2S

Simplifying we get,

S = 10100 / 2 = 5050

Did you see it! How can we ever find reasons for the astounding beauty of a genius's mind! Galois made the problem look so simple, that his teacher was spellbound. What is more, this method was found to be holding true for *any n*.

1 + 2 + 3 + ... + (n-2) + (n-1) + n = S (say)

n + (n-1) + (n-2) + ... + 3 + 2 + 1 = S (of course same)

Now adding both,

(1 + n) + (1 + n) + (1 + n) + ... (n times this way) = n(1 + n) = 2S

Simplifying,

S = n(n + 1) / 2

Just see and praise! This derivation needs no commentary. Its elegance speaks for itself! Now, a seeking mind will not stop at one glory. It will push further. A true mathematician's mind enjoys *solving*, not just the *solution*. Like an athlete who excels himself by setting tougher and tougher challenges, mathematicians riddle themselves with more and more complex generalizations.

Here we go on to,

1² + 2² + 3² + ... + n² = S (say)

Again I would like to tease you with the answer, before going to its roots. I find this an effective way to learn something. The awe should precede all our search for knowledge. Only *that* will keep us afloat at tougher times. It is like a fast-forward rediscovery. Remember, nothing is well learnt unless it is a self-discovery. But, as it is ridiculous to take the same time as the history has taken, we would like to peek at the answer and simulate the discovery process in a smaller scale. So the result first!

1² + 2² + 3² + ... + n² = S = n(n+1)(2n+1) / 6

Complex eh! Just wait.

We want to find the sum of all squares from 1 to n. Some times a method that was successful hitherto may not be applicable to a problem in hand. This can be so, not only in math, but also in other aspects of life. We must understand that this is neither preposterous nor ugly. With what assurance can we say that our efforts are absolute? How can we assume that the first luck we stumbled upon as the ultimate truth?

These ramblings are not some philosophical sophistry. It is said that Newton wrote down some *Philosophizing Truths* in his major book on Physics (*Principia Mathematica*). Human mind and achievements are always guided by their perception of life. The more positively you take a discord, a puzzle, a misfit, more persevering you will be, and more fruitful will in your search be.

In this vein, we shall *stoop to conquer!* When we are on a small peak, and if we want to reach a taller peak from where we are, we have to climb down to go up (Hill Climbing Principle). So let us explore some first principles, to calculate the sum of squares.

But first, the sum of natural numbers again, to arrive at some broader technique! (Sorry! We have to see the same thing in different angle to get a firmer grasp of it). But, don't worry; I'll try to make it as intuitive as possible. Be warned, it is going to be wordy! (Or, should I keep it plain?)

We know, (n + 1)² = (n + 1)(n + 1) = n² + 2n +1

Now let us do a mental leap. You must remember that the awesome tricks that mathematicians do are not the product of one day. Some of the seemingly simple methods that we see today have decades or even centuries of history. It is said that the *zero* that we use so naturally nowadays has taken a civilization to evolve! It is in India that it first originated. The entire European mind did not even stumble upon it until they found it through the Arabs.

So, if you ever wonder how some ingenious way was found by a great mind, remember it did take its toll of time and history. Just try your best to relish and enjoy it, and you are on your way to some personal landmark! All this said, follow on...

1² = 0² + 2.0 +1

2² = 1² + 2.1 +1

3² = 2² + 2.2 +1

...

n² = (n-1)² + 2.(n-1) +1

(n+1)² = n² + 2.n +1

Summing both sides of all the above equations,

1² + 2² + 3² + ... + (n+1)² = [0² + 1² + 2² + 3² + ... + n²] + 2.[0 + 1 + 2 + 3 + ... + n] + (n + 1).1

If you notice, all the squares on both sides cancel each other except (n+1)². So,

(n+1)² = 2.[0 + 1 + 2 + 3 + ... + n] + (n + 1).1

(n+1)² = 2.S + (n + 1).1

where 1 + 2 + 3 + ... + n = S (the same thing we are finding again!) Thus,

2.S = (n + 1)² - (n + 1)

S = (n + 1) [(n + 1) – 1] / 2 ---------------------- pulling out the common (n + 1)

S = (n + 1) [n] / 2 ---------------------- Aha! The same again!

After some thought, obvious isn't it? But see its elegance too! The key feature of this method, against the Galois's masterstroke is its generality. You can extend this method for squares, cubes and more. Like,

We know, (n + 1)³ = (n + 1)(n + 1)(n + 1) = (n² + 2n + 1)(n + 1) = n³ + 3n² + 3n + 1

Now go on as before. Sorry, against my will, I'm not going to go through this fully again. But if you are not convinced that,

**1² + 2² + 3² + ... + n² = n(n + 1)(2n + 1)/6**

Then, please work your way through this fully. In fact, when I did that in my early days, I found this very complex (though solvable) for squares and cubes (not to mention higher powers). But, as providence usually gives complexity for growth, I did find an elegant method for 4th and 5th powers. All the best!

Now that we are armed with all these results, we shall boldly proceed to solve the *Volume of the Sphere* problem. Rest assured, I'll not do the *do-it-yourself* tricks anymore. I'll do a meticulous blow up of each step. I did it for the *Sum of Squares* problem, only to save my breath for nicer (not so obvious) things to come.

**Limits Revisited**

You all should have heard the story of *Six Blind Men and the Elephant*. The story has an interesting connotation for *Human Comprehension*. An abstract concept is like the elephant in this story, it is *invisible* to us; i.e. We are *blind* in that respect. If we cannot *see* a concept, how else will we know about it? Even if we cannot *see* a concept fully, we can usually *Sense* some part of it at times. So our task is to *Sense* it in as many angle as possible and piece it together to form a tentative full picture.

What does all these mean to our understanding of *Limits*? The *Limit* is an abstract concept. It is also a technique. As we saw in the case of summation of series in the last section, a technique should be explored fully to make it general. We are going to do just that.

We saw that,

1/2 + 1/4 + 1/8 + 1/16 + 1/32 + 1/64 + ... (when continued forever!) = 1

This is *Limits*! Here, the limit is to infinity. What 'am I saying? Let me try in a different way again. We can write,

1/2 + 1/4 + 1/8 + 1/16 + 1/32 + 1/64 + ... (when continued forever! To infinity)

As, Limit n tends to infinity, of 1/2 n = 1

Clear? Ok, now the problem is, how do we say what the sum of an infinite series would be when its terms steadily decreases? Here the term 1/2 n steadily decreases, as the *n* increases. So, let us specialize on the *Limit n tends to infinity* case fully.

First off, remember, we haven't said that all infinite series is *convergent* (sum up to a number). For example, it is can be proved (How? Do pursue sometime...!) that,

1/1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + ... (when continued forever) = infinity!

So, we have to be cautious. How? Let us clear some basic stuff. Which is bigger? 1/10 or 1/100? Of course, the one with the larger denominator is the smallest (if the numerator is same). So the decreasing order is 1/10 , 1/100, 1/1000 .... Now, what happens if the denominator keeps increasing? The fraction keeps decreasing. But what will it be ultimately? Zero of course! (Please pursue further if not convinced). Thus we have,

Limit n tends to infinity, of 1/n = 0

Aha! That is something! Now we turn the question on its head. What happens if the denominator becomes smaller and smaller?

1/100 = .01

1/10 = .1

1/1 = 1

1/.1 = 10

1/.01 = 100

1/.001 = 1000

...

So, the value of the fraction increases, as the denominator decrease. How big can the fraction be? As big as we want! Yes, as the denominator goes to zero the value of the fraction becomes larger and larger, i.e. It becomes infinity. Thus,

Limit n tends to zero, of 1/n = infinity

Great! We are getting somewhere. To simplify things,

1/infinity = zero

And,

1/zero = infinity

Wow! Let us see what we can do with these results. For example, let us consider some ugly expression like (n + 1)(2n + 3) / 5n² as *n* tends to infinity.

Limit n tends to infinity, of (n + 1)(2n + 3) / 5n²

= (2n² + 5n + 3) / 5n²

= 2n²/5n² + 5n/5n² + ³/5n²

= ²/5 + 5/5n + ³/5n²

Now, making the *n* as infinity, the denominator of the 2nd and 3rd term becomes infinity (Believe me! 5 × infinity = infinity. Too much to believe? Then test it!), hence those terms become zero! What is left is ²/5.

Thus, Limit n tends to infinity, of (n + 1)(2n + 3) / 5n² = ²/5

Do you see the power! We shall need these analysis and techniques in finding the *Volume of Sphere*.

**Volume of Sphere Revisited**

Now you are going to witness a powerful technique, which trace back to a time, long before that of Newton's. The idea is to split a continuous thing into infinite number of discrete things. This is a very natural idea. Imagine, you want to find the area of an irregular figure. How will you do it? One nice idea is to divide the irregular figure into a grid of small squares and then add them up. The smaller the squares, higher your accuracy will be. If the area of squares *tends to zero*, then the number of squares *tend to infinity*, and hence the area is *exact*! Here, divide one half of the sphere into *n* circular disks of equal thickness. So the thickness of each disk will be R/n, where R is the radius of the sphere. Also the radius of the k-th disk can be found by the famous *Pythagoras Theorem* (Square of the hypotenuse equals the sum of the squares of the other two sides. How?!). Here,

R² = r² + (k . R/n)²

Thus, r² = R² – (k . R/n)²

Now, what is the Volume of the Whole Sphere?

= 2 times the volume of each hemisphere

= 2 × Sum of the Volume of all the disks (i.e. cylinders) in an hemisphere

You should understand that each disk is a cylinder, and,

Volume of a cylinder = Area of its base × its height = πr² . (R/n)

Thus the *Volume of the Sphere* is,

= 2.{π [R² – (1.R/n)²].(R/n) + π [R² – (2.R/n)²].(R/n) + .... }

Pulling out the π and (R/n),

= 2 π (R/n).{ [R² – (1.R/n)²] + [R² – (2.R/n)²] + .... + [R² – (n.R/n)²] }

Expanding and Pulling out the common R²,

= 2 π (R³/n).{ [1 – (1/n)²] + [1 – (2/n)²] + .... + [1 – (n/n)²] }

Summing the common terms,

= 2 π (R³/n).{ n.1 – [(1/n)² + (2/n)² + .... + (n/n)²] }

Pulling out the common 1/n² we get,

= 2 π (R³/n).{ n – (1/n)² [1² + 2² + .... + n²] }

Now, using the Sum to n Squares (that we derived earlier) formula here,

= 2 π (R³/n).{ n – (1/n)² [ n(n + 1)(2n + 1)/6] }

Pulling out the common factors and Simplifying,

= 2 π (R³/n).n{ 1 – (1/n)² [(n + 1)(2n + 1)/6] }

= 2 πR³.{ 1 – (1/n)² [(n + 1)(2n + 1)/6] }

= 2 πR³.{ 1 – [(n + 1)(2n + 1)/6n²] }

= 2 πR³.{ 1 – [(2n² + 3n + 1)/6n²] }

= 2 πR³.{ 1 – [2n²/6n²+ 3n/6n² + 1/6n²] }

= 2 πR³.{ 1 – [1/3+ 1/2n + 1/6n²] }

Well! This is the *Volume of the Sphere* approximately! The only reason for the *approximation* is the presence of *n* still there. After all, the Volume of the Sphere depends only on its radius R, hence there is no reason for any other variable to be present. When we started, we said that the infinite number of very small things becomes continuous itself. Thus when the number of discs become infinite, and their thickness become zero, and then the sum of the volume of all these discs will eventually become the Volume of the Sphere (V) itself!

Thus when the limit of n tend to infinity, in the above final equation, the 2nd and the 3rd term vanishes, thus,

V = 2πR³.{1 – 1/3} = (4/3)πR³

**∴ Volume of the Sphere = 4/3πR³**

At last, we have found the Volume of Sphere! Note it, we haven't used any Calculus! Now, the only thing that remains, is to show the Newton's effort in simplifying this whole process through Calculus.

**The Newton's Genius**

Enter Newton! And this whole process was simplified through Integral Calculus. The beauty of the above algebraic method of finding the Volume of Sphere is, it doesn't use any unsaid concept. In fact you can, if you want, altogether abolish calculus, and use this technique of *summing an infinite series over a limit* for all your needs. But that would be rather painfully tedious, since there are some simple patterns in the concept of limit itself, that we can use, to simplify. Remember, *the jargons and techniques of calculus are just, short forms for summing an infinite series over suitable limit*. No more, and no less. Now, let us finish off the holy grail of any higher secondary student, that of finding the relation between the ordinary algebra, and calculus. To me, this facet took lot of time to be intelligible. In retrospect, the trouble is in coming to terms with the obvious. The answer was really right before my eyes, yet I didn't believe, as it looked too simple to be true. Yes, calculus is really a short form for *summing convergent infinite series*, which happens to be translating itself as *area under the curve*, geometrically.

Very simply put, integral f(x)dx, between x=a and x=b (b>a) can be *defined* as, the area under the curve f(x), between a and b. Remember, a *Definition* is only an alias. No new truth is in there, just a sweet name in place rambling details. Note too, that a proper definition, clarifies immensely. Many a time, a good definition almost has the same clout as that of an *Axiom*, which is in fact a distillate of knowledge, that can make or break a science. These building blocks take lot of time to evolve, but once done, the problem picture becomes lot clearer.

ₐ∫ᵇ f(x)dx = Area under the curve f(x), between x=a and x=b

If you notice, the same trick that we applied to the above case of sphere holds good for all continuous functions. For the area under the curve case, assume that the x-axis is split into n equal sections, between x=a and a=b. So, each section (say h) is equal to (b-a)/n.

h = ⁽ᵇ⁻ᵃ⁾/ₙ

Now visualize rectangles with breadth as h, and length as f(h), f(2h), ... and f(nh). In the spirit of limits, can we not then say that, the sum of the areas of all these rectangles, as the area under the curve between x=a and x=b ?! Of course, if the number of sections (n), thus the rectangles, is infinitely large. So,

ₐ∫ᵇ f(x)dx = lim ₙ → ∞ ∑ₖ₌₁ⁿ h.f(*a +* k.h), *where h=*(ᵇ⁻ᵃ)/ₙ

Well, this is powerful! Do you realize that? If you don't I will not blame you. (Beware, there is a mistake here, that we'll clarify in the next section. It is ok for now!) For example, I was almost blind, or definitely hazy, about its value for many many years. What the above equation defines, is a technique to interpret the *limit of an infinite convergent series*, as the area under a suitable curve, and is represented in a neat form. Yes, nothing else at all. Well, there is nothing new in this, we have already seen that, for finding its volume, we can split a continuous and smooth sphere into infinite number of discrete sections and then summing them all. The above cryptic and intimidating expression, just formally concretize our volume trick. The point is, that the volume trick is such a powerful tool, that we are going to use it for any Continuous → Discrete → Continuous round-trip magic. The *proof of the pudding is in eating*, so let us use this beautiful equation, to simplify the volume-of-sphere derivation.

*Here h=*(R-0)/n=R/n, and *lim n → ∞*

And, ₀∫ᴿ f(x)dx = h. ∑ₖ₌₁ⁿ f(k.h),

The question is, what should be the f(x) in sphere's case? If we find that, we can, not only relate integral to volume of sphere, but also cast our derivation in the language of calculus. Remember, until now, we are only using calculus as notation shorthand, and nothing more, hence the derivation will not be any simpler. Once we frame this connection beyond doubt, we'll see some properties of integral, which allows many problems like that of deriving volume etc. to be dramatically simple. For now, what is f(x) here?

So we know, ₀∫ᴿ f(x)dx = h. ∑ₖ₌₁ⁿ f(k.h),

Here, since h acts as the height of the cylinder, f(k.h) is nothing but the area of the circle of kth cylinder.

Now, Area of the Circle = π.radius²

where, radius² = [R² - (k.h)²] = [R² - x²], as f(x)=f(k.h)

So, area of the kth cylinder's circle, f(x) = π.[R² - x²]

of course, height of the cylinder = h = R/n

When lim n → ∞, Volume of Sphere = 2 × Volume of the Hemisphere

= 2. ₀∫ᴿ f(x)dx = 2.R/n. ∑ₖ₌₁ⁿ π.[R² - (k.R/n)²]

Isn't this wonderful! The integral form of the volume of sphere is,

**Volume of Sphere = 2 ₀∫ᴿ π.[R² - x²]dx**

Well! I suppose the simplicity speaks volumes for itself. See the amazing brevity of saying the same thing, that we previously said in so many words, in so little. Of course, expressing something in a cute integral form doesn't solve it. All the same, we do know that if we can readily know the integral of all functions, and can cast a given problem into an integral of an appropriate function, then the solution is not only immediate, but also most elegant. By the way, in case you want to see the steps from here on,

Volume of Sphere = 2 ₀∫ᴿ π.[R² - x²]dx

Hoping that you know that, ∫ xⁿdx = x⁽ⁿ⁺¹⁾/(n+1)

∴ Volume of the Sphere

= 2π ₀∫ᴿ R²dx - 2π ₀∫ᴿ x²dx

= 2πR² [R-0] - 2π [R³/3 - 0]

= 2πR³ (1-1/3)

∴ Volume of the Sphere = 4/3πR³

**Integration Nirvana**

The last section's goal was to relate the modern Integration techniques with the bygone *summing convergent series* technique, through finding the volume of a sphere. But, Integration demands its own attention too. We'll now try to bridge this gap between the old-intuitive discrete methodology to the new-elegant integral technique, by exposing their relation in various angles.

The key concept that irritates a calculus student is the concept of *Indefinite Integral*. If Definite Integral (i.e. between limits a and b) means the area under the curve between the x=a and x=b, then what does Indefinite Integral (with no lower or upper limits specified) mean? This is an important question. As you will see the answer is obvious (in hindsight). The deeper doubt in this question is, if we are to assume only the definition that *Integration is just a handy abbreviation for the summation of some suitable convergent series*, and not use any of the modern results of integrals (which use differentiation and other tools, hitherto un-discussed here), then how are we to define a limit less Integration in terms of summation?! In the last section, we said,

ₐ∫ᵇ f(x)dx = lim ₙ → ∞ ∑ₖ₌₁ⁿ h.f(k.h), *where h=*(ᵇ⁻ᵃ)/ₙ

Sorry, this is not true! In fact I realized this mistake only latter. But I decided to keep the draft unaltered, to give you a sense of the common pitfalls involved when dealing with limits. (Yes, a classic case of bug turned into a feature). The correct form would be,

ₐ∫ᵇ f(x)dx = lim ₙ → ∞ ∑ₖ₌₁ⁿ h.f(*a +* k.h), *where h=*(ᵇ⁻ᵃ)/ₙ

A very subtle error indeed, but created a havoc in my early crosschecks. The beauty was, the final answer derived in the above section regarding the volume of sphere, is true, in spite of this mistake! Because, the problem in hand required x=a=0, hence we escaped. I realize that these types of mistakes are very common when you cast a given real life problem in integral terms. Indeed this problem definition phase is a very smart mental leap, hence need lot more reflections, from as many angles. Part of learning a concept, is also to learn its common pitfalls, in that sense I can be pardoned of this sin of knowingly allowing mistakes, if this almost-real-time simulation of a common mistake had been as reveling to you as it was to me.

Now, coming back from this little digression let me give out the answer before going into the motivation behind that, as is usual.

∫ f(x)dx = ₀∫ˣ f(x)dx

Yes, that is all there to it. Indefinite Integral is nothing but an Integral with limits going from x=0 to x=x (some arbitrary number). The point that could put you off is the upper limit x=x. Does it have any significance with the x of f(x)? Absolutely not! The x in f(x) is just to signify a variable (of course, x of f(x) is fully related to x of dx). Similarly, x of x=x (upper limit) is also a variable to signify an arbitrary value. It could have easily been x=y of x=z or x=1729 or x=B or anything. We choose x=x only to keep the number of variables to minimum, and to give a feeling that integral of f(x) is nothing but a transformed function of x still. This is a key trick, and a revelation that two independent entities, when made accidentally similar, look curious.

Ok, what is the point in making such a definition for definite integral?

If, ∫ f(x)dx = ₀∫ˣ f(x)dx = F(x), say

Then, ₐ∫ᵇ f(x)dx = F(b)-F(a)

What we are trying to say is, that the given problem of integration is same (for practical purposes) regardless of its limits. So, it would be nice to find the integral as a general function (of one variable, say x), and then plug in the limits to get the final results. This way, we need not calculate the integral for each change in the limits. A powerful idea. But how is this idea feasible? How can we say, that F(b)-F(a) gives the value of an integral between the limits x=a and x=b?

To understand that, see the figure in this section. You can notice that,

(The area between x=a and x=b under f(x)) = (The area between x=0 and x=b) - (The area between x=0 and x=a)

Of course assuming that a<b, we can reduce the problem of definite integral to one of subtracting areas. A powerful result, always reminding us of the geometric origin of the definition. In calculus, as in other fields, it is very important that we constantly be aware of the definitions and other assumptions, and not be carried away by the}