---
layout: post
title:  "Regular Expressions and Compilers"
categories: [Article]
---

Exploring the reach of RE in the BNF kingdom

**Prelude**

Wow! What a journey it was. It all started with a seemingly benign interest of unraveling the history and spirit of Perl's (now Java's too) Regular Expressions. This led to awk of UNIX, and which itself was inspired from SNOBOL of IBM and to the Automata theory. From there to Chomsky's hierarchy, then BNF, then RFC 2234, then again to Regular Expressions (RE). Yes, quite a trip. The ulterior motive that guided me to these terrains was the interest to find the limitations of RE with respect to Compiler design. I have heard that BNF is the meta language of choice to describe a programming language, if so, where does RE and BNF meet? What can BNF do, that RE cannot? A naive attempt to answer these questions is this essay. **Regular Expressions**

Volumes have been written on this topic, but the heart of it is quite simple. Its fame is due to surprising power of this deceptively simple syntax. Of course, Perl has made it very famous, by providing a 'rich' syntax (the often used adjective for Perl's RE). To give a solid taste of RE, and to help in highlighting the unity in different forms of representing a Regular Language, let us take a simple example, and stick to it (for more, checkout a [RE Library site](https://regxlib.com/Default.aspx)).

*b(aa*|oo*)m*, means that you have to start with *b* and end with *m*. But inside it can either be one or more *a*'s OR *o*'s, but not both. Note here that the *|* (pipe) symbol means the usual 'OR' condition. And as you would expect from the usual wildcard symbol *** (Kleene Star), it means 'Zero or More' repetitions of *a*'s. Thus the valid strings matching this RE are the following. Note also that *bm* is not valid, as there should be at least one *a* or one *o*.

*bam, bom, baam, boom, baaam, boooom, .....*

Surprisingly that is all there is to Regular Expressions. Of course, there are plenty of shortcuts for specifying some regular things. And yeah, you have back references, stingy vs. greedy searches, character classes, anchors etc. As you can see, the usual operating system wildcard search patterns (glob patterns) are just a simple subset of regular expressions. The notable exclusion is the *|* (pipe) symbol. This symbol (along with other concepts) packs lot of power to the regular expressions. Checkout the following nice links for a complete picture,

*   Regular Expression Basics
    *   from evolt.org, by Chris Spruck (Sprocket)
*   Picking up Perl (RE)
    *   This was in fact the first to hint me about regular languages.
*   Wikipedia: Regular Expression
    *   This is an open source encyclopedia! A treasure trove and an ideal starting point for many concepts.
*   Javascript RE
    *   From WebReference.com, another worthwhile repository of clear tutorials.

RE nowadays has lot of shortcuts to specify a long OR (|, pipe) patterns. For example,

| *a+*                 | aa* = Yes, this too is just a shortcut.                                      |
| :------------------- | :--------------------------------------------------------------------------- |
| *[0-9]*               | **\d** = (0|1|2|3|4|5|6|7|8|9)                                            |
| *[^0-9]*              | **\D** = any non-digit                                                     |
| *[aeiou]*            | (a|e|i|o|u)                                                                |
| *[^aeiou]*           | any non-vowels                                                             |
| *.       *             | (a dot) = (a|b|c|...|A|B|C|...|1|2|3|...|;|%|$|...) = any one character |
| *a{5}*                | (aaaaa)                                                                    |
| *a{2,5}*              | (aa|aaa|aaaa|aaaaa)                                                        |
| *a{2,}*               | (aaa*)                                                                     |

In this light, note:

a+ = a{1,}

a? = a{0,1}

a* = a{0,}

.* = .{0,} = nothing, anything or everything!

As you can see, regular expressions are really very expressive. But still they are very simple at their core. Most of its meta characters (* + | {} [] () . ?*) are there only to simply few routine things. By the way, you can specify these meta characters themselves by preceding the meta character by a \ (backslash). Of course, you should specify the backslash itself with a backslash, if you want to use it as a simple character (come on, you know that). But what is the minimum requirement for a regular expression? A [Regular Expression](https://www.wikipedia.com/wiki/Regular_expression) just requires three things: *The * (Kleene star), *|* (pipe) and the basic string concatenations. There could be some variations on the above symbolism, but off late, all implementations keep Perl as the de facto standard for RE symbols and capabilities.

**The Backus-Naur Form**

Can we create a huge regular expression to define a programming language? Well, RE is less suitable for that. BNF (The [Backus-Naur Form](https://www.wikipedia.com/wiki/Backus-Naur_Form) or Backus Normal Form) is used for that. You might have seen it in many places, maybe without knowing that it is that. If you mix the RE syntax with BNF itself you get the Extended BNF (or maybe the internet standard (RFC 2234) [Augmented BNF](https://www.ietf.org/rfc/rfc2234.txt)). This again is simplicity itself, and needless to say, very powerful. Let us take an example. Though there are many variations to BNF, we will take the simplest but nonetheless fully powerful syntax to present the example, just to feel the raw power.

*S = bB*

*B = aA*

*B = oO*

*A = aA*

*A = m*

*O = oM*

*O = m*

The characters in red belong to the meta language and the black ones are the constants for this particular language. Note that the capital letter in red are like variables (called here as Non-Terminals = NT) and the black small case letters are the constants (here Terminals). What this arrangement says is, start with *S* (the starting Non-Terminal) and then reduce the Non-Terminals with another Non-Terminal or a Terminal. Do this until you have only the Terminals (black ones). All such strings you can derive from the above *Grammar*, together form the *Language* defined by it.

*S*

*bB*

*baA*

*bam*

*S*

*bB*

*boO*

*booO*

*boom*

Here we can easily see that two statements with same left hand side non-terminal can be clubbed together with an OR (pipe) symbol, and self recursion with the Kleene star symbol. These are specified in the EBNF specification. EBNF = RE + BNF.

*A = aA*

*A = a*

Together can be clubbed as

*A = aA | a*

This again can be stated as

*A = a**

But note that these are only for convenience and not for any extra power.

Check the above derivations of the grammar to convince yourself. To be precise, BNF in general is capable of defining a more general language (Context Free Language) that cannot be defined by Regular Expressions at all. It seems Noam Chomsky defined a [language hierarchy](https://www.wikipedia.com/wiki/Chomsky_hierarchy) in which the Regular expression define the 'type-3' language (and the simplest of all), but the BNF in general is capable of defining any 'type-2' language (which include almost all programming language's syntax structure). By slightly expanding the definition a BNF (the traditional form of BNF was defined by Backus and used by Naur in Algol language spec), we can even define the 'type-1' (Context sensitive grammar) and 'type-0' (Unrestricted grammar). It is believed that 'type-0' defines all computable (whatever that means) languages. Alan Turing (maybe the pioneer of all these computational linguistics studies) has demonstrated that any computer is just a *Turing machine* that he can define, with ridiculously simple rules. And 'type-0' can represent all the programs for this Turing machine: That is, this generalized BNF can define any programming language ever!

**Finite State Machines and Equivalence of RE and BNF**

The first time I read that *a restricted form of BNF is in fact the Regular Expression itself*, I was hooked. Here are two meta language that I've used a bit before, and both in the context of defining a string of characters. And here is some statement connecting them both. The crux is that I all along believed that RE and BNF is serving different ends (BNF for languages, and RE for strings), and hence are incomparable. In fact these two *are* different, and yes, BNF is more powerful than RE. But it is also true that both do have the spirit of a compiler in them. After all both match strings. The fact that, *a restricted form of BNF = RE*, only puts things in perspective. But how?

I made up my mind that this should be the fitting core of this article. And that is what has taken me so long. Well, it was worth the delay. I did try some brute force ideas to fit an RE into a BNF and back, but though I could do for every specific instance I cooked up, the generality eluded. Finally, the bridging missing piece was the *Finite State machine*. The automata theory (computer language theory) uses lot of abstract machines, to make the concept of computability more concrete. The Regular Expressions form the *type-3* grammar and their model of a computer is the Finite State Machines. Which is just the simple UML State Chart diagram.

The above diagram is a Finite State Machine (FSM). The big black circle in the left is the start state, and each of those white boxes is the intermediate states, with their names inside. These finally lead to the end state denoted as an outlined black circle (I used ArgoUML). What does this FSM produce? You start from the start state and visit any of the possible intermediate state and end up with the string of characters that are there on the path. The following are some of the possible strings derivable from this FSM.

I think by seeing the above figure you would have guessed that this readily forms the regular expression. *b(aa*|oo*)m*.

*   Replace simple transition arrows with concatenations
*   Replace self loops with *
*   Finally, if a state branches to more than one different stages, separate each of the path to the end state, with the |

To convert a BNF to FSM, you must realize that FSM is exactly equal to RE. No more no less. But BNF notates more than a *Regular Language (type-3)*, it can notate a *Context Free Language (type-2)*. So the transition from BNF to FSM and hence RE is possible only if we suitably restrict BNF. These restrictions are that each statements (or production rules) of BNF should be only one of the following two forms.

1.  *X = aY*
2.  *X = a*

Now you can also visualize the BNF equivalent of the above FSM, if you follow the following steps.

*   Replace *X = aY* as a transition from state *X* to state *Y*, with *a* as the transition path.
*   Replace *X = aX* as a self loop of the state *X*.
*   Replace *X = a* as a transition to the final state.

Of these, as usual, the capitalized red ones are non-terminals, and the black small cases are the terminals. We here mean a *terminal token*, and not just a character. What does that mean? That, the terminals themselves could be words like **begin**, **end** and even composite symbols like **<=**.

Interestingly the Wikipedia (on Regular Expression) answers our deeper doubts too.

Regular expression can express exactly the class of languages expressed by finite state automata: the regular languages. **There is, however, a significant difference in compactness: some classes of regular languages can only be described by automata that grow exponentially in size, while the required regular expressions only grow linearly**.

We can also study expressive power within the formalism. As the example shows, different regular expressions can express the same language: the formalism is redundant. To what extent can this redundancy be eliminated? Can we find an interesting subset of regular expressions that is still fully expressive? Kleene star and set union are obviously required, but perhaps we can restrict their use. This turns out to be a surprisingly difficult problem. **As simple as the regular expressions are, it turns out there is no method to systematically rewrite them to some normal form. They are not finitely axiomatizable.** So we have to resort to other methods. This leads to the star height problem.

**Epilogue**

Knowing RegEx and BNF are complementary. The knowledge of one grows on the other. I'm conscious that I haven't explained the string sequences for which RE breaks down, and so on up the [formal language hierarchy](https://www.wikipedia.com/wiki/Formal_grammar).

*   **type-0:** *Regular Language* can notate any string you can specify.
*   **type-1:** *Context Regular Language* can notate strings like **a**n**b**n**c**n, where n>0
*   **type-2:** *Regular Language* can notate strings like **a**n**b**n, where n>0
*   **type-3:** *Regular Language* can notate strings like **a**m**b**n, where m,n>0.

Note here that the example expression of the greater type language cannot be represented in the lesser type. For example, you cannot express the string of the form **a**n**b**n, where n>0, with regular expressions. That is why people say *FSM cannot count*! Though restricted in power than BNF, RE is a compact way for defining identifiers, literals and expressions in a language. JavaCC, thus uses a mix of BNF, RE, and few other concepts like *attribute grammar* to deliver a single grammar file for lexical scanning and parsing. By the way, just to end in a progressive note, the following traditional diagram of compilation is thought provoking.

