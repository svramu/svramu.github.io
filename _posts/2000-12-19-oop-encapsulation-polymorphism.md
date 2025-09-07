---
layout: post
title:  "OOP = Encapsulation + Polymorphism"
---

An overview on Object Oriented Programming

**0. Introduction**

*'Why this essay?'*

Oriented (OO) movement is pervading the whole world now. With Java and Design Patterns, it is almost reaching its climax. Though many of us have worked in an OO environment or tool, there is still a gap between knowing the syntax & semantics and knowing how to use it. Let us together find some useful techniques and rules for successfully implementing an OO project.

Our goal is to be able to translate a given requirement to a class model. This is not trivial because, we have to think about, Reuse, Extensibility and Elegance too. In this essay, I will start with a general historical coverage of OOP, to ensure that we are completely covering everything. The use and importance of Polymorphism will be dealt latter in the essay. Design Patterns will come still latter.

**1. A small History**

*'One who forgets history are condemned to repeat it'*

Though the basic idea of Object Oriented programming has been around from 70's, the real thrust came only with C++, Delphi and Java. However, as C was already famous, C++ caught on very well.

There are many other OO languages too. Like, Smalltalk, ADA, and Eiffel etc. In fact, many of the non-OOP languages like COBOL, LISP, and PROLOG etc too are available now with OO extensions! So much so, that some databases (like Oracle8) are offering ORDBMS (Object 'Relational' Data Base Management Systems) and some even OODBMS!

Though C++ and Delphi are OOP languages, they still allow people to do non-OO programming. This is considered bad, as a non-OO language does not encourage the modularity, extensibility and manageability (we'll see 'how?' soon). And thus began the drive towards complete OO languages. Of these, Smalltalk is the oldest and Java and C# are the latest. In these languages, you cannot create a variable or a method (procedure or function) outside a class. An application is a collection of classes (or interfaces, which we will soon see), and the starting part of an application is a method-inside-a-class instead of a plain-method (like the 'main()' in C++).

Just to give you a taste of how languages arrived, hear these: (all are 1900+)

*   '54 Fortran
*   '57 Cobol
*   '58 Algol (Base for Simula)
*   '58 Lisp
*   '61 B1000 (First Object-Like system, also SIMULA1)
*   '62 Sketchpad (Clones and Instances introduced)
*   '64 Basic (We know it!)
*   '67 Simula67 (First programming language to have Objects and Classes)
*   '68 FLEX (First OOP based PC)
*   '70 Pascal (From Algol)
*   '71 C (From a language called B)
*   '72 Smalltalk72 (By Alan Kay, Based on Simula67 and Lisp)
*   '76 Smalltalk76 (First complete OO language)
*   '79 ADA (From Pascal)
*   '80 C with classes (experimental)
*   '83 C++ (Bjarne Stroustrup)
*   '86 Objective-C (from C and Smalltalk)
*   '86 Eiffel (from Simula)
*   '91 Sather (From Eiffel)
*   '91 Java (Sun)
*   2000 C# (The recent)

Whew! It is a long and winding history (remember, this just a summary of languages)!

*(I wrote this long back, and forgot from which site I got these information, I remember it was a marvelous chart. I'll find it and add it here soon.)*

**2. OOP is not new!**

*'A disciplined experienced programmer is already using it'*

Even with machine language (ones and zeros) it is theoretically possible to simulate an Object Oriented Programming! How else is a C++ or Delphi or Java compiler working! Ok, let us quickly look at the evolution of Java, to believe the above idea.

All best programmers have used most of the modern OO concepts. In fact, this ambiguity in OOP is nothing new. When structured programming came, people faced similar problems. It took a long time to think in functions and procedures. Now we are taking the same time to adjust to classes and interfaces.

So, what OOP does newly, is to force many of the skills and experience, to a normal programmer. Many of things that were achieved by naming conventions and project management are now a compiler time capability.

Whenever there is a paradigm change, it is hard to adjust. We just have to realize why that change happened, and use it with understanding. We should not just accept them blindly nor fear them.

**3. GW-Basic**

*'Old is Gold. But, all old things will die'*

Many of you would have seen GW-Basic. It was one of those early languages after Assembly languages. Honestly, GW-Basic is just like assembly, without the need to bother about Registers and cryptic Jump commands. It still had line numbers for program sequence branching.

Two good thing about GW-Basic is that it had an IF statement, which involved a register manipulation in assembly, and String data type, which was simulated with an array of ASCII characters. Other than that it was just like assembly, possessing all the basic numeric (+, -, *, /), String (+) and logical (<, =, >) operations.

Other than these, there was the new concept of multiple branching and looping structures. But, if you look at them properly, you can completely simulate them (WHILE, LOOP, REPEAT and FOR) yourself, by just using the IF statement and GOTO statement (Try!).

**4. The GOTO debacle**

*'The death of unconditional branching'*

At this time, the concept of 'functions' was not available with GW-Basic. Have you tried to simulate a function with just GOTO and Global Variable? Try it! Then, you'll understand how useful the concept of 'Function' is.

The basic trick was to keep our method (function or Procedure) parameters as global variables, and store the next statement's line number too. You then call a GOTO to the desired line, uses the global variables, finish the job, and then call another GOTO to the stored next line. Whew!

Of course this is possible. But, think of the number of global variables that will be used. Think of all the parameters for various function and some more global variables for the inter-method usage. It was a mess. There were so many global variables, that it was in fact hard to keep a unique name to them. Also think of the number of GOTO statements used. You need some for the method simulation and some for the loop jumping.

Because of all these, people decided that the number of GOTO should be reduced, as it creates a noodle-like code, and understanding the flow of the program is very tough. Hence, first GOSUB-RETURN was introduced, thus removing GOTO, and then SUB and FUCTION were introduced, thus reducing the number of global variables.

**5. C**

*'The climax of Structured Programming'*

Even after the introduction of methods, the GW-Basic was still a top down programming language. That is, it still allowed logics (looping and branching) outside the methods. Methods were optional. This allowed many programmers to ignore the method usage, because a program need not start with a method, or contain any method, if they so choose.

The problem of not using method will not be visible, as long the program is small. Once you cross some 500-1000 lines, a method-less program will become so complex that many bugs start to creep in. Thus, as the size of the commercial program starts to grow, the need for modularity was heavy.

Enter C! It was at this time that C became famous. It imposed a rule that every bit of logic in a program should be inside some method. And in fact the program itself will start from a default method called 'main()'. Only variable declaration was allowed outside methods (for the inter-method communications).

This was such a revolution, that many of the modern large programs were written in C. Because of its popularity, many different computer platform (from PC to main frame) started creating a C compiler for its community. Thus C was everywhere, and was used for literally everything (from business software to operating systems).

Also, C was the precursor to the real birth of structured programming principles. Though it evolved from Pascal, it far superceded it, because of its flexibility. Also C introduced a concept of 'struct', which allows grouping of variables. Methods are still ungrouped.

**6. The original need for OOP**

*'Human mind always wants more'*

If you remember, even the whole of DOS operating system was less than one floppy (1.44 MB). Such was the size of the programs that were made. Today, Windows 2000, even without its bells and whistle, will occupy around 500 MB! These are the times of monster programs. Do you know? Even a program of 4-5 MB size, when compiled, will have almost a lakh lines of source code!

What tools and techniques that we used for a small project cannot be used directly for a large project. We need more powerful modularity and extensibility than what we can get from using functions alone.

The main culprit was the global variables. If you remember, C allowed the declaration of global variables (say GV), for the sake of inter-method communications. But they were used by only few functions. Maybe two or three methods used a GV, but no other method can have the same-named GV for its own purpose. When you look at this restriction in light of a huge program, it will amount to some hundreds of GVs. This is complexity!

Also, there were methods, which were called by only few other methods. The problems of this sort are called as 'Name Space' problems. That is, you soon run out of apt (suitable) names for variables and methods. Hence, heavy Naming convention became very important, and thus putting the burden on project management instead of the compiler.

**7. Encapsulation**

*'Let us see the whole body. Not the intestines and bones'*

With the growth of monster programs, came the need for Data-Hiding. Nowadays the capability of a PC is far greater than the old days. Hence the size and complexity of the programs we write are also huge. Moreover, our need for handling complexity is more than our need for speed or memory optimization (though it is still there and will be so forever).

It is said, that human mind cannot remember too many things randomly (utmost 7 things it seems!). Thus we resort to grouping and classifying, to organize things, and thus to remember more than what we could with brute force alone. The grouping equivalent in software is through classes. In fact, the trend nowadays is to group classes into packages!

In addition, we want to see only the most essential. Too many details confuses human brain. So, we 'Hide' many variables and methods inside the class. Thus, a class is just a bundle of variables and methods, with some being hidden away outside the class. Thus the keywords like 'Private' and 'Public' became famous.

Now, the programming language is modeled something like: There are packages, which contain many classes, which in turn contain many variables and methods, and these methods finally contain statements (Assignment, Branching and Looping).

**8. The next step: Reuse**

*'Human mind seeks more and more optimizations. More we solve, more we want'*

Once the problem of Name space crunch is solved, with the added advantage of Data Hiding, using the class idea, people started looking for further optimization. Don't forget, that all these have been going on from 60's. 30+ years of thinking, from some of the best minds in the field, is bound to produce some good ideas. Of course, understanding all these modern concepts in few years is a challenging task. Do not ever underestimate the depth of OO thinking. It is not trivial, it not a joke and it definitely cannot be read like a story book over a night and be any useful.

However, it is also not a rocket science either! OOP is the distillation of years of efforts to simplify programming. So, however sophisticated it may be, it is so, for simplicity sake and can be understood and used effectively, if approached properly, with interest and without fear.

Now, after the creation of class concept, programmers found, that many of the classes have overlapping functionality. And it was wasteful to code the same logic again and again into many classes. Naturally, they wanted some way to remove the commonality as a separate entity and use it again and again in different classes, under different situation.

**9. Reuse is not automatic**

*'There is no magic! OOP is a tool, not a solution. Know to use it'*

In 70's and 80's many people were disappointed with OOP, as they thought that just by using a language like C++ or Smalltalk, they could reduce their code's size and increase the speed of creation. Also they thought, just by creating few classes their whole code can be reused again and again.

All these are false! OOP does not decrease the code size at all. If at all you see any reduction, it will be only due to your own special efforts to reduce it. As I told you earlier, a good programmer could create the same OO program in GW-Basic, with the same code size. Only thing that OOP does is to handle a huge project, in a controllable way, that too only when you design it that way.

Also, creating an OO application is not at all fast. But, the programs that were impossible earlier are possible now. It is not a question of speed of creation; it is just a question of handling complexity.

**10. Design More Code Less**

*'Now the stress is more on designing, rather than coding'*

What the OO movement has done is to remove the stress from coding, and to put it on designing. If you want a successful utilization of OO power, you need to shift your focus from coding to designing.

Designing means, to understand the system you are automating, more deeply, and predict and plan for the possible areas of changes well ahead. We should curb our instinct to start coding immediately and try to figure out the design pitfalls first. It has been time and again proved, that the projects that start off with minimal design might look faster in the initial stages, but soon the cost of bug fixing will override the benefits of an early start.

And unless we plan the areas of reuse, early in design, we will not reap the true benefits of OOP. OOP is not at all a cure for all the programming problems. OOP is a concept and a goal. Various languages like C++, Java and Delphi can only 'help' you in achieving that goal, but cannot ensure it.

Thus the question we must ask is 'how to Analyze and Design in OOP' not so much about how to code in OOP.

**11. Inheritance and Human Analogy**

*'The basic tool for code reuse'*

Inheritance is the key realization for code reuse. The meaning of the word Inheritance has been generalized these days. Because of the arrival of Interface (which we shall see soon), the normal class inheritance has been renamed as 'Implementation Inheritance' and the other as 'Interface Inheritance'.

We cannot directly relate the OOP Inheritance concept to the Inheritance in Human beings (or any life form). The key difference is in the fact: *One parent is enough to give birth to one or more child!* But, once you can accept this (maybe thinking of classes as some kind of mono-gender worm species!), then you can use the life analogy to understand most of the Inheritance concepts.

Also, a child (in OOP) will inherit ALL of the parent's qualities. It can have few more qualities, but it should have all of the parent's functionality (though modified).

Another problem with the Human analogy is the question, whether to treat each individual human being as a class or an object (instance of the class)? If you treat it as an object, how can an object (not a class) be inherited from another object (not a class)? And if it is a class, which is the object then! All the same, let us go with the Human analogy (with some qualification), as it is easily visualizable. Of course being aware of above pit falls will save us from confusing ourselves.

So now, imagine that we are all mono-generic, i.e. there is no male or female, we are all just humans! Also, imagine that we all can reproduce! (Maybe this would be the best help to women's lib organizations!). If you can do these mental feats, then, we can declare that each human being is a class! (No objects at all but!)

**12. Implementation Inheritance**

*'The rigid starting'*

Note that we are all real. Hence we are all classes, not Interfaces (We will see how to imagine that). And each class can create a new class (not an object). Now we have two options, either only one class begets a child class, or a group of classes can together beget a child!

Please do not try for a human explanation! A child being parented by many (more than two) parents is much more atrocious than a child being born to one parent! But, I feel, having an incongruous analogy (knowing that it is very incongruous) helps us to understand the differences glaringly, and hence helps to define the Real thing more accurately.

Don't worry there are lot of good real world examples for OOP. But programmers often confuse the human inheritance with it. So, it is better to once and for all expose the problems associated with it.

We have two religions of Inheritance (we are still talking about the Classes, not interfaces). One is Single Inheritance (one parent) and the other is Multiple Inheritance (many parents, two or more).

**13. Pros and cons of various Inheritances**

*'Problems of the primary tool'*

The main benefit of Implementation Inheritance is that it is homogeneous. Hence, the only idea you have to understand is that of Class. And the whole of programming can center around that.

With Single Inheritance the whole world is described as a huge but simple inverted tree (one root at the top and branches at the bottom). Thus the classes are very organized and rememberable. For each class, you have a single-line-path, tracing back to the basic root (conventionally, only one root). Also there are no closed paths, meaning, you cannot have a child, which have two parents, and they themselves having a common parent. That means each class has the qualities of only one other class, plus some of its own.

The problem is, that a same class cannot have the qualities of more than one parent. But if you see the real time situations, many object have many groups of qualities. Because of this, Multiple Inheritance came in. And immediately, the beautiful Inverted Tree structure is shattered. Now we can have many roots, each child can have many parents, and thus we have a forest, rather than a tree. But the benefit is that we can model a real world.

**14. The Diamond problem**

*'Too much flexibility is confusion'*

Multiple Inheritances are most flexible. But, many people doubted the ease of this model. Imagine that a class called 'Employed-Plumber' inherits from class 'Employee' and class 'Plumber'. In turn let 'Employee' and 'Plumber' inherit from 'Person'. Thus we have a diamond! The 'Employed-Plumber' inherits from 'Person', both through 'Employee' and through 'Plumber'.

What is the problem with this? Assume we have a method called 'workNow()' in the 'Person' class. Since the 'Employed-Plumber' is eventually the final child class, what should it do, if we call 'workNow()' for it? Of course, if it has overridden its own copy of the method 'workNow()' then it is easy to decide, that it will execute its own version. Assume that is not the case, then will it call the 'Employee's version, or 'Plumber's version or 'Person's version of the method?

This is not a small confusion. Many applications have hundreds of classes, and in C++ this inheritance forest can become so complex that, Multiple Inheritance introduced more confusion than what it clarified. There was one another problem of the 'Person' class being created twice in the memory (this can be rectified by declaring it as Virtual or Abstract). But, whatever you do, even if you declare, everything as Abstract, still this semantic confusion of what method to call, cannot be resolved elegantly.

There is a very interesting summary in Thinking in C++, by Bruce Eckle. Checkout,

'The reason MI exists in C++ and not in other OOP languages is that C++ is a hybrid language and couldn't enforce a single monolithic class hierarchy the way Smalltalk does. Instead, C++ allows many inheritance trees to be formed, so sometimes you may need to combine the interfaces from two or more trees into a new class.

If no 'diamonds' appear in your class hierarchy, MI is fairly simple (although identical function signatures in base classes must be resolved). If a diamond appears, then you must deal with the problems of duplicate subobjects by introducing virtual base classes. This not only adds confusion, but the underlying representation becomes more complex and less efficient.

Multiple inheritance has been called the 'goto of the 90's'. This seems appropriate because, like a goto, MI is best avoided in normal programming, but can occasionally be very useful. It's a 'minor' but more advanced feature of C++, designed to solve problems that arise in special situations. If you find yourself using it often, you may want to take a look at your reasoning. A good Occam's Razor is to ask, 'Must I upcast to all of the base classes?' If not, your life will be easier if you embed instances of all the classes you don't need to upcast to.'

**15. Interface Revolution**

*'Simplicity is the mark of Great Inventions'*

Interface is nothing but a class with only method signatures (the combination of name, ordered typed parameters and the return value), and with NO implementation (no logic code)!

At one stroke, the entire above problem can vanish, and the Inheritance can become very polished and crystal clear, by introducing Interface. If you notice carefully, the main culprit was the implementation of the parent classes. Had there been no implementation for 'Plumber', 'Employee' and 'Person'; then the question of 'Which Implementation of the method to use for the child class?' doesn't arise.

This solution is so deceptively simple, that many people do not accept that they have understood the full meaning, and they strive for more understanding, where there is none! And, this idea is so powerful that to a great extant, we can even abolish the usage of 'Implementation Inheritance' altogether and get away with only 'Interface Inheritance' (VB 6 fully uses this feature of OOP).

Now (with the current information), our OOP model is something like this. We have many classes; there are no relations between them, and each class may implement zero or more Interfaces. If a class doesn't implement any interface, then it is used only for Encapsulation, if it does implement some Interfaces then it is used for Polymorphism also (will be explained soon).

For now, assume that there is no 'Inheritance' either among Interfaces, or among the Classes. There is only Implementation relation between them that is all! Even with this simple model VB6 went a long way in challenging the strong hold of C++.

**16. The Delphi model**

*'With Interface, Class level Single Inheritance was introduced'*

Delphi took a slightly different root from VB6, thus capturing the elite of the early Windows programming community. It was only slightly different from the VB6 model. It still had, Classes, Interfaces and Multiple-Interface-Implementation Relations. Along with this it also had, Single-Implementation-Inheritance, that is, Single Inheritance of class (not Interfaces).

Because of this, its Visual Components Library was so simple that, people could create a new complete component, with just 3-4 lines of code, whereas in VB6 you have to cut paste pages of it. Thus, a concept (Inheritance) that was hitherto considered bad did reemerge as a champion (but with single inheritance on class only).

Nowadays, Multiple Inheritance in class is considered so detrimental, that except C++, no other modern language supports it.

**17. The Java Model**

*'Single Inheritance in Classes, and Multiple Inheritance in Interfaces'*

Until now, we have made Multiple Inheritance as the villain, and Interface as the hero. Interface is the hero still, but we are going to remove some of the bad glow from Multiple-Inheritance.

Had you noticed the above accusation of the C++ model carefully, you'll agree that all the problems were not due to Multiple Inheritance per se, instead only due to the combination of allowance of Implementation and Inheritance together. Thus once we separate these two, we should have no problems. Right?

In fact this is true. Java exploited this detail, and salvaged much of the C++ advantage, without its notoriety. It allowed Classes, Interfaces, Multiple Inheritance of Interfaces and Single Inheritance of Classes. Only thing that has been unanimously abolished from OO world is 'Multiple Inheritance of classes'.

**18. Digesting the current model**

*'Some rest after the hectic journey'*

We have come a full round! We started with C++, which had just Classes and Multiple Inheritance. Then VB6 removed inheritance completely, introduced Interfaces and Interface Implementation. Then, Delphi added Single Inheritance (of classes) to the soup. And finally Java added, Multiple Inheritance (of Interfaces).

The real chronological order of these products was C++, Delphi, VB6 and then Java. What I've been planning is only a logical evolution to aid the understanding of the basic OO concepts.

The other details that we have not discussed thus far, are Function Overloading, Operator overloading, Static (variables and methods), Function Overriding (protected clause), etc. These are all, important concepts too, but are just variations and elaborations on the above basic principles. Once we clear Encapsulation and Polymorphism, other things are lot simpler.

**19. Polymorphism**

*'Same code, but different behaviors'*

Inheritance is the basic infrastructure required for the Polymorphic behavior. Polymorphism is the dream of using the same code for realizing multiple behaviors, using dynamic binding of objects to interfaces. This clearly is the hallmark of an extensible system.

You can realize polymorphism in two ways, one through the class (implementation) inheritance, and other through the interface inheritance (implementation). In the case of Implementation Inheritance, the base class is used in the unchanging code, and an instance of its child classes is dynamically bound to it in runtime. In the case of Interface Inheritance, the Interface is used in the unchanging code, and an instance of the Implementing classes is dynamically bound to it in runtime.

Though Interface based Polymorphism is straightforward, Class based Polymorphism depends on 'Function overriding', Simple! If a parent class has an implemented method, the derived child class can either accept that without change, or it can completely change it, or else it can use the parent's version with some modification of its own (before or after it). In case of interface, the implementing classes must compulsorily provide an implementation, hence the scenario is lot simplified.
