&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> ```markdown
# Basic Design Principle: Loosely Couple

> Separate what is changing from what is not
>
> *S V Ramu (2001-11-13)*

**Introduction**

In my initial draft, I had copied lot of text from the Gang of Four Design Patterns book, as I was keeping this only as an internal ready-reckoner copy. Now I would love some audience, so have minimized the copied text to the barest minimum, to be within my reviewing rights. But you must read that marvelous book. It gives whole lot of emphasis on,

*   Programming to an Interface, not an Implementation
*   Favor object composition over class inheritance
*   Delegation
*   Inheritance versus Parameterized Types
*   Designing for Change (a wonderful checklist)

**Class Inheritance &amp; Abstract Classes: Code Reuse**

![](Basic%20Design%20Principle%20Loosely%20Couple/f4c8a4accb2bac2c0f31e9a93818cc6b.jpg)

After all the obvious disadvantages of Implementation Inheritance, we must understand fully the *need* for it too. Though *Polymorphism* is the real hallmark of OO extensibility, *Code Reuse* is also a goal. Misusing a tool doesn't preclude the real benefit of it.

Class inheritance is basically just a mechanism for extending an application's functionality by reusing functionality in parent classes. It lets you define a new kind of object rapidly in terms of an old one. It lets you get new implementations almost for free, inheriting most of what you need from existing classes.

(Gang of Four) When we attempt to keep all the references maintained by a concrete class as Interfaces, the Interface Implementation becomes a big issue. Since Interfaces just define the method signature and not the implementation in itself, code reuse suffers, as every concrete class that implement these interfaces has to rewrite all the code, even if most of it are exactly similar. Implementation Inheritance is ideal for this not-so-elite activity of Code Reuse. One good pattern that can be employed would be to define an abstract class, with most of the common code going into it, and what is specific to various individual implementation could be an abstract method, which can latter be overridden and implemented by the derived classes. This is *Template Method Pattern*.

```
class AbstractImplementation implements Interface {

  abstract protected void protectedPrimitiveMethod();

  //This method is ususally not overridden in the subclass.
  //(The final is optional, it is here jsut to stress the point)
  public final void publicTemplateMethod() {
    //Implementation independent code,
    //using the non-implemented abstract primitive method
    protectedPrimitiveMethod();
  }
}

class ConcreteImplementation1 extends AbstractImplementation
  implements Interface {
  //Note that the abstarct is removed.
  protected void protectedPrimitiveMethod() {
    //Implementation specific code.
  }
}
```

Though the specific classes can implement the Interface directly still (and it has to do that most of the time, in the Java like Single Implementation Inheritance languages, when a given concrete class is implementing many Interfaces), yet wherever we can, having an Abstract Class as a parent does help in grouping together the similarities, when there is lot of algorithmic commonness between the individual classes. This fact thus forms the strong case, for the presence of *Implementation Inheritance &amp; Abstract Classes* in a programming language.

**Interface: Polymorphism &amp; Multiple-Inheritance**

![](Basic%20Design%20Principle%20Loosely%20Couple/effec771955664196801820c776e455f.jpg)

![](Basic%20Design%20Principle%20Loosely%20Couple/9c3dfb37fa03a0f8ca28e8746138d8d3.jpg)

A **mixin** class is a class that's intended to provide an optional interface or functionality to other classes. It's similar to an abstract class in that it's not intended to be instantiated. Mixin classes require multiple inheritance.

(Gang of Four)

Now that the popular OO idiom of Inheritance and Classes is clearly placed (though in a not-so-charming domain), it is the onus of *Interface* to shoulder the main benefits of OOP. In C++ the concept of *Interface* was not obvious. Since Multiple Inheritance of classes was allowed, developers used a mixture of Abstract Classes and Multiple Inheritance to get the effect of Java-like-Interfaces. But once the Interface was recognized as an useful programming construct in its own right, and due to the *Diamond Problem* (the duplicate common ancestor class instances, and the ambiguity in calling the parent class methods), it was rightly felt that *Single Implementation Inheritance* alone is enough to avail the code reuse benefits. Nevertheless, due to the inherent benefits of *Multiple Interface Inheritance* in real-life modeling, that was retained in Java Interfaces.

*Polymorphism* signifies the *Programming to an Interface* spirit. It can even be argued that whole of an applications design should be in Interfaces; and Classes be used only for Implementation. This means, designing all objects and their interactions (parameters and return types of methods too) as interfaces alone, with or without Multiple Inheritance of Interfaces. This can be the starting point of any design, regardless of the fact that we might convert some of it into Classes for convenience sake (maybe, to reduce coding. Java does this all the time). This model can be likened to the RDBMS design cycle, where we design highly normalized Table structures and then denormalize it for performance sake. For this pristine act to be complete, we require that the language's API framework too is of this form. Unfortunately Java and others didn't start that way, but are making amendments now in their new API (where it is mostly Interfaces, and Abstract Factory Methods. For example, the whole of collection classes is based on Collection and Map Interfaces alone), and are trying to retrofit into the older APIs too (like the CharSequance for String). In Java, though unsaid, all Interfaces inherit form Object, which behaves both as a class and as an Interface!

We must also note, that with the emergence of Interface as the key OO abstraction, the role of class is relegated to a convenience role (even Parameterized classes fit this role). Thus the original assumption that classes have to be about *One thing* is no longer valid, this responsibility is taken by Interfaces now: A class could be implementing more than one dissimilar Interfaces, for code convenience sake. Today classes are the Implementation engines for one or more interfaces.

In this light, it is interesting that the *Static methods* take up the role of *Constructors for the Interfaces*! In the footsteps of Factory Method Pattern. You can see the real-time usage of this in all modern Java API. The `new` keyword for Object instantiation is now only for primitive classes, otherwise *Static Factory Method* is doing all the job of Object instantiation, much more elegantly and extensibly; because, the way the JVM (or the language runtime) can instantiate specific instances for an interface, declaratively. This is OOP loose coupling in its heights.
```}