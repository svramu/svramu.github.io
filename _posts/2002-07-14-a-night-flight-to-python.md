---
layout: post
title:  "A night flight to Python"
---

First impressions while learning the Python language

**What is Python?**

![Python](/assets/images/A%20night%20flight%20to%20Python/7e386672cfb167ce8e36ada4e20f1ece.jpg)

[Python](https://www.python.org/) is a *Scripting language* like javascript, vbscript, beanshell, perl, Tcl etc. The role of any scripting language is to make programming more conducive for day-to-day tasks than for a sprawling project. Because of this requirement, usually these languages are freely typed; meaning you cannot (or need not) explicitly specify the type of the variables. One completely rare modern feature in Python is its indentation based code blocks; the curly braces of C, Java are made unnecessary with the requirement of well indented code blocks. One nice effect of this model is that the code is clean to look at and very readable. Though this feature might look odd for a Java or C coder, it is in fact very compact and effective. The [beautiful article](https://www.linuxjournal.com/article.php?sid=3882) quoted in the [Thinking in Python](https://www.mindview.net/Books/TIPython) online book by Bruce Eckle, about the active open source guru Eric S. Raymond's first exposure and eventual love bond with Python, is a vivid and inspiring read for a start. This fine article of ESR exactly captured my mood, and hence was soothing.

> I immediately tripped over the first odd feature of Python that everyone notices: the fact that whitespace (indentation) is actually significant in the language syntax. The language has no analog of the C and Perl brace syntax; instead, changes in indentation delimit statement groups. And, like most hackers on first realizing this fact, I recoiled in reflexive disgust.

But his reflections goes beyond just the feeling and analyzed the reason for the discomfort too.

> I am just barely old enough to have programmed in batch FORTRAN for a few months back in the 1970s. Most hackers aren't these days, but somehow our culture seems to have retained a pretty accurate folk memory of how nasty those old-style fixed-field languages were. Indeed, the term "free format", used back then to describe the newer style of token-oriented syntax in Pascal and C, has almost been forgotten; all languages have been designed that way for decades now. Or almost all, anyway. It's hard to blame anyone, on seeing this Python feature, for initially reacting as though they had unexpectedly stepped in a steaming pile of dinosaur dung.

> (sometime latter)...Of course, this brought me face to face once again with Python's pons asinorum, the significance of whitespace. This time, however, I charged ahead and roughed out some code for a handful of sample GUI elements. Oddly enough, Python's use of whitespace stopped feeling unnatural after about twenty minutes. I just indented code, pretty much as I would have done in a C program anyway, and it worked...

**History of the need**

For a long time now, I'm struggling to find a way to manage the CLASSPATH and other environment variables in Windows, for Java. This is important for me because I often download and try out various open source Java projects. Over time my CLASSPATH becomes a mess, and I run into some obscure problems. It would be nice to have a tool which would allow me to manage classpath effectively. Especially it should allow me to keep all the relevant environment settings in a text file, which I can alter from time to time, and apply it all, every time I reconfigure my system.

The autoexec.bat file of Windows 95 is not useful for frequent changes, as it can be applied only on the system startup. In NT, the novice friendly GUI based entry-by-entry editor is annoying for regular batch updates to environment. Thanks to my friend Senthil's research we learnt that these values are kept in registry. The place where it is stored is different for different kinds of environment.

Default environment:

`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment`

Current user environment:

`HKEY_CURRENT_USER\Environment`

Volatile environment (vanishes with a restart):

`HKEY_CURRENT_USER\Volatile Environment`

Default environment (? forgot!):

`HKEY_USERS\.DEFAULT\Environment`

Sometime back I wrote a [small, one file utility](https://tattvum.com/Articles/2002/2002-07/2002-07-21/SetEx-0.9.zip), in Borland Delphi to parse a text file and apply changes to the registry. At that time, how much ever I tried, I couldn't get the **SET** command to reflect the changes made in the registry. Curiously it applied the changes if I open and OK the System Properties/ environment Variables dialog. Yes, this was a pain. So, I left it at that. After a long time, Senthil again dared to try this sticky problem once more, and found the mistake, and even made a full tool for setting the environment tools. My mistake was that I didn't know to give the right LPARAM to the `WM_SETTINGCHANGE` windows message. For registry changes, this has to be the leaf node that was changed (mostly just the string *"Environment"* works). Now my interest in revamping this environment management tool is alive again, as I need it to be file based, so that I can change my configurations often.

**Enter Python**

This time around, as my language of choice is java, I wanted to rewrite the tool in it. Obviously Java cannot provide API for windows registry. So my next choice was to use my old love, C, for this. Of course my C was rusty after these long years of neglect. Anyway, enthused by the [GNU Compiler Collection (GCC)](https://gcc.gnu.org/), I took couple of days to track the API calls to `windows.h` header file and started. Alas, due to my very minimal experience with windows API programming in C, I got into all sorts of troubles with string pointers.

Frustrated I looked around for a GPL tool. As fortune would have it, I was re-exposed to Python, especially since Bruce Eckle of [Thinking in Java](https://www.mindview.net/Books/TIJ/) fame, used to praise Python so much. I remember that it is more than just a scripting language. So, why not I give it a try? Like others, my initial exposure to it was not so pleasant or thrilling, as I had no *motive* to learn it, other than plain pride. But this time, I had a very clear agenda; *can it simplify my effort to build a registry editing tool?* So I downloaded the latest release and vowed myself that I will test it over the weekend.

You must know, that i initially considered making the registry-changing-part in C, and link that with a Java UI (as I don't dare to do a C GUI!), through either a simple socket based interface, or may be just file sharing (again I have no taste for JNI based adventure). Needless to say, this was a messy heterogeneous solution, and hence uninspiring. But I needed the tool badly. And this is when my understanding that Python can do Windows or UNIX specific tasks, while being portable to all platforms, came as an inspiration.

**Why Python?**

The fact that Python is portable to Linux, made it all the more lucrative to me, as I'm trying to train myself in Linux for past few weeks. A scripting language that I can use in both platforms (instead of either the shell script or batch files) is a very lucrative prospect. Of course the clout of the language was the final straw. Even few years back, while enjoying Bruce Eckle's TIJ, I was made curious by his regular comments about the then unheard-of Python.

> ...what is rapidly becoming my favorite language, an excellent companion to Java ...JPython, which allows you to combine Java and Python in a single program (the JPython interpreter is compiled to pure Java bytecodes, so there is nothing special you need to add to accomplish this). This language union promises great possibilities.

Now ESR, as if mind reading my fears, goes on to explain his reluctance to use either C, Perl or Tcl for scripting. His comparison with Perl was especially illuminating, as I was wondering whether I must try the famous and ubiquitous Perl instead of Python. I haven't used Perl before, but heard that it is the most powerful language for Regular Expression processing. I mentally noted that I must hunt for RE API in Python, once I go into it. ESR's comparison of Perl with Python, clarified my one another ulterior doubt. Here is a man, whom I have started admiring recently, is so clearly putting elegance of code above everything and in the same vein is praising Python. It should have something to merit it.

**Knowing what scripting means**

So the stage was set. I preponed my Python trial to the same day I downloaded the setup. The installation was the usual smooth Windows install. Just few familiar questions and it was done. OK, now my main doubt was, *How to run it?* The Python.exe was an interactive interpreter. Then what about my memory of seeing it as some .py files? The question is, How to write, compile and execute a Python source?

This is where my revelation was. With all these questions, I was rechecking my understanding of the term *Scripting Language* itself. Why do we need a scripting language? How does it compare to C and Java? In the spectrum of programming domains, C caters to the basic needs of assembly level or hardware level programming. The focus is more on control and moderately (in modern view) of structure. While Java is at the higher end of the spectrum, by providing elegant OO structures and effective idioms. With it all, throwing platform independence as the key punch. In fact it is Java that is defining the role of C/C++ these days. If you want to work on anything that is not provided in the Java's clean platform-independent API's you need C. But C, as we know is too quirky with its pointers and the now-obsolete hybrid OO. Now, isn't this an abysmal gap between these two ends of the spectrum?!

For sometime now, I'm feeling this stark gap. Like the rest of the Java world, I was thrilled by the power of [Apache Jakarta Ant](https://jakarta.apache.org/ant/index.html), the declarative XML build tool. But that too is very limiting sometimes when I'm pressed for a loop like processing. Even windows batch files don't fulfill these needs. Here I learnt that JavaScript is used for modern Window scripting, instead of the old and simple batch files. If it is only a new scripting language that I need, why not at least try Python? The point is, a versatile scripting language is a must for many activities that doesn't need the sophistication of Java, nor the 'do anything' sort of C's flexibility. That is scripting.

If scripting has to be useful for the quick and dirty daily tasks, it cannot burden us with strict type checking or with a need to be compiled. Keep batch files, or shell scripts in mind. This is scripting. The Python being a modern (1990) evolution of these old, system-specific scripting languages: It followed suite, and hence is an interpretive language with no strict type checking. Its modernity is in providing a very high-level, but ridiculously simple API for accessing everything of the system. Yes, maybe no-type-checking model will not scale for enterprise level projects. But Python's audience is not that (at least for now). Python is for the Apache Ant like activities and beyond. Scripting is for everything between hardware/system projects and enterprise projects.

**Finally that night...**

So, my first program was to see the .py source files running. I created a plain text file, and renamed it with .py extension, and included the following traditional line, in Python.

```python
print 'Hello World!'
```

How to execute this file? Just double click the file in the explorer; that is it. As usual this achievement of first seeing a running a program in a new language didn't fail to thrill me. This is because of the mental surety, that I can use the traditional, code-run-debug cycle to develop my applications. So now, my next step was to checkout the comments, control structures and functions in this language. This is vital, as without it, we cannot get anything out a language.

```python
#This is a copied program from the tutorial
a, b = 0, 1
while b < 1000:
    print b
    a, b = b, a+b
```

That was simple. And now for something my own, finding primes (my favorite).

```python
def isPrime(n):
    if n < 2:
        return None
    if n < 4:
        return 'isPrime'
    if n% 2 == 0:
        return None
    for divisor in range(3, int(round(pow(n,1 / 2.0)))+ 1, 2):
        if n%divisor == 0:
            return None
    return 'isPrime'

for i in range(1000):
    if isPrime(i):
        print i
```

Though I faced lot of problems in understanding the `pow` function, due to my ignorance with its data type coercion model, this was pretty cool. Now how about capturing some user inputs, and modularizing the program into two files and calling it from other. For this I have to hunt around for 5-10 minutes in the wonderful and comprehensive documents that come with the installation. Specifically for finding the functions required for getting input, I had to hunt its Library References pages. Initially I doubted if such an important function will be with an underscore! But most of the built in functions were like this. In fact underscore plays an important basic part in Python. Thus I moved the `isPrime` function to a new file, and called it from a starter file.

```python
from MyModule import isPrime
count = raw_input('Primes upto: ')
for i in range(int(count)):
    if isPrime(i):
        print i
raw_input('press ENTER key to exit...')
```

The second call of `raw_input()` method is a trick carried over from C days (it was `getch()` in it), to stop the console window closing immediately after finishing the program's execution. Well, this completes one complete circle for me. Once I know these basic details, rest is only knowing the nuances of the language's structures (like class, exception etc) and the library API that is available for file handling, sockets or mail handling. Python is a full blown scripting language, with extensive but deceptively simple libraries. It doesn't spare anything, from reflection, serialization, XML processing to even XML-RPC of WebServices fame. A scripting language should not be limited by features, maybe only by scalability to bigger project sizes. Python shines here.

```python
import poplib
M = poplib.POP3('pop.mydomain.com')
M.user('mypopid')
M.pass_('mypassword')
numMessages = len(M.list()[1])
for i in range(numMessages):
    for j in M.retr(i+ 1)[1]:
        print j
```

The beauty of the whole thing is, just an hour or two after installing the software, I have my working non-trivial code running! Getting ambitious, I explored the Module reference (the doc, rightly suggests to *"keep this under your pillow"*), and found APIs for using FTP, POP, HTTP etc. How about the above few lines of code for displaying all your mails!

**Continuing the Registry story...**

And thus amongst other things, I also found the libraries for the registry setting problem.

```python
from _winreg import *

def OpenKeyPath(pathList):
    for i in range(len(pathList)- 1):
        pathList[i+ 1] = OpenKey(pathList[i], pathList[i+ 1],
                                        0, KEY_ALL_ACCESS)
    return pathList[- 1]

envPath = [HKEY_LOCAL_MACHINE, 'SYSTEM', 'CurrentControlSet', 'Control',
           'Session Manager', 'Environment']
keyHandle = OpenKeyPath(envPath)
SetValueEx(keyHandle, 'BINGO', 0, REG_SZ, 'Bingo value')
FlushKey(keyHandle)
```

This was on day two (after the smooth and thrilling 3 hours the previous day), and my problem is already solved.

Only one more thing remained though. Even after flushing the changes, I couldn't make the registry changes broadcasted to a new console window's SET command. For this, after some exploration for running exe from Python, I decided to write a C program which will just have the proper `WM_SETTINGCHANGE` message that my friend discovered. Compile it to an executable, and call it from Python.

```python
def broadcastRegistryChange():
    os.spawnl(os.P_WAIT, os.path.dirname(__file__)+ "/WinBroadcast.exe",
            "WinBroadcast")
```

WinBroadcast.exe was just around 10k, as it only had one small function containing the following C code,

```c
char pszSection[] = "Environment";
LPARAM lParam = (LPARAM) (LPCTSTR) pszSection;
SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, lParam);
```

**Epilogue**

I would like to conclude with the thought provoking words of Eric S.Raymond.

> When you're writing working code nearly as fast as you can type and your misstep rate is near zero, it generally means you've achieved mastery of the language. But that didn't make sense, because it was still day one and I was regularly pausing to look up new language and library features!

> ...To say I was astonished would have been positively wallowing in understatement. It's remarkable enough when implementations of simple techniques work exactly as expected the first time; but my first metaclass hack in a new language, six days from a cold standing start? Even if we stipulate that I am a fairly talented hacker, this is an amazing testament to Python's clarity and elegance of design.

> There was simply no way I could have pulled off a coup like this in Perl, even with my vastly greater experience level in that language. It was at this point I realized I was probably leaving Perl behind.

I have comfortably elided the remarkable List processing features, other elaborate extensibility features with C, and many more. These are important and you can find them in help documents and various net resources. I only felt that other people's passionate experience can reveal much more in much shorter time, as it was for me. I'll soon complete the full tool, and include it in the TATTVUM PoP Prototype archive.
}
