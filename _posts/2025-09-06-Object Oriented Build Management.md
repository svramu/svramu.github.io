&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Object Oriented Build Management

Using Maven 2 to unravel object oriented thinking of build and project management

*Ganesh Sethuraman (2009-02-06)*

Abstract

Have you ever wondered how a build tool can make big impact to the way we code and deliver? If you have then this is where you will find your answers, if you have not, you will get more questions and some answers to them as well! This article will explain about some of subtle aspects of build management using [Maven](https://maven.apache.org/) tool drawing parallel to various object oriented concepts that we are familiar with and how that can be applied to build management. Here we will also see how migrating to an build using maven can help the project in making the development a lot easier, to have a better Java code management and how it aids in getting it to the new level in configuration management.

There are enough number of articles & books around '[what is maven?](https://maven.apache.org/what-is-maven.html)', '[how it works?](https://en.wikipedia.org/wiki/Apache_Maven)' and '[what are its benefits?](https://maven.apache.org/benefits-of-using-maven.html)' we will not be discussing those aspects of it in any detail, rather concentrate on certain manifestation of maven concepts which makes it even more powerful in a more subtle ways than its conventional aspects.

Introduction

If a Java developer/lead has to be lured into the Maven, show them that the existing build script size is going to be drastically reduced (of order of 100x – based on my practical experience, baring the dependency list; mainly due to fact that maven uses convention over configuration approach) and would be simple too, this would give a huge positive impression to start with. Alternatively, show them that [dependency management](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) is far superior and helps with better control over the internal dependency as well as dependency over the external artifacts/jars (unlike other build tools Maven knows about the project dependencies and hence could provide better report and management of dependencies). While these are key benefits from a developer's point of view, conceptually these are rather derived or these are by-products of Maven's object oriented principles.

Maven is fundamentally organized using automatically downloadable plug-in and has objects for each area of 'project' like objects for build, documentation, configuration management, continuous integration, testing and etc. By objects here we mean, they are self-contained, and has a well defined relationship with other objects mentioned above. The objects in Maven are represented in the form of a XML for convenience. Does this mean we would need potential 'code-ability' (say using OO language like Java) in future? I am afraid, we would not need that (but it is possible to do so using [Maven plug-ins](https://maven.apache.org/guides/plugin/guide-java-plugin-development.html)). The whole idea of maven is to remove as much developer coding as possible by using the 'convention over configuration' thinking. Perhaps, we should think Maven as a DSL (Domain Specific language) for Build and project management!

In this article we will unravel as many benefits as possible which make Maven even bigger impact to the projects.  Some of the key benefits that we touch upon are:

*   Better Code health
*   Development Ease
*   Better configuration management

Adding to this, there is a psychological advantage in migrating to Maven (for that matter any change), since we have to rethink on the build process bottom-up , hence we can optimize it better because of prior knowledge and also do away with pain areas because it brings in a new perspective.

### Better Code health & its management

Code health effectively means how close the code is to what was envisaged by the architect or the key stake holder, from architecture, the design and coding guidelines point of view and how well it is open for changes. While there are absolute code health metrics, it hardly matters, what matters more is how well we are improving and going towards the nirvana that one  would want to achieve. Code is always a developer thing, so you might have a questions, how come a build tool is playing a role in achieving a healthy code? hold on, there are more than one ways it can help:

Measure it to solve it

The fact is, once we start measuring code metrics we are inclined to resolving them. The developers don't like to have too many issues in their plate, particularly when it is transparent and open. This is exactly what Maven does to us; it creates a maven site (of course configurable) with all the possible metrics that one would like to see. Maven obviously does not create these metrics all on its own, it relies on various best of breed plug-in and generates an integrated site which can be readily seen by the team. Since Maven does all this selection, integration and download of the relevant plug-in, it makes creating these metrics far more easier which is the key and the rest of it would be automatically taken care.

Note that Metrics reports are only as good as the tool underneath it, certain tools don't provide how we are progressing rather only gives the current snapshot how the code health is at this point in time. While this helps, but the human psychology likes to see progress, which is a key factor. There are quite a few commercial tools (like JTest) which can be integrated with Maven for achieving the same. So we are not restrained by the tools that are provided by default in Maven.

The key metrics that are of interest to an architect would be to see the dependency tree: JDepend's detects spurious dependencies between the classes (typically across layers) which are degenerative in the long run. The PMD/Checkstyle identifies the poor exception handling/performance issues, there are guidelines related aspects which are certainly nice to have. From layer dependency management perspective, beyond a point if there is a need to make strong de-coupling of the layers it is ideal to separate them at configuration management level (say SVN) rather than using these tools to resolve. Note that the tools like Spring IoC, Guice reduce dependency of object creation but not API dependency.

 Make more 'sub-projects'

Does it sound like "Make more objects" of the OO paradigm? the rhyme is intended. Invariably medium to large sized projects invariably has several potential sub-projects within it. The sub-project means that it can be standalone tested and more importantly can be easily shared with other projects if need be with clear dependency and interface. One project should be able to derive the build properties (say dependencies, versions, etc) of any other. Fundamentally, we are talking about Encapsulation, Inheritance and similar terms of object oriented thinking. Technically in Java world these could be achieved by segregating the code as packages, and identify any dependencies issues with some tool or even worse not worry about the dependency breach at all. This makes the code difficult to refactor or change. For example, assume a typical JEE project which has the following components

*   Web archive (WAR)
*   Schedulers
*   Framework code (which are cross cutting)
*   EAR
*   EJB module

More often than not, these are generally available as one big monolithic project making it difficult to share with clear dependency tree, you get all or none, thereby minimizing ability to reuse, say the framework could be dependent on the WAR and yet we would never know, as everything is monolithic, so on and so forth. The layer dependency breach resolution is to create them as independent sub-project (with appropriate archetype – archetype is basically a meta data about the project and what it does, for example we have archetype for 'web' project).

While creating such sub-projects out of a monolithic block (typically done during migration to maven), we would traditionally see spurious dependency and even cyclic dependency which we did not envisage. At this point, rather than working around this, it is better to take it as a opportunity to resolve as many inaccurate dependencies by refactoring the code. For example, it might so happen that some of the framework code is dependent on the WEB/EJB archive which is illegal and does not promote extensibility. This promotes the same extensibility that an object oriented system does.

Maven enforces that in the configuration management system (say SVN/CVS) also these sub-project are segregated as a separate source tree, so that separation is visible and hard-wired. Explicitly declare these inter project dependencies in the Maven dependencies list. In effect, the sub-project is really what it is supposed to be, a project which can be shared and has its own life and release cycle. A 'Framework' code remains really a pure framework code.

Another subtle aspect of this sub-project concept is to have a better ownership of the sub-project by the team. Always it is easier to manage small part which is your own rather than to manage a larger one. Divide and conquer. The division helps in ownership, which ultimately has a positive impact to the project. We also know that maven promotes transparency by making the code quality public, this along with ownership has a synergistic effect and makes the owner fix issues on his/her own accord.

### Object Oriented Configuration management

A configuration management system is just a collection of files (with versions probably)! You might have code in those sometimes! This is the general thinking, and that needs a paradigm shift. But do we use them like that, not really, for developers these are source code, configuration files and to go even further 'view' source, 'model' source and so on. So the concept is to have these extra meaning (only those which may not vary too much from project to project) built in to the configuration management system, apart from creating sub-projects. This conventions to tag the semantics of the files could be denoted by its root folder name (src/main/java) or a special file (POM file) inside a folder denoting a special meaning (say that it is group, or a parent POM). This makes it more object-oriented and easy to separate them and have an appropriate root folder structure for the same.

Library files

Object oriented thinking also propitiate to 'keep things where it belongs'! So in this context where should the library files of a project be kept (say JARs files)? Now let us answer the simple questions below:

*   Does it belong to the project?
*   Do we need to maintain it and its dependency? and
*   Do we need to maintain its versions?

For example, let us take the example of a widely used jar file commons-logging.jar! Suppose this logging has dependency on commons-collections (say). While most of the project does maintain it in their CVS/SVN, the real answer is 'NO', we do not need them. We only need them for compilation and packaging, not for anything else. This dawned upon Maven and its whole dependency management system which collects these JARs from outside world/repositories, who are the real owners of them. Also, it not only collects the dependent JAR file, it also collects its next level dependent JARs ([transitive dependency](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html)) and makes them available. What are the benefits in thinking this way?

*   It frees up lot of space in our configuration management system - JARs & and its versions normally take most of the size,
*   Lesser maintenance of dependent JARs
*   For those who connect to remote configuration management systems, who benefit significantly they do not have to download these large files every day. This is more so for onsite-offshore kind of scenario where the JARs are maintained at different locations miles apart.
*   The project will never miss out of the transitive JARs mentioned above, no need to scramble to find out our transitive dependencies.

The price that we pay for these benefits is to make maven aware of what are the JARs, so that we can let maven using the external/internal repositories can manage it, which is a minuscule compared to benefits that we reap.

Internal Library files

In many projects we do create JARs file for various purposes, and like to share it internally or externally with other projects. In those cases we should treat it like any other external library file having a clear cut release cycle and dependency. So in effect, the internal library file should be treated like a sub-project that we discussed about earlier.

Conclusion

This article brings in another perspective of applying object oriented principles to build management using Maven 2. In summary, we saw about how it helps in code health, configuration management restructuring and libraries management to our advantage, and all of these with our 'sub-project' thinking. It does not cover various nitty-gritty of 'how' each of them can be done using Maven, which can perhaps be a separate follow-up article.

This kind of triggers where else we can apply our bread and butter 'object oriented thinking' and reap its benefits, having applied to build now. While it does look straight forward, its application might require a paradigm shift to what we do already.
}
