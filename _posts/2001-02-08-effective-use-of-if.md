---
layout: post
title:  "Effective Use of 'IF'"
author: ganesh
categories: [Article]
---

Is 'IF', the next generation GOTO ?!

**Introduction**

![code usage](/assets/images/Effective%20Use%20of%20IF/d481acb761d26d2dd302001a9b846db6.jpg)

Using 'IF' effectively in object oriented programming is an art. You haven't felt this? Looks ridiculous ? Trivial ? Many of us must have passed by this stage without actually stamping on it. Nevertheless we need to stream line this concept and enforce it with strong (but simple) theoretical background. Let us strive to change this art to a engineering discipline, this article is in an attempt to do that.

**Why is it bad?**

*   Inappropriate 'IF' makes the Object-Oriented programming look Procedural.
*   Code becomes less reusable.
*   Code Maintainability decreases. Change will not remain a cakewalk.
*   In short, it breaches Object-orientation, and the rest follows.

'IF' Statement is undoubtedly the successor to notorious GOTO statement. The worst part of it is that it is hard to realize this. Unlike 'GOTO', 'IF' statement cannot be altogether condemned and this adds up to difficulty, ' It is a necessary evil '. Only option left with us is to learn to use it only in the place where it is absolutely required.

**Where to Use?**

Let us define a general philosophy of where a 'IF' to be used and where it should not be. 'IF' is to be used only in the places where the behavior of system under consideration depends on a external entity. What we mean by an external entity here could be a Data Base, user interaction or for that matter any other system. For e.g. consider a case where one wants to set his application's look and feel to Motif or Windows or any other. Here our system should have a mechanism to known what the user(external entity) has set. So Bingo ! use our 'IF' here. Typically a ' if (GIUType.equals("Motif")) ' kind of check has to be done.

**Use it only once**

It is not enough to know where a 'IF' to be used, we should ensure that it is used ONLY where we need and no where else. Sometimes we make mistakes by inadvertently using a boolean instance variable for this. We set the boolean variable once and check this in many methods of that class. Let us take the same example, The user wants a Motif look and feel(say), so instance variable is set to "Motif". Now for creation of each GUI Component we need to check this variable. So there will be 'IF' condition to check before creation of buttons, checkboxes, window ... At the end we land up putting this 'IF' check in so many places that it is enough for us to get confused.

Clearly any change to this GUIType is going to have an effect in many places and thus leading to increased maintenance cost, programmer fire fighting and all this for no avail.

**Way Out**

Mere awareness of this potential hazard of using 'IF' cond during development is definitely going to help.

Most typical solution for this problem is to take a entirely different program flow for each 'IF' condition. This will ensure that in that program flow we choose, we need not repeat the 'IF' condition. This is definitely a desired feature for maintainability.

For the example given in this article Abstract Factory Design Pattern (see Gang-Of-Four Patterns) is a bulls-eye solution and we completely avoid 'IF' conditions except for once when we have to know the details from the external entity. Explanation of this pattern is however not under the scope of the article.

**Conclusion**

There should be some language support to streamline the use of 'IF'. It is natural to make good programming practices as a part of the language construct itself, thus making good programming mandatory and thereby not allowing the programmers to commit errors. This is not first time this happened in the past, it has happened with global variables, with GOTO and may be soon with 'IF' as well.

