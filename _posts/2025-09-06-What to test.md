&{<nil> false <nil> <nil> [] <nil> <nil> <nil> <nil> # What to test?

What is Mock, Assert, JUnit, and how are they related?

*S V Ramu (2005-04-13)*

**Prelude**

I'm very late to this game of [unit testing](https://c2.com/cgi/wiki?UnitTest). But of late, the guilt has been eating me up. I do see the benefit of it in flashes, but when I try to get organized for a project, this primordial question recurs. Also the various new and interesting concepts like [Mock](https://c2.com/cgi/wiki?MockObject), [Assert](https://java.sun.com/j2se/1.4.2/docs/guide/lang/assert.html) (like the 1.4 Java key word), and the [JUnit](https://www.junit.org/) itself are bit luring and confusing at the same time. Their domain of application seem to be overlapping. Maybe Mock is bit clearer, but yet, how do they all relate to each other?

Though this question has been simmering for a quite some time now, it is only yesterday when I was arguing on a practical scenario with Varad, one of my thinking colleagues, that things fell into place. Thanks to him.

**Testing is, asserting your expectations**

```java
// A sample JUnit TestCase...
public class MoneyTest extends TestCase {
    private Money f12CHF;
    private Money f14CHF;
    protected void setUp() {
        f12CHF = new Money(12, "CHF");
        f14CHF = new Money(14, "CHF");
    }
    public void testEquals() {
        Assert.assertTrue(!f12CHF.equals(null));
        Assert.assertEquals(f12CHF, f12CHF);
        Assert.assertEquals(f12CHF, new Money(12, "CHF"));
        Assert.assertTrue(!f12CHF.equals(f14CHF));
    }
    public void testSimpleAdd() {
        Money expected = new Money(26, "CHF");
        Money result = f12CHF.add(f14CHF);
        Assert.assertTrue(expected.equals(result));
    }
}
```

JUnit, beyond doubt is a remarkable paradigm. A small chunk of code, but yet a way to think about testing itself. What is testing after all? *Testing is just asserting your expectations!* And that is just what JUnit does. It calls/uses the code to be tested, and *asserts* that the return value and the expected value matches as we expect. This much is clear. And hence the apt quote from [JUnit](https://www.junit.org/),

Never in the field of software development was so much owed by so many to so few lines of code.

[Martin Fowler](https://www.martinfowler.com/)

It is also clear, that this assert, which the junit calls through custom methods, is now been standardized in Java 1.4 (merlin), as a statement, with two added benefits, that it can be turned off in runtime for the JVM, and when done so, the cost of the statement is made zero. Interesting, but no questions there. The question is, where should we use these asserts? Of course, JUnit test methods are just a set of asserts, and it makes sense there. Then should we not use it inside our non-test methods? What is to be expected of them there?

Sorry to confuse and prolong this torture of repetition. But this is how I felt about the whole issue. Ok, getting on with my clarity, *the key revelation is, notice that there are asserts inside the unit test methods! So, wherever you test something you need to use assert.* That is the only way, and the key point. Now, let me explore the ramification of this information, and how it can lead to clarity, on the fundamental question: What to test?

Before proceeding further, just for completion let us look at the equivalence of [assert... methods](https://www.junit.org/junit/javadoc/3.8.1/junit/framework/Assert.html) of JUnit, and the java keyword 'assert'. And for the whole reimplementation of JUnit in terms of 1.4 `assert` and 1.5 annotations, see [TestNG](https://beust.com/testng/).

```java
junit.framework.Assert.assertEquals(java.lang.String message, int expected, int actual)
// can be written in J2SE 1.4 as
assert expected==actual: message;
// Similarly, 
junit.framework.Assert.assertNotNull(java.lang.String message, java.lang.Object object)
// can be written in J2SE 1.4 as
assert object != null: message;
// And,
junit.framework.Assert.fail(java.lang.String message)
// can be written in J2SE 1.4 as
assert false: message;
```

**Components are either a Library or a Client or both**

![Components](/assets/images/What%20to%20test/5b66639b1675b9217f384a162418a92f.jpg)

Let me define few things for easy reference. *A Component is a chunk of code, which can be built and tested by a developer in isolation.* Ah, that is almost Utopian, but that is the goal and full intention. So you can imagine an application as a collection of components working together. And any component might be depending on other components, and might be depended upon by some others. So a same component can be both dependent and depended upon. When it depends on something it acts as a *Client* (say Cli), consumer. And when it is being depended upon, it acts as a *Library* (say Lib), provider. The User is of course the ultimate client, and maybe the Database can be considered as the ultimate *Library*.

**Where to assert?**

Initially I thought, *All Clients, and only clients, asserts*, keeping JUnit as the reference, and assuming that the original [Java guideline for asserts as DBC](https://java.sun.com/j2se/1.4.2/docs/guide/lang/assert.html) (Design By Contract) is taken care of. But yesterday again, when I was testing my claims with my brother, as usual, it became clear that with DBC it is the Provider which uses asserts. So there seems to two distinct usage for assert. One in Client, the test cases, upon the result of the called method, and another in the 'library', when the method is called. Simply put, assert all your expectations.

**To Unit Test, Mock the Clients!**

To mock is to make a dependency dummy, but predictable. Ideally a mock is as close as possible to the reality. Mock is like a model, where we abstract or simplify the environment, to focus on the key thing. If a component can be replaced, it can be Mocked. Or better still, by the definition of a component, as a well defined input to output transformer, which can be developed and tested in isolation, *every component can be mocked.*

And hence comes the revelation, that the Unit Tests and the Mock Objects, both are mocks. *Where Mock Objects mocks the Library, Unit Tests mock the client!* So what to test? Mock the clients! That is, create a dream client that will use your component fully, and assert. By the way, this also sheds light on using asserts. Use asserts profusely in your component! Because after all, every component that uses its dependencies, act as a Unit Test for them, as a Mock Client. Maybe assert can merit more exploration in the DBC direction, but it seems its nexus with testing is clear.

**Epilogue**

To be fair, don't believe what I say above about testing! I haven't yet tested it. Before now, testing was distant to me, even conceptually, though I seek it. From now, it is close to me, but until it is practiced like OO, these thoughts are no reference, except maybe as a starting point of a debate, or maybe an inspiration. Anyway I intend to test these ideas more, and see how much of these seeming clarity is practically useful, for [TDD (Test Driven Development)](https://www.extremeprogramming.org/rules/testfirst.html), and I'll report here if something interesting crops up.

Yet again, this is a fresh inspiration, served hot. It is almost a year now from the last article, and maybe I have to regain my instinct to be more public with my thoughts. Writing articles is a kind of knack, especially if you want to learn from it and not just preach. Blogs makes sense in this context. But all well written blogs are in fact articles, otherwise it is just a valuable form of discussion forum. If adding a personal or egoistical approach makes some thing a blog, definitely these articles are 'Blorticles' (Blog + Articles). Anyway, for now I like the personal space and formalism that these articles provide me, but otherwise I do envy the blog model, and I'm playing the devil's advocate.
}
