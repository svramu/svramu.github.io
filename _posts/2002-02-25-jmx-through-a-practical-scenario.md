---
layout: post
title:  "JMX: Through a practical scenario"
categories: [Article]
---

An example based analysis

**The Scenario**

Assume that we have an electronic thermometer, which we want to *manage* remotely. This is a fairly simple thermometer, which measures the ambient temperature of a room. What is there to *manage* here? One, we need to know the temperature at any given moment (maybe not in real-time, but say in periods of few seconds, say every 5 secs.). We can also set the temperature, so as to manually manage the room's temperature. Assume too that this thermometer is capable of raising an alarm if the temperature crosses a maximum or a minimum, of its preset range. There is only one thing to note here, that it raises an alarm; the maximum and minimum are not controlled by us (for simplicity sake). Let there also be a switch to enable or disable the alarm at our convenience. Well, that is it, this is our task. Amazingly, almost all the key potentials of JMX can be unleashed with just this simple scenario. The points to note are,

*   The current temperature: A Read-Write Attribute
*   The alarm's enable/disable switch: An Operation
*   The alarm: A Notification

I hope that you've got a general hang of what is an Attribute, or an Operation or a Notification. Though there can be aspects which could be hazy as to whether a given feature has to be treated as an Attribute or as an operation, this scenario is fair and simple enough. The Notification is anything whose trigger is not in our direct control.

**Our MBean: Attributes & Operations**

Now for this electronic instrument to be managed by a software component, we need first to have a wrapper which encapsulates all the details of the software-hardware nexus. Once this is done, we are essentially managing a software application. This is were the JBoss people got the brainwave to use JMX as a software spine for *plugging* various modules, instead of just *managing* it. Anyway, we now have to expose this Thermometer-Java-Wrapper to the JMX world. Which means we can avail of any of the four ways to create an MBean. A MBean hence, is any manageability Java facade to some resource (here, thermometer), for the JMX framework.

Of the four types of MBeans we'll choose the simplest one, namely *Standard MBean*. To create a Standard-MBean we just have to write a *getter* function for readable attributes, a *setter* procedure for writable attributes. All in JavaBeans convention, which apart from other details wants us to prefix `get` and `set` to our attributes name, for creating our methods. So our methods for attributes are,

`public Double getTemperature();`

`public void setTemperature(Double value);`

A Standard-MBean mandates that any method which is not for an attribute is an Operation. Hence, here we need just one method for enabling or disabling the thermometer alarm. Let us club both this activity with one procedure with a boolean input and no output.

`public void enableAlarm(Boolean isEnabled);`

So, our MBean interface till now is,

`public interface ThermometerMBean {`

`   public Double getTemperature();`

`   public void setTemperature(Double value);`

`   public void enableAlarm(Boolean isEnabled);`

`}`

And our MBean class itself would be,

`public class Thermometer implements ThermometerMBean {`

`   public Double getTemperature() {`

`       //Implementation   `

`   }`

`   public void setTemperature(Double value) {`

`       //Implementation   `

`   }`

`   public void enableAlarm(Boolean isEnabled) {`

`       //Implementation   `

`   }`

`}`

A MBean server is not interested in the class for its information needs, it only looks for an interface (if not in this class, in any of its ancestors), which has the same name as the class, but with `MBean` as suffix. So, it is the `ThermometerMBean` that is our thermometer's window to the JMX world.

**Our MBean: Notifications & Constructors**

The Notifications emitted by the thermometer are exposed by the `NotificationBroadcaster` interface that we have to implement in the above MBean class that we wrote. Thus we have to implement the following three methods for adding and removing Swing-style event listeners. The `getNotificationInfo` method is to aid the remote managing applications to know the list of Notifications that is available for listening.

`public void addNotificationListener(NotificationListener listener,`

`   NotificationFilter filter, java.lang.Object handback);`

`public MBeanNotificationInfo[] getNotificationInfo();`

`public void removeNotificationListener(NotificationListener listener);`

One more thing we have to do is, to ensure that the class has a public constructor (with any number of arguments, or none). This is manadatory requirement of an MBean, for being instantiated by the remote managing applications. So, the full MBean would be,

`public class Thermometer implements ThermometerMBean, NotificationBroadcaster {`

`   //The mandatory public constructor`

`   public Thermometer() {`

`       //Implementation   `

`   }`

`   //The getter for the Temperature attribute`

`   public Double getTemperature() {`

`       //Implementation   `

`   }`

`   //The setter for the Temperature attribute`

`   public void setTemperature(Double value) {`

`       //Implementation   `

`   }`

`   //The Operation to enable/disable the alarm`

`   public void enableAlarm(Boolean isEnabled) {`

`       //Implementation   `

`   }`

`   //Adds a listener to a registered MBean - NotificationBroadcaster.`

`   public void addNotificationListener(NotificationListener listener,`

`       NotificationFilter filter, java.lang.Object handback) {`

`       //Implementation   `

`   }`

`   //Returns a NotificationInfo object contaning the name of the Java class of the`

`   //notification and the notification types sent - NotificationBroadcaster.`

`   public MBeanNotificationInfo[] getNotificationInfo() {`

`       return new MBeanNotificationInfo[]{ new MBeanNotificationInfo(`

`               new String[]{`

`                   "mynotifications"`

`},`

`               "ramu.jmxsample.AlarmNotification",`

`               "The only notification in this ThermometerMBean")};      `

`   }`

`   //Removes a listener from a registered MBean - NotificationBroadcaster.`

`   public void removeNotificationListener(NotificationListener listener) {`

`       //Implementation   `

`   }`

`}`

Note the full coding for the `getNotificationInfo` method, which just says in so many words, that there is only one notification that this MBean will emit.

That is it! This is our MBean class that can now be managed through the JMX framework. Of course assume that we have proper implementation for each of these methods.

**The Monitor MBeans: Simplifying attribute monitoring**

If you notice in the above proceedings, the aspect of raising an alarm when the temperature goes beyond a certain high and low point, requires lot of details. One, we have to have an operation which enable/disable the alarm feature, and two we have to implement the `NotficationBroadcater` support. This in fact is a simplified version, because we have not defined the necessary attributes to alter the high and low points. But, if you ponder for a minute, isn't this activity of being notified at the high or low point of an attribute, a routine task? The JMX architecture says it is, and hence have included a whole package to deal with these types of routine attribute change Notifications. What we are concerned with is the `GaugeMonitor`.

The `GaugeMonitor`s are themselves made manageable by implementing a `GaugeMonitorMBean`. This is a good symptom of a mature model, where, like in XML, in RDBMS, etc., the modeling activity itself becomes an example of the model. An application which monitors a MBean, can in turn be monitored too, by itself becoming a MBean. Here the GaugeMonitor, is a piece of code, which monitors other MBean's attribute, but are themselves a MBean, with the High and Low point being the configurable attributes. Thus not only is our above task of writing code for raising an alarm, can be easily implemented with a GaugeMonitor, but the range within which we want the alarm to be triggered, is also configurable now. So, omitting all the redundant code, our original MBean becomes,

`public class Thermometer implements ThermometerMBean {`

`   //The mandatory public constructor`

`   public Thermometer() {`

`       //Implementation   `

`   }`

`   //The getter for the Temperature attribute`

`   public Double getTemperature() {`

`       //Implementation   `

`   }`

`   //The setter for the Temperature attribute`

`   public void setTemperature(Double value) {`

`       //Implementation   `

`   }`

`}`

As you can see, our MBean just gives the most basic information, that of the current temperature. Any derived value from this attribute can be routinely gleaned from the suitable monitors that are provided. Also see that the `NotificationBroadcaster` interface is no longer implemented. Our MBean no longer emit any notification by itself. As the Notification of High and Low point depends fully on the temperature attribute, we can just instantiate a gauge monitor MBean, and be notified to our heart's content. Currently there are three monitors that are provided with JMX. Hence, without any of our work, we can get the service of these monitors in the run-time! Yes, we can instantiate, configure and be notified, about the fluctuations of any attribute of any MBean, all in run-time. Monitoring, means that the Monitor checks the attribute value from time to time (as often as specified by the Granularity period) and then checks for the constraints.

**The Timer MBeans: Ensuring periodicity**

Assume now that we want to log the temperature every 15 minutes, into a database for future auditing, how much code do we need to write? Not much! Because there is a standard Timer service provided by JMX. These timers are also implemented as MBeans and hence their periodicity can be configured externally and in the run-time. All we have to do, is to instantiate a Timer MBean, configure it to trigger every 15 minutes. All these are just few property clicks away. After this, we have to write a timer notification listener, which checks the `ThermometerMBean`, and writes down that value into a database of our choice.

Thus one more thing is made routine, the timer. Again this too is a MBean hence manageable. Of course we can always write some standard Listeners (maybe as an MBean itself!) for the Timer Notifications, that can be configured with the MBean and the attribute we want to note down. Wow! This reminds me of the holy grail of making our applications as, many small configurable (hence reusable) modules, which can control other modules and be controlled by other modules in a standard way. So all that faces us is to write these abstracted small modules, and let a super JMX user, connect them, configure them and control them, from a universal control tower!

**The Relation MBeans: A Relationship Repository**

Now assume that there are many rooms in the given house whose temperature have to be managed. There might be a policy that all busy rooms should have much lower temperatures than the bedrooms and other rarely used rooms. Now you want to group the thermometers in different ways, and apply your attribute changes as a whole on them. This is where the JMX relation services comes into being. Our situation is rather simple, we can imagine far complex situations, where simple grouping is not enough. JMX provides a package for relation MBeans (again distributively managed), which allows us to dynamically group the MBeans, into various relationships, under different roles. This is a run-time activity again, and JMX's assurance is that it will automatically update the relations that we created when the MBeans are deregistered.

I remember pondering once that simple grouping, even if it is a tree of groups, or some method of overlapping groups, are inadequate. Think of knowledge classification, say we have lot of FAQs, that we want to group for public's consumption. How should we classify the questions? Say that something question is on XML, but we have answered it with VB coding, under what head should we classify it, under VB or under XML? OK, if it is going to be a tree, whether VB should be under XML or vice versa? This is a deep problem, the library naming systems like Dewey classification, adopts the tree structure with the accompanying problems. A more prudent solution would be to tag each question with one or more grouping, and do away with the tree altogether. If you had noticed, the way we search in Google or other search engines is something like that. When we type both XML and VB in it, it fetches us all things that are tagged both as VB and as XML. This is the spirit if relation model in JMX. A given MBean can be classified under different *Roles* at the same time.

Sometime a given grouping scheme might be exhaustive: In the sense, that every thing can be classified in one group or the other in that scheme. This is good, but there can be many such schemes which classify the given set of things uniquely. JMX heeds this need, and hence groups the *Role* under a *Relation*. So, there are Relations, which can contain many Roles, and which in turn contain many MBeans. Assume that we are classifying every staff in a Office as either a Manager or as an Clerk. But our company policy says that there cannot be more than 5 managers and not more than 20 clerks. So the cardinality of a role is important too. JMX provides for this too. Of course there can be many more complex constraints, but this RelationService-Relation-Role-MBean model is fairly generic one to start with, and we can always write our own code upon it. For every *Relation* there is a `RelationType`, and for every *Role* in it, we have `RoleInfo` in JMX. The Relation Type takes care of the cardinality of the Roles in it, through Role Info. And all Relation should be of some Relation Type. Though I wonder why we need at all to separate these two, it definitely doesn't hurt much. Anyway their ingenuity to think of this relation model instead of a useless tree-of-groups does add a smack of depth to their thinking.

**The Rest**

I feel, the details of deploying these MBeans in reality, and *Managing* them, is conspicuous by its absence. I have not talked directly about it because this can vary greatly between implementation. Currently I know only JBoss has implemented it prominently, and of course the reference implementation is there. Sometimes I feel, that J2EE team, having standardized everything that is traditionally considered a server side infrastructure, are now branching off into new domains, where they think standards could be common, yet there is space for implementation competition. JMX page says that it is a continuation of a similar older product from sun. Anyway, JMX is still too young, though promising. I believe the motivations behind a concept are tougher to comprehend, more than the implementation themselves.

