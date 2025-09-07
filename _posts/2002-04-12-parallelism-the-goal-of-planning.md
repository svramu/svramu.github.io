---
layout: post
title:  "Parallelism - The goal of planning"
---

An analysis on the goal and role of Project Planning and Designing

**What is Planning?**

Until the recent past, whenever I used to start on a project, and decided to 'Plan' something before starting coding, I used to get stuck. What should I plan about? Will not the requirements keep changing? Isn't direct coding, in small chunks, and in an iterative fashion, the best? But now, after some years of experience, slowly few things are becoming repetitively assertive.

It seems there are three key things that are unquestionably important as goals to any planning endeavor.

- Clear scope of the Project
- Simple Modular Pluggable Design
- Maximum Parallel Development

Of these, I believe, that the second point is almost completely dependent on the third. A highly parallelizable development definitely presupposes a modular design. But still, the second point can look like a separate need, if we make it to mean elegance of design, rather than modularity per se. Anyway, that is why in this article I'll be referring to modularity only as an aid to parallelism. The first point though, is very important and pretty much orthogonal to the parallelism need. I mean, knowing or clarifying 'what we want to develop' (requirements) is obviously an independent question from the way we want to develop it. Hence, I'll not be focusing on requirements in this article as it needs a treatment of its own.

In simpler terms, the question should be *what is the maximum number of developer that I can put in this project?* This question also answers, *In how short a time can I finish the project?*. Other questions like, how can I make the project good in quality? And, how can I ensure that my client will accept it? etc., are important, but are more are less answered by the above single important question.

**Scope - The feasible set of Testable Requirements**

The scope of the project is the other side of parallelism. Requirements are to the definition of the project, what parallelism is to development. Some time back while I was rummaging Internet for some effective but naturally simplistic approach to handle requirements and testing (QA), I stumbled upon a site, which enthusiastically talked about [Testable Requirements](https://www.testablerequirements.com/). This is at once an appealing and reassuring concept. I intend to explore further, the relevance of TR with respect to other SE domains like parallelism etc.

**How many people can (simultaneously) work in this project?**

Assume that you are the best developer in the whole world, and you know how to complete any program. Also assume that you are the only developer in the project. Now, for a given set of requirements, the amount of time required for you to complete the project is a constant, if you work alone. What can hasten this period? Obviously, you need more people in the project. But can you just put more people and get things done faster? All our histories proclaim, *Too many cooks spoil the broth*. A bunch of people, as a rule, are less manageable and hence less useful for any task. Then how can we speed up the project? By *allowing* more people to work together. There is a big difference between *Putting* more people, and *Allowing*. Allowing more people to work together means, that the project's stages and tasks are *designed* or *planned* in such a way, that more than one (or few) person can work together, without overrunning, or unduly waiting for each other.

So, when we embark on *Designing* a project, our prime goal should be to find what is the maximum number of people that we can put in the project, without wasting too much time on management issues. Of course, having more people is always more management issues, and hence, we have to doubly ensure that a larger team should not be less efficient than, a smaller one. If succesful, then that is the best situation we have. Remember, keeping other things constant, the greatness of a design, is only to the extant to which it allows non-conflicting parallel development. Other important goals like modular elegance of the project, and properly understanding the requirements, are in some sense, only to aid this holy grail of *maximum development parallelism*.

**Polymorphism - The Parallelism for development**

![img](/assets/images/Parallelism%20-%20The%20goal%20of%20planning/f6cc92b4106ac44b0cea8756a301b048.jpg)

Having type checking in a language is both a boon and a limitation. Undoubtedly it is a boon, within a closed module. But for inter module dependency it is mistake. If a module (a part of the project) depends on another module, through a Class then that could be dangerous (or at least wasteful). Because the implementation details of the class is an inescapable overhead now. Instead if,

- The dependency is through an Interface
- And the implementation is through dynamic class loading

Then the modules are that much independent of each other. Also notice that the modules can now be developed parallelly. Of course it could be developed serially by the same person too, if need be. The usual trick could be, to create a dummy (place holder) class implementing the interface, which could be used by the client module during its development and testing. This is the connotation of Polymorphism that I like. Polymorphism defined without dynamic binding, is a dilute term. The mark of extensibility of a project is the degree to which its internal relations are polymorphic. I'm unable to enumerate the exhaustive non-overlapping list of polymorphic needs of a project; but that should be possible as we mature further. For now, remembering to loose-couple inter-module dependency through interfaces and dynamic class loading, through a factory, is a decent insurance for usefulness of planning.

**Threads - The Parallelism for performance**

We should adopt the idea of runtime parallelism, through Threads. Now, and in future, the availability of parallel processing machines is only going to be ubiquitous. Being able to exploit this system capability is very important and natural. Breaking down a business (or any real life) problem into simultaneous threads is as tough, and as important as splitting a given project into parallely developable modules. Of course, as I can see now, there seem to be no direct link between these two. An optimally threaded application need not be allowing parallel development. All the same, this aspect should be involved even from the early stages of the design.

**Parallelism and the role of the leader**

Talking about leaders need not be alienating the subordinate developers. Even in Open Source projects like Linux Kernel development, Apache etc., where people might think that democracy is predominant, the role of leadership is absolute. In fact, especially in Public domain project, where theoretically anybody can be the leader, the pecking order is pretty rigid. It is not easy for you or me to go straight and dethrone Linus Trovald, and take over. When the freedom is there, the competition and quality of opponents is also high. And understandably, anybody remaining a leader in such open projects has to be unusually good in communication, aura and superior technical skills.

I say all this, only to eliminate the so called modesty based democracy from our minds. An automation project is too complex and technical to allow the luxury of modesty or politics based pecking order. The pecking order should be very visible and highly merit based. If you don't think you have that in you, please step aside or cooperate. If you think you can change things for good, be merciless in taking over the leadership by showing your strength. This is good for everybody. Without this open acceptance of our roles, the chance of completing a project is only a dream.

In many sense I can liken Film Making with Software Making. In film making too there is a strict hierarchy. Of course, you can never overstress humbleness and cooperation, but never at the cost of firm leadership. To ensure that the parallelism that is planned is put into practice, the project leader should be strong technically with good experience in group dynamics. Yes, I'm very much aware, that neither technicality alone nor management alone can make you a leader. Ideally the leader should be a mixture of both with prominent experience in getting things done. If the leader could also have an eye on parallelism, with an eye on the platforms capabilities and the project's scope, the success is not at all far off.

**Parallelism and Reuse**

You can never overstress the importance of reuse without over-dependence. I would like to once again link to the [fine article by Robert.C.Martin](https://www.objectmentor.com/publications/granularity.pdf). The parallelism of development necessitates *release based reuse*. When a module is developed parallely along with other modules, it will have its own release cycle, versioning and dependency; which has to be documented and conveyed to its users.

When modules are developed parallely, *as if it is a product on its own*, then, the extensibility and re-usability of the project is highest. The clarity of the developers about their role and criticality is much better this way. Achieving this parallelism is the onus of the project leader, and since this is neither trivial nor easy, the expectation on the leader is very high. I feel the usual point that no member of the project has to be indispensable, only belittles the enormous benefit offered by a good leader. The best this need for dispensability can only mean, that a superiors must really be worthy of their position. Because, if a leader is really the best dog of the bunch, then he will necessarily be less dependent on his subordinates. This holds good for a leader at any level, and to a any subordinate too.

**Epilogue**

I realize that I've talked as much about everything as I should be about parallelism. Explaining something is also explaining what it is not, and how it relates to similar things. All the same, my real point in this article is only to stress that the goal of planning is to build parallelism into the design. After all, what else is plannable, other than Scope and Parallelism?! Moving from here, the next goal would be to arrive at a clear, practical and tested Checklist for project planning and tracking, without degenerating into the mumbo jumbo of a complex SE process.

**References**

1.  [Testable Requirements](https://www.testablerequirements.com/)
    I'm constantly stimulated by this concept of Testable Requirements as a way for project scoping. We need to think about this much more before we incorporate it into TATTVUM model for simple and effective SE practices.
2.  [Reuse Release Equivalence Principle (R.C.Martin)](https://www.objectmentor.com/publications/granularity.pdf)
    This is a very fine article by Robert C. Martin, which discusses RREP among other key granularity based principles.
}
