---
layout: post
title:  "Agentic is dead. Long live the LLM."
date: 2026-02-25 06:00 +0530
categories: [Article]
---

Post date: Feb 25, 2026 06:00 AM

<img src="/assets/images/2026-02-25-agentic-is-dead/ai-overview.jpg" alt="ai-overview" width="300">
  
Last night, I vowed to go big and model the whole of enterprise software as an agentic system.

After all, if we identify each tool and each agent, and mock them, then we can trial-run the whole flow—and even have a transcript of the logs to prove it is working as expected. Even the final system needs this mockable testability. 

The best way to model RBAC is to use the session id between agents. And this is possible and normal in ADK. And we can model long-term memory as a tool call to save and retrieve user preferences from a DB.

When analyzing this with Gemini, it looks like these are pretty solid routes. But we have to design defensively for prompt injection and guardrails against hallucinations from the beginning.

BUT the amount of effort you put into the system design now is more than what's required for a good enterprise application. Because we have to safeguard against hallucinations too, which is a new burden now. 
 
What is a better guardrail than deterministic code? So, the best is to filter all natural language input, output, and even the LLM ideas deterministically with some kind of code; that way the system is testable and reliable. 

Of course, many know I have been touting that I stopped manually coding for a year now, and for the past quarter, I've stopped seeing code too. Because the LLM is so good at generating code. As they say, English (or Tamil etc.) is your new programming language. My job is only to be clear about what feature is required and to be able to test it fully. 

Surprisingly, this has been a time of prolific development for me. In fact, instead of being sad that my 30 years of experience with code is down the drain, I'm excited that so much can be developed so fast. 

I created my own personal polyglot language trainer PWA—a replacement for Duolingo—in one week (but after three weeks of thinking and analyzing). I revamped an old exam-taking application I wrote in Angular into Svelte now. I forgot Angular and don't know Svelte, because I never saw the code! Btw, this app was built and used over four years lovingly. Now revamped to be mobile-friendly with no Firebase, which I have been wanting to do for the past 5 years. Ah, this was recreated in 5 days.

Also, the capability to interface with natural language is unprecedented. The user need not know the UI and the system; the system will know the user. Which was always the intention anyway. 

So these are the two revolutions of GenAI: it democratized the UI—anybody can speak to the system in their natural language—and it democratized the logic, so anyone can generate code as long as they have the requirements and system design patience. These are undeniably new and good with GenAI. 

But the moment you think and rely on its reasoning, you are hit with hallucinations.

If you look at the history, LLMs were created for language translation, like English to French or Arabic to Japanese. What researchers are surprised by is that just a next-word predictor is so good at translation. And so many of human activity is just a form of translation. 

Even Tool Calling is a translation. We are translating English to a list of APIs. This is magical to see. Even the recent post about FunctionGemma is about how natural language can create events in your calendar or text someone. An API spec is a language with its own vocabulary and grammar.

What is AI code assist? It is translating English or Tamil to Java or C++ or SQL. Programming languages are also a target language like French or Chinese.

Anything beyond translation faces hallucinations. Even translation can be rough at the edges sometimes. But it is making the impossible (just 3 years ago) possible. So we are considerate and even thankful. 

But when it is claiming to replace an enterprise system—which has been so reliable for the past 50 years—with something that is only approximate, it is foolish and dangerous. Every effort that we put into guardrails against LLM hallucinations is a plea to use code. 

Code is deterministic. Code is repeatable, so it is testable. And mainly, code is cheap and fast now with LLMs. So much is said about agentic systems thinking—that it can heal errors and create new workflows dynamically in runtime. But the moment you try to harness it, you hit the wall of hallucinations, and the tsunami of guardrails you have to build looks massive. But now that code is cheap, we might as well put the effort into generating code for all sorts of edge cases and error conditions and release tested, reliable code—even every day, if our process is good. We can have smart logs which could alert us to see where the user is struggling and build new flows and glues, because the code is cheap. And all these are old dreams of any budding app designer. 

Agentic is dead, long live the LLM!

PS:

<img src="/assets/images/2026-02-25-agentic-is-dead/gemini-convinced.jpeg" alt="gemini-convinced" width="300">

*I made gemini agree with me after an one hour builldup 😂 In fact I started for designing an agentic system with google adk. More and more it gave ideas and corrected, I see my system design skill is same. nothing new.*

<img src="/assets/images/2026-02-25-agentic-is-dead/gemini-historic-context.jpeg" alt="historic-context" width="300">

*The historical context*
