---
layout: post
title:  "AJAX Nirvana"
---

Patterns and Development Mindset for AJAX

**Introduction**

Direct from the horse's mouth, the idea of AJAX cannot be explained more simply or candidly than this.

...Ajax isn't something you can download. It's an approach - a way of thinking about the architecture of web applications using certain technologies. Neither the Ajax name nor the approach are proprietary to Adaptive Path.

...XMLHttpRequest is only part of the Ajax equation. XMLHttpRequest is the technical component that makes the asynchronous server communication possible; Ajax is our name for the overall approach described in the article, which relies not only on XMLHttpRequest, but on CSS, DOM, and other technologies.

...the browser loads an Ajax engine - written in JavaScript and usually tucked away in a hidden frame.

...XML is the most fully-developed means of getting data in and out of an Ajax client, but there's no reason you couldn't accomplish the same effects using a technology like [JavaScript Object Notation](https://www.crockford.com/JSON/) (JSON) or any similar means of structuring data for interchange.

Ajax isn't a technology. It's really several technologies, each flourishing in its own right, coming together in powerful new ways. Ajax incorporates:

*   standards-based presentation using XHTML and CSS;
*   dynamic display and interaction using the [Document Object Model](https://www.scottandrew.com/weblog/articles/dom_1);
*   data interchange and manipulation using [XML and XSLT](https://www-106.ibm.com/developerworks/xml/library/x-xslt/?article=xr);
*   asynchronous data retrieval using [XMLHttpRequest](https://www.xml.com/pub/a/2005/02/09/xml-http-request.html);
*   and [JavaScript](https://www.crockford.com/javascript/javascript.html) binding everything together.

[Ajax: A New Approach to Web Applications - Jesse James Garrett](https://www.adaptivepath.com/publications/essays/archives/000385.php)

**It is not a fad, it is here to stay**

There is so much talk that, it is not new, and it is old wine in new bottle (and under new name). Even the above original article agrees to that. But these nay sayers miss a point. What was new when Einstein claimed that [Light speed is finite?](https://en.wikipedia.org/wiki/Speed_of_light) The idea was already known. What did Newton tell when he enunciated the [three laws of motion?](https://www.thespacesite.com/space/history/dawn3.php) Individually all were known in earlier times too. What is new is the clear unified focus, and that this is necessary and sufficient. That is exactly what has been said now, by giving a new name. Ajax is a promise of future: That you don't need any other client, but browser! (of course my opinion). Whether that promise face no business resistance or not is a different issue. But it is a realistic move now, and let IT world react to it.

Since all current browsers support it, it is proved in full usage by Google, named simply by [Adaptive Path](https://www.adaptivepath.com/), and hyped well by the community, this is here to stay. It is tough (maybe not impossible) for Microsoft themselves to reverse this trend of more and more browser based 'client' applications. The best I know, a year or more back was [Zoe](https://guests.evectors.it/zoe/). Now Google desktop, is doing that, using a local web server to show the application in browser. By the way, even [jetty](https://jetty.mortbay.org/jetty/), my favorite web embeddable server, is specially tweaking for ajax usage, in its [next iteration](https://www.mortbay.com/MB/log/gregw/?permalink=Jetty6Continuations.html) (6.0 Continuations).

**Why now...? Browser Support**

The fact that it is not new, is not its weakness, but its strength. I don't know how anybody can forget that. In browser world, invariance across browsers is a rarity. If XMLHTTPRequest object is available in some form in every browser, then that is a revelation worth herding behind. Yes, Microsoft started it, and my awe is reserved for them in this respect. But why this rave now? Because only now, 95+% browsers are supporting it. Of course this unanimity of making XMLHTTP object available, is not when jesse's article was published. Maybe an year or so earlier (see the [Wikipedia article](https://en.wikipedia.org/wiki/AJAX), Opera only from version 7.6, and firefox from 1.0). If anybody, it was Google who realized its full potential. But they didn't *name* it as the key thing, though they used it so. BTW, before this, I haven't heard about [Jesse James Garret](https://blog.jjg.net/). In recent times he has been [writing more](https://www.ok-cancel.com/archives/article/2005/09/why-ajax-matters-now.html), and this nice [comic stripe](https://www.ok-cancel.com/comic/105.html).

**Extreme Ajax: Server is only for Data. Ajax for GUI**

Ok now for how to use Ajax. Let us go to the extreme and see. Every time I read about ajax it is only about some aspect of of the GUI being enhanced by Ajax. Like some suggesting edit boxes, some nifty validations etc. But what is the maximum that ajax can do to the Web GUI? Can we totally change the way we create web GUI? Consider the following:

1.  Can we totally avoid 'generating' GUI from server pages or templating languages? Can the GUI be simply HTML + CSS + JS + DOM, and of course Ajax based server data calls (ideally JSON) for the rest?
2.  How do we submit forms? Ok some cool JS based enumeration with ajax. But how do we submit form with file upload! Browser won't allow you to touch local files with XMLHTTP object, or anything else. Only the browser will handle file upload.
3.  If all GUI details is in JS, then can the user not see it? Can we prevent users from stealing our cool GUI tricks? Is this an issue?

Yes, all the above are curable now! That means, all dynamic generation of GUI can be handled by the client side JS alone. The server can be oblivious to the GUI. The following are the benefits.

1.  The whole client GUI can be developed standalone, without Server. That means, you can send this standalone GUI for business approval, and the same GUI can be a drop in replacement for the server GUI.
2.  This standalone GUI can be tested with local data files, during development and testing.
3.  JSON is the ideal, native data transport model for web, maybe not XML. And server just sending data in JSON, is an extreme MVC goal. Only the JSON and URL params has to be standardized between the server and the client.

Think of that...! The server data model being same, and the whole GUI being developed in various ways. If CSS changed the way we skin the look and feel (colors, fonts, images, and layout) of the web application, this Ajax, and the consequent standaloneness allows even the interactions and the behavior to be skinnable.

**A Minimal Working Sample**

The proof of the pudding is in eating. Let me provide a minimal but complete sample, for the above standalone model of web development, and explain the key concepts used in that.

1.  Download and unzip [this zip file](https://tattvum.com/Articles/2005/2005-09/2005-09-27/Ramu-AJAX-20050923-MinimalAJAX-Sample.zip) into a separate folder.
2.  Open the index.html
3.  See the effects and check out the code.

Just to reduce external dependencies, I've used a simplified version of my own XMLHTTP method wrapper. There are much better and complete JS libraries out there ([prototype](https://www.sergiopereira.com/articles/prototype.js.html), [behavior](https://bennolan.com/behaviour/), [dojo](https://dojotoolkit.org/)).

By the way, the slight flicker you see while loading the index.html in the above sample zip, is because, in local mode, the loading is so fast that the "Loading..." div vanishes in a moment (read further for details). Over web, it might be slightly visible, either if your connection is slow, or if your initialization is big. In this example the url is a local file (yes, it works locally too!). If you change it to a server url, which returns a similar json, then the whole gui works without any other change. That is what you get with ajax! BTW, we can assume, after this initial page, rest of the call will be through ajax and dom changes mostly. If that is invasive you can use IFrame, for changing whole lot of things. IFrame, because, we might always need some things in the page to be retained and updated. We don't need a frame normally, but a frame too can be useful when used appropriately. *After all the whole ball game is, how to refresh some parts of the screen, without refreshing the whole screen.* So Frame, IFrame, and then Ajax-DOM can be the decreasing order of invasive refresh.

**The Starting Page: {display:none}**

So, we have an index.html, inside the document root folder of the web server. Thus, when you point to the server as https://www.yourdomain.com then this page shows up in the client browser. Now, this is a static page, not generated dynamically in asp or jsp. If this page doesn't need any data, then no issue. But if it does need dynamic data, then?

I tried some complex inner frame stuff. But then settled on a very simple css trick. Now it seems Google could be already using this. Have you seen that small "Loading..." showing up in gmail? That is the clue. Basically the whole body of the index page will be inside a `div` block, with style `{display: none}`. Instead, a separate div with this "Loading..." text will be visible. And the onload of the page, gets the data, does the required dom changes, makes the loading div invisible, and makes the main body div visible. Neat trick eh!

```html
<html>
  <body>
    <div id="loading" ><br />Loading...</div>
    <div id="main" style='display:none;' >
      ...The whole normal body content goes here...
    </div>
  </body>
</html>
```

**You cannot synchronize with ajax, but can workaround**

In client side Javascript, you cannot do any synchronization in a simple manner. That is, if you've fired say an ajax request to server, and you want another request to be sent based on the current one that you sent, you have to code that as a call in the handler of the previous request. This is messy, and a small issue that you have to be mindful of. But sometimes even this cannot be enough, and at that time, bundle this as one call in the server.

For example, say while loading the page, the init data is acquired through 3 calls to server. And only after all have arrived and handled you'd like to disable loading and enable main div. How do you do this?! From what I know, this is impossible in JS, so you have to bundle all these three calls as one, in server and call that from the client. This will be a key consideration for how granular you make your server calls for data.

But yeah, you can use the `async` parameter of the XMLHTTP, to make it synchronous. But then you'll loose the benefit of parallel calls. But since it has to be the same server (the ajax calls can be only to the originating server for security reasons) that handles all calls, anyway, for a single CPU server, this may not be a big deal. But for an ideal case, bundling all async calls as one call in the server is the best. But yeah, as a one off thing, you can put XMLHTTP async parameter to good use.

**Form submit and File uploading**

Ajax was going smooth for me. But the first time I hit form submission with file upload, I was stuck. Basically the browser's form submit does two things. One, of course, submits the data to server, and secondly, refreshes the page! This is unacceptable in the ajax model. A whole page refresh is only the last resort. But Forms are pretty common, and so will the full page refresh be?

So the immediate trick would be to do a dom traversing, and get all the values from the form, and do an ajax submit, instead of a real form submit. This will work for any form without file upload and some people have done it. But then, what if we have a file upload? If that is a different case, then should we not handle all form submit in the same way?

We should, and that way is to *allow the browser submit to go through, but target it to an hidden inner frame*. Yes, this is a simple trick, which I learnt from a [drupal coder](https://drupal.org/node/28483), through [Google](https://www.acko.net/blog/summer-of-code-ajax-for-drupal). Here, using hidden IFrame is still ajax, I guess. *Maybe we have to define ajax as a proper noun describing, any non invasive page update*. You may disagree, but this is what I take it to be.

**IFrame vs. XMLHTTP**

The idea is,

*   Have a hidden IFrame.
*   Give the target of the form you submit as this hidden IFrame
*   But unlike, [XMLHTTP](https://developer.apple.com/internet/webcontent/xmlhttpreq.html) handler, the refresh of an IFrame will not alert you. So, the IFrame page that returns, though can be empty, should contain an onload method call through the `window.parent`. Thus you have your alert! May be this method name can be sent as an hidden field of the form.

That is all, you essentially have an IFrame based XMLHTTP object. The rest is same. So the form target to IFrame, separates the submit behavior of the form submit, and this onload call of the returning frame page performs the refresh behavior of the form submit.

Maybe then can we do away with XMLHTTP altogether, and use only hidden IFrame? I think this is fully feasible, and people have been doing this for quite some time now and even today when the same code has to work with very old browsers (they check for the availability of XMLHTTP, or else use hidden IFrame model).

*   XMLHTTP is a joy to use, but that doesn't usually activate the throbber (the animation that the browser is active) like IFrame does.
*   Also, to send many request parallely, you might have to create the IFrame dynamically ([I have to try out](https://developer.apple.com/internet/webcontent/iframe.html) yet).

**GUI code can be clean - Behavior.js**

With all this ajax, the immediate casualty is the GUI code. Hitherto, it was only html, and occasionally some validation JS. Now with so much scripting, it can be seriously cluttered. And since it is a script, not a compilable java code, the debugging is a nightmare, apart from poor readability. But this is a problem only if you are ignorant of many efforts that have gone by.

Like CSS is there to separate look and feel (color, font and layout) from HTML structure, you can use `document.getElementById(ID).innerHTML` and `document.getElementById(ID).onclick` DOM features, to attach the event code to it in a modular way. `innerHTML` when you want to use `document.write()` like activities. Do note that, `document.write()` can be tricky from code separation perspective. For this you can use [behavior.js](https://bennolan.com/behaviour/) with `innerHTML`, for not only id (unique) based single node access and handling, but also class based bulk handling of nodes. Very powerful and a nifty js library.

Thus, HTML just has tags (mostly div with id and/or class) to define the structure and static data, then CSS files have style, then js files for attaching behavior, and finally ajax for dynamic data.

**Asynchronous GUI paradigm**

I don't think even in client GUI with VB or Java Swing, we used asynchronous update often. Hence the need to show appropriate feedback for background work, was rare. But now with Ajax, it is going to be regular. All calls through XMLHTTP will usually be async (though you can make it synchronized, but why would you? See Javascript synchronization section above). So many of us are bit naive when it comes to giving enough visual feedback. This is a ripe area for research, and many people are innovating cool tricks for this. Maybe this will then be carried over to thick clients too. (If they survive this ajax onslaught ;)

*   [Yellow fade technique](https://www.37signals.com/svn/archives/000558.php) is one such for showing latest changes.
*   Gmail's "Loading..." is the standard visual idiom for everything else.
*   Maybe you can simulate browser's throbber too, in fact, showing concurrent calls.

The web designing community is adding to this list, constantly.

**JavaScript is not protectable - Issue?**

Even .exe or executable files are [decompilable](https://en.wikipedia.org/wiki/Disassembler). [Reverse engineering](https://en.wikipedia.org/wiki/Reverse_engineering) has a [hoary past](https://www.program-transformation.org/Transform/HistoryOfDecompilation2) and is [well studied](https://www.acm.uiuc.edu/sigmil/RevEng/). Usually decompiling is perfected by studying the compilation process for various compilers for the [given language elements](https://www.acm.uiuc.edu/sigmil/RevEng/ch05.html). And it seems decompiling for protocol analysis, like in [OpenOffice.org](https://www.openoffice.org/) is [legally allowed](https://digital-law-online.info/lpdi1.0/treatise48.html). By the way, I even found clean decompilers for [delphi](https://delphi.about.com/od/devutilities/a/decompiling_p.htm), my old love.

Java is 10 year old. Its bytecode has always been almost readably decompilable. Yet a huge commercial industry is built with Java Software. The most they do to protect is to obfuscate the bytecode, which usually still produces the right classes, methods and if/loop structures, and only the user given names are mangled. The point is, the source being available is not the real threat, if the software does not do anything uniquely. What are we protecting if not uniqueness?

Also protection is not really essential for commercial vaibility. RedHat, and MySQL are examples for that. In fact a open source software, allows a different kind of freedom. And security is usually based on the license. Maybe not all kinds of business is amenable for Open Source (it is hard for me to believe that)! For them, Obfuscation is a real option. If it is even hard for the original developers to maintain the software with all the code comments, how easy is it for the crackers to reverse engineer an obfuscated code and use it? This is usually meaningful only for breaking copy protection. For things that cannot be protected, maybe open source faces the problem squarely and finds other ways of commercializing. It is not usually a question of whether it is ethical to reverse engineer or not, it is more whether it is useful to do that, or if it is really possible to do that. So for things that can be broken, false security is more dangerous. And for things that is not useful to be broken, any obfuscation is redundant.

Remember, if it can be broken even in a tough way, that can be automated. So if it is possible to reverse engineer, even if it is tough, it will be made easy. So the question is only whether it is decompilable or not. If decompilable, then it is only the question of usefulness, not toughness. And in rare case where the work is unique and it is not protectable, then it might be prudent to as well open it and be the good guy and a pioneer, instead of waiting for somebody to crack it and get the name.

Anyway, if you are really interested, there are many obfucscators for JavaScript. Though I believe in open source, for javascript, I might as well use obfuscators for three reason. Mainly because it usually reduces size and that is good over web. Secondly, precisely because JS-HTML-GUI is not usually too unique, and I need not have qualms of being greedily secretive. And lastly, even the [Google scripts](https://serversideguy.blogspot.com/2004/12/google-suggest-dissected.html) are broken. Again, proving, that any useful thing will be broken, if it can be, and even if it is very tough. By the way, most things can be broken anyway, hence my penchant for OpenSource.

**Issues of Ajax?**

Every time I hear about the issues of Ajax, it is about it not allowing a website like usage patterns. Like, no proper back button handling, no bookmarkability, complexity of JS coding etc. But have they all ever known what it takes to build a serious desktop client with VB, Delphi or Java? Remember Ajax is used for building web applications, not web sites of static pages. And that means all the complexity and issues of an application will be true for it. And who said that a web application should be like a web site!?

Other issues like java script can be disabled is like saying, that the machine could be switched off. The current statistics is around 90% of browsers have their JS enabled. And who knows, this 10% disabled browsers may not apply to your application users. They might be total novices or paranoids (thanks to MSIE's scary past). And maybe this ajax trend will gently prod them to enable JS. Just like cookie, people will grow over the fear of using it.

**Epilogue**

So learn DHTML afresh. Brush up your JS skills. Clean up your HTML with clear tags, and CSS separation, so that you can give `id` attribute appropriately and keep your HTML code clean. With ajax, client code too needs the same rigor and cleanliness, like your server java code. Let all future GUI tools generate good CSS based code for all their nifty image effects. Let future DHTML menus be pure list and CSS based, atleast with cleanly separated JS based, so that menus can be generated dynamically with ajax. This is all possible now, but still more coding elegance and simplicity would do good to the client side programming.

I don't see how Microsoft can cannibalize this ajax guarantee for a standard based browser. The best way the commercial houses can capitalize on this ajax wave is to build good IDE, to generate WYSIWYG ajax pages. That would be cool, but too unlockable for their taste. But who knows, Microsoft's crafty business people may already have plans.

The patterns for developing total ajax client is too new to be complete here. It is a huge promise, and it is about time the clients get this much attention. So, maybe I'll have one more installment on this, or maybe not. And the code sample given here is just to prove that whole GUI can be built and integrated as a standalone module, and nothing more.
}
