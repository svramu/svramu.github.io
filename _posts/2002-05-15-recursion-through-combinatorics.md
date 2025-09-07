---
layout: post
title:  "Recursion through Combinatorics"
---

Exploring the complexity of designing and debugging a recursive method

**The Prelude**

*Recursion* is the ultimate art of the algorithmic programming. And now-a-days spending time on algorithms is no longer considered useful or cool. The modern buzz is to focus on the Software engineering aspects and the elite OOP idioms. All these may be, but to me, and computing in general, the algorithms are the best inspiration in convincing us of computer's magic. The sense of achievement that is realized when completing a complex algorithms equals an OO design or even the best managerial coup de grace. My early frustration in imbibing loops, branches and arrays, is still fresh in my mind. For a long time, I shunned recursion as something that is too complex to be useful, and lavished my time in devising ingenious way to solve problems with loops, arrays and some subtle tricks alone. Until one day, few years back, a friend instilled my envy and my awe, by simplifying drastically (and speeding up too) my hard won loop for Fractals. After that day, after seeing a very close problem being benefited by recursion, I was curious, experimental; and thus started enjoying to use recursion for literally any problem, which had even a semblance of look-alike sub-structure.

In a suitable light, recursion is nothing short of a magic or a poetic work of art. But it does have its limitation, in being bound by the limited stack size. Clearly for some problems of large sizes, a loop is highly scalable and often the only way out. But for some complex small logics, recursion could be infinitely elegant and maybe even faster. I always thought that all recursion based problems could be solved with loops alone. Somewhere I learnt that somebody called *Ackermann* proved with examples that there are recursions which are uncastable into loops alone, unless we resort to stack like data structures, which are just recursion at heart. Anyway, almost all modern languages are capable of recursive method calls, so it is good to learn to enjoy, and be benefited by them, while they are still there.

**Combinatorics**

Combinatorics is a branch of pure mathematics that deals with problems that have many possible states, which we have to enumerate (or comprehend) in some sense. This branch has so many unsolved problems, that I feel a major revolution is pending here (like calculus was to taming continuum). Also, one feels that the whole branch is just a collection of different questions, waiting to be solved. Most questions are so easy to state that every body can understand, but still with elusive solution. This article will be dealing with few simple but illustrative combinatorial problems and their algorithmic solutions. These problems are very easy to relate to (unlike many in graph theory that needs some domain knowledge), and all you need to analyze and understand them is just a sound (and eager) mind and simple facility with numbers.

*   The Factorial problem.
*   The Fibonacci numbers.
*   The Prime Factorization.
*   The Greatest Common Divisor (GCD).
*   The Permutations & Combinations.
*   The Eight Queen problem.

**The Factorial problem**

*Factorial* is the traditional first example for showing the wares of recursion. Although, this problem could be much more efficiently solved with iteration alone, using recursion is very illustrative.

n! = n * (n-1) * (n-2) * .... * 3 * 2 * 1

where, 0! = 1 (not zero, by definition)

and thus 1! = 1, 2!=2*1=2, 3!=3*2*1=6,

4!=4*3*2*1=24, 5!=5*4*3*2*1=120 ...

Thus n! = n * (n-1)!

Note the use of exclamation mark for factorial of n; this is the popular symbol. Also note that Factorial of (n) can be represented with factorial of (n-1). This is the typical giveaway of a recursive function. The factorial is a rapidly exploding function, meaning that it soon becomes a very very large number (beyond our capacity to store or display). For example, 10!=3628800 and 20!=2432902008176640000. Following would be the straight forward iterative algorithm, in Java.

//The most efficient and scalable (for larger n) algorithm (iterative)

```java
public static int factorialIterative(int n) {
    int result = 1;
    for(int i=n; i>0; i--) {
        result *= i;
    }
    return result;
}
```

And its equivalent recursive logic... See the elegance of it, but this has an upper limit due to stack size (though, this particular problem is not much affected by it, since the numbers anyway get too big before we hit stack limit).

//A less efficient but more elegant recursive solution

```java
public static int factorialRecursive(int n) {
    //Since 0!=1. This is our end-condition.
    if(n==0) return 1;
	//see the simplicity of it.
    else return n * factorialRecursive(n-1);
}
```

**The Fibonacci problem**

*Fibonacci Series* is also the traditional second example for showing the wares of recursion. This problem is practically limiting in its recursive form, although using recursion is very illustrative again.

F(n) = F(n) + F(n-1)

given that F(0)=0 and F(1)=1

thus F(2)=1+0=1, F(3)=1+1=2, F(4)=2+1=3, F(5)=5,

F(6)=8, 13, 21, 34, 55,....

Simply put, the current value is the sum of previous two values. This problem can be generalized for previous three, four etc. (called Lucas series). One way to look at Fibonacci problem is that, to calculate the current state, we need to have previous two states only. This is very well suited for an iterative algorithm.

```java
public static void fibonacciIterative(int n) {
    int a = 0;
    int b = 1;
    int c = 0;//to be used inside the loop.
    for(int i=2; i<=n; i++) {
        //We just move a+b --> c, b --> a, and c --> b
        //Note that for Fibonacci, you need to remember only past two states.
        c = a + b;
        a = b;
        b = c;
    }
    return c;
}
```

Its equivalent recursive logic is simply a useless beauty. In fact Fibonacci is the practical proof that recursion (and anything elegant) need not be efficient too. The problem with recursion for Fibonacci is that the things are calculated from scratch every time, which the iterative logic above avoids.

```java
public static int fibonacciRecursive(int n) {
    if(n==0) return 0;
    if(n==1) return 1;
    //Though elegant, this logic is prohibitively costly,
    //since, all values are calculated from scratch every time.
    return fibonacciRecursive(n-1) + fibonacciRecursive(n-2);
}
```

**Prime Factorization**

This is another interesting combinatorial problem. To me, this was the first problem that alerted me to see recursion in many domains that I usually treat as looping problem. This, like GCD, is very suitable for recursion for the typical small usages. (No where near record breaking number crunching).

Prime Factorization, is the representation of any given integer into a product
of primes. Since it cannot be further factorized (as all are primes), the
Prime Factorization of a number is unique.

e.g:

1234567890 = 2.3.3.5.3607.3803

19 = 19 ---> since 19 is prime.

The basic trick is to divide the given number by successive primes.
But since we can't have the primes early on, we use successive odd numbers
(but starting with 2).

This works because, once a number is divided by a prime fully, it cannot be
divided by its composite odd number multiples latter.

The key point to note about this problem, is that the key process inside both the recursive and iterative form are same. The form is outside the main logic. If you compare this with factorial or Fibonacci, you'll notice that they use recursion as the central logic step, while this problem use it somewhat in an offhand manner.

```java
public static void factorizeIterative(int n) {
    factorizeIterative(n, 2);
}

public static void factorizeIterative(int n, int d) {
    while(n>d) {
        //This is common for both iterative and recursive logic
        if(n%d==0) {
            n = (int) n/d;
            System.out.print(d+" ");
        } else {
            d += (d==2)? 1: 2;
        }
    }
    System.out.println(n+" ");
}
```

Both the methods use a wrapper method that calls the recursive core. This is a usual practice to hide out the extra parameters that are required for recursive processing. In Delphi (Object Pascal) we used to achieve this elegantly with inner methods. But this is not possible with Java, due to its important (but irksome) *Less is More* goal. Of course you can simulate inner methods with inner classes, but for simple cases this seems bit of a over kill.

```java
public static void factorizeRecursive(int n) {
    factorizeRecursive(n, 2);
    System.out.println();
}

public static void factorizeRecursive(int n, int d) {
    if(d>n) return;

    //This is common for both iterative and recursive logic
    if(n%d==0) {
        n = (int) n/d;
        System.out.print(d+" ");
    } else {
        d += (d==2)? 1: 2;
    }

    factorizeRecursive(n, d);
}
```

**Greatest Common Divisor (GCD)**

I added this example just for academic completeness. This too is very important from the history of mathematics perspective. I think this was the earliest recursive solution for a mathematical problem.

GCD(a, b) = c ---> i.e. the largest number that can divide
both a and b, is the GCD c.

GCD(17, 19) = 1 ---> since the numbers are relatively prime.

GCD(126, 120) = 6 ---> 6 is the greatest common divisor.

Thinking in prime factorization,

126 = (2.3).3.7

120 = 2.2.(2.3).5

Thus the GCD is the common part of their prime factors.
Which is (2.3) = 6

The Euclid algorithm states that,
all you have to do to find the gcd is,

1.  Divide the larger number with the smaller and get the reminder.
2.  Now find the GCD of the smaller number and this reminder.
3.  If the reminder is zero, then the smaller number is GCD.

The iterative solution...

```java
public static int gcdIterative(int a, int b) {
    while(b>0) {
        int c = a%b;
        a = b;
        b = c;
    }
    return a;
}
```

Note the drastic simplicity of the recursive form. This elegance is undoubtedly the obvious lure of the recursive algorithms, in spite of their steep learning curve and complex debugging requirements. Yes, you can get pretty confused with recursion, if you do not know what you are handling. But with a bit of practice, and some impassionate suitability analysis, it could be the sweetest and most poetic part of your code.

```java
public static int gcdRecursive(int a, int b) {
    //If a is divisible by b, then a is the GCD.
    //Also note that we assume a>b, on first invocation of this method.
    if(b==0) return a;
    //Note the naturally recursive nature of the logic,
    //and the efficiency of it!
    return gcdRecursive(b, a%b);
}
```

**A note about the examples**

In all the above examples, the comparison of the iterative method to the recursive one was done, to highlight the elegance of stating a logic with recursion. But we must be very clear that, in general, the iterative logic has a more scalable use of memory. That is, usually the iterative methods can scale to larger values of the problem than the recursive counterpart. For example, the iterative logic in the above examples can be used for much larger values of Factorial or GCD (Fibonacci is particularly hopeless even for small values). Two key things to note for recursion would be,

*   *Does the stack space usage shoot uncontrollably, for the given scope of the problem?*
*   In the factorial example, though the recursive method needs more and more stack space for larger n, for n! which are within the `long` data type, recursion is good enough. But for Fibonacci, which doesn't grow as fast as the factorial, the recursion is bad for stack space reason alone (apart from the more important second point). In this regard the GCD and Prime Factorization are snug fit for the recursive model, as they rapidly converge even for pretty big numbers, even beyond the `long` range.
*   *Does the recursive logic need to recalculate unnecessarily?*
*   This is the most important question with respect to the efficiency of the logic. If this holds, for smaller input sizes, the recursive logic usually is faster than the iterative ones. But if this point is not satisfied, it is hopeless to use the logic, as it is unattractive both by scalability and by efficiency point of views. Just the elegance of stating a problem is not good enough at all.

All the same, with all these things to consider, and once the above two points are satisfied, the recursive algorithms are both intuitive to find and a joy to code. In fact for many of the problems above, including the Fibonacci, I worked out the recursive logic first, before the iterative one. This is something like the flow charts. In early days, I couldn't code unless I have the flow chart before hand, since the syntax was not very natural. But sooner, a programming language gives a much better abstraction and rigor than the flow chart, and hence I used to code first, and then derive the flow chart for others. So, in the following examples, I will be giving only the recursive logic and leave the iterative one to you, if you need it.

**Permutation & Combination**

Well, this is the problem that motivated me to write this whole article. To be frank, this problem was the goal, in trying for which in my early days, I explored much of recursion. This problem was also my first exposure to arrays (not knowing arrays, I used to seek an elusive *variable variable*!). The enigma of this problem was that, for exams we used to code the permutations of fixed size, like for a 4 letter word or a 5 letter word. But, a generic solution for n-letter word was very elusive. I still consider this problem as a nice test for anybody trying to learn recursion. It does need some mathematical bent, unless you consider such pattern finding as commonsense computing.

Consider the 4! ways of a 4-letter word.... (<sub>4</sub>P<sub>4</sub>)

**1234** **2134** **3124** **4123**

1243 2143 3142 4132

1324 2314 3214 4213

1342 2341 3241 4231

1423 2413 3412 4312

1432 2431 3421 **4321**

Notice the bolded starting points. These could be generated by a single swap, if we assume that the previous bolded position is available. But how to ensure that this is available after all the other combination? This requires a **ripple**. Ripple is simple, but how to explain it best? As you can see, this recursion too needs a wrapper method to hide the extra parameters that are required in the recursive version. This `permutateFull` method is to generate just the <sub>r</sub>P<sub>r</sub> permutations.

//A recursion wrapper

```java
public static void permutateFull(int[] array, ArrayHandler handler) {
    permutateFull(array, 0, array.length, handler);
}
```

//The main recursor for factorial-permutation

```java
private static void permutateFull(int[] array, int start, int end,
            ArrayHandler handler) {
    //we don't care how the result array is used, we just call the handler
    if(start>=end-1) handler.handle(array);
    else {
        permutateFull(array, start+1, end, handler);
        for(int i=start+1; i<end; i++) {
            //This is the key step
            swap(array, start, i);
            permutateFull(array, start+1, end, handler);
        }
        //tricky, maybe even inefficient, but very elegent.
        //Another key step
        ripple(array, start, end);
    }
}
```

Note that the ArrayHandler interface is not a necessary part of the logic. It is there only to separate the usage of the permutation result from the main logic. In C terms, it is just a function pointer (maybe you can call it a *Strategy* Design Pattern).

//A callback to delegate the permutation results usage.
//This is not important for the logic, but makes it generic

```java
interface ArrayHandler {
    public void handle(int[] array);
}
```

The combination (<sub>n</sub>C<sub>r</sub>) is one another new recursive logic. It just generates the possible unique combinations, without considering the positional differences.

//A recursion wrapper

```java
public static void combinate(int n, int r, ArrayHandler handler) {
    combinate(initArray(r), 0, 0, n, handler);
}
```

//The main recursor for combination

```java
private static void combinate(int[] array, int cell, int start, int end,
            ArrayHandler handler) {
    //we don't care how the result array is used,
    //we just call the handler
    if(cell==array.length) handler.handle(array);
    else {
        for(int i=start; i<end; i++) {
            array[cell] = i;
            combinate(array, cell+1, i+1, end, handler);
        }
    }
}
```

Notice that to calculate <sub>n</sub>P<sub>r</sub> permutations, we don't need a new logic. We just use `combinate` and `permutateFull` in a nested fashion.

//A simple usage scenario

```java
public static void main(String[] args) {
    //Using nPr = r! . nCr
    //We calculate the permutation (nPr) using the combination (nCr) and
    //full-permutation (r!)
    combinate(4, 3, new ArrayHandler() {
        public void handle(final int[] array) {
            System.out.println("....");
            //The r! part for the each nCr result
            permutateFull(array, new ArrayHandler() {
                public void handle(int[] array) {
                    printResult(array);
                }
            });
        }
    });
}
```

The simple primitive functions used are the following. Mainly note the simple ripple method (just a loop of successive swaps).

//The plain old swap

```java
public static void swap(int[] array, int i, int j);
```

//Just initialize the array with 1,2,3,4...

```java
public static int[] initArray(int size);
```

//Use the reault array however you want

```java
public static void printResult(int[] array);
```

//Swap 1-2, 2-3, 3-4 ... (n-1)-n

```java
public static void ripple(int[] array, int start, int end) {
    for(int i=start; i<end-1; i++) {
        swap(array, i, i+1);
    }
}
```

**Chess, puzzles and Combinatorics**

Puzzles are the important source for most of the mathematical branches. Graph theory started from a bridge traversal puzzle, by Euler. Probability came out of gambling. In this sense, though Chess is not a pure mathematical discipline, it has all the signs of one. Beside the chess proper there are few chess related puzzles that have become a passion for many. Two of which are prominent: One is the *Eight Queen Problem* and other is the *Grand Knight's Tour*. I'll present the easier of them, the queen puzzle. The tour puzzle, I think, needs some more thinking, as exhaustive search seems nearly impossible. I tried the brute fore logic but it didn't generate even one solution after 30 minutes. It did find some 61 move false starts, but nothing more.

Another non-chess puzzle that is recursive and interesting is the *Tower of Hanoi*. I'm tempted to say 'I leave that as an exercise for you' ;-) but the fact is just the space and time crunch.

**The Eight Queen Problem**

This is an interesting, catchy and very old chess problem. Here I assume no special tricks but the plain old backtracking exhaustive search.

The goal is to keep eight queens (use the 8 pawns) in the regular chessboard, such
that no queen attacks the other.

eg:

1 5 8 6 3 7 2 4

8 4 1 3 6 2 7 5

![Chessboard](/assets/images/Recursion%20through%20Combinatorics/666d79fdc2770aa1650939193e03f881.jpg)

This linear form of solution means, to place the queens in the specified rows of the successive columns. In the first solution, keep the queens in 1st row of
1st column, 5th row of 2nd column, 8th row of 3rd column etc.

There are 92 solutions in all, but only 24 that are unique; others are just the reflections and rotations of it. You can even experiment with any nxn chess board.
In 4-board --> 2 solutions, 5-->10, 6-->4, 7-->40, 8-->92, 9-->352,...

//The input col would initially be zero,
//and thus this method need a wrapper method to hide this
//recursion related input parameter
//The positions is a global array

```java
public static void placeQueens(int col) {
    for(int i=0; i<positions.length; i++) {
        positions[col] = i;
        if(isValid(col)) {
            if(col==positions.length-1) {
                printResult(positions);
            } else {
                placeQueens(col+1);
            }
        }
    }
}
```

Of course, as you might be knowing, the following are the queen specific checks.

//This just abstracts the queens movement possibilities.

```java
public static boolean isValid(int col) {
    for(int i=0; i<col; i++) {
        //check for upper diagonal clash
        if(positions[col]==positions[i]+(col-i)) return false;
        //check for row clash
        if(positions[col]==positions[i]) return false;
        //check for lower diagonal clash
        if(positions[col]==positions[i]-(col-i)) return false;
    }
    return true;
}
```

**Epilogue**

Well, I started off to summarize the whole domain of recursion, including the mutual recursion and some research of its pitfalls and solutions, but could complete only the introduction to the whole subject. This just means that I'll try for one more article in these lines. Just for completion I'm attaching the source code of these examples, which you can tweak and experiment. I'm really sorry that the coding is not up to any standard, except the logic maybe, as they are only quick code hacks. For whatever it is worth, you can download the source code here (~5k).
}
