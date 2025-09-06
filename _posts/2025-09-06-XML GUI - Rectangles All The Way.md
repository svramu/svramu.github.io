&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # XML GUI - Rectangles All The Way

On laying out rectangular components in a rectangular GUI

*S V Ramu (2002-09-17)*

**Prelude**

*Fearing the time requirement for checking the hyperlinks, I couldn't provide proper hyperlinks in this article. Most of the key words should be readily available through Google search, if need be, add few contextual keywords too.*

I wanted to start on projects. But I come back to GUI again and again, and it is becoming blatantly clear that spending once energy with Swing or other object model is simply wasteful. Of course it is always a pleasure to work with GUI in OOP. In fact, I consider GUI to be the cleanest OO candidate, as my experience with the Delphi VCL (Visual Component Library) and now the Java Swing is still fresh in my memory. But the moment you realize that a simpler option is available, even the grandest of ritual becomes a chore.

What is that simpler option? XML. Netscape 6 (Mozilla) project was the first proof of concept implementation, of XML based GUI creation. It defined a XML schema called XML User interface Language (XUL), and implemented a GUI engine for that in all the platform it supports. It initially created a Java implementation too (Blackwood project) but for some reason lost steam. I think, now it renders XUL natively in each OS. Sometime back a JXUL project attempted to give a java implementation of XUL with Swing, but again the enthusiasm dwindled. Now, the Luxor project is going with a pretty good zeal. In a way, Luxor does recognize rightly that XUL for Java is shortsighted, and tries to make XUL, a generalized standard for cross-platform and cross-toolkit GUI. There is a W3C effort too that is going on for XForms, with similar intentions. But right now XUL seems to be the de facto standard.

Why all this fuss about a XML based GUI? How at all is XML related to GUI? The punch answer is the 'cross-toolkit' nature of these efforts. When you write code to show a form/window with some components, behavior and events, you have to master the API of the toolkit you use. Today we have VCL of Delphi, GTK for mainly Linux, Swing for Java, of course the VB model and now even the WinForms from the .NET world. All these have their own claims, benefits, pitfalls and locks. If you code with an API, usually it is not an one-to-one mapping to another. Whenever you port, you need considerable effort to re implement the GUI, even within the same Operating System. GTK and TCL attempts to be the cross-platform version of these API, but not less complex or perfect. The point is, these toolkits are evolving, and there is no point in betting on any one of them. Fortunately, what constitute a GUI is fairly clear now, and worth standardizing. What is differing is the modular and efficient implementation of these UI patterns.

XML based GUI definitions are such platform independent models. As you know, XML parsing is fairly common and standardized in all platforms. XML is becoming a fairly simple, but importantly, the most accepted universal data format. If you consider a GUI design and its behavioral hooks itself as data, XML is the obvious choice to represent it. XUL is one such XML GUI format. As the Luxor lead developer declares, a change in XML format for GUI is relatively easy to cope, as XSL transformation is equally standardized and popular.

For example, think of a typical login screen this way,

```xml
<Screen type="modal">
    <table>
        <tr>
            <td><Label title="Name"/></td>
            <td><Editor name="txtName" text=""/></td>
        </tr>    
        <tr>
            <td><Label title="Password"/></td>
            <td><PassEditor name="txtPass"/></td>
        </tr>    
    </table>
</Screen>
```

Notice how simply and intuitively this captures the essence of a GUI design. Beware, there are lots of small details (like the data capture, event triggering, modularity etc.) that have to be worked out, but this is definitely simple. Also once we just standardize the names for these components, and few other things, we now have a standard that stipulates the design and overall behavior, but does not forces us to select one particular implementation. Imagine what a benefit it would be, if we can give the above XML snippet to VCL or GTK or Swing, and have our GUI rendered! This is what XML GUI is promising. Imbibe and analyze this benefit now, and keep away from elaborate GUI APIs, even if it is platform neutral like Swing, TCL etc. We want nothing short of toolkit neutrality.

**Laying out components on screen: Rectangles**

From the day one, when Apple were doing their pioneering experiments with GUI (Graphical User Interface), through the X Windows standardization, through Windows 3.1, then 95, XP and now the Java Swings, one thing has remained constant and unquestioned. That, a screen should be Rectangular! A screen of interaction is a 'window' to the processes and data inside.

![image](XML%20GUI%20-%20Rectangles%20All%20The%20Way/8065b31a28d062d5dc5c24c54058b04b.jpg)

Only three regular (equal sided) figures can tile the plane. Namely a Triangle (3 sides), a Square (4 sides), and a Hexagon (6 sides). Both a triangle and a hexagon should be regular to tile the plane simply. Also these figures cannot be arbitrarily decomposable into themselves. That is, a triangle cannot be internally divided into triangles, the way we want. A hexagon similarly cannot be subdivided into hexagons the way we want. (Can a hexagon be constructed from hexagons at all? I'm conscious that I'm treading a vast area of research here. Tiling a plane with asymmetric figures was well analyzed by Roger Penrose, the noted engraver Escher, and others. My intention is only to show the overall limitations of these miscellaneous tiling figures). What is left is the four sided figure. Of course a square tiles the plane. The important thing is, even a Rectangle can tile a plane. Another useful feature of rectangles is, we can cover a rectangle with different sized rectangles too. Also these internal rectangles can be easily placed in such a way, that the space remaining after placing a rectangle, will also be a rectangle.

This is why rectangles are so important and friendly to GUI designers. Hence it is not surprising to see that the upcoming web portals, the modern docked screens, the famous Java layout managers are all only suitably decked rectangles. All components are rectangles. All component groups are rectangles. The whole window, and the screen itself is a rectangle. Thus it becomes important to understand, what all configurations are possible with rectangles, and what minimum details we need to specify a given configuration. *The main benefit that we can avail while working with rectangles is, once we cover a side with a rectangle, the remaining space itself is a rectangle, and hence the same principle we adopted to the original rectangle can be recursively applied to the derived inner rectangular spaces.*

**The elaborate HTML tables**

Who has not used the HTML tables! This versatile model has simplified the web layouts phenomenally. Even though CSS is trying to eliminate the use of tables for layouts (with a similar Box model), Tables are here to stay. The beauty of this model is its powerful simplicity. It just has three tags `TABLE`, `TR` and `TD`, and two key attributes, `colspan` and `rowspan`. With this limited infrastructure, it is giving the designers tremendous flexibility. Assuming that you know to use HTML tables, let us use an example to show its power and limitations.

![image](XML%20GUI%20-%20Rectangles%20All%20The%20Way/d6472d501e73af91ef2f8b01f06f1e30.jpg)

```xml
<table>
    <tr>
        <td colspan="2" rowspan="2"/>
        <td></td>
        <td colspan="3"/>
    </tr>
    <tr>
        <td colspan="2" rowspan="2"/>
        <td></td>
        <td rowspan="2"/>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>
```

The above layout is simple enough. But let us try few new twists. What if we prefer to use TC (table column) instead of TR (table row). So, TD should now mean the rows. Just to streamline the names of these tags, during these alternate views, let us use ROW=TR and COL=TD. In the same vein, can we not call TABLE as COL? (since we are using only ROW inside TABLE, like we use only COL inside a ROW). Now let us relax one another restriction of TABLE; thus a ROW or COL can always contain other ROWs or COLs. This is equivalent to embedding TABLEs inside TDs. The benefit of using ROW and COL is that we now have only two tags and a uniform usage. But a confusion arises in this recursive embedding (w.r.t.. the two-level html embedding) if we consider the usage of 'colspan' and 'rowspan'. Before going further, for example, see the following alternate XML structure, of the same layout.

```xml
<ROW id="table">
    <COL>
        <ROW rowspan="2" colspan="2"/>
        <ROW/>
    </COL>
    <COL>
        <ROW/>
    </COL>
    <COL>
        <ROW/>
        <ROW rowspan="2" colspan="2"/>
    </COL>
    <COL>
        <ROW colspan="3"/>
    </COL>
    <COL>
        <ROW/>
        <ROW/>
    </COL>
    <COL>
        <ROW rowspan="2"/>
    </COL>
</ROW>
```

If you notice, the 'colspan' is not of much consequence, as it is mostly handled within the row (there are few dependencies though). But, when you give 'rowspan', it clearly affects the layout of the subsequent rows. This dependency can be quite bothersome if we recursively embed ROWs and COLs to n-levels. This I think is a serious lacuna in using the TABLE model as a generic layout designer.

**The simple Box layout**

An alternate model would be the much touted new layout of J2SE 1.3, the Box Layout. Let us try to use this Box model for the same layout example above.

```xml
<BOX>
    <BOX flow="v">
        <BOX wt="2"/>
        <BOX>
            <BOX/>
            <BOX/>
        </BOX>
    </BOX>
    <BOX flow="v" wt="2">
        <BOX>
            <BOX/>
            <BOX wt="3"/>
        </BOX>
        <BOX wt="2">
            <BOX wt="2"/>
            <BOX flow="v">
                <BOX/>
                <BOX/>
            </BOX>
            <BOX/>
        </BOX>
    </BOX>
</BOX>
```

Note that we can avail the following shorthand if need be,

```xml
<BOX>
    <BOX><BOX>
                =    
    </BOX></BOX>
</BOX>
```

`<BOX flow="h"/>= <HBOX/>= <BOX/>`

`<BOX flow="v"/> = <VBOX/>`

As you can see, this BOX tag is highly modular, since the interaction between two tags is very simple and homogeneous. The only difference between this model and the Swing model is the possibility of specifying weights, and hence allowing proportional subdivisioning of a Box. In the Java Box layout manager, it is always the equal divisioning by default, and we have to suitably manipulate the component's preferred dimensions to get the necessary effects. It seems that the Box layout could very well be the basic layout for GUI designing, due to its very little conceptual requirements and yet with almost complete coverage of any rectangular GUI layout.

Before going further, we will try to touch upon the dimensioning syntax for the 'wt' attribute of the BOX tag. We have few choices: like the absolute pixel(px) units, or the usual percentage(%) units, or the more expressive ratios as above. Ratios are bit rigid, as we are specifying the relative size of each box. So, when one box changes, almost all the boxes have to change. This could be a hindrance some times. If we use absolute pixel units, then we can use '*' to specify the flexible boxes, so that other fixed sized boxes can be unaltered, while flexible boxes cushion the dimension changes.

**The simpler Dockable Panel layout**

This brings us to yet another layout model. While working in Delphi and VB, I found the `align` property of panels, very useful. You just start with a Form, place a Panel, set its align property to (say) 'Top' (you can also specify something like 'Bottom', 'Left', 'Right' and 'Center'). The panel then goes and sticks to the top, occupying the whole breadth of the form. Only other thing you need to specify is the height of the panel. Now, the rest of the screen, not occupied by the top panel, is again a rectangle, and hence you can continue this trick of recursively embedding the panels. For example, let us reuse the BOX to mean the dockable panel, and render the above layout again, in this model.

```xml
<BOX>
    <BOX align="left" wt="1/3">
        <BOX align="center"/>
        <BOX align="bottom" wt="1/3">
            <BOX align="left" wt="1/2"/>
            <BOX align="center"/>
        </BOX>
    </BOX>
    <BOX align="center">
        <BOX align="top" wt="1/3">
            <BOX align="top" wt="1/4"/>
            <BOX align="center"/>
        </BOX>
        <BOX align="center">
            <BOX align="left" wt="1/2"/>
            <BOX align="center">
                <BOX align="top" wt="1/2"/>
                <BOX align="center"/>
            </BOX>
            <BOX align="right" wt="1/4"/>
        </BOX>
    </BOX>
</BOX>
```

Though this has lot more characters than the previous Box layout, this docking model is far simpler conceptually. Of course some proper defaults could simplify the syntax bit more. Like, we can assume `align="center"` whenever no align is specified ('center' doesn't require 'wt'). Also we can assume `wt="1/2"` when no wt is specified.

**Where boxes lack**

There seem to be two basic layouts now. The original HTML table model and the refined Dockable Box model. I initially thought that they are isomorphic in their capabilities to specify any rectangular layout. But see the following layout for an exception. The irony is, this is very elegantly specifiable with the Table model. Maybe the Table model is still required to express the fringe case layouts. I believe this following case is not too common in GUI requirements.

![image](XML%20GUI%20-%20Rectangles%20All%20The%20Way/d8b2a34f6c86ec7fae0fcce859cb8654.jpg)

The weakness seems to be in not being able to specify cyclically overlapping panels. In the Box model, one of the boxes will always be fully covering a side. Of course it doesn't mean that a split in a side is inexpressible in the Box model. As the following figure shows, the split boxes can themselves be put in a regular top box (here).

![image](XML%20GUI%20-%20Rectangles%20All%20The%20Way/ce66696c54b985bf5fbd02c1bde6746a.jpg)

**Epilogue**

Like many of the article in this site, this article too is not trying to put forth a complete theory. The idea is to present the importance of XML based GUIs, and to stress the centralness of the Layout models in that XML definition. We see that, as it is, we need a mixture of two or more layouts to define any rectangular composition. Of course, what that set of layout is? And how we prove that they can fully define any rectangular composition? Is still unsolved for me. Also note that some simpler things are better done with a specific layout, than with the generics. For example, though the Java Grid Layout can be achieved with boxes themselves, a dedicated grid layout could simplify a situation. Maybe Java is wise in assuming that we need many different layouts, and we can always specify a new layout to simplify our specific requirement. By the way, where exactly does GridBag layout contribute, in this milieu?

In the context of the XML GUI as a whole, we do need to modularize the layouts and components, in such a way that we must be able to define new layouts and components, given the set of atomic units. In that sense, can HTML Table layout be the axiomatic base for all other layouts? What should be axioms for components? Many question yet to be answered. This is just a work in progress. Any XML GUI should address creation of extensions. Right now XUL doesn't provide much in that sense. But that is what we have. So, it is bit premature to strictly follow any schema immediately. The schema we use must be nimble enough to be transformed into another, with XSLT alone. If so, we must not include scripting or templating too much in our GUI definition, as XSLT is not strong there. Maybe a XML should only be a pure data model, and not a mix of scripting and data, as Luxor tries to be. Also instead of pushing data to the code that uses the GUI, they must pull it from the GUI. Only triggering of events could be a reasonable hook to the processing code.
}