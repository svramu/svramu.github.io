---
layout: post
title:  "Thinking about Architecture"
---

Just a rambling sequence of thoughts about the best idiom for an architecture

**Vertical Stripes - Functional Independence**

In n-tier Layered Architecture (or Horizontal Stripe) it is the common to view the whole software as consisting of GUI, Middle tier, and DB. Or, these layers can be further resolved into thinner layers, but the whole software is one big vertical stripe. By Vertical-stripe, we mean an end-to-end solution which takes of everything from Data-Capture to Business-Logic to Resource-Persistence. In this sense, whereas the traditional Layered-Architecture can be considered to be consisting of Horizontal-Stripes based on technology usage, the Vertical-Stripe is more a functionality based separation of software modules.

**Horizontal Layers - Programmatic Independence**

But, for the reasons of consistency and re usability, the programmatic technological separation do have its own benefits. This way, many similar tasks of the standalone functional vertical stripes, can be simplified by using common programmatic solutions across the application. Of course the concern in this view is the reconfigurability of the horizontal software pieces for the diverse vertical functionality. (It is better to call horizontals as layers and verticals as stripes).

**Functional Independence again**

It must be kept in mind that however useful a technical stripe might be, the loosely coupled vertical independence of the functional stripes, is immeasurably valuable for the sake of extendability of the whole application. This way, we can start with the core stripe and slowly extend the whole spectrum of the application capabilities, breadth wise, as we mature in that domain. However hard we try to make an application complete in itself, there is bound to be new revelation along the way, and the unavoidable addition and deletion. Hence it is prudent to design for change and not for completeness.

**What is basic?**

OK, what should constitute the core vertical stripe? How thin or broad it can be? if the full breadth of the application is impossible to predict, then how are we to predict the credibility of our allowances for it? In this regard, we must note that breadth of an application depends on the functional domain hence always of secondary expertise to a developer. This might be the reason for the instant adoption of the Horizontal Stripe model, where the criteria for separation is clearly technical and not functional, hence fully inside the control of the developer. But, the past few years of practices and moods show that, although technological focus is irreplaceable, we have to, and are ready, to branch into the functional focus mode. Contrary to the conservative belief that 'what we cannot predict, we cannot plan for', customer needs do have nice patterns, if we follow the relatively long history of software products. What are these patterns? needs more elaboration.

**The Iterative Spiral development**

It is generally realized that the Iterative or Spiral model of development, in stages, is far superior to the old linear waterfall model. This focus on Functional Vertical Stripe based Architectural approach, does have this element of iterative spirit in it. And taking the horizontal stripes too to that goal of iterative sophistication, we arrive at the ideal software process. Certainly this has a ring of completeness and manageability in its semantics. The idea is simple, start with a standalone module, create and link it with other such isolated modules to create a vertical stripe, and then add more disjoint vertical stripes to the application, find similarities been the 'beads' of the vertical stripes, merge beads wherever you can, and at last what you get is an evolving organism of software module web, which together function as one application, and yet is reusable into other application. This almost make applications an overlapping packaging of reusable and standalone components (or beads). The holy grail!

**The component web**

Thus we come back to a well known idiom of component based development. The current Web Service trend is also fully in these tracks. For completion sake and logical elegance, can we abstractly extend this concept of planar web into 3D? Thus consider whole application as a loosely coupled, declaratively linked, web of components, which are absolutely isolated from each other's internals, but linked only based on their published messages and input-output data dependencies (maybe through XML alone).

**Imagining the Component and its Connections**

Imagine the component as a smooth shining black spheres. Which has well defined one-way valves, and buttons to start some transformation on the inputs, and output it. It is important not to imagine the component as just black cuboid boxes, as that will color our imagination, and restrict us to fewer ways of linking with other boxes, and with fewer one-to-one input-outputs. The spheres allow us imagine easily numerous magnetic relations with other spheres, and many-to-many input outputs. This addition of complexity through many IO and many links is justified, as the overall complexity is reduced dramatically by this model. The software is no longer a huge indivisible jelly, but a pluggable sphere-and-thread web. Extending this idiom, the spheres and threads could be of many different types. But, spheres and threads are independent world in themselves, yet interact (maybe like man and women as threads, and things of world as the component). Thus both the component and the glue, can be imagined as objects or as protocols. More concretely as jar-files and XML-files!

**The Jigsaw Puzzle**

There is a danger in imagining the links as threads, as it gives them an identity of their own. Ideally the links should only be a protocol and everything else are the component themselves. Maybe a Jigsaw piece can be a good abstraction to software component, and its unique curved border is the protocol, to which other jigsaw pieces can attach to. Of course to avoid the graph theoretic planar-ness of the whole picture and the consequent inconceivability to certain components, we can imagine the jigsaw piece in 3D and hence with lot more unique socket to connect to or allow connections (here, thinking one piece as client and another as server is dangerous. think of two way membranes). But, even in 3D the problem of exhausting the connectability is imaginable, hence we have to fall back on the abstract graph theoretic vertices (components) and edges (protocols). Vertexes and Edges is certainly more abstract but useful than its restrictive 3D equivalent of bead and thread. One vertex can be connected to as many other vertices as possible, edges are not real, but just a way of denoting the connectedness.

**Ropes ands twines (Carpet, Mesh) Model**

Coming back to stripes and layers, after much thought, it does make sense to keep the vertical stripes standalone, and as the key focus. Of course the horizontal programmatic commonness can be imagined as the binding twine, for the vertical function ropes. This way we keep the isolation of the rope stripes as pristine with twine as the bundling connection. Of course, the twine too can be considered as a liner bundle of yarns, as much as the rope is a linear bundle of thinner chords, and the whole application is a carpet of vertical threads and horizontal bindings. Also note that the vertical (seeing the horizontal carpet with its length horizontal and breadth vertical) is sealed at both ends (that is un-extend-able) but the horizontal can be extended as much as we wish by adding more and more, independent, vertical threads. This way the emphasis is more on the functionality based expansion, and technique based horizontal compactness. The user is at the one end of the breadth of the carpet and the data store is at the opposite end, and each functionality is one immutable thread between these.

**Lattice or grid (NET) Model**

Carpet is too cohesive and continuous for the real software imagination. In real life, for each stripe we have to deploy three executables, one for GUI, Middle and DB tier. If we assume these to be vertices of a lattice then the vertical and horizontal connections are the intra-stripe protocols and inter-stripe protocol respectively. Or better still we can call it as NET model, as the edges need not be straight or perpendicular, as each node can be connected to more than 4 or 6 other nodes.

**And the war goes on...!**
}
