---
layout: post
title:  "Engineering Service Architecture"
author: ganesh
categories: [Article]
---

On modularizing a system as reusable services

![service architecture](/assets/images/Engineering%20Service%20Architecture/1793b2683f36f043e273a55c2f56e6f4.jpg)

## Introduction

Defining an Information system in terms of services has become quite popular for some time now. Be it EJB, CORBA services or off-late Web Services, the fundamental idea behind them all is to split the requirements of a system as services, having well-defined responsibilities. It is important to differentiate between the technology and the underling architecture, as in this article we will be concentrating more on the architecture, business and Software Engineering angle rather than the core technology and the implementation aspect. We will also be going through some of the generic guiding principles in engineering service architectures.

Here we will consider a medium to large sized organization typically having various projects, to accomplish various activities within the organization, using service architecture.

## Service Vs API

Typically a service is run in a controlled distributed environment, whose system property (transaction, pooling of resources, etc.) can be administered from outside the application runtime. If I could make every API a service with all the above mentioned features, it would be the height of technological advancement. But neither there is urgency for such level of distributedness nor do we have enough technology right now to do it, while meeting the desired performance criteria of the system. So we have to choose what is to be the API, and what is to be a service, with all its qualities and compromises. The determining factors for an API to be made as a Service are...

*   Execution time is longer

    *   Typically I/O (Database, File I/O) activity takes longer time, hence can be made as a service.
    *   Huge number crunching operations.
*   The need for Single-point control over the logic.

    *   Like, currency-conversion operation needs real time data with volatile logic. This logic for it need not be available in all the machines, to avoid maintenance headaches.

## Goals

Before going though the various details of a service architecture, let us understand what we would achieve at the end of it.

*   *Service Reuse*: In its truest sense.

For this to be possible we need the following,

*   *Service Modeling*: A deciding factor in designing a service architecture
*   *Service Comprehension*: A service should be easy to understand.
*   *Service Management*: These are like any other soft skills, but very important for the success of a service architecture.

## Reuse of Service

How many times have a class written been modified, just because we had a small change in the requirement, even though it does not actually affect the intended functionality of the class? More often than not, it so happens that we apply lot of thought in technical ability of reuse using concepts like polymorphism, inheritance and even design patterns. But little thought is given to business sense of reuse. In reality the complexity of a requirement is too high to solve it just by technical reusability techniques; we will have to graduate to the next level. Let us go back to the First Principal of OO process model, the noun phrase analysis and iteratively pruning them. The core idea of modeling a system to real world is important for reuse in its truest sense.

A service is reusable; but to be reused by what? Often we don't have an answer for this. But latter, we realize that it should be reused by other possible requirements. Because of sheer economics and software engineering aspects, it is pretty difficult to predict what will be the reused in future. The complexity is too high to predict one. On the other hand, if we are so sure of a future need, we would any way design for it. What we all have is the current business requirements; so will have to model our system against the current needs and should cater to the future needs by following sound design principles. A service which is not modeled to a fine grained business need has less possible reuse.

## Service Modeling

What is so different about real world modeling and the business modeling? Nothing great! We are just leveraging the fact that the business functional units (a class!?) don't change much but their interaction do. Like an 'Account' does change its meaning over a period of time, but *where all* an account can be used can be different and needs to be changed due to various business requirements. Now we know what is changing and what is not, so let us '*Separate* what is changing from what is not'. Here the business functional units are made as services and others are clients to them.

## Data centric service model

A check on what are the possible inputs and outputs of a service is quite useful in modeling a service. No two services within an organization should retrieve the same data. If we have more than one service returning the same business data, it implies that there is some amount of duplication of the model and that there is no central control on enterprise data, which is crucial for reuse and better manageability of the system.

The data retrieved by a service should never be client dependent. This is because a client represents a combination of business functionality but a service is not. A client represent a user view of how one wants a particular core business functionality to be viewed. It is fast changing. Both the business and the technology are changing, so it makes more sense to make the services independent of its client. It is often the case that we are developing a system which involves both client and server (services). In which case more care should be taken to make the service not specific to one or few clients. This is synonymous to completing a code faster by introducing more flags; but remember that maintenance and enhancements are at stake.

## Service Comprehension

At the first look, the need for comprehension of a service may not look immense but it is, because the litmus test for a well defined service architecture is its comprehensibility. Simplicity, Uniformity and documentation are the factors that influence the service comprehension; let see each of them in detail. Not to forget that, more comprehensible a service is, more reusable it will become. Note here that we are not discussing about the simplicity of implementation of a service, but the simplicity of the service architecture, which will pay only over a period of time.

Uniformity in the way we access a service, passing common info from client to server, etc. are important for making a service more 'readable'. Though some commonalties cannot be made uniform at the organization level, it can be made uniform across a defined business group. Categorizing services should be done at a broad level initially and fine tuned iteratively.

Documentation. Most important and surprisingly difficult is to maintain documentation of the services at the organization level. Making it accessible to every developer, is an added challenge. Like many other documentation techniques, here too the documentation has to be made with structured templates so that all the services can be described in similar manner. This is for the simple reason that we don't miss out on important information of a service definition. Another point to note in documentation is that, if you really want to have good documentation and want it to be maintained too, then *Keep it short*.

## Influence of technology on Service Architecture

Though technology has little or no influence in business modeling or in making a service architecture, there are some practical limitations due to technology, which need to be addressed. Irrespective of what the technology we are using, performance and scalability needs has to be handled ingeniously. Design decision in this aspect could be crucial. Design Patterns on various caching techniques, pooling of connections and other resources are vital and using the technology-provided features for pooling (like EJB Object pooling) are important too. Pros and cons of having 'state' maintained in the service architecture is to be analyzed based on the organization requirements.

A word of caution here is to keep the technology as independent as possible to the organization's service architecture. In fact EJB did achieve this to some extent by making the container responsible for peripheral and technical requirements of service's functionality.

Versioning. For sure there is going to be some business changes, which could shake the core of the business. What ever we have designed as core and fine-grained service may not remain so. Even if there is less likelihood of this happening, we should be prepared for it. These changes could be because of the dynamics of a business itself. Say a merger/acquisition happened or a diversification to the existing system requiring a change to the current business model. We need to have a plan and version the possible changes to a system. Here technology could be handy in having a predefined extension mechanism. A Java (for EJB) based extension or a CORBA based IDL inheritance can be used for extending an existing system.

## Service Architecture Management

To maintain the level of serenity that a service intends to have, and to make the service reusable in its truest sense, we need to have all the service going though a common approval system. If everybody understands the architecture and the spirit behind each and every design decisions we wouldn't need this system. But this seldom happens, in reality.

The approval system must be able to screen various service requirements within an organization. This will avoid service being created too project-centric; and it will only take little effort from the approval system to make it a organization-level public service. We would also require a stubborn and confident manager here who puts preferred service architecture into action. Any kind of slackness in making a service generic would make the organizational information system chaotic and inconsistent in the long run. The role of the approval system will be to review the service request in pure OO terms and keeping in mind the defined guiding principles of the organization, irrespective of the technology used.

