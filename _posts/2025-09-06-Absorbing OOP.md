&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Absorbing OOP...

My journey towards OOP absorption
*SB Senthil (2002-06-04)*

![](Absorbing%20OOP/1360587c3eaf22ef31ef653108a15cab.jpg)

**Prelude**

This Article talks about my experience with OOP. It takes much time to become a programmer and much more to design in OOP. I was first introduced to programming in Foxpro, a procedural language. Then it was C, and after a while C++; where I heard this jargon *OOP*.

**More jargons**

Then in C++ there was a shower of jargons: Class, Object, Virtual, Abstract, Overloading, Friend, Inheritance, Encapsulation, Polymorphism, Template, etc. Each jargons have individual meaning and functionality, but everything looked like a nightmare to me! I used C++ more as a procedural language than as object oriented. I did many graphics programs which were more interesting; and few samples for each jargon, without knowing the real use of it.

**Thanks to Delphi**

My first professional programming language was [Delphi](http://www.borland.com/delphi) (a Object Pascal based Integrated Development Environment from [Borland](http://www.borland.com/)). Delphi is a Object Oriented Programming language. But I followed my own C++ trick here and used it again as a procedural language. After a year and a half I started developing custom components for a project, which become an eye opener for me towards OOP. I understood all the jargons and my nightmare were driven away. It was a very short learning curve; hardly a month (credits goes to my friends and Delphi's source code). Even though I understood OOP very well, I used it for only component development and not in my project domain.

**My First OOP**

After few months I was working on code and performance optimization of a project. There was a tree design for main screen where modules and sub modules were listed, and a double click invoked them. The same tree design was there in a security module also, to enable and disable users. This commonality lured me to induce OOP (the first *Class* I wrote for my project domain!) I created a base abstract tree class which had all the common functionality, from which I inherited a SecurityTree and a ModuleTree. A simple idea but after this I extensively used Encapsulation, Inheritance and Polymorphism.

**New Jargon: Interface**

*Interface* at the first sight looked as strict Abstract class without any implementation. But this was supposed to be a replacement for multiple inheritances. When I dug out the real use of Interface it was amazing. The key feature of Interface is it can be implemented by *many* classes (i.e. unlike abstract classes this can be implemented by *non-hierarchical* classes), and one class can implement many interfaces. The impact of interface changed my application design drastically. I started designing more in interface than classes. This gave my application more flexibility than never before. Polymorphism was used to its limits.

**Design patterns**

Design patterns by GOF illustrate 23 patterns which represents good object oriented design practices. This greatly reduced the work of the application architect; as they can just say the name of a pattern, instead of explaining the whole class interactions. Abstract Class is a class which has an abstract member. Similarly, Abstract Factory is a pattern which create an abstract class without specifying the concrete class. After enough maturity in OOP and Design Patterns, Now I simply follow the old OOP rule 'Remove what is changing from what is not changing', and design the application. Only after all this I check whether they fit into any pattern.

**My First OOD**

My first Application required sending the data from a department to a Service (a website) where the data is published. There are many departments and many services. One department can send data for many services, and one service can get data from many departments. Each service will need that data in its own format and protocol.

*   Each department should be able to specify the services to which they publish lines. The Departments should be externally configurable.
*   These services should be externally configurable too, with their Protocol (FTP, HTTP and SOCKET), IP-Address, and the Port number.
*   The Database and the server name should be externally configurable.
*   The interval for the periodic sending of lines should be configurable

**Finale**

At this juncture of my journey in OOP, I would say "OOP is a wild Horse! It takes much time to tame, but it can win you in the long run". This is my philosophy with OOP. The above application (my first OOD), after its initial version, has under gone hundreds of changes in user requirements, from various clients, and yet the architecture withstood all these modularly. The application is up and running still!
}