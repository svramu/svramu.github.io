---
layout: post
title:  "The 'final' trick"
---

Helping the Java compiler to optimize the class file generation (2003-05-17, 2003-06-08)

**Prelude**

Well this is definitely not the last trick article, but an article on the Java keyword `final`'s usage. Have you wondered how Java can afford to not have a C/C++ like preprocessor? What is the real benefit of a preprocessor in a language? How does the the new J2SE 1.4 keyword `assert` relate to `final`? Have you been frustrated that inserting debugging `System.out.println` statements is sometimes a performance overhead, even when disabled? Where does AspectJ (or AOP in general) fit in these scenarios?

**Preprocessor macros: Inlining**

Preprocessor (say PP) is usually a black art. Always dangerous yet seemingly indispensable. Pre-processor directives, as the name suggest, is processed *before* the actual compilation begins. The C PP directives (or statements) is a sort of a scripting language, used within the C files, but forming a layer of its own. So ideally the same PP language (directives) can be used with other language files too (even Java! if you want). Two predominant use of it are 'Inlining' and 'Conditional Compiling'.

You can define constants with preprocessor using the `#define` directive in C.

```c
#define XYZ (3+3)
```

Then wherever you use `XYZ`, the *text* `(3+3)` is substituted by the PP. You must remember that the PP directives like `#define` is just a text substitution mechanism (or call it 'macros', to be polite). So how you define your replacing macro (here the macro name is `XYZ`) is important. For example, the following macro can behave very different from the above one (just removed the parenthesis).

```c
#define XYZ 3+3
```

Because the effect of calling the above macro from a C code, like,

```c
printf("XYZ = %i",XYZ*2);
```

can be very different. If it were with parenthesis it will be `(3+3)*2=12`, if not, it will be, `3+3*2=9`. This is what [Bruce Eckle](https://www.mindview.net/) has to say about using PP directives for constants.

```c
#define PI 3.14159
```

...

When you use the preprocessor to create constants, you place control of those constants outside the scope of the compiler. No type checking is performed on the name PI and you can't take the address of PI (so you can't pass a pointer or a reference to PI). PI cannot be a variable of a user-defined type. The meaning of PI lasts from the point it is defined to the end of the file; the preprocessor doesn't recognize scoping.

*ticpp ed 2 vol 1 chap 3*

Of course you can become creative with PP for other things like, function like macros, stringizing, string concatenation, and token pasting.

```c
#define FLOOR(x,b) ((x)>=(b)?0:1)

#define DEBUG(x) cout << #x " = " << x << endl

#define FIELD(a) char* a##_string; int a##_size
```

But there are lurking dangers.

In C, one of the ways to preserve efficiency is through the use of macros, which allow you to make what looks like a function call without the normal function call overhead. The macro is implemented with the preprocessor instead of the compiler proper, and the preprocessor replaces all macro calls directly with the macro code, so there's no cost involved from pushing arguments, making an assembly-language CALL, returning arguments, and performing an assembly-language RETURN. All the work is performed by the preprocessor, so you have the convenience and readability of a function call but it doesn't cost you anything.

*... a macro looks like a function call, but doesn't always act like one. This can bury difficult-to-find bugs.*

*ticpp ed 2 vol 1 chap 9*

C++ did try to reduce the dangers of PP, but still utilizing its benefit of, inlined code, by introducing the `inline` modifier for functions.

To retain the efficiency of the preprocessor macro, but to add the safety and class scoping of true functions, C++ has the inline function.

... To define an inline function, you must ordinarily precede the function definition with the inline keyword. However, this is not necessary inside a class definition. Any function you define inside a class definition is automatically an inline.

... It is important to understand that an inline is just a suggestion to the compiler; the compiler is not forced to inline anything at all. A good compiler will inline small, simple functions while intelligently ignoring inlines that are too complicated. This will give you the results you want - the true semantics of a function call with the efficiency of a macro.

*ticpp ed 2 vol 1 chap 9*

**Preprocessor flags: Conditional Compiling**

Though PP macros are very useful for minimizing code typing and consistency, the key benefit of PP was to allow Conditional Compiling (CC). That is, some part of the code can be NOT compiled based on few conditions or 'flags'. This is the usual trick for cross-platform coding in C. Though for most of the cases you can use the standard libraries to localize the differences of the platform, you still need a way to conditionally compile based on the CPU model and the OS. Debugging code, or logging is yet another popular usecase for conditional compiling.

By using the preprocessor to `#define` one or more debugging flags (preferably in a header file), you can test a flag using an `#ifdef` statement and conditionally include debugging code. When you think your debugging is finished, you can simply `#undef` the flag(s) and the code will automatically be removed (and you'll reduce the size and runtime overhead of your executable file).

*ticpp ed 2 vol 1 chap 3*

```c
#ifdef DEBUG
    //Check to see if the flag is defined
       //debugging code here
       printf("the code reached this point: 12345.");
#endif
//DEBUG
```

This `printf` will not even be included in the executable that is built by compilation, if we don't declare a `#define DEBUG` somewhere before.

This is a powerful usecase, especially in situations like logging, profiling, or debugging in general. If more and more appropriate information is logged while the program is running, more it is amenable for quick troubleshooting. But this also slows the system if you log too much, or your application is too big. Thus we need a way to stop logging-IO, and also a way to remove these coding completely from the shipping build when not debugging. This is what is achieved by Conditional Compiling. Indeed, an indispensable mechanism in the programmer's tool box.

**The Java 'final' keyword**

...the compiler is not forced to inline anything at all. A good compiler will inline small, simple functions while intelligently ignoring inlines that are too complicated.

This is the key observation. Over the years the compiler technology is growing in strength, and also the accumulated knowledge on the language usage and pitfalls. A language designer's challenge is to balance the sometime conflicting demands of safety and ease of use. Java from the beginning has taken path of simplicity and safety, even at the cost of slight discomfort to the programmer. *Less is more* is definitely a maxim of Java. Sun, the creators of Java, is a commercial company basically, unlike the almost individual creators of C/C++, hence are hoping that the *standards being open, companies can compete on implementation*. So, if the `inline` keyword is just an hint to the compiler, why not make all these kinds of optimization a job of the compiler implementor?! Taking this idea to its limits, it can be said that a preprocessor can be made redundant, if we assume that the language is well defined, and these optimization can be guessed by the compiler more uniformly than the programmer. This is Java's goal. Its language specification says,

The Java™ programming language is a general-purpose, concurrent, class-based, object-oriented language. It is designed to be simple enough that many programmers can achieve fluency in the language. ...It is intended to be a production language, not a research language, and so, as C. A. R. Hoare suggested in his classic paper on language design, the design has avoided including new and untested features.

*Java Language Specification ed 2 chap 1*

...For simplicity, the language has neither declaration "headers" separate from the implementation of a class...

*Java Language Specification ed 2 chap 1*

These words summarize the intentions of the language creators. For preprocessing, the Java's take is that, given a possibility that a compiler can suitably produce reasonably optimized code, IF it is given a few hints by the programmer, where necessary, then we can remove altogether, all the spurious external dependencies of a language like Preprocessors, header files model etc. The code,

```java
final static boolean DEBUG = true;
```

is equivalent to `#define DEBUG` of C. This model has the benefit of being simple (only one language to understand), coherent (all coding is same coding: `if` is same everywhere) and safe (as the same compiler is handling all conditionals, and hence type safe). As to the inlining of the methods, it is up to the compiler, wherever the method is `private` or `final` or under some other criteria. In explicit terms, here is the relevant snippet from the language spec.

```java
if (false) { x=3; }
```

does not result in a compile-time error. *An optimizing compiler may realize that the statement x=3; will never be executed and may choose to omit the code for that statement from the generated class file*, but the statement x=3; is not regarded as "unreachable" in the technical sense specified here.

The rationale for this differing treatment is to allow programmers to define "flag variables" such as:

```java
static final boolean DEBUG = false;
```

and then write code such as:

```java
if (DEBUG) { x=3; }
```

The idea is that it should be possible to change the value of DEBUG from false to true or from true to false and then compile the code correctly with no other changes to the program text.

*Java Language Specification ed 2 chap 14 sec 14.20 Unreachable Statements*

when I tested this idea with the following code, with and without the `final` keyword (just that change). The code size of the class file generated was 312 bytes (with final) and 513 bytes (without final) respectively with J2SE 1.4.1_02 compiler. Obviously, when the with-final version was decompiled with [Jode](https://jode.sourceforge.net/), the whole `if` block was absent.

```java
public class TestFinal {
    final static boolean DEBUG = false;
    public static void main(String[] args) {
         if(DEBUG) System.out.println("I'm called.");
    }
}
```

**The relation between 'final' and 'assert'**

J2SE 1.4 introduced [Assertion Facility](https://www.tattvum.com/Articles/2002/2002-07/2002-07-28/Ramu-SE-20020727-DBCEiffelJava.html). An `assert` is slightly different in purpose when compared to conditional compiling. Our need is not to reduce the binary size, because we want to be able to enable the logging whenever we want with the application. But we surely want to optimize the speed if we don't use logging or assert. When you use something like the following code, for debugging,

```java
MyDebug.trace(getSomeValue());
```

where, the `trace` method logs only if a global constant is set, you are not safe! Because here `getSomeValue()` functions is first called before trace is called, and hence your if block inside the `trace` method is no good in preventing this line of code from being a performance reducer. But if you do the same thing explicitly like the following,

```java
if(ASSERT) MyDebug.trace(getSomeValue());
```

then it is optimal. The maximum cost you incur is the cost of evaluating the simple `if`. And this is exactly what the `assert` statement does. The following J2SE API Javadoc note summarizes this link very clearly.

The assertion facility offers no direct support for stripping assertions out of class files. The assert statement may, however, be used in conjunction with the "conditional compilation" idiom described in JLS 14.20, enabling the compiler to eliminate all traces of these asserts from the class files that it generates:

```java
static final boolean asserts = ... ; // false to eliminate asserts
if (asserts) assert <expr> ;
```

*J2SE 1.4 API Javadoc*

To ensure that assertions are not a performance liability in deployed applications, assertions can be enabled or disabled when the program is started, and are disabled by default. Disabling assertions eliminates their performance penalty entirely. Once disabled, they are essentially equivalent to *empty statements* in semantics and performance.

*J2SE 1.4 API Javadoc*

Where conditional compiling aims at completely removing development time logging scaffolding, `assert` facility just want to be able to live without those scaffolding, if need be. This also means, it might want to enable these debugging logging, for trouble shooting, even in the final application. As the spec states, using assert will eliminate even the `if` evaluation overhead, if it is disabled. Thus what the compiler does smartly for conditional compilation, the `assert` keyword does for assertion. You must note that, what the `assert` keyword does, cannot be emulated otherwise with Java, with the same performance benefit (whether you accept or understand the benefit of this facility, this is true).

**The role of AOP to debugging**

It seems that we are not alone when we feel irritated, that we have to code and maintain all those logging statements in many of our methods, just to trace the route taken by the runtime logic. Of course a good debugger will give you enough information for this usecase, but still, having a permanent trace of the method call is useful sometimes. And generalizing these types of usecases, people are trying to view the coding effort in layers, instead of just objects. Objects have already proved its worth, but definitely need more help, to be a complete solution for the developer. The current efforts in *Aspect Oriented Programming (AOP)* is trying to address this issue of *separating the concerns*, in programming.

Well, this is a fertile topic in its own right, and I intend to relate to it, more elaborately in future. The popular pioneer in this field is [AspectJ](https://aspectj.org/) (now maintained by eclipse). But recently, I feel the JBoss 4.0 DR1 adaptation of AOP is both clean and innovative. More on these soon.

**Epilogue**

This all started with my problems with maintaining and optimizing my debugging related logging facility. But the Java language spec enlarged my understanding to the compatibility issues. Then the natural comparison to asserts and AOP was inevitable. Above all this article also cleaned my rusty understanding of C preprocessors. I fully understand that I've only touched upon the various related things of Java's `static final` modifiers. But the goal is to stress the optimizing hints associated with the Java's `final` keyword.

Off late my interest in C/C++ is growing. I'm slowly rediscovering both its primitiveness and also its power. C/C++ really complements Java very nicely. Its availability and native reach can be fully reaped through Java's simple and elegant JNI model. More on these in future.
}
