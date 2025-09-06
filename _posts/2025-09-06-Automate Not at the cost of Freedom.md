&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Automate: Not at the cost of Freedom

Simple suggestions on SCM tools and versioning

*S V Ramu (2002-04-07)*

**Isn't CVS like version controllers bad?**

Often, I feel enslaved by some CASE tools; predominant of them is the version control system. These tools are so cool and so inviting, that we fail to notice the snare in them. The predominant lure is its seemingly indispensable nature, due to its hyped delta technology and all. It was a natural evolution when people were worried about so much releases that they were making, and the enormous storage space all these versions where gulping. So, it was natural to invent a tool that can store only the difference of each version and also keep track of all changes meticulously. The big flaw of the programmer not being in full control of the format of these storages is overseen in all these compression hype. But nowadays, when storage space is not at all a criterion in deciding upon a development practice, a reconsideration of these *given* is proper.

I find that it is extremely hard to fill up a simple recordable CD (which just costs under Rs.20/-) with all the corporate source code (zipped), even for a full month. This prompted me to think about the needlessness of putting ourselves against the human-un-readable format of these version control systems. I equally abhor the open-source CVS and its proprietary and costly commercial counterparts. Because, they all are binary formats, with not much persuasive need in these modern times.

**Some lacunas?**

Think of a simple situation. You want to manage a big project with lot of parallel development going on. Now, the usually proposed need for version control tool is for following reasons,

*   It saves space
*   It allows concurrency for developers working on it, without running over each other.
*   It makes versioning of different stream of development easy.

Powerful factors indeed. The first one is really mute in many of the under 50 developers project: The space saving is not worth much. And for much bigger projects, centrally sharing code for different streams of development is only asking for trouble. Larger projects must have larger componentization to ease management. Thus the second point, in my opinion, is that much controversial. Of course, I would like to test this hypothesis on large open-source projects like GNU, GNOME, Linux etc. (which, as a rule, use CVS for version controlling). I think, CVS also doubles up as a code delivery system as much as sharing. I feel, the final point too can be handled without a specific tool, and just with proper versioning model.

**Reuse Release Equivalence Principle**

I find this (RREP) a very nice concept of [www.ObjectMentor.com](https://tattvum.com/Articles/2002/2002-04/2002-04-07/Ramu-SE-20020407-FreedomAndSCM.html#RREP), and is the way to go. It very crisply states that your unit of reuse should be the unit of release too, if you don't want to maintain the reused code too. It also suggests that a *Package* (Java like) could be this optimal granule of release and reuse. The added benefit of this model is that it allows lot of (most?) parallel development, and hence avoids the concurrency argument for a CVS like tool. I personally have a good experience with such a model in a decent 10-15 people project (not much but considerable still). A good package being just a dozen or so key classes, needing hardly 3-6 people, is an ideal candidate for mutually managed independent development. Even very large projects can be ideally broken into a tree of such small sized packages, and thus reduce code reuse to nil.

Also, these packages could be released with their own version numbers, builds, docs and patches. Anybody using a package only has to have its dependent packages of proper version. If new version comes up, they can optionally adopt it or delay. A package for a using developer is a completely sealed component with a life of its own. This is not just for off-the-self buying model, but also within an in-house development.

**Epilogue**

I intend to test these ideas on the TATTVUM open-source software releases, and thereby eliminate the need for the contributors to know CVS or other such tools. Of course, there are other issues like merging of changes, version numbering etc. Which looks simple enough now, but could grow out of our hands if not properly planned. Lot to test, but I would like to push this concept of *Less is More* (Less tools, but more automation) however far as possible, before accepting newer gadgets. I intend to write more on this soon.

**References**

[Reuse Release Equivalence Principle](https://www.objectmentor.com/publications/granularity.pdf)

This is a very fine article by Robert C. Martin, which discusses RREP among other key granularity based principles.
}
