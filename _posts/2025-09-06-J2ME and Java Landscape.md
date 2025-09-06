&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # J2ME and Java Landscape

How J2ME programming model relates to J2SE, J2EE and Java in general?

*S V Ramu (2003-10-14)*

**Prelude**

It all started with the good fortune of getting a [Nokia 6610](http://www.forum.nokia.com/devices/6610) handset for GPRS connection, thanks to my employer. Though I primarily use it as a modem and not so much as a cell phone, the fact that it is java enabled, prompted me to try that out. This being the first time ever that I come anywhere near J2ME, the process was bit frustrating but very exciting. The verdict is, J2ME is cool and pretty easy!

As usual, the goal is not be a tutorial, but to be a survey of the terrain. There are many good tutorial out there in web, of which I'll point to some. But more importantly, I'll focus on one key point that pestered me while starting in this area. That is "How is J2ME platform different from J2SE, which we are used to?". Once this is answered, I felt lot of the general Java skills can be immediately applied, knowing fully well, the limitations of J2ME.

**Nokia 6610 cellular phone**

The first thing that I did, is what any new buyer of cell phone would do: explore the ring tones! My handset was quite capable, as the GPRS phones are normally bit costly, and are high end ones, than the regular cell phones. This phone comes with a [PC connectivity software](http://www.nokia.com/nokia/0,8764,4311,00.html) and a [USB cable](http://www.nokia.com/nokia/0,5184,5445,00.html) to connect the PC to the phone. The PC end of the cable connects to a USB port and the Nokia phone end has a [PopPortTM](http://www.nokia.com/nokia/0,4879,4629,00.html), which is unique to Nokia, and is common to all its new phones and accessories. So with this, I could upload 4 track polyphonic midi song files to the phone. This is really cool.

As said before, I use this phone primarily for its GPRS facility, which allows me to be always online (well, nearly always), with minimum fixed cost. [GPRS](http://www.gsmworld.com/technology/gprs/index.shtml) (General Packet Radio Service) is a protocol, over the regular [GSM](http://www.gsmworld.com/technology/index.shtml) (Global Mobile System) phones.

General Packet Radio Service (GPRS) enabled networks offer 'always-on', higher capacity, Internet-based content and packet-based data services. This enables services such as color Internet browsing, e-mail on the move, powerful visual communications, multimedia messages and location-based services.

[GSM World](http://www.gsmworld.com/technology/gprs/index.shtml)

For the uninitiated, the GSM phones have the usual 10 digit phone numbers that are globally unique, in contrast to the [CDMA](http://www.cellular.co.za/cdma.htm) (Code Division Multiple Access) devices, for [WLL](http://www.iec.org/online/tutorials/wll/) (Wireless Local Loop) applications. In India, CDMA phones for WLL use, like land line, has only max of 8 digits.

Sometimes called radio in the loop (RITL) or fixed-radio access (FRA), WLL is a system that connects subscribers to the public switched telephone network (PSTN) using radio signals as a substitute for copper for all or part of the connection between the subscriber and the switch. This includes cordless access systems, proprietary fixed radio access, and fixed cellular systems.

[IEC](http://www.iec.org/online/tutorials/wll/)

Both GSM and CDMA are competing technologies for the cellular transmission. WLL is a local wireless connection to a network, and barring politics, can be used with both CDMA and GSM.

Since WLL is a wireless access method that uses radio waves to connect the subscriber to a local central office, it can be implemented alongside a regular PSTN (Public Switched Telephone Network), or be combined with digital wireless technologies, such as CDMA (Code Division Multiple Access) and GSM.

[ZDNet](http://www.zdnetindia.com/news/features/stories/89814.html)

This is only the general overview. If you can write a novice friendly original article in this area, please do. We would be happy to publish it.

**Java landscape**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/bbd5d69c39d0afaf7a99683bac031f75.jpg)

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/ea8da3571e41048801162dfa318be693.jpg)

The picture in the left summarizes it all. This is my adaptation of the the original picture that is available in the [J2ME Data Sheet](http://java.sun.com/j2me/j2me-ds.pdf). Basically there are three reasons to draw afresh: one of course I didn't want to consider any copyright issues, secondly that is too rich and curvy for this site, and thirdly, and importantly, it depicts the J2EE as a separate stack. From what I see, every edition of the J2EE release depends fully on the latest (well, almost) available J2SE release. For example, the upcoming [J2EE 1.4 beta 2 requires J2SE 1.4.1_02](http://java.sun.com/j2ee/1.4/download-beta2.html). So I understand, the idea of showing J2EE as a separate stack is only to reiterate maybe Sun's intention of growing J2EE as independent of J2SE. What would that mean? That means some part (package, class or restrictions) of J2SE may not be applicable to J2EE? I seriously doubt this, if history is any indicator J2EE will always be a superset of J2SE. Hence this diagram, where J2EE is stacked over J2SE. It is also compact, as a side effect. I'm always intrigued by the thin line that separates a Language and its API. This is not with Java alone, even in C and pascal, there are basic methods, or libraries, which are integral to the language (like `malloc()`). In java, classes like `Object` are such integral API pieces that the language syntax (`class`) depends upon. `catch` depends upon `Throwable`. In the upcoming J2SE 1.5 the enhanced `for` (or foreach), depends on a new interface called `Iterable`. So much so, Java has made the whole of `java.lang.*` package as basic to the language and hence will be automatically imported ([JLS 2ed 7.5.3 Automatic Imports](http://java.sun.com/docs/books/jls/second_edition/html/packages.doc.html#26741)) in any java file you write (which is 4 interfaces, 32 classes, 24 Exceptions, and 22 Errors, as of 1.4.2). These classes "are fundamental to the design of the Java programming language", and relate to the basic OOP underpinnings, primitive-wrapper datatypes, Math-String handling, System operations like threads, and importantly Exception handling mechanisms.

All this time I'm talking about basic Java. The usual way the java language is extended to a specific programming model is by

*   Creating new packages/classes which only depend on the already existing classes, and some more
*   Sometime, for more fundamental features, Sun create a JNI based native code link to the OS resource.
*   And rarely they create a language change. Like, in J2SE 1.4 they introduced a new keyword `assert` and in 1.5 they will be introducing `enum`. Apart from these they can from time to time introduce non-keyword syntax and semantics to enrich the language. Like the nested classes in 1.1, and generics et al in 1.5.

This order is also representative of the degree of impact of the changes to the developer. Lower the change, more fundamentally a developer should realign their programming practice. A simple API change (1, and 2 above) just require an import, and appropriate usage of the API. The second type changes can many times be only a performance and stability change, and the developer may not need to know much more than the API. In this line, we can consider a 0th level change, which is only an JVM implementation change. This will not be even known to the developer, but they will reap benefit in performance or stability or both.

**The basic trinity of Java platforms: J2SE, J2EE, and J2ME**

As the number of API's of java grew, the confusion of which is mainly for server programming, which is for regular client programming, and which is for small devices programming, became glaring. There were plethora (more than few hundreds) of [JSR](http://www.jcp.org/jsr/overview) (Java Specification Request), but not all are required for everybody. So the whole java programming is now separated into 3 broad editions.

*   [J2SE](http://java.sun.com/j2se/) :The Standard edition, is the central one, and the usually known one to a developer. This is the basis for Java Plugin, which is the basis for a machine to claim being Java enabled.
*   [J2EE](http://java.sun.com/j2ee/) :The Enterprise Edition, for server based applications like Servlet/JSP, EJB, JMS etc. Usual java product users won't need these in their machine. All they need is the java runtime engine, of J2SE, in the form of Java Plugin.
*   [J2ME](http://java.sun.com/j2me/) :The Micro Edition, for small digital equipments. These are the upcoming wearable computers. Instruments like pager, phones, PDA, etc. which don't look like a computer, but pack most of those power in a small size. J2ME is in fact a wrapper name for all the standards and tools for this domain. In some sense, it is is not as homogeneous as J2SE or J2EE.

In a way, each of these editions (category), specify their own central native executable called VM, which glue the java byte code to the native OS. The APIs that are defined along with the VM specification, is to ease and abstract the intricacies of the native chip and OS, to the developer, and thereby achieving the holy goal of java, [WORA](http://java.sun.com/features/1997/aug/wora.html) (Write Once, Run Anywhere, [more details](http://java.sun.com/features/1998/01/wora.html)). J2EE's VM depends fully on the J2SE VM, and builds extra features on it. Since J2EE is a superset of J2SE, all that is below is included, with some more. But J2ME is not so clean, as you go down in the size of the equipment for which you program, the memory and speed become lower and lower, and hence many of the useful features of J2SE cannot be available in J2ME. *This includes even some language features*! J2ME, hence is more an integrated concept, rather than a unified product.

As you can see in the figure, there are three ingredient to a java environment.

*   *Native OS:* On which the whole JVM is layered. Usually this is coded in C/C++ nowadays, as assembly is relegated to more obscure performance related or CPU specific areas. Java has no control here.
*   *The Java's VM:* This is the glue that binds our Java Bytecode to the Native OS. The VM spec + the Java Language spec together define the base platform.
*   *The Core API:* This is defining API for the platform. For J2SE, the whole 130+ packages (and 2700+ classes/interfaces) of 1.4.2 defines the JVM, language and the Platform.

**J2ME**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/6ece8bbdf1dacc1e3995fd6861a148ea.jpg)

A highly optimized Java runtime environment, J2ME (Java 2 Platform, Micro Edition) technology specifically addresses the vast consumer space, which covers the range of extremely tiny commodities such as smart cards or a pager all the way up to the set-top box, an appliance almost as powerful as a computer. [Sun J2ME](http://java.sun.com/j2me/)

Coming to the core issue of J2ME, let us first try to map the ingredients of J2ME in comparison to Java in general. First you must remember, there are almost [infinite varieties](http://wireless.java.sun.com/device/) of small devices for which Java (J2ME) can be used. There are pagers, cell phones, PDA, Set Top boxes, even your own custom made robots, and many more. How can one software give the API for all these devices? You can't. For example, most cell phones have a way to vibrate when a call comes. There is a java API for doing this programmatically, but what use could this be to your say, coffee maker or set-top boxes? That is why, the whole J2ME arena is divided into many parts. Where, few parts can be used individually or together, and few others cannot be.

Although it would be nice to have the entire J2SE Application Programming Interface (API) available on a micro device, it's not realistic. For example, a mobile phone with its limited display cannot provide all the functionality available in the Abstract Window Toolkit, the first graphical user interface released with Java.

[Core J2ME Technology and MIDP](http://www.phptr.com/)

**Virtual Machines: JVM, KVM, CVM**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/7fe8a1dba965459dd8116695e9c80bf7.jpg)

The J2ME is divided into the *VM* of its own (JVM, KVM, CVM), then the core API called the *Configuration*, the linguistic abilities of Java, which are very related to the VM implementation itself, and then the *Profile*, which depend upon the Configuration, and add more vertical (device dependent) capabilities to the platform. Beyond this you can have many *Optional Packages* (like an API for Bluetooth etc.), which can be added to suite your need. Of course there are dependencies between the profiles and the Configuration. For example the MID profile need CLD Configuration (more latter). And FP can only run with CDC, and not with CLDC. The Virtual machine, is the implementation backbone of the Configuration. It does many things that a Configuration needs, and the rest is handled by the classes. So much so, that people say that a VM is just an implementation of the Configuration for which it was written to support, and hence in the the modified J2ME stack image, we've clubbed configuration with the VM. The full blown JVM is what we know, as used in our J2SE 1.4.2 SDK, and which conforms to JLS 2.0. But Sun has two more VMs. One is the KVM, The Kilobyte Virtual Machine, which occupies barely 40-80kb of memory, 20-40kb of heap, and can run with 25mhz 16bit CPU. That is small. Then a CVM: Card VM, is smaller than that!

A configuration defines a Java platform for a 'horizontal' category or grouping of devices with similar requirements on total memory budget and other hardware capabilities. More specifically, a configuration:

*   specifies the Java programming language features supported
*   specifies the Java virtual machine features supported
*   specifies the basic Java libraries and APIs supported

...In J2ME, a Java virtual machine implementation and a configuration specification are very closely aligned. Together they are designed to capture just the essential capabilities of each category of device. Further differentiation into device families is provided with the additional APIs specified at the profile layer. To meet the need of new and exciting applications, profiles can be augmented with additional Java class libraries.

[KVM Whitepaper](http://java.sun.com/products/cldc/wp)

Currently J2ME has two configurations defined through JCP. *CDC* : Connected Device Configuration, *CLDC* : Connected Limited Device Configuration.

**CDC: Connected Device Configuration**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/7c564895f91a8fa7606eec2a0c35b84f.jpg)

**CDC supports the full Java 2 virtual machine specification, including floating point support and core library features such as full class loading, thread support and security.** At the class library level, CDC uses J2SE class libraries whose implementations have been optimized for small memory environments. In the interest of resource conservation, some J2SE-based class libraries have modified interfaces, while others have been removed entirely. The result is a flexible Java application environment that fits comfortably within a memory budget of 2 MB of RAM and 2 MB of ROM. [CDC Whitepaper](http://java.sun.com/products/cdc/wp/cdc-whitepaper.pdf)

CDC-based technology is intended for use with a broad range of consumer and embedded devices like smart communicators, pagers, personal digital assistants (PDAs) and set-top boxes.

[Sun CDC](http://java.sun.com/products/cdc/)

"CDC was designed around the two goals of J2SE compatibility and support for resource constrained devices. J2SE compatibility allows developers to leverage their investments in J2SE technology, including libraries, tools and skills". So for most practical purposes, the programming with CDC is similar to programming with J2SE. Except for restriction in using few of the rich APIs of J2SE. For a wonderful comparison of CDC vs. J2SE API, see the [CDC API Comparison](http://java.sun.com/products/cdc/api.html). The key thing to remember is that, java language wise, and JVM wise there is no difference between CDC and J2SE. Only the API support differ.

Few of the major differences between CDC 1.0 and J2SE 1.3.1 are:

*   Deprecated methods have been removed. That by itself can reduce lot of foot print.
*   `java.lang.*, java.io.*, java.net.*, java.util.*, java.security.*, java.text.*` are identically supported.
*   If you add Personal Profile and everything below it, the CDC supports `java.applet.*, java.math.*` identically. Thus profile act as the optional parts, for the CDC to be almost full blown J2SE.
*   Also with Personal Profile, the CDC supports partially or optionally, `java.awt.*, java.beans.*, java.rmi.*, java.sql.*`. Sometime though similar actions can be performed, the classes and signatures will be replaced to reflect the small resource needs of CDC.
*   Most of the javax packages like `javax.accessibility.*, javax.naming.*, javax.rmi.*, javax.sound.*, javax.swing.*, javax.transaction.*, org.omg.*`, donot have any support in CDC. As these are too heavy for it. And afterall J2ME is a client side platform, infact for resource costrained clients.
*   Since it is mainly for 'connected' wireless devices, support for `javax.microedition.io.*, javax.microedition.xlet.*` is included, which are the API's of CLDC.

A **profile** is a set of standard APIs that support a narrower device category within the CDC framework. A specific profile is combined with a configuration like CDC to represent a complete Java application environment. CDC supports three profiles for different product scenarios.

[Sun CDC](http://java.sun.com/products/cdc/)

*   [Foundation Profile](http://java.sun.com/products/foundation) *(FP):*
    *   J2SE-based class library
    *   no GUI support
    *   CLDC 1.0 compatibility library
*   [Personal Basis Profile](http://java.sun.com/products/personalbasis) *(PBP):*
    *   lightweight component support
    *   xlet support
    *   Foundation Profile APIs
*   [Personal Profile](http://java.sun.com/products/personalprofile) *(PP):*
    *   full AWT support
    *   applet support
    *   migration path for PersonalJava technology
    *   Personal Basis Profile APIs

With the support of Optional Packages (OP), CDC supports complete [JDBC 3.0](http://java.sun.com/products/jdbc) for database connectivity, and almost complete [RMI OP](http://java.sun.com/products/rmiop/), for inter VM communication, and Web services. Bottom up, each of the above three profile is a superst of one above. Thus 'J2ME Personal Basis Profile includes all of the APIs in Foundation Profile'.

Apart from these, XLet is the application model derived from Java TV APIs. `javax.microedition.xlet.*, javax.microedition..xlet.ixc.*` allow programming with XLets.

**The -let-s of Java World**

You should have heard many `let`s in Java: Applet, Servlet, Midlet, Doclet, XLet. All these are application models and classes with these names are the starting point of that type of applications. For example Applet intiate and controls a client side web based application. Servlet does the same for server side. Midlet come in CLDC. XLet in CDC PBP. Doclet, is to generate JavaDoc from java files.

**At last! CLDC: Connected Limited Device Configuration**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/c571006671b02d58a452dbde72b26172.jpg)

CLDC is the foundation for the Java runtime environment targeted at small, resource-constrained devices, such as mobile phones, pagers, and mainstream personal digital assistants. CLDC, combined with the Mobile Information Device Profile (MIDP), is the Java runtime environment for today's resource-constrained mobile information devices (MIDs) such as phones and entry level PDAs. [Sun CLDC](http://java.sun.com/products/cldc/)

Well, this is the area I used for Nokia 6610 programming that I was talking at the start of this article. And this is the area, that prompted me to search all these J2ME stuff, to help place it in perspective to a J2SE developer. Most of the J2ME programming you'll see will relate to CLDC. As CDC devices are not many, and is not user-programmable right now, IMHO. Somehow, creating a game or application for our cell phone holds more potential use and charm to us, than doing that for SetTop boxes. But in fact the line is thin!

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/1b58be105b4fdfb963ea837143489aa7.jpg)

There are PDAs which have CDC capabilities, and some high end cell phones too, which are just a PDA in disguise. In fact PDA is the dividing line between CDC and CLDC, based on their memory and speed. CLDC is highly constrained from a J2SE perspective, but is well endowed if you consider that we are dealing with memories like 128kb. Starting with CLDC and below (JavaCard), the whole of Java language as we see in J2SE cannot be implemented, and hence the JVM spec too cannot be adhered fully. So a constrained Kilobyte VM (KVM) is used exclusively for CLDC implementation.

As to the general relation between CLDC and J2SE, the Sun's KVM Whitepaper puts it very illustratively. It goes on to add, 'Classes outside J2SE may not use the `java.*` name space'. As you can see, as we go down to smaller devices, less and less of Java's language, JVM spec and APIs can be supported. Also note from the figure, that CDC is a full superset of CLDC, and also support a lot more of J2SE, in fact the whole of JVM spec. On the other hand CLDC has many restrictions even in the Java language that it allows.

A Java VM supporting CLDC shall be compatible with Chapters 1 through 17 of *The Java Language Specification*...:

*   **No support for floating point data types (float and double).**
*   No support for finalization of class instances. The method Object.finalize() does not exist.
*   Limitations on error handling. Most subclasses of lava.lang.Error are not supported. Errors of these types are handled in an implementation dependent manner appropriate for the device (in contrast, CLDC includes a fairly complete set of exception classes.).

A Java VM supporting CLDC shall be compatible with the Java Virtual Machine as specified in *The Java Virtual Machine Specification*:

*   **No support for floating point data types (float and double).**
*   No support for the Java Native Interface (JNI).
*   No user-defined, Java-level class loaders.
*   No reflection features.
*   No support for thread groups or daemon threads.
*   No support for finalization of class instances.
*   No weak references.
*   Limitations on error handling.

...floating point support, which has been omitted primarily because the majority of the CLDC target devices do not have hardware support for **floating point arithmetic**, the features above have been eliminated either because of **strict memory limitations**, or because of potential security concerns in the **absence of the full J2SE security model**.

[KVM Whitepaper](http://java.sun.com/products/cldc/wp)

But considering the low memory environments, it is amazing that they still allow Threads (of course they say, without preemptive multitasking, you have to `yield()` to call another thread), General exception handling, Garbage collection, full OOP model. Well this is lot more that the regulation C environment, which is still the king for the down to the metal programming. Though, as a normal J2SE programmer, you won't miss the absence of weak references, finalization, and many Errors, the absence of Reflection can be sometime pinching for some nifty programs. But in my Nokia 6610, where the maximum application jar can only be 64k, there is anyway not much room for so much modularity. These programs are mean with resources. Apart from the language and the VM restrictions, the biggest will be the absence of many many J2SE packages.

Just the three basic packages are included in the CLDC API set. `java.lang.*, java.util.*, java.io.*`. *Even within these packages, very few key classes are supported, and even in those classes only a subset of methods are supported*.

| `java.lang.*`     | `Object, Class, Throwable`<br>`Runtime, System, Thread, Runnable`<br>`String, StringBuffer`<br>`Boolean, Byte, Short, Integer, Long, Character`<br>`Math`<br>`Error, VirtualMachineError, OutOfMemoryError`<br>And most of the exceptions are supported. |
| :----------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `java.io.*`       | `InputStream, OutputStream, ByteArrayInputStream, ByteArrayOutputStream, DataInput, DataOutput, DataInputStream, DataOutputStream, Reader, Writer, InputStreamReader, OutputStreamWriter, PrintStream`<br>`EOFException, IOException, InterruptedException, UnsupportedEncodingException, UTFDataFormatException`<br>Pretty much all important ones. Of course CLDC donot have a file system and hence all file related classes will be missing. |
| `java.util.*`     | `Vector, Stack, Hashtable, Enumeration`<br>`Calendar, Date, TimeZone`<br>`Random`<br>`EmptyStackException, NoSuchElementException`<br>                                                                                                                                                  |
| `javax.microedition.io.*` | `Connection, InputConnection, OutputConnection`<br>`StreamConnection, StreamConnectionNotifier`<br>`Datagram, DatagramConnection`<br>`ContentConnection`<br>`Connector`<br>                                                                                                             |

**MIDP: Mobile Information Device Profile**

That is pretty much all you have to program with CLDC alone. To be honest this is a decent set, and you can code interesting stuff with these. But you seldom need to do with CLDC alone. Most cell phones come with an extra package set called [MIDP](http://java.sun.com/products/midp/) (there is now two MIDP versions), which adds extra classes which are either an alternative to the ones available in J2SE, or, are specific to most cell phones and PDAs (Mobile Information Devices, MIDs).

At the implementation level, a **profile** is defined simply as a collection of Java APIs and class libraries that reside on top of a specified configuration and that provide the additional domain-specific capabilities for devices in a specific market segment.

In our example above, each of the three families of devices (cell phones, washing machines, and intercommunicating toys) would be addressed by a separate J2ME profile. Of course, the only one of these profiles in existence at the current time is the MIDP, designed for cell phones and related devices.

[KVM Whitepaper](http://java.sun.com/products/cldc/wp)

The Mobile Information Device Profile (MIDP), combined with the Connected Limited Device Configuration (CLDC), is the Java runtime environment for today's mobile information devices (MIDs) such as phones and entry level PDAs. What MIDP provides is the core application functionality required by mobile applications - including the user interface, network connectivity, local data storage, and application lifecycle management - packaged as a standardized Java runtime environment and a set of Java APIs.

[MIDP](http://java.sun.com/products/midp/)

| MIDP 1.0       |
| :------------- |
| MIDP 2.0.\*      |
| `javax.microedition.io`   |
| `javax.microedition.lcdui`  |
| `javax.microedition.midlet` |
| `javax.microedition.lcdui.game`    |
| `javax.microedition.media`    |
| `javax.microedition.media.control` |
| `javax.microedition.pki`    |
| `javax.microedition.rms`    |

It is important to note that there are lot of overlap in packages, classes and methods in the CLDC 1.0, MIDP 1.0 and MIDP 2.0. For example the package `javax.microedition.io` is introduced in CLDC 1.0 itself, yet MIDP 1.0 adds more classes to it (especially HttpConnection and other protocol related stuff). Then again MIDP 2.0 adds security related classes to the same package (HttpsConnection). Also sometime the latter version introduces a new method, in an laready existing class. For example, `javax.microedition.midlet.MIDlet` was introduced in MIDP 1.0, but MIDP 2.0 introduces `platformRequest(String)` and `checkPermission(String)` into this class.

Apart from MIDP, there are many Optional Packages for CLDC, like (to name a few),

*   [Java Technology for Wireless Industry](http://java.sun.com/products/jtwi) (JSR-185)
*   [Mobile Media API](http://java.sun.com/products/mmapi) (JSR-135)
*   [Wireless Messaging API](http://java.sun.com/products/wma) (JSR-120)
*   [Bluetooth API](http://jcp.org/jsr/detail/82.jsp) (JSR-82) by [Motorola](http://e-www.motorola.com/webapp/sps/site/taxonomy.jsp?nodeId=03M0ym4sDZxM0zZ6m1Y6)
*   [Location API for J2ME](http://jcp.org/jsr/detail/179.jsp) (JSR-179)
*   [Mobile 3D Graphics](http://jcp.org/jsr/detail/184.jsp) (JSR-184)

For more details into the exact differences between various, Configurations and Profiles read [J2ME Technical Overview](http://tattvum.com/Articles/2003/2003-10/2003-10-19/java.sun.com/javaone/javaone2001/pdfs/2267.pdf) by Jesus David Rivas and Roger Riggs. This is elaborate and a good starting point for a comparative study. Of course above all you can download the [J2ME Wireless Toolkit 2.0](http://java.sun.com/products/j2mewtoolkit) itself, and explore the API doc and also run few demo programs that comes with it and runs inside a phone-like emulator. Very illustrative stuff.

**JavaCard**

![Java Landscape](/assets/images/J2ME%20and%20Java%20Landscape/ff94dc02d9f18860199d709f0629b9a7.jpg)

If, like me, you are thinking, programming to a pager or a cell phone is ridiculous enough, then programming to a chip embedded, visiting card size, smart card was a complete joke. If My 6610 can only take an application jar of size 64k max, and only three like that totally, what can we meaning fully do with a smart card, with memory as low as 16k or lower? This is what [JavaCard](http://java.sun.com/products/javacard/) tries to accomplish. [An article on Java Card 2.0](http://www.javaworld.com/javaworld/jw-03-1998/jw-03-javadev_p.html) specification says, 'the minimum system requirement is 16 kilobytes of read-only memory (ROM), 8 kilobytes of EEPROM, and 256 bytes of random access memory (RAM)'. We are talking that low! Well this is a very nascent area for me, and I think for the industry too, relatively. For a quick preview try this [java world article](http://www.javaworld.com/javaworld/jw-07-1999/jw-07-javacard_p.html). The APDU (application protocol data units) form the basic protocol of communication between the card and the reader, standardized by ISO 7816. Basically the idea is you write your java card application, and upload it into it, and a card reader application, together with that which is inside the card, by communicating with APDU, will do something useful.

Following packages and classes are only used. As you'll see, it is a very very small subset of J2SE, and understandably so.

| `java.lang.*`   | `Object, Throwable`<br>And some 9 exceptions. Thats it!     |
| :-------------- | :--------------------------------------------------------------- |
| `java.io.*`     | `IOException`<br>Yes only that!                                  |
| `java.rmi.*`    | `Remote`<br>`RemoteException`<br>                               |
| `javacard apis` | `javacard.framework.*`<br>`javacard.framework.service.*`<br>`javacard.security.*`<br>`javacardx.crypto.*`<br> |

The following words should be familiar by now.

While Java Card technology enables programs written in the Java programming language to run on smart cards, such small devices are far too under-powered to support the full functionality of the Java platform. Therefore, the Java Card platform supports only a carefully chosen, customized subset of the features of the Java platform. This subset provides features that are well-suited}
