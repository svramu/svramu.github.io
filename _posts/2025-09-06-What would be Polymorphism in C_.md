&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # What would be Polymorphism in C ?!

Trying out function pointers and DLL to mimic Java Interfaces

*S V Ramu (2003-04-20)*

**What is Polymorphism? - from Bruce Eckle**

Some books, even till few years back, treat function overloading as a form of Polymorphism. They even gave a name *static polymorphism*, maybe to give an aura of authenticity. Of course, Poly-Morphism means 'many forms', so can we say that function overloading, which has same function name, but different signatures, as polymorphic? If so, maybe we should say, that all human beings are dogs, or maybe pigs. Because humans, dogs and pigs are all mammals. Stretched to its limits, anything can be compared and equated to anything else. Apart from being philosophical, it makes little sense to define things, based on their commonalities. It is best if the definitions use the unique features of a concept. For polymorphism it is the 'late binding'. Function overloading is at its best, a syntactic sugar. It is fairly easy to exist without function overloading with just naming conventions, but it is pretty much impossible for any regular programmer to simulate late-binding without language aid called polymorphism.

[Bruce Eckle](http://www.mindview.net/) is a popular and an inspiring figure for anybody coming into C++ or Java. His unique way of going right into the design matters of the language, while teaching the language itself, is a treat to any programmer who is new to that language. Especially if you know programming already, then his nuggets of reasoning on the language design is a real treat. His initial work on C++ and then on Java, are both phenomenal in their coverage and depth. These books don't pretend to be the specification of the language, but as a guided tour of their unique features and quirks, with their historical and logical underpinnings. The following are extracts from two of his famous books: Thinking In CPP (ticpp) and Thinking in Java (tij), which are downloadable for free as soft copy from his [www.MindView.net](http://www.mindview.net/). This is what he has to say about Polymorphism.

...it's impossible to understand, or even create, an example of polymorphism without using data abstraction and inheritance. Polymorphism is a feature that cannot be viewed in isolation (like const or a switch statement, for example), but instead works only in concert, as part of a "big picture" of class relationships. *People are often confused by other, non-object-oriented features of C++, like overloading and default arguments, which are sometimes presented as object-oriented. Don't be fooled; if it isn't late binding, it isn't polymorphism.*

**ticpp ed 2 vol 1 chap 15**

In this chapter, you'll learn about polymorphism (also called dynamic binding or late binding or run-time binding) starting from the basics, with simple examples that strip away everything but the polymorphic behavior of the program.

**tij ed 3 rev 4 chap 7**

Note the unmistakable tone of confidence in these words. This is a rare one. It takes two things, one a clear logical analysis, and two a passion for sharing that analysis. I usually go for the small paragraph summaries that he provides after his examples. That is when he is at his inspiring best. In very few words he crystallizes the page-long examples that he provides. In the following extract he brings out a very typical case where polymorphism shines. Hence it also is a defining example of polymorphism.

Connecting a method call to a method body is called binding. When binding is performed before the program is run (by the compiler and linker, if there is one), it's called early binding. You might not have heard the term before because it has never been an option with procedural languages. C compilers have only one kind of method call, and that's early binding.

...The solution is called late binding, which means that the binding occurs at run time, based on the type of object. Late binding is also called dynamic binding or run-time binding.

Because of polymorphism, you can add as many new types as you want to the system without changing the [called] method. *In a well-designed OOP program, most or all of your methods will follow [this] model and communicate only with the base-class interface. Such a program is extensible because you can add new functionality by inheriting new data types from the common base class. The methods that manipulate the base-class interface will not need to be changed at all to accommodate the new classes.*

**tij ed 3 rev 4 chap 7**

Well, it can't be put any clearer. Concepts are abstract. They can only be seen in as many different views as possible, and yet can always be explained further. But once you see it for yourself, the expression can be yours. I would be considering a very basic but clear example of polymorphism here.

**A simplest but authentic polymorphic example**

Consider the following scenario of one interface, two implementing classes and one using application class, modeled in UML using [BlueJ](http://www.bluej.org/). For simplicity, there is only one method in the interface, and hence in the two derived classes is:

    int calculate(int a, int b);

As you can see, the method just specifies that the two input ints are used for calculation and a new int is returned. Any operation can be performed on these two ints and hence the polymorphism is seen.

Note that this example is also illustrative of the potential danger of Function Pointers or Delegates. Here the interface itself suggest that there is no semantic ordering in the two inputs. But if we make a class with subtract operation, then a confusion arises, whether `a-b` is used or `b-a`? Here since the interface doesn't specify an order, the users of this interface should be cautious against assuming wrongly. Thus you can see, in case of function pointers, used from wrong or unrelated classes, the semantics can be a subtle source of errors. In case of interfaces, usually the interface's purpose declares or warns about the semantic implications, which is hard to get it inside the syntax. Anyway, here we just deal with a simple case, where these types of ambiguities doesn't matter. A calculation is a calculation, the semantics is up to the users and implementors of the class.

![UML Diagram](/assets/images/What%20would%20be%20Polymorphism%20in%20C%20/195b7615237a512abc10dc9249e4f2b8.jpg)

As you can see, BlueJ is a cool and surprisingly simple but powerful tool. It is mainly an educational tool to teach OOP (why do people say it as OOPs?! I feel they are confused with the American usage of shock). The great thing about this tool is, it allows you to create the classes, modify the code, compile it, and even instantiate and use it without any code. In the screen shot I've created an instance for each class, and I use the `calculat_1`, and use its method `calculateWithBlueJ`, with `add_1` or `mutiply_1`, and some value for the ints a and b, and get the result! Amazing tool indeed.

This is what the BlueJ people give as a reason for their tool. Remember it is not a full fledged UML tool, like RationalRose or ArgoUML, and yet it has a place for itself: For teaching OO with Java.

Java is a reasonably clean language, but by no means free of problems for introductory teaching. ...Two of the problems most often reported in the literature are: 1.problems with the main function, 2. problems with text I/O.

BlueJ solves both of these problems!

Many Java text books claim to use an "objects first" approach. We very much agree with this idea. In reality, most of the books then go on to explain some low level instructions first and get to objects and classes in chapter four. The reason is an intrinsic problem with Java: if you explain classes first, then you still need a way to execute the class's operations to see a result. And to do this you have to write some driver code. To write this code, you need to know some Java instructions.

Because objects can be created interactively, and methods can be called interactively, there is no need for a main function. Students can write classes and call their methods without a need to have a main. And because parameters can be passed to interactive method calls and results are displayed, there is no immediate need for I/O. Students can write and test very sophisticated code without the need for any I/O operations!

[Why BlueJ](http://www.bluej.org/why/why.html)

If you had been a teacher, or attempted to explain OOP to others, you can't help agreeing with these people. Pedagogy is surely an art and science, and these teachers are not just passive users of technology, but active contributors. Rightly done, teaching can be very enriching to all concerned.

**Polymorphism in Java**

Polymorphism in java is pretty straight forward. In fact puristic. Java doesn't consider methods as first-class citizens of its OO world. Methods have meaning only as a part of a class. If you want to pass a method as parameter, you have to create an interface and/or a class to pass that method. This is very distinct from the function pointer notion of C, Delphi (Object Pascal) or C#. The argument of Java, against using Delegates (the modern function pointers), is that implementing interfaces involves abiding by the unwritten semantics of an method. But Delegates only portrays method signature conformance. Now we'll create an interface with one method and implement it in two classes.

```java
public interface Calculate {
    int calculate(int a, int b);
}
```

```java
public class Add implements Calculate {
    public int calculate(int a, int b) {
        return a + b;
    }
}
```

```java
public class Multiply implements Calculate {
    public int calculate(int a, int b) {
        return a * b;
    }
}
```

To use these classes and demo the polymorphic behavior, let us create a simple, but a very powerful java application (a class with `main` method). Note how casually we convert the string class name into a class and then an instance of it, and then call it directly. (In VB6 with COM you do something very similar, but without the notion of class, as types are down played there. In COM we use the GUID or a suitably given name for creating an instance of the COM interface. In java you directly use the fully qualified name of the class).

```java
public class Calculator {
    public static int loadUsingInterface(String className, int a, int b)
                throws Throwable {
        Class loadedClass = Class.forName(className);
        //of course this class SHOULD implement the Calculate interface
        Calculate calculate = (Calculate) loadedClass.newInstance();
        return calculate.calculate(a, b);
    }
    public static void main(String[] args) throws Throwable {
        int a = Integer.parseInt(args[1]);
        int b = Integer.parseInt(args[2]);
        //the args[0] is the fully qualified class name to use
        int ans = loadUsingInterface(args[0], a, b);
        System.out.println(a+" "+args[0]+" "+b+" = "+ans);
    }
}
```

The key thing to note here regarding polymorphism is, you can create the `Add` and `Multiply` class well after the creation and compilation of the `Calculate` interface and the `Calculator` application. You can create as many implementation of this interface as required, and the original interface or application need not be touched whether in the source or the binary form. In fact, you can ship just the newly added class as and when you create, and the client just needs to know the newly available name to use. This is very powerful. The fact that Java creates one .class file, for each of the class you create is really an inflexibility, but a welcome one at that. Though one .java file can define as many classes as you want, on compilation it will create one class file for each class.

This implies that `class` (of course `interface` too, and in the up coming J2SE 1.5 we have `enum`) are the basic granules of an application. If you change a method, you have to change the whole class file. But unlike C DLLs (Dynamic Link Libraries, roughly equal to java packages), you need not replace a whole package for a small method change. So the unit of modeling, that is class, is also the unit of programming, and also the unit of deployment! A remarkable simplicity indeed. The crowning glory of all these is, each of these class are polymorphically dependent on each other. That is, as long as the method signature of the class doesn't change, the classes dependent on this method can happily use it, even after we replace this class with better or different behavior. Binding to classes dynamically, in runtime, is what is polymorphism. But having the ease of loading the class itself dynamically, and then dynamically binding to it through an interface is a added usefulness.

There is also one alternative ugly way to do the same thing. Through RTTI (Run Time Type Identification), or 'Reflection' in java lingo. For this you need to import `java.lang.Method` class. The following `loadUsingReflection` method can be used in place of the previous method using Interface. The signature is same, just the code inside is different, but producing the same result.

```java
    public static int loadUsingReflection(String className, int a, int b)
                  throws Throwable {
        Class loadedClass = Class.forName(className);
        //of course this class NEED NOT implement the Calculate interface
        //It just need to have a method with the same siganture
        Method calculate = loadedClass.getDeclaredMethod("calculate",
                            new Class[]{ int.class, int.class });
        Integer result = (Integer) calculate.invoke(loadedClass.newInstance(),
                            new Object[]{ new Integer(a), new Integer(b) });
        return result.intValue();
    }
```

This is obviously ugly because, you do it with more code, complexity and above all danger. There is also a performance deficit. Then why we need this? Reflection is not for regular programming at all. If you use it, your code can degenerate into procedural programming and below. Reflection is for IDE and tool vendors, who want to use your classes in an unimagined way, to aid you while programming. One situation could be to show the list of methods while using a class, in an editor. jEdit's SpeedJava code assistance plug-ins use reflection.

To run these classes, use command line, go to directory in which you have these classes and type `java Calculator Add 2 3` or `java Calculator Multiply 2 3`. Both will produce different result. I assume that java.exe (maybe even j2se 1.1 should run this example) is in your path, and CLASPATH has . (current directory) in it. Come on! I assume you know how to run java application ;) You can download the zip file Tattvum-20030426-Polymorphism-java.zip, for the java sources and the binaries. The `Calculator` class in it contains another method called `calculateWithBlueJ` to allow being used directly with BlueJ.

**Polymorphism with Function pointers in C**

Due to Java's origin from C, the basic syntax of a method, loop etc. are refreshingly similar. The equivalent of .class file-like replaceable granularity in java, can be achieved in C, only through DLL. Since normal C calls are blazingly fast when compared to DLL calls, usually this granularity takes a back seat to performance.

```c
//Add.c
__declspec (dllexport) int calculate(int a, int b) {
    return a + b;
}
```

```c
//Multiply.c
__declspec (dllexport) int calculate(int a, int b) {
    return a * b;
}
```

As you can note, except for the ugly and cryptic `__declspec (dllexport)` thing, required for exporting the function into the DLL, everything else is same as java. Also note that we DO NOT need an interface, as conformance to a signature is not checked while compiling. This is similar to `loadUsingReflection` method in the java example. The equivalent method here in C is `loadUsingDLL`, just to convey that it uses DLL to load and call the method, but other wise it is similar in spirit to the reflection method in java example.

```c
//Calculator.c
#include <windows.h>
typedef int (*ptrFn)(int, int);
int loadUsingDLL(char *dllfile, int a, int b) {
    HANDLE dllHandle = LoadLibrary(dllfile);
    if(dllHandle == NULL) {
        printf("Unable to load the DLL.\n");
        exit(1);
    }
    ptrFn calculate = (ptrFn) GetProcAddress(dllHandle,"calculate");
    if(calculate == NULL) {
        printf("Unable to load the procedure.\n");
        exit(1);
    }
    return calculate(a, b);
}
```

The key thing here is the function pointer. Just like variable pointer, function pointer points to any function of specfic signature (inputs and return). Name of the function is unimportant. C has a nice feature of creating a named new type from a complex definition of type, which is used for structs mainly. Here we can use it to simplify the function pointer usage. `typedef int (*ptrFn)(int, int);` creates a type called `ptrFn`, which just says that it is a pointer to a function with two input ints and one return of int. Hence we can simply declare a function pointer variable like `ptrFn calculate`. By the way, just for completion, the main function is very similar to the java counterpart.

```c
int main(int argc, char *argv[]) {
    int a = atoi(argv[2]);
    int b = atoi(argv[3]);
    //the args[1] is the DLL name to use
    int ans = loadUsingDLL(argv[1], a, b);
    printf("%d %s %d = %d", a, argv[1], b, ans);
    return 0;
}
```

To run these c files, use command line, go to directory in which you have these files and type `Calculator Add 2 3` or `Calculator Multiply 2 3`. Both will produce different result. To build these examples, you need GCC in your path. If so you can build all these files into DLL and EXE, using the batch file `makeAllExecutables.bat`. It internally uses `makeDLL.bat` to build a given dll. As you could notice, the DLL and exe files are much larger when compared to the Java class files. In future, as the chip speed progress and JVM technology advance, this is where java can excel, as it is very compact and neat. I doubt if a Java developer will have GCC (GNU Compiler collection or GNU C compiler) at hand, so I'm bundling the .exe and .dll files with the source for you to download (Tattvum-20030426-Polymorphism-C.zip). It contains another generic file called `dllinit.c`, which is common for most DLLs you ever create and use.

**Epilogue**

Putting it grossly, what polymorphism gives for you is replaceable methods. Of course this is oversimplification, as we elide over all the design elegance it gives. But still, mechanically, polymorphism is just an elegant way of creating and using function pointers. This is what Bruce Eckle has to say about function pointers:

Once a function is compiled and loaded into the computer to be executed, it occupies a chunk of memory. That memory, and thus the function, has an address.

One of the more interesting constructs you can create is an array of pointers to functions. To select a function, you just index into the array and dereference the pointer. This supports the concept of table-driven code; instead of using conditionals or case statements, you select functions to execute based on a state variable (or a combination of state variables). This kind of design can be useful if you often add or delete functions from the table (or if you want to create or change such a table dynamically).

**ticpp ed 2 vol 1 chap 3**

The array (or a struct if you want) of function pointers is what can be compared to present day class. If a class is a collection of variables and functions, then since a function too can be represented as a (special pointer) variable, we can represent the class as an array of variables and function pointers. Can inheritance then be modeled as adding new function pointers, or replacing a old one?! Of course this doesn't give the elegance that a java like language provides, but for understanding the roots of OOP, function pointers, and arrays of it, is the key.

[Drive Folder](https://drive.google.com/folderview?id=17JYcWXtZ8vy-dw6AX7f54l8hEOlO1vOQ)
}
