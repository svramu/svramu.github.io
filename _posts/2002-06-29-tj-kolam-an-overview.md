---
layout: post
title:  "TJ Kolam - An Overview"
categories: [Article]
---

An explanation for the TJKolam application in the PoPP archive

A PoPP archive explanatory article, for [TJKolam]({% post_url 2002-06-23-popp-tj-kolam %})

**What is a Kolam?**

Well, I'm not an expert in this hoary art of South India. In fact, it is this envy of mine towards these unassuming household artists that prompted me to automate this sophisticated and artistic curve drawings. *Kolam*, is a regular Tamil word (maybe other South Indian languages too might be sharing this word with minor variations). I didn't even try to translate this name into English, for this project, as Kolam is pretty unique to this part of the world. Of course, I've seen similar art forms with knots and curves in some Inca related pages in web. I guess the Arabs too have similar graphic art forms (which is evident in some great mosques that are in India). All the same, I guess, no where else in the world, is the Kolam like art form as alive and a day-to-day affair, as it is in India. In the North of India, another colorful variation of this practice is prevalent, in the name of *Rangoli*. But I feel Rangoli, and some other artistic variations of Tamil Nadu itself, are not as mathematically interesting as this particular version of Kolam (nonetheless they are all a great feast to discerning eyes).

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/42716c9f65f978780e3ced69657c2d64.jpg)

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/5a5a90598768012a65d71427cadd612a.jpg)

The above samples are the flavors I'm interested in. These drawings were created with the TJ Kolam program, available in the PoPP archive. The first one is a straight forward print screen, but the second is a merge of two three Print Screens. The goal of this application is to allow printing and saving of these kolams, from an easy to use interface, where you can create these beauties. Maybe we can make a kolam screen saver too! For now (PoPP's TJKolam 0.1 version), the algorithm is in place, but we still need to spruce up the interface, before it could be useful to my granny.

In Tamil they are called *'Neli Kolam'*. 'Neli' roughly means a 'squiggle', and that is really what it is. These kolams are a daily sight in many South Indian streets. I was first indifferent to it, but when one evening I tried to draw some of them, that is when I realized how tough it is. In fact it is not exactly tough, but it does require a particular sense of symmetry and aptitude. That night I vowed that I either should memorize at least ten of them. This was bit of a rash resolve, since my elders have learnt this art over the years by comparing notes with many other family members. Trying to master them all in a night is really bit too greedy of me.

Fortunately as it turned out, I found lot of invariants in these drawings. For one, there is symmetry. But more than that, I found the following interesting feature which could make any (I mean any 'neli') kolam simple. I have a strong suspicion that this following bubble model should be known to my unsung kolam teachers, because I now remember seeing them rubbing some knot while trying to remember an old kolam. All the same, I've never seen them exactly using them as a main technique for creating a new kolam. As far as I know, new kolams were created only by sharing with others, or over time by modifying an old and famous one.

By the way, just to stun the uninitiated, the first of the above is a single continuous line! The second has two lines (three if you count the inner circle). (Don't tell this to my mom, or yours, she might ridicule me for exaggerating this seemingly simple thing! Simple it might be for them, for me at least it was toil. Toil of pleasure though.) Even after a couple of years of exposure to these kolams, I simply cannot stop wondering at these marvel of curves, and the genius of the womenfolk who foster this art. The problem is how to concoct a new kolam? If I try drawing a curve right away, I'm assured that I will get stuck somewhere soon.

**Kolam as connected bubbles**

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/c1d98ec96575f82a9abfde7e78281e45.jpg)

The trick is to use the symmetry of the kolam. The typical symmetry used is the cyclic symmetry, as shown in the above figure. This is also the most complex and the most impressive one, apart from being the most common (the others are reflection symmetry between the halves). This reduces the problem of remembering the whole kolam, to one of remembering just one quarter of it. Of course, nothing stops us from creating a completely asymmetrical one, but I haven't seen it in daily use (maybe I should explore more of that, now that it is easy with this program).

I think this symmetry part has been used extensively by the kolam creators. But, this is not enough. You need more patterns to make kolam drawing as simple as connecting points with line. If you see the above figure, I've specifically shaded the closed areas that contain the dots ('Pullie' in Tamil). This way you can see clearly that a kolam is just a connected network of many 'bubbles' (if you can call these shaded parts so). This is important because, this way you only have to join different dots creatively, and the regulation part of weaving the curve around them could be automated. This is not to say that joining dots is easy, because traditionally only certain dot-connections are considered beautiful. You are free to explore, but don't blame me, if your mom gives an indifferent glance to your masterpiece. The above are some frequent and pleasing connections of dots.

You can see the connecting lines in green in the above figure. The darker shaded bubbles, is only to highlight that, if a dot is connected to one or more dots, the bubble will be connected similarly. I have highlighted one vertex each for degree 1,2,3 and 4. But how to draw the kolam curve with this concept of bubbles?

**Kolam as a continuous curve**

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/80ad708d79287ae7d5d2ec4403c147f4.jpg)

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/611fb8849bf5ea7ab8adfd07d004ca7a.jpg)

If you see the sample kolams above, and observe the curve in the vicinity of the dots, you can see that it follows intuitive and simple patterns. I've enumerated these crossovers for vertices of various degrees. This picture was created by enlarging the kolam and rubbing out the irrelevant parts. Note particularly that a dot with a given degree can manifest in various angles. For example, see the difference in curve form for the dot of degree two. This seemingly insignificant point can confuse a novice's mind. When you see the link of bubbles with these crossovers, the curve's path should be pretty clear. But again, how to draw the curve in one single flow, without resorting to modeling the physical bubbles?

![](/assets/images/TJ%20Kolam%20-%20An%20Overview/9167d69a58c6c28754976abd3eacac76.jpg)

This brings us to the final piece of logic. This is nothing but the same bubble technique abstracted to its minimal essence. You can try tracing from the dot labeled as '1' and proceed till '17'. Be careful while traversing the busy 9-13-15 point. This point of degree four will have four transits (three shown here). Typically a point of n-degree (n lines attached to it), will have n transits.

Some commentary now... Since 1 and 2 are connected by the green line, a curve starting from the bottom cuts the line 1-2. The control is transferred to the point 2. Since 2-3 is connected, and since this line is the first of 2's from the curve's point of view, the curve cuts this 2-3 line and the control of decision is transferred to 3. And so on. The green connection line is shown in blue to highlight this control changing path. You can also imagine that the curve going from 1 to 2 is a clockwise sweep, and from 2 to 3 is an anti-clockwise sweep. Again a clockwise sweep from 3 to 4, and so on. This 'sweep', so to say, alternates between points. This fact is used in the program source as the variable "wise" (clockwise or anticlockwise), which alters between +1 and -1. This logic gives an unambiguous way to generate the path of the curve. After making the connection lines in the dots grid, we can use this algorithm to generate the path of the curve, by starting from any point. If the curve is not single threaded, then you might have to start from another point. Once started, the algorithm automatically ensures that the curve comes back to the starting point, to form a closed curve. By the way, I haven't worked out an optimal way to find all the staring point required. For now, I either do it specifically for a kolam, or assume all dots as starting points (this make the curve thick due to over drawing - maybe due to rounding off errors).

**The Cubic Bezier Spline curve**

Now for the final piece of puzzle. I found the above logic few years back, but couldn't produce this program then, because of my ignorance towards computer graphics. In graphics, there is this notion of drawing a *smooth* curve between two points using something called Cubic Bezier curve. As I understand, the general term for these types of generic smooth curves is *Spline*. It seems you can produce various types of spline curves. The Bezier curve's cubic form is the most common and most flexible of all. Basically a Bezier curve is only for two points, so to draw our kolam curve we need to *stitch* these curves into a long winding smooth one, by ensuring that they meet at the common point, tangentially.

In this program I have used a very crude logic for this stitching, which shows up in some non-smooth squiggles in corners. I'm now exploring B-Splines and some exotic but famous thing called NURBS (Non-Uniform Rational B Splines). All these are some variations of interpolation, and are hence recursive in definition. You can get more information on these at [this interesting link](https://www.ipm.sci-nnov.ru/%7Edemidov/VRML/Splines/Intro/Bezier.htm). These are interesting in their own right, while also being useful for drawing kolams.

