---
layout: post
title:  "Thinking in Threads - 2"
---

Analyzing the primitives

**Recap**

We'll start from where we left in the [first part of this series](https://tattvum.com/Articles/2002/2002-08/2002-08-06/Ramu-SE-20020803-ThinkingInThreads.html) on threads. The provoking question is, *Why do we need a `synchronized` keyword and two methods (`wait` and `notify`) to achieve synchronization in java?* We also found that the basic minimum that we want for synchronization is, just a way to `hold` a lock, or `allow` it being held by other threads. A typical implementation of this idiom could be as follows.

```java
public class Lock {
    //This is to prevent anybody outside this
    //class from calling wait or notify on it.
    private Object internalLock = new Object();
    private boolean held = false;
    public void hold() {
        //This is to ensure that the whole
        //holding or allowing process is atomic.
        synchronized(internalLock) {
            if(held) {
                //This is the typical usage of
                //the wait() method
                try {
                    internalLock.wait();
                } catch(Throwable error) {
                    error.printStackTrace();
                }
                //After this we can be sure that
                //the boolean 'held' is FALSE.
                //As the only other method that
                //uses it is our own, allow.
            }
            held = true;
        }
    }
    public void allow() {
        synchronized(internalLock) {
            held = false;
            //we are notifying all, just to be
            //sure. Here even notify should do.
            internalLock.notifyAll();
        }
    }
}
```

Note here that when you instantiate this class, the private `held` boolean variable is FALSE. So, the first thread that calls `hold` will acquire it. Any body calling the `hold` method the second time, without calling the `allow` method, will be blocked, till somebody *allow* them to hold it.

**Mimicking the synchronized keyword**

As a soft start, let us mimic the `synchronized` keyword of java itself, with this simplistic `Lock` class.

```java
//Using our primitive to simulate
//the synchronized block of Java
Lock myLock = new Lock();
myLock.hold();
    //This is our simulated
    //synchronized block
    //Like it, until this block ends,
    //no other thread can 'hold'
    //this myLock.
myLock.allow();
```

```java
//The Java way of compile-time-checked
//threadsafe code block.
synchronized(anyObject) {
    //The threadsafe code goes here.
}
```

As you can notice, this new primitive is far less safe than using the `synchronized` keyword. Why? Because, if we omit the closing call to `allow`, the thread sleeps for ever. Java being a highly type safe language, tries to increase the opportunities for the compiler to check for these types of human mistakes. By using a `synchronized` block, provided by the language itself, the code is structured and hence is safe. This idea is just like say, the `while` loop. Before it was invented, people used `goto` to simulate that, with the potential danger of missing the `goto`, or pointing it to some improper places. By including loops as a basic construct of the language itself, these common mistakes are now compile time checked, and hence are safe.

```java
//A theoretical reconstruction of
//while-less loops, with goto.
//This cannot be checked at
//compile time.
loopStart:
if(i<= 0) goto loopEnd;
    //your looping code
    //goes here
goto loopStart;
loopEnd:
//Remember that goto is reserved
//but not a keyword in Java
```

```java
//The equivalent, structured,
//compile-time checked, while-loop.
//Notice that we don't need a goto
//and hence labels.
while(i> 0) {
    //your looping code
    //goes here
}
```

Well then why do we need this new `Lock` primitive? We'll look at that, but before that, let us relate the role of the `wait` and `notify` methods of any Java `Object` instance, and the `synchronized` blocks. You should remember that every Java object is a lock and can be used so in any synchronized blocks. Similarly calling `wait` on any object will block the thread that is executing that call, and `notify` will release one such blocking call. Isn't this similar to our `hold` and `allow`? It is, except for the tight coupling of the `synchronized` with these methods. Before calling these two methods, we have to acquire the object using `synchronized`.

```java
//Simulating a synchronized block
//using wait and notify alone.
Object myLock = new Object();
boolean isLocked = false;
//This is just the lock part ;-)
if(isLocked) {
    synchronized(myLock) {
        try {
            myLock.wait();
        } catch(Throwable error) {
            //One of the following
            //could be thrown...
            //IllegalMonitorStateException
            //InterruptedException
        }
    }
} else {
    isLocked = true;
}
    //Your synchronized, threadsafe
    //code goes here.
    //An overkill eh?
//Now you finish the block,
//by freeing the lock.
synchronized(myLock) {
    //you are not compelled to catch the
    //runtime IllegalMonitorStateException
    myLock.notifyAll();
}
```

Yup, this is outright ugly and complex. But the point is that the methods `wait` and `notify`, by itself can simulate the `synchronized` block. The fact that `synchronized` keyword itself is used in the above code sample, is only because of the language's requirement. We could very well imagine that synchronization being inbuilt in these method calls. The point I'm driving at is, if these two methods can do the job of the synchronizing blocks, why do we need one more idiom and keyword called `synchronized`? My guess is, of course the complexity of the above sample itself. Especially since such blocks are very common in a program, it is worth having a construct that simplifies it. But the main reason I think is, the structured nature of the block itself, and hence its compile time safety.

**Limitations of the wait and notify calls**

Say, we want to create the threads in an application (the main thread), but we want the spawned threads to start only after we finish something in the main thread; how do we do this?

```java
public class ParentChildThreadsDemo {
    static Object lock = new Object();
    //The inner class implementation of a
    //simple thread.
    static class SomeThread extends Thread {
        public void run() {
            //This thread waits for the
            //parents lock, before continuing
            synchronized(lock){
                //The spawned thread's
                //code goes here.
            }
        }
    }
    public static void main(String[] args) {
        synchronized(lock) {
            //Create and start the thread
            new SomeThread().start();
            //Do some big activity here.
            //Though the threads are created
            //and started already, it will not
            //run until this synchronized block
            //on the lock, completes.
        }
        //The thread could be running now.
    }
}
```

This is a very mundane example. As you can see, just the `synchronized` block seems to be enough. This is in fact the ideal and very common case, where the java *monitors* come very handy and is completely safe. Now let us say, we need to create lot more threads, but we don't want each thread to wait for other child threads to complete. All we want is that they all start after the parent has completed. That means, they just have to acquire the lock, release it immediately and go their way. To code this, we just have to change the inner thread class.

```java
    static class SomeThread extends Thread {
        public void run() {
            //NOTE:we release the lock, as
            //soon as we acquire it.
            synchronized(lock){}
            //The spawned thread's
            //code goes here.
        }
    }
```

Note here, that the `synchronized` block is behaving like a `wait` method (it *waits* for the lock, and is *notified* when the parent relinquishes it). One big difference is that the block waits, *only* if it had been locked by somebody else, if not, it just acquires it and goes ahead. In the case of `wait` method, it will always wait after the call, until some other thread notifies it. We could have achieved the same effect with `wait` and `notify` itself, but this is sometimes dangerous.

```java
public class ParentChildThreadsDemo {
    static Object lock = new Object();
    static class SomeThread extends Thread {
        public void run() {
            //This thread waits for the
            //parent's lock, before continuing
            //(BEWARE!)
            synchronized(lock){
                try { lock.wait(); } catch(Throwable error){}
            }
            //The spawned thread's
            //code goes here.
        }
    }
    public static void main(String[] args) {
        //Assume that the threads will be waiting
        new SomeThread().start();
        //notify all threads to start (BEWARE!)
        synchronized(lock) { lock.notifyAll(); }
    }
}
```

Why is this code dangerous? Because, if the parent completes the creation and starting of all threads, *before* the child threads reach the waiting code, then when the parent *notifies all*, some of the children may not be waiting, and consequently when they start their wait, there will be no notification call for them to wake up! The problem is, this code will run most of the time, but sometimes, when it hangs up, debugging may not be natural at all. Yes, it is *you* who have to handle these kind of missed notifications. The compiler turns a deaf ear to this lapse on our part. Of course we can use these two methods alone for mimicking the block construct, but that needs more code, attention, and above all will be ugly.

**Limitations of the synchronized blocks**

Now let us turn the question on its head, *why do we need the `wait` and `notify` methods, if the `synchronized` block is already doing a great job?* This is an important question. The simple answer is, locks are not nice structured paradigms, in the first place. If only the handling of all thread safety can be bottled into compile time checks, the world would be a nice place to live. Unfortunately it is not. Our struggle now to make thread locks to behave deterministically, is something like what was going few decades before to control the `goto`'s notorious spaghetti code. With Java we can say, that `goto` is in fact made obsolete, with the modified use of the `break` and `continue` keywords. We haven't conquered thread locks yet. Improper use of locks can even now produce completely undebuggable code.

The problem is, the `synchronized` block is less useful when we want to `wait` for something in one thread, and `notify` that in another. Here, we cannot avail of the neat safety of the block construct (obviously it cannot span method or class boundaries), and have to resort to the careful use of `wait` and `notify`. **The limitation of the synchronized block becomes very obvious when the parent thread have to wait first, and be notified by one of its child**. How can we achieve this with the block model? We cannot. The block model will *block* only if some other thread holds the lock. So if a thread wants to be blocked first, before anybody else could get its lock, we have to use `wait`. And there lies the key difference between the two models.

**Epilogue**

In this article I did define the `Lock` class with its two basic methods `hold` and `allow`. But after that I've only dissected some of the important aspects of Java threading model, with the new primitive in the background. I did find the new primitive useful in simplifying some aspects of Thinking in Threads, but it is definitely not the elusive primitive I'm searching. The attempt is to compare and contrast various primitives under various thread usage scenarios, till we achieve a *nirvana* in thread. :-)

The Java monitors are interesting. Individually, neither the `synchronized` keyword, nor the `wait` and `notify` methods can satisfy all the locking needs. But together, they give too many ways to accomplish the same thing. Continuing our frugal approach, can we arrive at a synchronization primitive that can do this seemingly impossible task? My analysis continues, so should yours too. Needless to add, this series will continue, and your inputs will be very much appreciated.
}
