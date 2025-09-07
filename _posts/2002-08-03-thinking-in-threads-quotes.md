---
layout: post
title:  "Thinking in Threads (Quotes)"
---

Quotes form the great masters

This is a support page for the [Thinking in Threads](https://tattvum.com/Articles/2002/2002-08/2002-08-06/Ramu-SE-20020803-ThinkingInThreads.html) article. However much I resisted, I couldn't stop myself from sharing the following key quotes, from Andrew S. Tanenbaum (1995), Bruce Eckle (2000), and Borland help on Delphi and Win32. So hear it straight from the masters! (For more details, please read these treasure troves directly).

**The Single Sequence Idiom: Process &amp; Thread**

*(Modern Operating Systems - Andrew S. Tanenbaum)*

All modern computers do several things at the same time. While running a user program, a computer can also be reading from a disk and printing on a terminal or printer. In a multiprogramming system, the CPU also switches from program to program, running each for tens or hundreds of milliseconds. While strictly speaking, at any instant of time, the CPU is running only one program, in course of (say) 1 second, it may work on several programs, thus giving an **illusion of parallelism**. Sometime people speak of **Pseudoparallelism** to mean this rapid switching back and forth of the CPU between programs, to contrast it with the true hardware parallelism of the CPU computing while one or more I/O devices are running...

Keeping track of multiple, parallel activities is hard to do. Therefore, Operating System designers over the years have evolved a model that makes parallelism easier to deal with...

In this model, all the runnable software on the computer, often including the operating system, is organized into a number of *sequential process*, or just *process* for short. **A process is just an executing program**, including the current values of program counter, registers (of CPU) and variables (memory). Conceptually each process has its own CPU. In reality, of course, the real CPU switches ...from process to process, but to understand the system it is much easier to think about a collection of processes running in (pseudo) parallel, than to try keep track of how the CPU switches from program to program... **Multi-Programming**...

With the CPU switching back and forth among the processes, the rate at which a process performs its computation will not be uniform, and probably not even reproducible if the same processes are run again. Thus **process must not be programmed with built-in assumptions about timing.**

The difference between a process and a program is subtle, but crucial... The key idea here is that a **process is an activity** of some kind... A single processor maybe shared between multiple processes, with some scheduling algorithm being used to determine when to stop work on one process and service a different one.

*(Thinking in Java, 2ed, - Bruce Eckel)*

An additional advantage to threads is that they substitute 'light' execution context switches (of the order of 100 instructions) for 'heavy' process context switches (of the order of 1000s of instructions). **Since all threads in a given process share the same memory space, a light context switch changes only program execution and local variables. On the other hand, a process change 'the heavy context switch' must exchange the full memory space.**

Objects provide a way to divide a program into independent sections. **Often, you also need to turn a program into separate, independently running subtasks**... Each of these independent subtasks is called a thread, and you program as if each thread runs by itself and has the CPU to itself. Some underlying mechanism is actually dividing up the CPU time for you, but in general, you don't have to think about it, which makes programming with multiple threads a much easier task.

**A process is a self-contained running program with its own address space.** A multitasking operating system is capable of running more than one process (program) at a time, while making it look like each one is chugging along on its own, by periodically providing CPU cycles to each process. **A thread is a single sequential flow of control within a process.** A single process can thus have multiple concurrently executing threads.

The thread model (and its programming support in Java) is a programming convenience to simplify juggling several operations at the same time within a single program. With threads, the CPU will pop around and give each thread some of its time. Each thread has the consciousness of constantly having the CPU to itself, but the CPU's time is actually sliced between all the threads. The exception to this is if your program is running on multiple CPUs. But **one of the great things about threading is that you are abstracted away from this layer, so your code does not need to know whether it is actually running on a single CPU or many. Thus, threads are a way to create transparently scalable programs.**

Threading reduces computing efficiency somewhat, but the net improvement in program design, resource balancing, and user convenience is often quite valuable. Of course, if you have more than one CPU, then the operating system can dedicate each CPU to a set of threads or even a single thread and the whole program can run much faster. **Multitasking and multithreading tend to be the most reasonable ways to utilize multiprocessor systems.**

*(Delphi 5 Help - Borland)*

Note: **Not all operating systems implement true multi-processing, even when it is supported by the underlying hardware**. For example Windows 95 only simulates multiprocessing, even if the underlying hardware supports it.

You can think of it (Thread) as a program that is launched by your application, except that it shares the same process space... Multi-threaded applications are applications that include several simultaneous paths of execution. While using multiple threads requires careful thought, it can enhance your programs by, **Avoiding bottlenecks..., Organizing program behavior..., and Multiprocessing.**

**The issues of parallel programming**

*(Modern Operating Systems - Andrew S. Tanenbaum)*

...situation like these where two or more processes are reading and writing some shared data, and the **final result depends on who runs precisely when**, are called **race condition**. Debugging programs containing race conditions are no fun at all. The results of most runs are fine, but once in a rare while something weird and unexplained happens. (!)

**A set of processes is deadlocked if each process is the set is waiting for an event that only other process in the set can cause.** Because all the processes are waiting, none of them will ever cause any of the events that could wake up any of the other members of the set, ...and all continue to wait forever... None of the process can run, none of them can release any resources, and none of them can be awakened. The number of processes and the kind of resources (file, device or a piece of information) possessed or requested is un important.

**A situation ...in which all the programs continue to run indefinitely but fail to make any progress is called starvation**.

*(Thinking in Java, 2ed, - Bruce Eckel)*

You can think of a single-threaded program as one lonely entity moving around through your problem space and doing one thing at a time. Because there's only one entity, you never have to think about the problem of two entities trying to use the same resource at the same time, like two people trying to park in the same space, walk through a door at the same time, or even talk at the same time. With multithreading, things aren't lonely anymore, but you now have the possibility of two or more threads trying to use the same limited resource at once. Colliding over a resource must be prevented or else you'll have two threads trying to access the same bank account at the same time, print to the same printer, or adjust the same valve, etc.

Because threads can become blocked and because objects can have synchronized methods that prevent threads from accessing that object until the synchronization lock is released, **it's possible for one thread to get stuck waiting for another thread, which in turn waits for another thread, etc., until the chain leads back to a thread waiting on the first one. You get a continuous loop of threads waiting on each other and no one can move. This is called DEADLOCK.** *The claim is that it doesn't happen that often, but when it happens to you it's frustrating to debug*... There is no language support to help prevent deadlock; it's up to you to avoid it by careful design. These are not comforting words to the person who's trying to debug a deadlocking program.

Of course, **all synchronization depends on programmer diligence: every piece of code that can access a shared resource must be wrapped in an appropriate synchronized block.**

*(Delphi 5 Online Help - Borland)*

Writing the thread function is a little trickier than writing a separate program because you must make sure that you don't overwrite memory that is used by other threads in your application. On the other hand, because the thread shares the same process space with other threads, you can use the shared memory to communicate between threads.

...their properties and methods are not guaranteed to be thread-safe. That is, accessing properties or executing methods may perform some actions that use memory which is not protected from the actions of other threads.

**In fact, global variables provide a powerful mechanism for communicating between threads...** Sometimes, however, you may want to use variables that are global to all the routines running in your thread, but not shared with other instances of the same thread class. You can do this by declaring thread-local variables.

**When writing the code that runs when your thread is executed, you must consider the behavior of other threads that may be executing simultaneously**. In particular, care must be taken to avoid two threads trying to use the same global object or variable at the same time. In addition, the code in one thread can depend on the results of tasks performed by other threads.

When global memory does not need to be shared by multiple threads, consider using thread-local variables instead of global variables. By using thread-local variables, your thread does not need to wait for or lock out any other threads.

**To avoid clashing with other threads when accessing global objects or variables, you may need to block the execution of other threads until your thread code has finished an operation.** Be careful not to block other execution threads unnecessarily. Doing so can cause performance to degrade seriously and negate most of the advantages of using multiple threads.

**The synchronization primitives**

*(Modern Operating Systems - Andrew S. Tanenbaum)*

...various proposals for achieving **mutual exclusion**, so that while one process is busy updating shared memory in its critical region, no other process will enter *its* critical section.

**Many computers, especially those designed with multiple processors in mind, have an instruction TEST-AND-SET-LOCK (TSL)...** It reads the contents of the memory word into a register and then stores a non-zero value at that memory address... guaranteed to be indivisible -- no other process can access the word until the instruction is finished. The CPU... locks the memory bus to prohibit other CPUs from accessing memory until it is done... this instruction can be used to prevent two process from simultaneously entering their critical section...(How!)

Both Peterson's solution and the solution using TSL are correct, but both have the defect of requiring **busy waiting**... when a process wants to enter its critical section, it checks to see if the entry is allowed. If it is not, the process just sits in a tight loop waiting until it is... Not only does this approach **waste CPU time**, but it can have unexpected effects... **priority inversion problem**.

**The Java Model**

*(Java Language Specification 2ed. James Gosling, Bill Joy, Guy Steele. July, 1996)*

The Java programming language supports the coding of programs that, though concurrent, still exhibit deterministic behavior, by providing mechanisms for synchronizing the concurrent activity of threads. **To synchronize threads, the Java programming language uses monitors, which are a high-level mechanism for allowing only one thread at a time to execute a region of code protected by the monitor**. The behavior of monitors is explained in terms of locks; **there is a lock associated with each object.**

The synchronized statement (14.18) performs two special actions relevant only to multithreaded operation: (1) after computing a reference to an object but before executing its body, it locks a lock associated with the object, and (2) after execution of the body has completed, either normally or abruptly, it unlocks that same lock. **As a convenience, a method may be declared synchronized; such a method behaves as if its body were contained in a synchronized statement.**

**The methods wait, notify, and notifyAll of class Object support an efficient transfer of control from one thread to another**. Rather than simply "spinning" (repeatedly locking and unlocking an object to see whether some internal state has changed), which consumes computational effort, a **thread can suspend itself using wait until such time as another thread awakens it using notify**. This is especially appropriate in situations where threads have a producer-consumer relationship (actively cooperating on a common goal) rather than a mutual exclusion relationship (trying to avoid conflicts while sharing a common resource).

**There is a lock associated with every object. The Java programming language does not provide a way to perform separate lock and unlock actions**; instead, they are implicitly performed by high-level constructs that arrange always to pair such actions correctly... Best practice is that if a variable is ever to be assigned by one thread and used or assigned by another, then all accesses to that variable should be enclosed in synchronized methods or synchronized statements... **The Java programming language does not prevent, nor require detection of, deadlock conditions**. Programs where threads hold (directly or indirectly) locks on multiple objects should use conventional techniques for deadlock avoidance, **creating higher-level locking primitives that don't deadlock**, if necessary.

Wow! The Trio say it all!! Now compare this with the Operating System guru, and taste the rare pleasure of seeing the same thing from two different master's eyes.

*(MS Win32 Developer's help - Microsoft (in Delphi 5)*

A mutex object is a synchronization object whose state is set to signaled when it is not owned by any thread, and nonsignaled when it is owned. **Only one thread at a time can own a mutex object, whose name comes from the fact that it is useful in coordinating mutually exclusive access to a shared resource**. For example, to prevent two threads from writing to shared memory at the same time, **each thread waits for ownership of a mutex object before executing the code that accesses the memory**. After writing to the shared memory, the thread releases the mutex object... Once a thread owns a mutex, it can specify the same mutex in repeated calls to one of the wait-functions without blocking its execution. This prevents a thread from deadlocking itself while waiting for a mutex that it already owns.

*(Modern Operating Systems - Andrew S. Tanenbaum)*

With semaphores and event counters, interprocess communication looks easy, doesn't it? ...one subtle error and everything comes to a grinding halt. It is like programming in assembly language, only worse, because the errors are races and deadlocks, and other forms of unpredictable and irreproducible behavior... *(since inadvertent usage of semaphores can lead to deadlocks, because the incrementing and decrementing is fully in the hands of the developer)*...

To make it easier to write correct programs, Hore(1974) and Brinch Hansen(1975) proposed a higher level synchronization primitive called a **monitor**... **A monitor is a collection of procedures, variables and data structures that are grouped together in a special kind of package or module. Processes may call the procedures in a monitor whenever they want to, but they cannot directly access the monitor's internal data structures from procedures declared outside the monitor**... only one process can be active in a monitor at any instant... *(the implementation is unimportant here, but very interesting in compiler construction)*...

In any event, the person writing the monitor does not have to be aware of how the compiler arranges mutual exclusion. **It is sufficient to know that by turning all the critical section into monitor procedures, no two processes will ever execute inside the CS at the same time...**

...(but) **we also need a way to block when they cannot proceed**... The solution lies in the introduction of **condition variables, along with two operations on them, WAIT and SIGNAL.** When a monitor procedure ...cannot continue, its does a wait on a condition variable *(any object in Java)*. This action causes the calling process to block. it also allows another process that had been previously prohibited from entering the monitor to enter now.

This process, can wakeup its sleeping partner by doing a SIGNAL *(Notify in Java)* on the condition variable that its partner is waiting on. To avoid having two active processes in the monitor at the same time, **we need a rule telling what happens after after a SIGNAL (call)**. Hoare proposed to let the newly awakened process run suspending other one. Brinch proposed... that a process doing the SIGNAL must exit the monitor immediately. In other words, a SIGNAL statement may appear only as the final statement in a monitor procedure... it is conceptually simpler and is also easier to implement. *(this is not the way Java sees it)* If a SIGNAL is done on a condition variable on which several processes are waiting. only one of them, determined by the system scheduler, is revived *(Java allows both notify() and notifyAll())*.

**The condition variables are not counters. Thus if a condition variable is signaled with no one waiting on it, the signal is lost**. The WAIT *must* come before SIGNAL. ... By making the mutual exclusion of critical regions automatic, monitors make parallel programming much less error prone than with semaphores...(only) a few languages such as concurrent Euclid (Holt 1983) have them, but they are rare. *(include Java now!)*
}
