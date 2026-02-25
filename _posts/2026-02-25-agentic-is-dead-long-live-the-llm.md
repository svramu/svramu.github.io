---
layout: post
title:  "Agentic is dead. Long live the LLM."
date: 2026-02-25 06:00 +0530
categories: [Article]
---

Post date: Feb 25, 2026 06:00 AM

<img src="/assets/images/2026-02-25-agentic-is-dead/ai-overview.jpg" alt="ai-overview" width="300">
  
Last night, I vowed myself to go big and model the whole enterprise software as an agentic system.

After all, if we identify each tool and each agent, and mock it, then we can trial run the whole flow, and even have a transcript of the logs, to prove it is working as expected. Even the final system needs this mockable testability. 

The best way to model RBAC is to use the session id between agents. And this is possible and normal in ADK. And model the long term memory as a tool call to save and retrieve user preferences from a db.

When analysing this with gemini, looks like these are pretty solid routes, and we have to design defensively for prompt injection and guard rails against hallucinations from the beginning.

BUT the amount of effort you put for the system design now is more than required for a good enterprise application. Because we have to safeguard against hallucinations too, which is a new burden now. 
 
What is the best gaurd rail than deterministic code? So, best is to filter all natural language input, output and even the llm ideas deterministic-aly with some kind of code, that way the system is testable and reliable. 

Of course many know I have been touting that I stopped manually coding for a year now, and for the past quarter stopped seeing code too. Because llm is so good in generating code. As everybody say english or tamil is your new programming language. My job is only to be clear about what feature is required and being able to test it fully. 

Surprisingly this has been a time of prolific development for me. In fact instead of being sad that my 30 years of experience with code is down the drain, I'm excited that so much can be developed so fast. 

I created my own personal polyglot language trainer PWA, a replacement for duolingo. In 1 week (but 3 weeks of thinking and analysing). I revamped an old exam taking application I wrote in angular in svelte now. I forgot angular and don't know svelte, because I never saw the code! Btw, this app was built and used over four years lovingly. Now revamped to be mobile friendly with no firebase., which I have been wanting to do for past 5 years. Ah this was recreated in 5 days.

Also the capability that we can interface with natural language is unprecedented. So the user need not know the ui and the system, the system will know the user. Which is always the intention anyway. 

So these are the two revolution of the genai: it democratised the UI, anybody can speak to the system in their natural language, and it democratised the logic, so anyone can generate code as long as they have the requirements and system design patience. These are undeniable new and good with genai. 

But the moment you think and rely that it can reason, you are hit with hallucinations.

If you see the history, llm was created for language translation, like English to French or say Arabic to Japanese. What the researchers are surprised is that just the next word predictor is so good at translation. And so many of human activity is just a form of translation. 

Even Tool Calling is a translation. We are translating English to a list of APIs. This is magical to see. Even the recent post about FunctionGemma is about how natural language can create events in your calendar, or text someone. A API spec is a language with its own vocabulary and grammar.

What is AI code assist? It is translating English or tamil to Java or C++ or SQL. Programming languages are also a target language like french or Chinese.

Anything beyond translation, faces hallucinations. Even translation can be rough at edges sometimes. But it is making impossible, just 3 years before, possible. So we are considerate and even thankful. 

But when it is claiming to replace enterprise system which is so reliable in the past 50 years, with something that is only approximate, it is foolish and dangerous. Every effort that we put for guardrail against llm hallucinations, is pleading to use code. 

Code is deterministic. Code is repeatable so testable. And mainly code is cheap and fast now with llm. So much is said about agentic systems thinking, that it can heal errors and create new workflows dynamically in the runtime. But the moment you try to harness it, you hit the wall of hallucinations and the tsunami of gaurdrails you have to build looks large. But now that the code is cheap, we could as well put the effort to generate code for all sorts of edge cases and error condition and release a tested reliable code, even every day, if our process is good. We can have smart logs which could alert us to see where the user is struggling and build new flows and glues, because the code is cheap. And all these are old dreams of any budding app desiner. 

Agentic is dead, long live the LLM!

PS:

<img src="/assets/images/2026-02-25-agentic-is-dead/gemini-convinced.jpeg" alt="gemini-convinced" width="300">

*I made gemini agree with me after an one hour builldup 😂 In fact I started for designing an agentic system with google adk. More and more it gave ideas and corrected, I see my system design skill is same. nothing new.*

<img src="/assets/images/2026-02-25-agentic-is-dead/gemini-historic-context.jpeg" alt="gemini-historic-context" width="300">

*the historical context*
