&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Chaos, Fractals and P2P Programming

Minimum Rules and Maximum Possibilities

*S V Ramu (2002-04-27)*

**Chaos:**

*Most animated gifs in this article are very small due to page size constraint. You can look at it magnified, by using the Microsoft Magnifier in Start/Programs/Accessories/Accessibility/Magnifier.*

On first exposure, one might assume that *Chaos* is just any random phenomenon. But it is more than that. Chaotic systems are very dependent on their initial conditions, but after that they usually follow, fairly simple rules of transformation. But in spite of their simple and concrete state transformation rules, the system might be too complex to predict 'what its next state will be'. Nowadays it is realized that weather and many other real world phenomenon are chaotic. Which means that they follow fairly simple rules, but yet they are highly predictable.

A phenomenon is termed *Random*, if we cannot predict what its next state will be. Many a times, though we cannot predict the next state, we can say with pretty good accuracy, how many times a given state would have occurred out of the total number of states that the phenomenon went through. This ratio of how many times a particular condition occurred, to the total number of conditions that occurred, is called the *Probability* of that condition. Roughly, such random phenomenon, along with their probabilities is called a *Stochastic Process*. Sometimes though, we not only know the probability of a state, we also might know the probability of transitioning from one state to another. A stochastic process with such transitional probabilities is called a *Markov Chain*.

Even in phenomenon where we know exactly what will happen (if given what it is now), might turn out to be very very complex and hence seemingly erratic. Such phenomenon, which have clear cut transitional rules but some random initial conditions, are termed as *Chaotic*. Throw in some randomness in the transitional rules too, and you have a *really* chaotic system. Jargons apart, what we are saying is, when some phenomenon seem completely erratic, it is still possible to study it in a systematic way, through its inherent invariant rules. Though Einstein used to publicly criticize these randomness based macro study, as inelegant sciences, many a times this is what all one can do. He himself applied these ideas in many of his studies, to obtain some useful non-trivial results.

Chaos is a promising concept. Because, even though a system seem to behave very random or erratic, there is still a big hope that, we might find its inner constancy and the initial conditions, and thereby be able to predict the system's future states. Of course, this has not been possible in many a situation, yet it is still a very luring promise of a shortcut.

**Conway's Life:**

Life, is the most famous cellular automaton, created by John Horton Conway (it was widely known after Martin Gardner discussed it in Scientific American). You can see it in action with a neat application by [Juan M. Aguirregabiria](https://tp.lc.ehu.es/jma.html).

In this automaton the universe (which may be rectangular or, if opposite sides are identified, toroidal) is made up of a finite number of contiguous square cells which may be alive or dead and have exactly 8 neighboring cells, which in turn may be alive or dead. The evolution, from one generation to the next one, is governed by two simple rules derived from the number of live neighboring cells:

*   A cell will die in the next generation if in the current one is surrounded by less than 2 or more than 3 live cells. One may think that in the first case it has too few friends to keep in life, while 4 or more neighbors are too much for the available food.
*   In an empty cell a new one will appear in the next generation if in the current one is surrounded by exactly 3 live cells. In this universe three parents are needed. These are the classical rules, but in this program you can change the number of cells necessary to keep alive or to give birth to a new one, in order to explore other possibilities.

The evolution of this universe is fascinating and many interesting configurations have been found.

There is no randomness in this scenario, except the initial condition. After that, everything is exactly as per rules. Yet, even such very very small rule set (just two here) could have a far reaching complexity. Though we can with certainty predict the next stage of the simulation (given the present one), we cannot say what would happen after say 10 *generations* (applying once, the above two rules is called one generation). In this simulation, based on the initial cells, there could be many different configurations possible.

*   For some starting cell configuration, there will be no visible change, as all cells get stuck with the 2,3 neighbor rule. Each one of the colored configuration below is stable, and won't change in any number of generations. Also, any other arrangement that happens to come to these states, will stay here forever.

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/7b6b897668dfc0986d97b4d36644a8de.jpg)

*   Some states oscillate between few finite numbers of states (two here). These too are stable final states, albeit a dynamic stability. The key cause is the dynamic birth and death of cells.

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/0ce49a6236ec97ead9cec172129f8a8c.jpg)

*   If the cell arrangement gets caught in the below-two/above-three neighbor rule, then the arrangement steadily decays, and after some generations, the whole population dies out, or hits a stable end.

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/d94fada25bdcbb22166dd440a96785bf.jpg)

*   Sometimes interesting things happen. If things are properly arranged, the creations and deaths of cells will so suitably happen, that the whole setup seemingly moves about. Of course many other dynamic configurations are possible, and you can experiment them in the above said free program.

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/bc4b9049d46f10fc21064c1ad960a70a.jpg)

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/cc9c8a044b6d8d2b762b4da9db1ac1c0.jpg)

The importance and the novelty of this simulation is that these cells resemble the human population with an amazingly similarity. If our civilization too starts with different initial conditions, we too will propagate, oscillate, completely die out, or maybe move about. Another beauty of this game is that the rules are so simple, and yet the possibilities are so innumerable. Even for a 5-10 cell configuration, you need a computer to simulate the behavior. Whether a given population will grow on for ever, or that it will die out or stabilize on some state is an open question and completely determined by the initial condition (if so after how many generation?). From what I've seen, all population comes to a standstill (either completely wiped out or hits a dead-end). Maybe we can prove this from the two rules alone.

**Fractals:**

As I remember reading, it was Mandelbrot (pronounced 'mandelbro') of IBM who first studied *Fractals* as a way to describe natural shapes and phenomenon. Now it is so famous and useful, that people use it for everything from image compression to weather forecasting. I'm not sure about the exact chronology, but Fractals and Chaos became famous together, though it is said that the study of Chaos is much older. One reason for Fractal's glamour could be the stunning and unbelievably complex graphics that could be generated by suitably setting up the initial conditions and transformation rules (who could forget the Julia sets and the Dragon Curves). I basically treat Fractals as the concrete side of Chaos, but dealing with the same intention of deterministically simplifying a seemingly erratic phenomenon. For a start, you can look at the J2SE 1.3 applet demos (JAVA_HOME/demo/applets/Fractal), which nicely shows the well-known Von Koch ice crystal curve.

The rigorous definition of Fractals has something to do with *Space Filling Curves* and *Fractional Dimensions* (hence the name Fractals). For us it just means things that could be accomplished with ridiculously simple rules and initial conditions, and yet mimicking the real life's complexity. The interesting anecdote about the 'squigiliness' of any continental shoreline is very apt and thought provoking. These days, I assume any chaotic system that doesn't have randomness in it as Fractals. I doubt the validity of this assumption, but it does satisfy the need to classify randomness and non-randomness with respect to simple transformation rules. (Do look up the web).

We can easily make a program with recursive logic to visually present the Von Koch Quadric Curve (looks nicer than the J2SE demo, as the sides are straight). The idea is to start with a simple straight line and continuously apply the square sine wave like shape to each edge at each stage. You can see this applied to a square.

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/cdd556afbb83762aa50fefae422c3711.jpg)

**Serpenski's Triangle:**

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/1559178c510f3c7cdea25f69f677651f.jpg)

Is it really possible to have a system that is random in its successive states, and yet is very predictable overall? A popular and simple example is the Serpenski's Triangle.

*   Take any three *Fixed Points* (shown as yellow squares).
*   Now take a random point anywhere is the picture (shown as a yellow dot in the upper left). Call this the *Current Point*.
*   Now choose any one of the 3 fixed points randomly, and plot the mid point of the chosen Fixed Point and the Current Point. And make the mid point as the Current Point.
*   Now repeat the above step for ever (say 10,000 times).

If the above steps are carried over you'll get a very legible triangle that is on the right side. How is this possible? How can a repetitive random process ever produce such concrete outcome? You should try this program to believe it. In fact this can be very simply proved with just similarity of triangle. Somewhere in our heart we believe that anything that has even an iota of randomness in it, behaves unpredictably. It is something like, long calculations stopping people from knowing a concept, in past.

The importance of chaos is that it does salvage some information from a seemingly erratic situation. We need not be right away put off by the randomness of a situation. We can try to unravel the hidden simple rules of the system. Chaos is predictable randomness. Of course not all erratic happenings bend to analysis. But we can try.

This example is also a link between Chaos and Fractals. This same Serpenski's Triangle can be made from completely deterministic fractal like rules. This makes me suspect that maybe every random phenomenon can be approximated to some very *recursive and self-repetitive* deterministic fractal rules. To produce this triangle through fractals, just apply the following figure recursively to each side of itself (in one consistent direction).

![image](/assets/images/Chaos%20Fractals%20and%20P2P%20Programming/bc1ce4ffa51ae1e0f695ffa1e14057fb.jpg)

**P2P Programming: Minimum Rules and Maximum Possibilities**

As we know, human mind cannot remember disconnected things. Concepts must have a rationale behind it. An Application Programming Interface is a kind of axioms for whatever application we make. How flexible and powerful a platform is determined by the reach and genericity of its API. More complex the API is, less useful or discouraging it is to the developers; but too simpler if it is, its lack-of-reach and inflexibility is blamed. There need to be a balance between the simplicity and the breadth.

Hitherto, thinking in conventional terms, we did not go beyond certain simplicity, with the fear that we might be too restrictive. But the chaotic systems encourage us to think about a different level of drastic simplicity, where without sacrificing the power of the API we could reduce the base rules to unimaginable simplicity. This is very much needed because, as we progress we need to assimilate old concepts so thoroughly so that daring newer dreams are possible. Already the API's are proliferating is such speed (just see the JSR traffic), that we might get caught in our own confusions.

In this light, the specifications of JINI and JXTA are invitingly simple. They just mind the core architecture and leave everything else to the developers to experiment and extend. All the time ensuring that things don't go so incompatible that they don't work together. I comforted by the concepts like, *'A book is complete not when you cannot add anything further, but when you cannot remove anymore'*, also the old maxim (which, Java made still more famous) *'Less is More'*. It is not easy to resist the temptation of 'throwing in the kitchen sink', so to say. Always my initial attempts at an article tend to include too many disparate things, to act as a personal brain dump rather than an assured and soothing tutorial. Maybe as we mature we will grow out of this habit, and concentrate more on the absolute core, leaving the peripheries to the whims of future.

Peer-To-Peer (P2P) networking is trying to completely eliminate the central bottleneck of the present server based paradigms. P2P is also trying to more optimally use the network resources, apart from the fault tolerance criteria. You can look up the JXTA spec and the GridEngine spec of Sun. With JINI they started imagining many redundant service locator servers, but even this is made unnecessary in JXTA (apart from the removal of Java binding, towards XML). JXTA specifies 6 (supposedly simple) protocols (I'm yet to master them) to allow communication between varied peers. They say that the whole core platform code is under 50k (and still reducing). This minimality of core protocols is in many ways, the way to go. The much praised simplicity and focus of the NFS (Network File System) protocol of Sun is very much visible in this network architecture standardization effort too.

The use of simple but Fractal like powerful rules for P2P programming is that, the developers are free to use these rules in many different ways and in many different situations, and thereby creating powerful future systems. Of course this is a utopian dream, but worth the effort, if it is done in a collaborative and open manner. Whenever we create some architecture or a protocol for the Holy Grail of Distributed Computing (or for that matter anything), we need to keep this simplicity and flexibility requirement in mind. Maybe some more in depth study of these invigorating concepts of Chaos and Fractals could make our endeavor that much more success-prone.
}
