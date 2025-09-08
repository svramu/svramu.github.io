---
layout: post
title:  "Making design happen"
author: ganesh
categories: [Article]
---

On managing change that could affect the design

**Introduction**

This article is about how to manage the conceived design rather than making of the design itself. Many a times a good design at the end of the project becomes ineffective or doesn't remain as effective as it ought to be. This article will help to identify the forces that affect the design and general management strategy and design process that will give some guidelines to overcome it.

This article can also be thought off as a snapshot into development life cycle where we are trying to enforce the conceived architecture and design.

**Forces which affect the design**

There is more than one way a conceived design could be deviated. Broadly the forces could be pure people management problem (like lack of commitment from team member, and other issues) and other is the force that affects the design due to natural flaw in software engineering design process. In this article we will concentrate more on the problem that arise out of the later. The forces that affect are...

*   Requirement changes that happen during the development might end-up as deviation from the conceived design.
*   Pure Technical issues which might force a deviation from the spirit of the existing design.

    *   Limitation of the Language / Framework.
    *   Incomplete knowledge about the language/framework on which we are working on, leads to change in design at a later stage.
    *   Incorrect solution to the limitations mentioned above.

**Continuous Improvement**

An immaculate design is only in books and in very small projects, spending too much time up-front and perfecting the design blueprint is true only in architecting a house. Iterative or RUP or XP kind of design is proving to be better than water fall kind of 'do it right the first time' kind of design. The continuous change in the design has quite a few side effects which are different from the conventional form of design, and which needs to be engraved in our mind.

1.  Automated testing is mandatory as we are continuously improving the design; we need to test our system every time we change the design.
2.  Never hesitate to change the design when we feel the design is pulling its weight. In fact this point is dependent on the one above, the thought of automated testing will give us confidence that, any side effects in the system due to design change will be caught during testing

**Control Points - Crucial to design**

Architect or designer or a project manager or who ever is responsible for the design (let us call him a 'lead') for the enforcement of the design need to have full control over the development team as well. Nobody is infallible; there could be always some problem in the suggested design. It is not imperative to get the design right the first time, but it is imperative to improve the design along with the changes that happen to the code. The lead needs to have what is called '*Control Points*' in the development life cycle where the developers come back to the lead in case of any problems or issues that might effect the design(not necessarily affect), instead of just going ahead with the development.

The lead can then validate the design and should suggest change for making the code better in the current scenario. It is lead's responsibility to enforce a healthy *feedback control system*, so that the changes made to the code are with the same theme and philosophy that was originally thought of and yet jelling well with the new changes that happened.

