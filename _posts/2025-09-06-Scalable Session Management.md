&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # Scalable Session Management

Scalable session management strategy for web
*Ganesh Sethuraman (2003-04-03)*

**Problem**

Session management in any web technology (J2EE or others) has evolved over a period of time, now some of them even have a distributed session management. The amount of data present in the session is crucial for the scalability for the system. This is more critical for any web system which has *high-hits* with *non-static* data to be shown to the user.

Let us see a typical problem in a web system which has menus and some sub-menus for navigation. Assume that session data is required at menu level as well as at sub-menu level in the application, so the program adds the data to session as and when required. When the user of the web-system navigates randomly from one sub-menu to another, the data added in the previously visited sub-menu still remains in the memory, irrespective of whether the developer really needed that data now or not. Now the problem is two folds here,

- There is some amount of data in the memory which is unused and possibly never be used again. This is a memory leak.
- To mitigate the above issue, assume that developer is given the responsibility of removing the data form the session as and when he doesn't want it anymore. Then it involves more effort from developer side as well as the program is error prone as the developer may forget to delete a particular data and it is even difficult to detect during review process.

Let us see an example to visualize the problem better, let us take a snapshot of a credit system, following is the way in which the credit system is grouped and same way the navigation menu is also (hierarchically) organized.

CREDIT SYSTEM

- COLLATERALS
    - COLLATERAL COMMENTS
    - CREDITS CONNECTED
- PRINCIPLE REPAYMENT
- INTEREST REPAYMENT

In the above menus, when the user clicks on the COLLATERALS the list of collateral the user has , is shown, the user can further add COMMENTS to each of the collateral available or the user can also see the CREDITS CONNECTED to the collaterals, both the options are provided to the user. Assume that each menu and sub-menu has a set of screens to accomplish the task.

*Case 1*. When the user clicks on the COLLATERALS, few data is added to the session, which is reused when the user goes into its sub-menu, COLLATERAL COMMENTS. Once the user sets the collateral comments he goes into CREDITS CONNECTED, the previous data added to the session when the user was in COLLATERAL COMMENTS are not useful anymore and it is just adding to the memory leak.

*Case 2*. Assume the same case as above where user edits the COLLATERAL COMMENTS and commits it, he goes randomly into PRINCIPLE REPAYMENT, now the session data of COLLATERAL COMMENTS are useless and also the session data added in the COLLATERALS are also useless, just adding to the memory leak again.

**Cost of the problem**

The cost of the above mentioned problem may wary from system to system. Following are the factors given in the order of importance.

*Web designed with group of hierarchical menu structure:* Many web system these days are designed in a hierarchical fashion which is logical indeed, as that is how the in the real world the many systems are grouped. By hierarchical design we mean system with menus, sub-menus and menus with various levels. Systems having two levels are very common. The data is added to session when the user is in a particular menu or sub-menu. It is quite possible that the data added in a particular sub-menu is useless when the user moves on to another sub-menu. Hence more menus and sub-menus we have in the system there is a possibility that we add up more and more unwanted data in the session, thereby increasing the cost of storage.

*Visit statistics of the web page:* Suppose the user visits one or two pages after he logs-in and then logs-out. This has a different effect on the storage, especially if the user visits many pages on an average, it can be costly.

*Number of site hits:* Of-course the number of hits to the system has a role in identifying the amount of data that needs to be there in the memory, more the hits more conservative we should be about usage of session.

**A Solution for the above problem**

A solution to above mentioned problem is to ensure data in the session is removed as and when they become unnecessary and the developer is freed of the burden of removing the data added to the session. This is like going Java-way, where the developer is not burdened by the task of removing the objects created. However in our case the solution is not GC, as we will propose a more deterministic way of removing session data.

Hierarchical compartmentization of session.

1.  Divide the session into various compartments. The compartments are hierarchically organized (i.e., parent-child relation).
2.  These compartments are named.
3.  The developer should also be able to create or remove the compartments from session.
4.  The developer adds data into these named compartments as and when required, name of the compartment is assigned based on what menu or sub-menu he is in.
5.  The hierarchical compartments can be inter-dependent or independent; here dependency means that when we remove the parent compartment then its entire child compartments are also removed, this has a cascading effect. On the contrary, when they are independent, the removal of one compartment does not affect the others.

The above points are what we basically need to do over an existing session handling mechanism. There are some more changes required for the application framework which we will see below. Typically these changes will be part of/extension of MVC framework which the application uses.

*Isn't it logical to make the session hierarchical when the menus which govern the data addition into session is hierarchical.*

Session Boundary Identification

- Arrive at an interface with which the application informs the session that end of menu or sub-menu has reached along with the menu/sub-menu name.
- As and when the boundary events are captured the corresponding compartments are removed from the session. The dependency of these compartments takes care of cascading the effect to other compartments.

**Conclusion**

The total amount of session data in the memory is directly dependent on the number of users, so if we want our system to be scalable, it is imperative to have as little data in the memory, as possible; this is exactly what this article helps us to achieve. Thinking futuristically also we stand to gain. For example, in the current hardware scenario we generally add memory so that the system is tuned to manage the maximum load, so any memory saved with above approach may not pay directly, but when it comes to blades and grid computing where the hardware resource are shared, every bit saved is a bit gained. This article is still incomplete, the design and a reference implementation can be added to this.
}