---
layout: post
title:  "How to manage our own site?"
categories: [FAQ]
---

(2002-05-05)

*   What is managing a site?
*   \[S V Ramu, 2002-05-05]
*   Once you have [started your site]({% post_url 2025-09-06-how-to-start-our-own-site %}), the next thing to do is to keep it alive with fresh and interesting content. For this to be possible, apart from preparing those content (text, images, etc.) you must also think and decide about the way you want this content to be arranged, so that new changes could be implemented with minimum fuss. This FAQ doesn't address the content itself, it deals with *managing* that content, once you have some.
*   \[S V Ramu, 2002-05-05]
*   **Do I need to manage?**
*   \[S V Ramu, 2002-05-05]
*   It depends. A web site could very well be used as a 'visiting card'. That usage is recognized, and is a respectful one. But a web site can do more than that for you. It could be your vehicle for international advertisement, and a way to share your knowledge and thereby get to know like minded people. So, whenever you have time and the skills necessary to project yourselves or your group more, you need to constantly update your site with new content, and thus manage it.
*   \[S V Ramu, 2002-05-05]
*   **Can a live site guarantee a profitable friendship or steady revenue?**
*   \[S V Ramu, 2002-05-05]
*   No, it all depends on your USP (Unique Selling Point). If you are to offer only those that 100 others are already offering and with class, then obviously you cannot get too far with a site. Of course, a simple *Visiting Card* model site, which just serves to identify you with your work, profile and your dreams, is a very valid thing to do and has its own respectful place. But a website is potentially capable of putting you across the whole world, and hence need managing. Revenue again is a whole different question, which depends on the strength of your offerings. This FAQ doesn't address the content itself, it deals with *managing* that content, once you have some.
*   \[S V Ramu, 2002-05-05]
*   **How often do I need to update my site?**
*   \[S V Ramu, 2002-05-05]
*   Obviously there can be no hard and fast rule here. For a personal site, once a month updation should be quite sufficient. But, for a professional site, a weekly updation is necessary and mostly sufficient. If you notice most of big corporate sites like Microsoft, Sun, IBM, Borland etc. they update their site anywhere between once a week to twice a week sometimes. The point is to give enough time to your users to notice your site, but not to allow them to believe that you are dead, so to say. One more factor is, how interactive your site is. If much of the information is given and taken through the site (instead of mails), then you need to be very agile, and update the site very often, maybe even daily for a period. Online newspapers and magazines will definitely be updating things daily (sometimes even every moment). But for most corporate sites, even at their busiest peak, once a week updation is decent, twice is better if they can afford.
*   \[S V Ramu, 2002-05-05]
*   **What should I update?**
*   \[S V Ramu, 2002-05-05]
*   Again no one-size-fits-all answer is possible. But general idea is pretty much invariant. For most corporate sites, what is updated is their plans and strategies that are meaningful for their customers. For informational site, of course the period of updation is dependent upon their speed of their content generation. Too fast for their capabilities: the information becomes too dilute; and too slow: the readers loose interest. The idea is to keep your readers expectant but satisfied, by updating solid content, in a cycle that is consistent with your domain. Done properly, your users feel your vibrant presence.
*   \[S V Ramu, 2002-05-05]
*   **What should be the format of my content? Can I use animations and sound?**
*   \[S V Ramu, 2002-05-05]
*   As of today, and especially in Indian homes, the best rule of thumb would be to keep your content very very simple. If animation and sound is what you are catering, and the main focus of your business, then you have no other go but to accept the internet crawl, or pay for increasing the bandwidth, or restrict yourselves to intranet audience. But for most Business-to-HomeUser sites the only rule is to keep your content to just text and HTML colors, with occasional images and GIF animations (remember GIF is in strict sense illegal without royalty). But many Business-to-Business sites (who mostly have 128k or above lines) can and do dare to use Java applets and Flash presentations. Even these people are usually cautious enough to optimize their content size to their lowest audience. Remember, most leased lines too go to a crawl in peak hours. So, it is prudent, for few more years at least to be very mindful of what we put in our site, and think twice about whether we can do without it, or with smaller medias. If thinking of Flash, try if GIF will do. If thinking GIF, try if PNG or static GIF should do. If you are planning frames, see if some suitable HTML tables should do, or if some simple CSS sheets can do the trick. As always, keep simple, think high.
*   \[S V Ramu, 2002-05-05]
*   **Can I use interactive capabilities of ASP and Servlets?**
*   \[S V Ramu, 2002-05-05]
*   You can and should, if your server has those capabilities. The server space you buy, come with different price tags and usually corresponding capabilities. If your server has only static page capabilities, then you should be content with just that. Most servers allow ASP and some allow Servlets/JSP. Instead of going head-over-heels with these new possibilities, think what is best for you and see if these capabilities answer that. Remember, a newer technology needs newer strategies and better automations. Before using a new capability, think long and deep whether you have the required expertise and confidence. Technology for its own sake is useless and means more work. Also, if the database capability is not available in your server, usually most of the reasons for having ASP/JSP based interaction could be mute.
*   \[S V Ramu, 2002-05-05]
*   **So, when at all can I use ASP/JSP?**
*   \[S V Ramu, 2002-05-05]
*   One area where interaction is indispensable is in login authentication. If you just have minimal database capabilities and ASP/JSP facility, a quite effective login system can be introduced. Of course, if only there is anything in your site needing authentication. A open website frees the user from remembering a new password (until .NET gets on, or the Sun's collaborative personal profiling). Definitely there are valid situations where you need to authenticate the identity of your user, and for that, dynamic content delivery mechanism and a data store could be indispensable.
*   \[S V Ramu, 2002-05-05]
*   **Is there anything that can be useful for content management, from TATTVUM?**
*   \[S V Ramu, 2002-05-05]
*   Our present in-house static content (HTML, CSS, PNG and GIF) management is working pretty efficiently for now (as it is, our interactivity is in mails alone). It is fully XML-XSL based with Apache-Jakarta-Ant as the build automator. It just takes 20-30 seconds to correct a typo in all the pages; such is the power of XML-XSL transformations! Usually though we hesitate to introduce any site wide layout change, as that means uploading around 600kb of files through FTP (Yes! Such is the pathetic condition of the home connections and basic server packages). One another truth we are rediscovering is to, keep our content model generic, so as to allow automation and ease manageability. Even the directory structures and naming conventions need to be logical, consistent and compact. We have also been for some time testing and exploring a dynamic content model using just *One* servlet, few classes and many XSL sheets. As we are already hitting the limits of static pages, we will be switching to it anytime soon. We also intend to explain our open model as an article, and with the community's support, as a progressive standard Check List.
*   \[S V Ramu, 2002-05-05]
*   **Is there any other content management system?**
*   \[S V Ramu, 2002-05-05]
*   yes there are many. Some like open nuke is based on PHP language. There is Struts from Apache Jakarta in Java. There is also Cocoon etc from apache itself. We haven't explored these fully enough. They do look promising and open. We'll soon have articles on these at TATTVUM. But we are cautious about too much learning overhead. We intend to arrive at a minimalist model, where the architecture is just a few minutes of explanation, but the extension possibilities are myriad. For now a XML-XSL system is most generic, as it could be ported to work with any language of our choice (from Java to PHP). Struts being from Ant's stables, is promising to be a winner. More soon.
*   \[S V Ramu, 2002-05-05]

