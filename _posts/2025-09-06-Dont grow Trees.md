&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Don't grow Trees!

What is NOT the true benefit of OOP?

*S V Ramu (2002-03-25)*

**The natural evolution**

![b10439faf70435348f4e8519634b5b34.jpg](Dont%20grow%20Trees/b10439faf70435348f4e8519634b5b34.jpg)

We can never overstress the naturalness of the OOP evolution, and its real psychological benefit. But, be very clear, that regardless of OOP or other such *Silver Bullets* the core of coding hasn't changed much from the assembly days. A good programmer has always managed the complexities of an application, by proper partitioning of the system. Sub grouping a massive idea, has always been the minds way for simplifying the understanding and thereby progressing to bigger complexities. To add more sugar to an already full jar, you shake it. Also, the impetus to shake up doesn't arise, unless you feel the limitation. When a new concept comes by, we bend behind our back to use it, regardless of its pitfalls. But soon, when the common problems are obvious, and core strengths are certain, we proceed to next level of innovation, grouping, simplification and progress. Are we passing through that stage, with respect to OOP? The choice of programming language is important because it influences one's point of view. Our patterns assume Smalltalk/C++-level language features, and that choice determines what can and cannot be implemented easily. If we assumed procedural languages, we might have included design patterns called "Inheritance," "Encapsulation," and "Polymorphism." Similarly, some of our patterns are supported directly by the less common object-oriented languages. CLOS has multi-methods, for example, which lessen the need for a pattern such as Visitor (page 331). In fact, there are enough differences between Smalltalk and C++ to mean that some patterns can be expressed more easily in one language than the other. (See Iterator (257) for an example.)

**(GoF Design Patterns Book)**

A programming language's job is to provide better grouping idioms, so that old ideas no longer clog the path of newer ideas. Making obvious things common and enforced, we allow newer ones to emerge (and maybe obsolete ones disappear).

**Inheritance is no longer sacred**

Even in these days, I hear Inheritance-bashing as a way of deploring OOP's benefit. To my understanding, the emergence of *Interfaces* is the death knell of *Classes*, which means the sacred heights of Inheritance has vanished, at least 10-15 years before, when Delphi, VB and Java emerged. VB is a clear example where, Inheritance was so much abhorred that it was altogether rooted out from the language, despite the prominent and controversial presence of it in C++. Maybe C++ is the final glory of Inheritance in its extremes. The demise of Inheritance was mainly due to its own overuse.

In a week, programmers can use C++ as a better C. In 2--3 weeks, programmers can effectively use classes without inheritance. In a month, programmers can master inheritance enough to use it in some small examples. Then, programmers need about 6 months for practice and advanced study of class design and the effective uses and pitfalls of inheritance and other advanced features. After this period of study, programmers are ready to develop C++ libraries of their own. Attempts to develop large C++ applications without this period of study and experimentation have resulted in some widely known failures. The best programming organizations will reform management strategies along with adopting OOP at the technical level.

**(Subject-Oriented Programming)**

OOP also benefits from miscellaneous programming language enhancements implemented in object-oriented languages. **C++ benefits from important miscellaneous enhancements not really related to OOP**: strong typing; **function overloading;** placing declarations anywhere; C++-style comments; reference arguments to procedures and reference return values; const declarations; simpler, cleaner storage management using new and delete operators; and inline specifications. These enhancements make C++ a better language than C independent of the OOP enhancements, but the benefits of these enhancements are often not distinguished from the benefits of OOP.

**(Subject-Oriented Programming)**

C++ mistakenly stressed Implementation Inheritance as the hallmark of OOP. Slowly, and painfully, it became clear that it is not so, and it was simply Encapsulation and Polymorphism which are the true goals of OOP. And Inheritance was salvaged only due to its, minor use of code-reuse. Forget big trees of Inheritance, now with Interfaces, Inheritance is no more than one level normally. When I worked with VB6, I was exposed to massive Inheritance bashing. Having seen Delphi3 I did miss Implementation Inheritance as a code simplifying technique (if not code reduction). Of course, I did forget this handicap, for some time in VB, as I was thrilled to discover the fullest reach of Interfaces in VB. Delphi made a highly discouraging implementation of Interface (though before VB), because of its inability to satisfy the COM model bindings, and totally ridiculous instantiation inconsistencies. VB, having seen Delphi, and steering clearly away from Inheritance, very elegantly introduced Interface.

You must use VB6 to really see what omission of Inheritance, and simplification and forcing of Interfaces, could do to your appreciation of polymorphism. If done with care and love, a good VB application shined beautifully in bringing out the elegance of OOP. Of course, you have to overlook the ugly code copying that you might have to employ, if two implementations are similar. You can use procedural modules to avoid this code copying, but Implementation Inheritance would be far far elegant for this very purpose. Maybe that is why Implementation Inheritance is introduced in VB7, despite MS's vociferous denouncement early on. Given that MS does believe in *More is More*, Inheritance does have its significant benefit, for code sharing (or reuse), if used only for that, and not mistaken with Polymorphism, as in C++.

I think the days of Inheritance based OOP bashing is gone. Inheritance is no longer the crown jewel of OOP. Only Polymorphism (Dynamic Binding of behavior) and Encapsulation are. You must also be very clear that side improvements like Method Overloading, is NOT a manifestation of Polymorphism in practical sense (though in general English semantics, polymorphism could be linked to reuse of method name in method overloading). The good symptom of Polymorphism should be Dynamic Binding. Method overloading uses compile time static binding, and hence cannot be called Polymorphism, without diluting its distinct and useful connotation.

**Don't grow Trees!**

Of late, as the [site](http://tattvum.com/Articles/2002/2002-03/2002-03-31/Ramu-SE-20020325-DontGrowTrees.html#OOPBAD2) rightly points out, our dependence of Tree based imageries have grown to extreme levels. Few notable ones would be,

*   The Folder structure is a tree, with the files as the leaf nodes.
*   All the management structures have shifted to Tree based idioms. Notably, Microsoft Management Console, and all such management tools.
*   Class based single Inheritance is also a Tree, which has been so very controversial, for this reason alone.
*   Above all, the XML, the claimed universal data structure is a Tree in its heart, if not for those attributes.
*   Even the Library book taxonomies like Dewey system are based on trees. In fact a 10 based restricted trees.
*   The Biological taxonomies, namely the binomial nomenclature, is a tree.

Trees are indeed a very handy idiom for understanding a tough data structure. When Tree begun, in Folder structures, it was as a major idiomatic evolution. But even then, the Trees were very tough idioms for novices. If a person is brought up with Lists as the maximum complex structure in the world, then Trees are frightening for sure. This is nothing new, earlier, even ComboBoxes were considered unfriendly GUI, when compared to List Boxes. But as humans are exposed to complexities, the need to move for tougher and more realistic idioms is vital. I still remember the days when, lacking suitable VB components, and due to the need to be 'user friendly', we used to show trees as a wizard of List Boxes. But now, we straightaway go for Trees. Trees, no doubt, have simplified our reactions to hitherto complex data structures. Many of the real-time object relationships are representable as trees. And many simple lists naturally grow to become trees. XML is the ultimate proof of the universality and flexibility of trees. But are Trees the final destination? Now that we are so comfortable with it, what are its pitfalls? What is the next 'complex' structure we can imagine?

Any relation ship can be represented as Graphs (Thanks to Euler's genius), which are just points and lines (vertices and edges, if you like). A Maximal Graph is a diagram where every point is connected with every other point, and hence is very complex. Many natural relationship graphs do not have this ultimate connectivity, but are in fact more complex, due to their myriad restrictions to be kept in mind. In this light, Tree is only one type of graph, albeit a simple one, which has no cycles in it. If tree is complex, and cycles are a sin, then just imagine what it takes to visualize a maximal graph.

If we can have the simplicity of Lists, orderliness of Tree, and still could handle even maximal graphs, that would be great. Of course, as usual, be ready to face the brunt of being a pioneer. Your users will not hail you as messiah, but as a Satan who is unnecessarily making their GUI indecipherable. All the same, now is the time, when Trees are de facto, that we can experiment on these areas. The reviewed site feels this need and laudably tries to approach this problem in many ways.

**Overlappable grouping: Sets**

Have you seen JMX relation MBeans? Can you say why Google search is easier than Google Directories? Did you ponder why Attributes (or its equivalent) are important for XML? Why file or folder shortcuts (i.e. links) are there in all operating systems? And why the modern OO language prefer Interfaces to Inheritance for Polymorphism? The answer to most of these questions will involve the intention of overcoming the pitfalls of trees. Though the limitations of trees is well known for a long time now. Only recently, as in JMX, is it seriously being addressed. This *OOP Oversold* site puts this crisis very eloquently.

Related to inheritance (above), IS-A-Mania is the excessive promotion of one aspect/criteria above other candidates.

In certain "natural" domains like geometry and chemistry this may be appropriate because God (or Mother Nature) does not change those very often . However, my experience is that classification criteria or "usage paths" of items often change in the business domain.

HAS-A relationships are simply more flexible. I agree that there are some potential compiler checking features and syntactical shortcuts that IS-A can provide, including popular forms of polymorphism. But adaptability is usually more important. **IS-A is a stronger modeling statement, and thus is harder to undo than HAS-A...**

The bottom line is that HAS-A relations can easily serve as IS-A relations with little or no change, but not the other way around. And, OO loses much of its differences under HAS-A. Classes become little more than procedural "modules" under HAS-A.

*(OOP Oversold site Home Page)*

The solution this site offers is what JMX is offering in Relation MBean. The solution is to move away from the strict grouping of trees, to one of loose grouping as in sets. Where, a given object can be a member of two different sets at the same time. This is a very powerful idea. This way of classifying things into overlappable groups, models reality closely and can of course handle the maximal graphs, if need be. The reviewed site, explores alternative GUI for explorer like programs. Did you notice that, the attributes in XML allow us to group two or more separate branches under one attribute, and hence manipulate it accordingly with XSL like pattern matching engines. In many sense, the keyword based Search Engines, are in fact, loose grouping of the content the site has. If you cannot decide, whether XML should come under Java or Java (or VB) should come under XML, make both Java and XML as keywords, and assign it to the content, which is, say, a Java app using XML. This way, a given content is grouped under different categories, and yet, you can List all the Java content with one keyword. This is very powerful, though bit confusing initially, as, the only thing that you deal with is Sets, and whose content are only Lists.

**Inheritance Trees vs. Interface Sets**

The famous accusation against classes is that it promotes deep trees and thus going against its own goal of making the code maintenance easier. Deep trees are not the original impetus for Inheritance, but it immediately caught on with the beautiful VCL of Delphi and now the Swings in Java. Yes it does help greatly in these specific cases, due to the massive code reuse that is required in making visual components. But for most other cases, all we need in inheritance, is in Interfaces. Except for code reuse, which is when Class Inheritance is used. If you see the whole concept of Inheritance in this light, whole emphasis shifts from Inheritance like trees to Interface like groups. Hence, deep trees and their consequent far reaching ripple effects, are not usual, as the code reuse trees do not span more than one or two or three levels, in most non-GUI cases.

Multiple Interface inheritance is overlapped grouping, or sets (of course not classes ;), since implementation is not a part of the interfaces. Thus a given object can be grouped under different interfaces. In the hitherto silent trend of moving away from trees towards sets, Interfaces are clearly a step ahead. Why do we need interfaces? Is not abstract classes and multiple inheritance enough? And how can we fully get the benefit of MI with inheritance? These are very different questions, needing a special essay by itself. The core of which would be, what GoF so aptly said,

The choice of programming language is important because it influences one's point of view.

A new word means a new shade of understanding. Remember, the number of similar meaning words with very slight variation on emphasis, is an indicator (apart form confusion) of our deeper understanding of the domain that the word expresses. It is said that the Eskimos of the ice continents, have 3 or 4 nouns for ice alone, with very distinct meaning. For us, ice is a ice is a ice. For them, who are so closely bound with ice, it has different subtle features which need specific terms. Maybe to them, a Mercedes is a car is a vehicle!

**References**

1.  [Subject-Oriented Programming](http://iraf.noao.edu/iraf/web/ADASS/adass_proc/adass_95/cogginsj/cogginsj.html)
    This is a very scholarly looking write-up. Lot of insights are provided regarding the popular problems of OO languages, apart from other things.
2.  [Java Criticism](http://www.geocities.com/tablizer/javacrit.htm)
3.  [Shapes Example](http://www.geocities.com/tablizer/shapes.htm)
    The first link is general link on Java bashing. If you can be open enough, few aspects could be revealing. The second one is a masterly exposition of the ills of Inheritance and trees in general. This article sort of projects Procedures and Classes as duels, which is very novel. There is one other fine article in this site, on superiority of Sets over Tree, I lost that link! I'll find and add it.}