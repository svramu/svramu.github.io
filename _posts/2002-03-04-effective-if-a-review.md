---
layout: post
title:  "Effective IF - A review"
---

Thinking aloud on Ganesh's article

At the outset, I must accept, unfortunately, that I don't have any answers to put this issue to complete rest. But I believe, by giving vent to grosser emotion bound logic, much cleaner objective logic can surface.

**The Prelude**

Sometime back my brother stunned me with a trivial looking, but inescapably deep argument about the dubiousness of using `if` statement in OO programming. It was stunning because of its elusive obviousness. Like in 'Emperor's new cloths', the question was equivalent to pulling sheets from under our feet, without a warning. All along, we have assumed that loops and branches are necessary aspects of practical programming.

The success of structured programming was to replace the unconditional branching with the structured conditional ones. So much so, Java brought it to its logical conclusion, by removing `goto` altogether with a spruced up `break` and `continue` along with the hopelessly constrained code-line labels. Thus bringing to end, a history of torments showered upon `if`, by severing the final chord of life it had, in escaping deep loops. The article *Effective IF* rightly ponders whether `if` is the next `goto`.

The OOP was the final nail in traditional-programming's coffin. The OOP relegates all loops and branches to some dark internals of a method, and our all-consuming focus is only showered on partitioning a system into maintainable network of objects. Java went to the extent of protesting even enumerated types completely (check out the RFE related to it in Java Developer Connection, and the rambling pros and cons). Maybe rightly so, but it is clear that the next battle in trying to realize the fullest reach and limitations of polymorphism, against the traditional type based branching, is on.

**The problem**

That article somewhere troubles our OO brains when we use `if` for type checking. And that might be the clue for further analysis!? It is rightly observed there that, whenever we have to deal with an external non-OO code, or with an incompatible one, we are forced to interface our sleek patternish object oriented modeling, with gross type checking. So, it deduces that `if` has to be used with caution, if at all, and only in these application peripheries. After which, into our OO world, we have to use polymorphism to hilt, and ideally do away with `if` altogether. I must accept that this is plainly discomforting for me. The beauty of the situation is that, in this light, `if` definitely looks the villain, and there is nothing else we can do but to reign in its use. And with all this implication that it could well be the next `goto`, I dread to imagine a future with out it! Could this be the feeling that people had, when they first heard about `goto`'s dispensability or multiple-inheritance's pitfalls?

But is `if` the only culprit? or wholly? Though `goto` was dismissed, its final demise was not a complete shunning of all its usages. Of course, the keyword is no longer used (Java reserves it, in case), but many of its traditional useful usage has been only absorbed and renamed into existing comfortable idioms of `break` and `continue`. Similarly when *inheritance* was feared, it only resulted in creating a more comforting idiom of `interface` in place of it, and relegating class inheritance to only code reuse. All of the modelling role is now taken up fully by interfaces (which does allow inheritance, even multiple inheritance). Thus, all these traditional controversial idioms have not been fully erased without trace, but only transformed or spilt into newer self-consistent forms. And this might be the clue for our analysis on `if`.

**The Roles**

When all we use `if`? If `if` has to be removed, shouldn't we remove boolean data type too? Or, is `if` a *necessary evil* as the article observes, and hence only to be curtailed and not abolished? All these questions are definitely the symptoms of its rough future, if not a complete abolition. It seems, one, `if` is needed for code-branching based on some condition (there is no denying fact, I hope, that branching and looping is indispensable. The question is in which form). Secondly, we use it for branching based on a object's type or maybe a state. It is this second aspect that is visibly irritating in `if`. Forget the case statement, which is almost the proof of the crime, a sin in OO terms! But wait, is the first use, devoid of any strain of type checking? When can a condition checking be beyond suspicion of being a type checking? Or, can it ever be?

If we say that a function returning boolean, is ok, since it is *not* for type checking, are we sure? The suspicion is squarely on all variables now. `if` is only a tool, the cause are these variables, state. Is state bad inherently? Can we even imagine existing without it? Can we differentiate whether a given state is for type checking, and not for other things? By the way, is there anything at all a state can stand for, while not being used for type checking? This reminds me of the brain's model, where there is no persistent data store, or state per se, it is all in the inter connections. How things are connected is itself the information and the machinery to analyze it. Astounding, but can our programming language too one day simulate that? Meaning, no variable, only logic?! Looks farfetched now, even for imagination.

Now imagine the other extreme. Assume that the world is full of clean OOP, that is, there is no *external* or *incompatible* code per se. Then, can we be sure that `if` will not arise? Maybe, but it seems that we are not there yet. And now that this topic is raised, the general web links assures me, that almost the whole of OO world is working on this very point! The main significance of the *Effective IF* article is to put the whole burden on the `if` statement, and thereby ignite too many passionate brains. This gives a new urgency to resolving this *What is real OOP?* enigma.

**The Lessons**

As the article itself accepts that the problem is not outright, and we cannot just say that `if` should go, for now, the refactoring site gives some nice workarounds for the popular misuses of these `if` statement.

*   Replace Conditional with Visitor
*   Replace Conditional with Polymorphism
*   Replace Type Code with Subclasses
*   Replace Type Code with Class
*   Replace Type Code with State/Strategy

Of these the last three is not fully relevant to us, but still heightens the threat of those code which uses variables for checking type of an object. Also read the *Inherit Don't Branch* article in the Wiki web, it is speaking exactly about what we are dealing here. Anyway, this is a fertile topic, and I intend to revisit it soon.

**References**

*   [Effective Use of 'IF'](https://www.tattvum.com/Articles/2002/2002-03/2002-03-08/Ganesh-SE-20010208-EffectiveIF.html)
    The original article, which was included as an appendix in his MS dissertation thesis. The thesis was about patterns and their practical usability in a complete pattern based sample chess application.
*   [Add type-safe enums to Java](https://developer.java.sun.com/developer/bugParade/bugs/4401321.html)
    A Java RFE, slowly growing up in the Java's top 25 Request for Enhancement list. Highly debated, and highly interesting. There are very good arguments, for and against it. In many sense it is a non-sensitively, and debatably casted form of this `if` question.
*   [Replace Conditional with Polymorphism](https://www.refactoring.com/catalog/replaceConditionalWithPolymorphism.html)
    This is one of a ton of refactoring techniques presented in this page. Worth pondering.
*   [Inherit Dont Branch](https://c2.com/cgi/wiki?InheritDontBranch)
*   [Enumerated Types In Java](https://c2.com/cgi/wiki?EnumeratedTypesInJava)
*   [Polymorphism Vs Selection Idiom](https://c2.com/cgi/wiki?PolymorphismVsSelectionIdiom)
    It is amazing how much this web site has accumulated over years. Very informative and high quality stuff. There are links everywhere, so be choosy.
}
