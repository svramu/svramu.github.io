---
layout: post
title:  "How AOP is already possible in Java?"
categories: [Article]
---

**Prelude**

It has been a long gap, due to my work pressure. One of the goal in my work was to design a server side framework, to allow new services to be plugged into the system. Well, are Java server frameworks, just like any other Java applications? Mostly yes. But the fact that a server framework is the central block of a growing application, demand it to do some peculiar things. So, you start searching for new tools, and paradigms for programming it. When [JBoss 4](https://www.jboss.org/developers/projects/jboss/aop) introduced [AOP](https://en.wikipedia.org/wiki/AOP) based J2EE server, I was awe struck. Because, when I was only trying to understand and admire AspectJ, here is a team who is going ahead and envisioning new uses for it. This is not the first time; even with [JBoss 3](https://www.jboss.org/overview), I was stumped by their ingenious use of [JMX](https://java.sun.com/products/JavaManagement) for a framework skeleton, especially so, when I was just then trying to make sense of JMX for the first time in my survey of J2EE.

What keeps these people ahead of their times? How are new concepts concocted, when we are just groping to learn some decades old OOP etc.? Well, if my current server framework project is any indicator, I know the answer. Necessity! Yes, the same old trusted wine. The demands of frameworks are such, that you seek *interception* as a way to avoid code duplication, and for central control.

**AOP and AspectJ**

This article is not an AOP tutorial, its intention is to think about its basic root, and other ramification of using it. All the same, very mild introduction would be appropriate. There are some excellent resource in web on AOP. Some links are provided, relevant to this article. Maybe some other time we can have one exclusive article, on AOP survey.

Aspect-oriented programming (AOP) is a way of modularizing crosscutting concerns much like object-oriented programming is a way of modularizing common concerns. AspectJ is an implementation of aspect-oriented programming for Java.

Concerns like security cut across the natural units of modularity. For object-oriented programming languages, the natural unit of modularity is the class. But in object-oriented programming languages, crosscutting concerns are not easily turned into classes precisely because they cut across classes, and so these aren't reusable, they can't be refined or inherited, they are spread through out the program in an undisciplined way, in short, they are difficult to work with.

[Introduction to AspectJ](https://dev.eclipse.org/viewcvs/indextech.cgi/%7Echeckout%7E/aspectj-home/doc/progguide/starting-aspectj.html)

The usual first example of AOP is the logging problem. That is, if we want a set of methods to `println` at the start of the method, and at the end. How would we do that? Obviously by inserting these statements in the source. But the gotcha comes when we need to remove it in the shipping version of the source, but have it again back while developing the new version. Of course, removing it in the class file is easy, as we can use the Java's [conditional compiling idiom]({% post_url 2003-05-17-the-final-trick %}). But removing the logging code, in the shipped source is much more difficult, as we need some nifty search replace, or a parser based refactoring editor.

The solution provided by AspectJ, is to write a special class-like thing called an `aspect`, and inside it define some special variable-like things called `pointcuts`, and use it to define, special method-like thing called `advice`. And thus isolate, and keep all the logging code in one place.

[A good introduction](https://dev.eclipse.org/viewcvs/indextech.cgi/%7Echeckout%7E/aspectj-home/doc/progguide/starting-aspectj.html) is straight from the current home site [Eclipse](https://eclipse.org/aspectj/).

`aspect` SimpleTracing {
   `pointcut` *tracedCall()*:
       `call`(void SomeClass.method(Param));
   before(): *tracedCall()* {
       System.out.println("Entering: " + thisJoinPoint);
   }
}

What this code does is, it *Intercepts* any call to the method `SomeClass.method(Param)`. This is called a `pointcut` (maybe meaning a cutting point?). With this defined, we use it to define an *advice* called `before()`, and write whatever code we want, which is logging here, at the point of interception, and allow the call to go its way. So basically what AspectJ is giving, is the power to trap any method call. In fact goes beyond this and traps even variable assignment, object creation (just before the new), etc. These are called *join points*, with which we define *pointcuts*.

*   [Interview with Gregor Kiczales](https://www.theserverside.com/talks/videos/GregorKiczalesText/interview.jsp) (creator of AspectJ)
*   [AOP refactoring 1](https://www.theserverside.com/articles/article.jsp?l=AspectOrientedRefactoringPart1)
*   [AOP refactoring 2](https://www.theserverside.com/articles/article.jsp?l=AspectOrientedRefactoringPart2)

**AOP != Interception**

Much has been debated, on what AOP is. The recent blog of [Ted Neward](https://www.neward.net/ted/index.html) (Java and .NET book writer, speaker and mentor) [AOP != Interception](https://www.neward.net/ted/weblog/index.jsp?date=20030107) was shocking at first! Because I was slowly coming to terms that AOP is just the capability to *intercept* the joining points of the language. But here is someone saying that it is not! But his prelude is a solace.

while Interception is a powerful mechanism in its own right, it's not the same as AOP, and while they do share a number of defining characteristics, **to understand AOP as Interception is like thinking OOP is data structs plus a bunch of function pointers**. Just as we didn't understand objects until we got past the idea that objects are "just code and data", if we're to truly understand the potential power inherent in AOP, we need to get beyond this thinking that Interception and AOP are the same thing. They're obviously related at some points, but that's not the same thing as equality.

[Setting the Story Straight: AOP != Interception](https://www.neward.net/ted/weblog/index.jsp?date=20030107)

This blog is beautiful, and broad in its coverage. I still haven't read each word in it. But, after my work with my server framework, I realize that many of its quote are in fact my personal experience en route. But as I found while trying to explain [polymorphism with C]({% post_url 2003-04-20-what-would-be-polymorphism-in-c %}), and while while finding the [volume of sphere without Calculus]({% post_url 2000-11-20-why-calculus %}), there is value in exploring the core principle or technique, which makes an otherwise tough idea clear. It is like the metaphor of tree, for a blind man to 'visualize'. So, AOP in its basic spirit, can be realized if you understand the nice capabilities that are possible when we can **intercept** any method call, or other [joinpoints](https://en.wikipedia.org/wiki/Join_point). Of course, understanding this way, will not teach you the various idioms in decomposing an application into aspects. That is an art (at least for now). It is like saying, that by knowing inheritance or polymorphism, conjuring the need for [design patterns](https://en.wikipedia.org/wiki/Design_pattern_%28computer_science%29) is not trivial at all. But that does not mean that the basic techniques are any different. It is only that knowing the tools of the trade doesn't make you a good craftsman. Knowing to play flute will not necessarily make you a musician.

**java.lang.reflect.Proxy**

My assumption all along, was that to intercept method calls, you need an AOP tool. Or, any such tool, that will allow you either statically ([AspectJ](https://eclipse.org/aspectj/)), or dynamically ([JavaAssist](https://www.csg.is.titech.ac.jp/%7Echiba/javassist/), [Nanning](https://nanning.codehaus.org/overview.html), [Dynaop](https://dynaop.dev.java.net/)) modify the written class, so that intercepting code can be inserted. But modifying existing class, gives me jitters, and can cause class file compatibilities with some JVMs. This is treading in non-java-standard arena. And in my tests, many tools broke with the J2SE-1.5-beta I was using. So, clearly AOP is not an option. But I wanted a way to intercept a method based on its name, whenever anybody calls that object on a particular object.

Then I stumbled upon [java.lang.reflect.Proxy](https://java.sun.com/j2se/1.5.0/docs/api/java/lang/reflect/Proxy.html). I now remember seeing it before, but have never thought of it to be useful, at least for my daily needs. The amazing thing is, it is there from J2SE 1.3. And only now AOP is becoming a serious consideration for commercial software. Of course, the whole world is rocking in its wave, with [IBM planning to AOPize all its tools](https://zdnet.com.com/2100-1104_2-5081831.html), and [J2SE 1.6](https://www.infoworld.com/article/04/04/06/HNjava16_1.html) itself debating to give it a first class treatment inside Java. So, all said, `Proxy` is amazingly cool, to be there in Java from 1.3.

The `Proxy` documentation is pretty complete with an example, in the standard javadoc. All you need to know practically is just the following two methods.

`Object Proxy.newProxyInstance(ClassLoader, Class[] interfaces, InvocationHandler);`

`void InvocationHandler.invoke(Object proxy, Method, Object[] args);`

The first is a static method call, and the second is an interface method, to be implemented by us.

A *dynamic proxy class* (simply referred to as a proxy class below) is a class that implements a list of interfaces specified at runtime when the class is created, with behavior as described below. A proxy interface is such an interface that is implemented by a proxy class. A proxy instance is an instance of a proxy class. Each proxy instance has an associated invocation handler object, which implements the interface [InvocationHandler](https://java.sun.com/j2se/1.5.0/docs/api/java/lang/reflect/InvocationHandler.html). A method invocation on a proxy instance through one of its proxy interfaces will be dispatched to the invoke method of the instance's invocation handler, passing the proxy instance, a `java.lang.reflect.Method` object identifying the method that was invoked, and an array of type Object containing the arguments. **The invocation handler processes the encoded method invocation as appropriate and the result that it returns will be returned as the result of the method invocation on the proxy instance.**

[java.reflect.Proxy javadoc api](https://java.sun.com/j2se/1.5.0/docs/api/java/lang/reflect/Proxy.html)

And it goes on to explicitly list the finer prints of the contract. Simply put, Java gives language support to create a dynamic wrapper class, which can be prolymorphically casted into any arbitrary list of interfaces you give. The beauty is, it does this in its own inimical style of adding a new class, instead of creating a new keyword! You can see this trait (adding classes instead of keywords) in Java, in classes of `java.lang.ref.*`. OK, if it creates a dynamic object implementing our interfaces, how can it give the appropriate implementation for it? It can't! So, it gives us an interface with one method `InvocationHandler.invoke`, for which we have to write implementation. This one method is obviously similar to the well known `Method.invoke`.

A method invocation on a proxy instance through one of its proxy interfaces will be dispatched to the invoke method of the instance's invocation handler, passing the proxy instance, a java.lang.reflect.Method object identifying the method that was invoked, and an array of type Object containing the arguments.

[java.reflect.Proxy javadoc api](https://java.sun.com/j2se/1.5.0/docs/api/java/lang/reflect/Proxy.html)

You can't be clearer than that! But if you want, there is a minimal example to in that page. *So, the big point is, you can use this class to dynamically intercept any call to its methods. And it is up to you to decide, what methods you want to intercept, and how*. To what use this capability can be put to? In my case it is WorkFlow. I treat the method calls as actions, and fire BEFORE and AFTER triggers, when these methods are executed! Simple but amazingly useful. For all you budding workflow enthusiasts out there, I have given you a scoop (much more about WorkFlow, some other time). Of course, any one who has passing acquaintance with the standard AOP examples, can map much more uses to this Java capability.

**J2SE 1.5 Annotation vs. JavaBean naming convention**

There has been a growing trend towards annotating fields, methods, and classes as having particular attributes that indicate they should be processed in special ways by development tools, deployment tools, or run-time libraries. We call such annotations metadata.

For example, the JavaBeansTM architecture introduced various stylistic naming patterns (such as getFoo/setFoo method names) that could be used to indicate that particular methods were used for accessing properties, for registering event handlers, and so forth. Similarly the Enterprise JavaBeans architecture introduced various stylistic patterns that allow methods to be marked as remote methods, home methods, and the like. The EJB architecture defines significant extra information in its deployment descriptors that is used to provide information on things like the persistence relationships of fields, the transactional properties of methods, and so forth. Source code defining web services components has similar needs.

[JSR 175: A Metadata Facility for the JavaTM Programming Language](https://www.jcp.org/en/jsr/detail?id=175)

As we all would have understood. The Bean naming conventions, are only a poor man's [Annotation](https://www.jcp.org/en/jsr/detail?id=175). For how many meta information about a class, method or a variable can we use naming convention? Of course, in that way, the intention of those items becomes clear, is true. But naming conventions for that is intrusive, and can be an impediment in some overlapping requirements. For this elegance and for making meta data more statically safe and expressive, Java 1.5 introduces Annotations, aka Metadata facility. With JavaDoc like tools, and now Annotations, our source become complete information repository of all we want to say. The details can be worked out by the tools. Maybe they will be recasting the javadoc tags along with the other major Annotation standardization efforts that is going on. First time I explored the Annotation feature, it was surprisingly elegant in keeping with Java idiom, and truly expressive. Now I understand why naming convention was introduced. Because, the alternative, this Annotation, requires so much thought.

OK, how is Annotation (or Metadata) useful for the current topic of dynamic proxies based method interception? Simple, to selectively intercept the methods. Without Annotation, we have to use naming conventions, or the method signature. Now we can elegantly do that with Annotation. The newly added `<T extends Annotation> T getAnnotation(Class<T> annotationClass)` can be used for this. Oh, you do know about Generics right? And Enum? Don't miss exploring the [new J2SE 1.5 features.](https://java.sun.com/features/2003/05/bloch_qa.html)

**AOP is much bigger**

As commented earlier. AOP is much deeper than just method interception. Even in interception, proxy only buys us method interception, whereas usual AOP tools include interception variables and constructors. Except maybe the [Dynaop](https://dynaop.dev.java.net/) and [Nanning](https://nanning.codehaus.org/overview.html).

But in a pure OO perspective, ideally the fields should not be exposed as public. Also, by the [Abstract Factory pattern](https://en.wikipedia.org/wiki/Factory_method_pattern) we are discouraged in allowing constructors to be called directly. Maybe there are, and will be, exceptions to these principles. But for now, for a closely crafted framework, `Proxy` buys you most of the advantages. One class may not be a paradigm shift, but for just one class, Java has done remarkably well on its *Less is More* philosophy.

I have elided till now, one vital point about the limitation of this `Proxy` model with respect to AOP. That is the ability to specify an interception, ad hoc, to any class. This is subtly different from the server framework scenario, I've explained till now. Here, there will be a central container with which all services are instantiated, and hence they can be wrapped with a proxy, and hence be intercepted. But in many non-server application, this may not be the case, or need to be contrived to be so. There, AOP like ad hoc interception, should be a boon.

This non-server requirement subtly changes this interception game, and possibilities. Suddenly the application can be visualized as layers of 'aspects', each looking after a [concern](https://www.research.ibm.com/hyperspace/index.htm). The area of interaction between aspects, also raises newer complexities, and demands more understanding to use it effectively.

**Epilogue**

Check out [DynAOP](https://dynaop.dev.java.net/). I discovered this after going into proxy. But it does promise to be better than palin Java `Proxy`. Of course, Proxy is as minimal as you can get.

After the long wait for 1.5, we have to wait for 1.6 now. Java IS interesting! Let us hope that the recent [press release](https://www.eweek.com/article2/0,1759,1560909,00.asp) with Microsoft, is only for Java's good, if not for Linux. Few more interesting ideas and debates are brewing. I hope, I can share it soon. Man! if at all you want to learn new things, don't go hunting for a new teacher, just stick your head for new problems. Believe me when I say, that necessity is the mother of invention.

