---
layout: post
title:  "DBC, Eiffel, and Java"
categories: [Article]
---

A survey of the 'Design by Contract' paradigm

**Prelude**

In continuing the language survey, that started with [Python](https://www.tattvum.com/Articles/2002/2002-07/2002-07-21/Ramu-Prog-20020719-PythonNight.html), to understand the role and limitations of a programming language in coloring our ideas and in producing reliable software, I stumbled upon [Eiffel](https://www.eiffel.com/) and its motto of *Design by Contract* (the superset of the `assert` statement in C/C++ and now in J2SE 1.4). This article, as it can only be, is a plain survey, and a catalogue of various remarkable things, that I encountered while trying to understand this thought provoking concept of *'Design by Contract'*. Except for few personal comments here and there, the whole credit, as usual, goes to internet, and its pillars of great people.

**Reuse and 'Design by Contract'**

![Eiffel Tower](/assets/images/DBC%20Eiffel%20and%20Java/56870b04ffc2c690f541a7807d8af2ef.jpg)

The Holy Grail of all software effort is *Reuse*. None of us, who take pride in what we do, would like to recreate again and again what we have done well already. Like all other creative fields like Science, Music, Art, Films etc., in software too, building upon old achievements is a sacred act. Unfortunately one big impediment in achieving this is that the requirements are changing continuously, and a piece of code written for one purpose rarely fits a new one. And with the notorious *Reuse error* of the much touted [Ariane spacecraft debacle](https://www.eiffel.com/doc/manuals/technology/contract/ariane/), one is in fact very hesitant to reuse something on its face value. The article says, A recent $500 million software error provides a sobering reminder that this principle is not just a pleasant academic ideal. On June 4, 1996, the maiden flight of the European Ariane 5 launcher crashed, about 40 seconds after takeoff. Media reports indicated that a half-billion dollars was lost - the rocket was uninsured.

Particularly vexing is the realization that the error came from a piece of the software that was not needed. The software involved is part of the Inertial Reference System, for which we will keep the acronym SRI used in the report,... The exception was due to a floating point error during a conversion from a 64-bit floating-point value, representing the flight's "horizontal bias," to a 16-bit signed integer...

What was truly unacceptable in this case was the absence of any kind of precise specification associated with this reusable module. The requirement that the horizontal bias should fit on 16 bits was in fact stated in an obscure part of a mission document. But it was nowhere to be found in the code itself!

There is a more simple lesson to be learned from this unfortunate event: **Reuse without a precise, rigorous specification mechanism is a risk of potentially disastrous proportions.**

By the way, it would interest you to know, as found in the elaborate and useful article, [Why Eiffel](https://www.elj.com/eiffel/why-eiffel/) by Todd Plessel,

Standard Ada 95 does not include the 'Anna' assertions package. This prevents Design by Contract and its benefits in program documentation and reliability. (*This has been cited as a cause of a recent failed rocket launch.*)

**What is 'Design by Contract'? What is Eiffel?**

In many ways the principle of *Design by Contarct* (Trademark of Eiffel Software Inc.), and *Eiffel*, the language that first introduced it, cannot be explained without references to each other and of course to it illustrious creator, Bertrand Meyer. The language gets its name, inspired from the legendary Gustave Eiffel (1832--1923) of France, who built the *The Eiffel Tower, ... in 1887 for the 1889 World Fair, was completed on time and within budget...*

- 1985: Eiffel was designed at Eiffel Software (then known as ISE), initially as an internal tool.
- 1986: The Eiffel 1 environment was first demonstrated in public at the first OOPSLA conference in October of 1986 where it attracted considerable attention, leading us to release it as a commercial product at the end of 1986.
- 1988: Eiffel recognition was given a large boost by the appearance of the best selling book [Object-Oriented Software Construction](https://www.eiffel.com/doc/oosc/page.html) by Bertrand Meyer (the creator of the language and the president of the company).
- 1990: The last iteration of the original technology was version 2.3
- The next version, Eiffel 3, ...was written entirely in Eiffel; ..introduced the Melting Ice Technology for fast recompilation.
- The latest milestones in Eiffel technology is Eiffel 5 and EiffelStudio.

In his article, [Eiffel's Design by Contract](https://www.elj.com/eiffel/bm/dbc/), Mayer quotes an accolade from McKim, which gives a concise history of this 'Design by Contract' concept.

The concepts of preconditions and postconditions to form a contract on a routine go back at least to Dijkstra and Hoare in the late 60's and early 70's. In the late 70's and early 80's there were a couple of experimental languages Alphard and Euclid that were designed to support assertions. It's not clear to me how much they succeeded in implementing these, however. --McKim

A comparison article by Bertrand Meyer, [Eiffel vs C++](https://www.elj.com/eiffel/bm/eiffelvscpp89/), gives a simple and vivid definition of the *Design by Contract* principle. And for more information on this principle, you can check out their [DBC related web page](https://www.eiffel.com/doc/manuals/technology/contract/page.html).

A fundamental property of Eiffel software is that it may be equipped with assertions. **Assertions are elements of formal specification that serve to characterize the semantics of classes and their routines independently of their implementation. Assertions include in particular routine preconditions (which must be satisfied when a routine is called), routine postconditions (ensured by the routine on exit) and class invariants (global consistency conditions applying to every instance of a class).**

Assertions are essential for documenting components. As a matter of fact, I do not understand how one can talk about the very idea of reusable software components without assertions. Using a hardware analogy, a software component without assertions is similar to, say, an amplifier without precondition (the acceptable input voltage), postcondition (the gain, expressed as acceptable ratio of output to input) and invariant (including for example the temperature limits expected and maintained by the amplifier). Yet of widely available programming languages, only Eiffel has these notions.

To quote the quote from the article [Java and 'Design by Contract'](https://www.elj.com/eiffel/feature/dbc/java/ge/) by Geoff Eldridge,

Part of the liberation of working in DbC fashion derives from the absolute guarantee that the entire system plays by the rules; the freedom *not* to play by the rules breaks the (as it were) meta-contract that makes Eiffel Eiffel. -- Tim Peters, 21 Nov 98

A good quote to explain the motive of the Eiffel language, would be the very quote of the site's eloquent and to-the-point, introductory article, [Eiffel in a Nutshell](https://www.eiffel.com/eiffel/nutshell.html). This also gives a wonderfully concise example for exhibiting a reusable class (a numeric counter), with reasons for using the DBC features.

As Roland Racko wrote in Software Development: "Everything about Eiffel is single-mindedly, unambiguously, gloriously focused on reusability -- right down to the choice of reserved words and punctuation and right up to the compile time environment". We couldn't say it better. Eiffel was designed from day one to be the vehicle for the new software industry, based on the reuse of high-quality components -- rather than on everyone reinventing the wheel all the time.

**Eiffel: A short overview**

To be frank, after seeing Eiffel and its much hyped DBC, I did (and do) feel a bit like switching to it! Of course the regulation fear of not being in the popularly supported platform, does threaten me. In fact, it would be nice if there is a language that has Python like *indentation based* syntax, with Eiffel like DBC features, Perl like natural Regular expressions, and Java like mass support. Anyway, it might be still too premature for me, to have a concrete wish list for a language, other than some spur-of-the-moment frustrations. If not anything, knowing a new language does expand your depth of usage in the known one. In that vein let us learn Eiffel. Do remember, this is only a personal comparative crash course of the Eiffel language. You can check the following links for more information.

- [An Eiffel Overview](https://www.elj.com/eiffel/rp/eiffel-overview.pdf) by Richard Paige, for a quick, simple but effective overview of the language structure.
- [Object-Oriented Programming In Eiffel](https://www-staff.socs.uts.edu.au/%7Erist/eiffel/index.html), by Robert Rist & Robert Terwilliger, a free book in MS Word format.
- [Eiffel: An Advanced Introduction](https://www.elj.com/eiffel/intro/) by Alan A. Snyder and Brian N. Vetter,
- [comp.lang.eiffel FAQ](https://www.faqs.org/faqs/eiffel-faq/) a comprehensive list of almost everything about Eiffel
- [Documentation: Getting Started with Eiffel](https://www.elj.com/eiffel/getting-started/doc/), an exhaustive list of links maintained by Geoff Eldridge, 'dedicated to exposing Eiffel'.

From these nice web links I got to know about the [SmallEiffel project](https://smalleiffel.loria.fr/index.html) of GNU, (*...aiming to offer an Eiffel development environment as easy to use as Smalltalk and as safe as Eiffel. Since version -0.82, SmallEiffel has been promoted by the Free Software Foundation as the official GNU Eiffel Compiler*). And the elaborate [Eiffel Liberty](https://www.elj.com/) project and its free Win32 port of the SmallEiffel compiler, which I'm currently using.

At the first sight, the Eiffel tokens (syntax units) has an [Object Pascal](https://www.borland.com/delphi) (Borland Delphi) feel to it. Especially its departure from C/Java model of denoting equality and assignment. Eiffel uses `:=` for assignment and `=` for testing equality. Somehow, I still like this, as it is bit unnatural to think equality as `==` (though it does 'rhyme' with `>=` and `<=`). After all it is *assignment* that is a construct of the computing world, and hence that is the one that need a new symbol. Also the `:=` (colon equal-to) emphasis the one-way-ness (LHS to RHS) of the assignment. On the other hand, Eiffel's `//` and `\\` for integer division is bit alien to a C/Java mind.

Not only these basic operators, even the keywords of the language have the distinct 'wordy' feel of Pascal, especially the `do` and `end` keywords for marking a statement block (contrast this with the terseness of the ternary operator `?:` of C and the indentation based statement block of Python).

```
class HELLO_WORLD
    --This is a comment
feature
    make is -- this is a procedure
    do
        io.put_string("Hello World.%N");
    end;
end
```

In Eiffel, a line starting with two hyphens is a comment (like in HTML etc). Also note that Eiffel users keep their class name in caps (!); constants are plain variables here. the `feature` is either a method (function or procedures) or a variable. For more C/Java comparable analysis of Eiffel, you can read the strong but reveling article, [Eiffel vs C++](https://www.elj.com/eiffel/bm/eiffelvscpp89/), by Mayer himself.

While reading this article, I was surprised of the so many outdated comments about C++, like, C++ not having templates and multiple inheritance! Only then did I realize that this article was written in 1989, and even then Eiffel had the features like safe Multiple Inheritance (now unanimously condemned and replaced by Interfaces), genericity (now the template classes of C++, and which is slated for adoption in J2SE 1.5 tiger release), Exceptions (which I thought was there from early C++ days), Deferred classes (it is amazing that C++ got Abstract classes only after 1989), and of course the glorious type unification (which is ridiculed for partial implementation in .NET and safe removal from Java with wrapper classes). It was illuminating to note that Eiffel had one primitive class called *BITS M* for creating INTEGER, REAL etc. as *Classes*, without performance sacrifice. I envy this feature.

The simple and powerful example given in the introductory [Eiffel in a Nutshell](https://www.eiffel.com/eiffel/nutshell.html) article, would be the best way to illustrate the reusability focus, and the syntactic structure of the *Design by Contract* model of writing code. The following code is as in the site, with some reduction of white spaces, to highlight the simple structure for appreciation. I'll repeat the Mayer's words on this DBC notion again, for emphasis.

A fundamental property of Eiffel software is that it may be equipped with assertions. **Assertions are elements of formal specification that serve to characterize the semantics of classes and their routines independently of their implementation. Assertions include in particular routine preconditions (which must be satisfied when a routine is called), routine postconditions (ensured by the routine on exit) and class invariants (global consistency conditions applying to every instance of a class).**

```
class COUNTER
feature -- Access
    item: INTEGER -- Counter's value.
feature -- Element change
    increment is -- Increase by one.
    do
        item := item + 1
    ensure -- post condition
        item = old item + 1
    end
    decrement is -- Decrease by one.
    require -- pre-condition
        item > 0
    do
        item := item - 1
    ensure -- post condition
        item = old item - 1
    end
    reset is -- Reset to zero.
    do
        item := 0
    ensure
        item = 0
    end
invariant -- asserting class invariance
    item >= 0
end
```

Note the keywords `require`, `ensure`, and `invariant`. These are assertions of pre-condition, post-condition and invariance respectively. This is the heart of *Design by Contract* and all the magic that surround it. All the assertions are boolean expressions, and must validate to `true`, else an exception will be raised. This is the contract specification, and the consequent reliability assurance. I hope the above code sample is self-explaining (though new for a C/Java mindset).

**DBC and Java**

Bertrand Mayer strongly criticizes all the major modern paradigms of reusability, like ActiveX, JavaBeans, CORBA IDL, since they don't incorporate contract (and hence reliability of reuse) into it. In his forceful article [Avoiding the Second Historic Mistake](https://www.elj.com/eiffel/bm/mistake/) he argues that Java is committing some of the very same mistakes that caused the dethroning of C++ from its heights. Yet, he also goes on to accept this plurality of languages, and even hints about the need for C++ wrappers and Java Byte code generators for Eiffel (This was in 1997. These tools are currently available even with the free SmallEiffel implementation).

But the forced march to Java in 1997 is no more justified than the mass conversions to C++ in 1987. This time we don't have the excuse that we don't know; and no spacecraft hides, ready to rescue us, behind the comet. ... Can we as an industry learn from our mistakes? How many more Taligent-like catastrophes are needed, with Java replacing C++, to discover the obvious? Must we lose another ten years?

Nevertheless, the 'once' Java lover in me, did urge me to look around for the DBC like functionality in Java. Of course many of you might now be using the J2SE 1.4 feature of `assert` statement, for a simple C++ like assertion functionality. Though many a Eiffel-envying-Java-minds do pester Sun for more of DBC features, instead of the simple assertion, this inclusion of assertion in itself has staved lot of negative comments about java. Echoing this demand, the DBC RFE (Request for Enhancement) is now seventh in the list of top RFEs. Now that Generics (No. 1 RFE) is already promised for the 1.5 release, DBC would be generating lot of noise, and maybe some solutions too. You can look at the DBC JSR (Java Specification Request) [4449383 Support For 'Design by Contract', beyond "a simple assertion facility](https://developer.java.sun.com/developer/bugParade/), and also the old JSR for assertion [4071460 Please add assert capability to java language](https://developer.java.sun.com/developer/bugParade/), for being informed about the pros and cons of these requests. (Requires free login).

Thanks to the nice wrapper article [Java and 'Design by Contract'](https://www.elj.com/eiffel/feature/dbc/java/ge/) by Geoff Eldridge, we are led to a surprising fact that [James Gosling](https://java.sun.com/people/jag/green) had indeed designed assertion in his Oak 0.2 specification (section 7.1 and 7.2), as a part of the Green project (the java precursor). Except for class invariants of Eiffel, he has included both pre and post condition, and even a SQL constraints like variable level assert. Unfortunately, it seems he has ripped of these parts due to time constraint of the project. By the way, a simple tool called [iContract](https://www.reliable-systems.com/tools/iContract/iContract.htm), is trying to emulate the DBC functionality through a java preprocessor using special javadoc tags (`@pre`, `@post` etc). Notably the [JASS - Java with assertions](https://semantik.informatik.uni-oldenburg.de/%7Ejass/index.html) project is trying to bridge the gap for the time being, by providing all of the DBC features through preprocessing of special java comments (the ** variety).

**Changes in J2SE 1.4**

[Assertion Facility](https://java.sun.com/j2se/1.4/docs/guide/lang/assert.html) in java is simple but looks strong.

**assert Expression1;**

**assert Expression1 : Expression2 ;**

In both forms of the assert statement, **Expression1 must have type boolean or a compile-time error occurs.**

If assertions are disabled in a class, the assert statements contained in that class have no effect. If assertions are enabled, the first expression is evaluated. If it evaluates to false, an `AssertionError` is thrown. If the assertion contains a second expression (preceded by a colon), this expression is evaluated and passed to the constructor of the AssertionError; otherwise the parameterless constructor is used. (If the first expression evaluates to true, the second expression is not evaluated). If an exception is thrown while either expression is being evaluated, the assert statement completes abruptly, throwing this exception.

This is almost everything of what Java has to offer for DBC; and remarkably this is lot, though not everything. A typical usage scenario could be,

```java
int convertSuit( int suit) {
    switch (suit) {
        case Suit.CLUBS:
            //...
            break;
        case Suit.DIAMONDS:
            //...
            break;
        case Suit.HEARTS:
            //...
            break;
        case Suit.SPADES:
            //...
            break;
        default:
            //Execution should never
            //reach this point!!!
            assert false;
    }
    //...
    //Post condition
    //Ensure that it is a sute still
    assert suit>=Suit.CLUBS && suit<=Suit.SPADES
    return suite;
}
```

The simple assertion facility does enable a limited form of design-by-contract style programming. The assert statement is appropriate for postcondition and class invariant checking. Precondition checking should still be performed by checks inside methods that result in particular, documented exceptions, such as IllegalArgumentException and IllegalStateException.

Class invariants needs an internal method to be used by the assertion in appropriate places (Eiffel's is simpler). The major drawback is, these asserts are not inherited by the sub classes, unless the super class method itself is called. This is what could be changed by introducing full blown DBC. Notably, the usage guideline says that public method's precondition (`require`) should *not* be an assert, as Java assertion facility could be disabled (like in Eiffel). Of course you cannot *remove* it easily from the class files, as it should be enablable in the field. Interestingly, the guide says,

We considered providing such a (full DBC like) facility, but were unable to convince ourselves that it is possible to graft it onto the Java programming language without massive changes to the Java platform libraries, and massive inconsistencies between old and new libraries. Further, we were not convinced that such a facility would preserve the simplicity that is Java's hallmark. On balance, we came to the conclusion that a simple boolean assertion facility was a fairly straight-forward solution and far less risky. **It's worth noting that adding a boolean assertion facility to the language doesn't preclude adding a full-fledged design-by-contract facility at some time in the future.**

**Epilogue**

There is no denying fact that Eiffel is by far a superior design, especially considering that it is there from 1985 (java is 1995+). But Java is fast growing. Though a language cannot grow beyond its basic premise and restrictions, there is still lot of scope for java. With all the abuse that is showered on Java (due to its popularity), once the Generics comes into the language (now that assertion is already there), almost 80% of all idealistic concepts of a OOP will be there in it. Yes, still there are many minor grievances towards java (like, lack of type unification, interpretive runtime, no multiple inheritance, enum dilemma etc.), but these are largely controversial and can be forgiven, given its relatively simple linguistic structure, unparalleled ubiquity and of course the extensive and collaborative APIs.

To conclude, I concur with the broad view of Ian Joyner in his article, [C++?? : A Critique of C++ (3rd Ed.)](https://www.elj.com/cppcv3/). Though that article's sole purpose is to lash out on C++ (rightfully so), it does expound many a general truth worth pondering. Beyond a point, we will have to grow out of being habituated to thinking through a language, to thinking through sound Software Engineering principles. Remember, the great C was dethroned, the invincible C++ went away, even the now hot Java has to succumb to its design limitation some day, but programming will still be around (maybe fully changed) in some form or the other. Only the general principles of modularity and simplicity can be ever with you.

A programming language is just a tool, in the same way that an axe is a tool. If the axe is blunt when chopping down a tree, then procedures, processes and methodologies could be invented to make it as effective as possible; but that leaves the real problem unsolved: that the axe that does the real work is blunt. ...A poor axeman could be ineffective with even a sharp axe, but the axe maker will still strive to produce the sharpest axe for the good axeman. The argument that poor programmers will produce bad programs in any language so we shouldn't bother with better languages is fallacious.

Java is still an unproven entity for large projects (in 1996), and the byte code is interpreted. Eiffel and C++ are roughly equivalent in performance. Interpreted Java will be around 10 times slower. But Java byte codes could be compiled into native code.

In a nutshell, an object-oriented language that lacks the qualities of a high level language entirely misses the point of why we have progressed from machine coding to symbolic assembler and beyond. Without the essential high level qualities, OO is nothing but hype. Eiffel shows that it is important to be high level as well as OO, and I hope that the lesson to be learned by any programming paradigm, not just OO, is that the fundamental is to make the task of programming (that is system development as a whole) easier by the removal of the burden of bookkeeping.

**My hope is that the industry establishes a professional software engineering culture, not a programming language culture** based on seriously flawed and arcane languages. The software engineering culture is not well represented in C++. - Ian Joyner - October 1996

