---
layout: post
title:  "XPathDMM - XPath Document Memory Model"
categories: [Article]
---

A simple alternative to W3C's object based DOM

![XPathDMM](/assets/images/XPathDMM%20-%20XPath%20Document%20Memory%20Model/c5c5a0f65c3ca519cbae9f7f8e348dfc.jpg)

**DOM and XPath**

DOM (Document Memory Model) is nothing but an API for handling XML in memory. SAX (Simple API for XML) is the default event-based parser model for handling a XML stream. Usually (in JDK) we use SAX for converting a XML file into a DOM (just a tree of objects, mimicking the XML tree), and use the standard coding model to get and set xml nodes, or traverse it. The XML DOM is proving to be a boon for in-memory cache like data structures, and hence its API becomes a critical piece of code.

XPath is a separate standard, but not many people can differentiate it from XSL. This is because; initially XPath was only a sub project in the XSL standard track. Of course W3C did realize that this is a critical piece of standard but not many did not. XPath simply put, is a file path like notation (separated by forward slashes) for uniquely identifying each node in the XML tree. It is very simple yet powerful. Using XPath we can select a element, or its attribute, or the text inside, the comment etc. It also allows conditional searches like, 'select any element if it contains so and so attribute' and more. Much of XSL's elegance comes from the expressiveness of XPath (of course the declarative template model too).

**The problem with DOM**

DOM, as it name signifies, is an Object Model. Meaning, its creators claim that OOP is the best way to handle a in-memory tree. But even DOM level 2 doesn't provide as much as the simple XPath based XSL could. This is because, DOM uses the standard loops for getting to a node (Traversal API is not yet fully supported by many DOM implementations). Whereas XPath uses pattern matching and a cool syntax for getting the required nodes. XPath puts the smartness in the XPath parser, while DOM puts the onus on the developer. This is not flexibility, but a burden, as XPath is already doing everything we need.

I'm in fact eliding much grosser inconveniences in the DOM proper, because JDOM like APIs are already overcoming these petty problems like 'being unable to simply transfer a node from one DOM to another' etc. But even JDOM is betting on the JFC objects like List, instead of XPath. Because of this a DOM using code becomes highly algorithmic, as there are far too many loops and object usage to accomplish even simple tasks like fetching the value of an attribute of a particular node in the tree.

**Why XPathDMM?**

DMM just means Document Memory Model. I just wanted to de emphasize the 'Object' part of the DOM. Otherwise, DMM also intends to be an in-memory XML representation. By removing the focus on objects, we also remove the dependency from the JFC based coding model, and move towards XPath based pattern matching. Come to think of it, I wonder why this is not already popular. Because with just 5-7 methods you can accomplish what you can with DOM and its plethora of interfaces and the deluge of methods in them. XPathDMM has only one interface and literally a handful of methods. But thanks to the power of XPath we can accomplish more than what a DOM promises even with such a simple set of methods.

The key thing that enabled me to even dream of such a possibility is the elaborate expressiveness of the very simple XPath syntax, and the availability of generic XPath implementation from [Apache Xalan-Java 2](https://xml.apache.org/) project. I moved out of the J2EE 1.3 W3C DOM API almost within days after using it. At that time (roughly two years back) JDOM was very promising with a clean object model and an intuitive method list. But soon its lack of support for effective node search mechanism put it only slightly better than the W3C DOM. I did try to simulate the XPath parsing by trickily coding some recursive loops. But beyond going to an element or its attribute, rest was too complex for me (like accommodating conditional XPath searches needs far more sophisticated parsing, than just some nifty loops or recursion). And finally XALAN provided this, and I just have to wrap this power with a suitably simplified interface.

**What is XPath DMM?**

XPathDMM consists of just one interface and an implementation of it with the XALAN library (for now). Of course, for now you'll not realize any performance benefit at all (it might even be slower!). But the point is, it allows a non-object based (if you can assume that String is a far efficient data type) implementation of the 'DOM' itself. Maybe some sort of a flat hash map (instead of a tree), with appropriate pattern matching algorithms could do. Mainly your business code can be clean of these loops, and be future proof to the inevitable XPath orientation of DOM. I'll just dump the interface below without much comment on the rationale behind each method's signature.

```java
public interface XPathDMM {
	//Browsability:
	public String select(String xpath, int position) throws Exception;
	//The iterartor consist of black-box holder objects
	//which can be queried for value.
	public Iterator select(String xpath) throws Exception;
	//This object input is only to allow some optimization by the
	//by the implementation, in searching for a node that
	//is already found once.
	//Especially with respect to the above iterator objects.
	public String select(Object node) throws Exception;
	//Miscellaneous methods:
	//These methods are there just to allow above type of optimized
	//bookmark objects, whenever we need.
	public String obj2xp(Object node) throws Exception;
	public Object xp2obj(String xpath, int position) throws Exception;
	//Mutability:
	//Norte the simplicity and straight forwardness of the calls.
	//Compare this with DOM or JDOM
	public int update(String xpath, String value) throws Exception;
	public int delete(String xpath) throws Exception;
	public int insert(String xpath, String value) throws Exception;
	//Output:
	//This is to output the DOM in a form that is suitable for
	//XSL transformers.
	public Source output() throws Exception;
	public XPathDMM output(String xpath) throws Exception;
}
```

**Epilogue**

This week I intended to give the working XALAN implementation of the above interface, but decided against it as I was shy of my shabby code. I'll try to clean it for public perusal, if possible with some more comments on the decision of each signature, and then present it. Meanwhile, if you are curious enough to overlook the coding style, I'll be more than glad to send it to you in mail, if you mail me (svramu at TATTVUM.com). I can guarantee that it works decent enough to be used in real-time code. Of course lot of improvements could be made to these method signatures, for allowing relative XPath addressing and other things. Sometime I wonder why Sun accepted JDOM for a JSR, without fully exploring XPath route. Maybe we can submit this for a JSR, if we are sufficiently confident of its ease of use! Stay tuned.

