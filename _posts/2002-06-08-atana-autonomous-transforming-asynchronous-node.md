---
layout: post
title:  "ATANA - Autonomous Transforming Asynchronous Node Architecture"
---

An attempt to model any software as a collection of XML transforming nodes

![ATANA Architecture 1](/assets/images/ATANA%20-%20Autonomous%20Transforming%20Asynchronous%20Node/28ca38e611408c7f4d5667032d9a9f51.jpg)

### Meta Prelude

This article is a continuation to few other earlier articles, on the importance of imagining the whole application as a web of data transforming nodes. This is already used successfully in the web server scenario by [Cocoon](https://www.tattvum.com/Articles/2002/2002-05/2002-05-12/Ramu-SE-2002-05-10-ILoveCocoon.html). In fact Cocoon brings alive the possibility of generalizing any software as *piplines* of XSL transformation. In an [earlier article](https://www.tattvum.com/Articles/2002/2002-03/2002-03-06/Ramu-SE-20011111-IsOopDead.html), while discussing about the interesting future of treating everything as XML, and in [other times](https://www.tattvum.com/Articles/2002/2002-06/2002-06-09/Ramu-SE-20011101-Architecture.html) the idea of assuming functionalities as standalone nodes connected suitably to form the whole application was very satisfying and promising. Then why not push this grain of future possibility now?! That is what this article is trying to do: To elaborate this 'pure XML-XSLT' based architecture, and see how far we can escape OOP/Java for business logic. Not knowing Cocoon fully, this exercise might as weel turn out as just the explanation to it. But, that is fine enough. What we want is a simple, distributed and extensible way of looking at an application. If Cocoon is already that, we can adopt that and proceed further. By the way, if this idea is appealing, we will make this is as an early member of the new *PoPP (Proof of Principle Prototype) Archive* that we are planning at TATTVUM.

**The Architecture**

![ATANA Architecture 2](/assets/images/ATANA%20-%20Autonomous%20Transforming%20Asynchronous%20Node/501a818a5dc66a0129b627bea8c3953a.jpg)

![ATANA Architecture 3](/assets/images/ATANA%20-%20Autonomous%20Transforming%20Asynchronous%20Node/aa54e5793988e5e946514fc5cce1b827.jpg)

As far as I know, this is exactly what Cocoon is doing. Except that I haven't explored all its potentials and limitations, so cannot quote it for reference, except reuse the terms like *generators*, *serializers*, etc. Also, it is point less to wait for someone else to provide for us. Somewhere, without worrying about false starts we have to clear our own dreams. In that sense this article is an attempt to spell out as clearly as possible, what is really needed in an architecture. Because without that being clear, we won't recognize the good thing that is out there, even if we see it. This is just an active way of learning. Instead of just trying to understand what is there, we try to define what we want and start finding that. In that process, if an already existing thing answers our question, we can pick it up and proceed further with new dreams. If there is no answer for our unique question, then we create one. If you are mentally prepared, this simulated rediscovery is very beneficial and always keeps you meaningfully busy.

**More Developers - The prime goal of an architecture**

When groping with the question of, 'What should I design?', the following approach is very satisfying. The stress on parallelizability of a development process is not much recognized. But, this could as well be a cool metrics to measure the merit of a planning process.

The goal of designing a solution, is two-fold. One, to meet the requirement, of course. And two, to maximize the possibility of parallel development through modularity. I think the second is not recognized in such explicit terms. To make it bit more dramatic, the abstract time line and abstract job assignment, should be furnished only by the architectural team, and not some non-technical project manager. How could the managers know the possibility of parallelism in the design? Their role is only supportive. Their job is to make the timeline concrete with exact dates, and the job assignment concrete with exact names, and then ensure that all these go along smoothly, and the real-time problems are properly abstracted and given to the architect team for solution. This is the only way that introverts and extroverts can coexist. People with mixture of both can be the nexus people (spokespersons) or the manger of the whole project.

([Axioms of Software Business](https://www.tattvum.com/Articles/2002/2002-03/2002-03-11/Ramu-SE-2002-03-10-AxiomsOfGovernance.html))

I used to dream about something like ODOPOT. It is, *One Day, One Person, One Task*. At that time I myself new that I was not ready for that, and my colleges did well to warn me that this is ambitious. Of course, it never got implemented. Still, this is the goal that keeps one in track while evaluating a new silver bullet of my own dreams or of others. Can an architecture allow us to think about the application in a way, that will automatically decide about the number of ODOPOTs required by the project? Like [Testable Requirements](https://www.testablerequirements.com/), ODOPOT too promises to be an interesting way to look at the project size, and especially development.

**Autonomous Node**

Each ATA Node could be considered as a standalone and asynchronous XML aggregator and XSLT converter. Thus if properly granularized, each node could very well be the *a unit Task* for *one person*, and might even be for *one day*. The luring point is that, a XML ATA Node is very well defined. We can tell what XML inputs are there, what XML output we need, and what all XML configuration parameters are there. The developer's task is to write the conforming transformation code. Here, my take is that XSL could very well be the only language required, to the exclusion of everything like Java or C++. This is what the PoP implementation will latter try to test. Pushing this idea further, we can imagine that a group of related XATANs (XML ATA Nodes) could be assigned to a group leader, with the well defined list of XML inputs and XML outputs.

Thus each node should and can mind itself and itself alone. The Input, Control and Output (ICO) being well defined, this is very much possible. This feature of the nodes is very important for delegating the whole node to an individual developer. If this node has too many configurable controls, and a huge input, or huge output, this could be further zoomed in to a mini web of XATANs. This means that we can start the application as a set of ICO of XMLs, and then break them into smaller XATANs, as we go along. This is an autonomous and highly delegatable feature.

**Transforming Node**

In these early days, where XML based screens (XUL) is still in their formative periods, there will be need for building such standard XML generators, Serializers, and maybe even some Transformers. For these we might use Java or C/CC++, but never for the application logic. Only these reusable parts need conventional programming. The new data flow being fully in XML, could be transformed with XSLT alone, with some support for routinely merging of two or more XML as needed.

Any node is only a data transforming node. Whether we use XML or not, this true for any conventional module based thinking. But when you use XML to define your Input, Output and Control, the XSLT immediately presents itself as the best candidate for this purpose, and thus making it clear that a XATAN is basically a transformation node.

**Asynchronous Node**

With all the hoopla about *Network being the computer*, P2P coming up in a big way, and of course the hype on hype about Web Services, it is becoming clear that the modern paradigm of programming has to include time delays and parallelism as their main stress. A XATAN (rhymes with SATAN!) could be considered as a place where time stops and moves in its own pace. How should the XATAN to XATAN's communication be? If we assume that it is asynchronous, then how should we best model the event/interrupt based programming in XML? If the calls are synchronous, how to handle that with XML alone? These are important questions that have to be answered while working on the prototype.

**Keep Java in the background**

I mean, keep all the traditional programming in the background. The idea is to use Java or such like only for generating XML from non-XML sources. For XML to XML transformation, use only XSL (which again is pure XML). How can we model the inter XATAN calls with XML alone? How are we going to handle synchronicity with XML alone? These are open questions right now. With Cocoon like examples (where the XSP like custom XML scripting does the job), we must find a pure standalone transformation based idiom. The goal is to *completely* avoid traditional programing, and use only XSL and our custom declarative model.
}
