---
layout: post
title: "Long live the Agentic AI! Volte-Face. Mea culpa."
date: 2026-05-03 10:00 +0530
categories: [Article]
---

If LLM calls tools, is it agentic? If variables and methods are bundled together, is that OOP? It is, but it is not! On the surface it is correct, but the spirit is deeper.

In OOP, defining a Class is both a science and an art. The whole field of design patterns makes it a subtle art. Similarly, using an LLM to answer a question and using that response to branch our code appropriately is surely everything you can do with it. But we can aspire for more! Think about automatic debugging, or code refactoring for modularity.

[Inspired](https://www.youtube.com/shorts/UI9OP-ebdwM) to see what it takes to build my own coding agent, say, to modularize a 10,000-line Python file. Gemini and Antigravity easily helped me use [tree-sitter](https://en.wikipedia.org/wiki/Tree-sitter_(parser_generator)) to extract a list of classes, functions, and tests. Feed this list to the LLM and ask it to identify the target files for each item. Then, using that grouping, instruct the LLM on which file each item (class, function, or test) should go. Since my LLM is only Gemma 4, I processed the 1000+ items in parallel batches of 40. Afterward, use tree-sitter again to cut and paste the code, and then test it. This works!

Of course, the full-fledged AI coding agents like Cursor, Antigravity, and OpenCode are a whole level up. They enable any refactoring possible with generic tools like read, write, list, bash, etc. The core idea is that **we can use the feedback from the tools or LLMs to iterate further**. For a coding agent this looks appropriate because the act of finding the groups/files from the list of classes or functions is not normally possible with our deterministic code. LLMs are built for it. And when you think of automatic debugging to resolve a bug, an LLM fits like a glove.

In an enterprise setting, you may not find a converging loop like AI code-assist tools, but you can sure bottle an individual non-deterministic magic into an agent, an **AI agent**. And that is why frameworks like Google ADK are built, they can ease these multi-agent use cases.

In his [recent interview](https://www.youtube.com/watch?v=96jN2OCOfLs), Karpathy quoted another person's tweet: "**You can outsource thinking, but you cannot outsource understanding**". As a famous educator, he appreciates that whatever advancement comes, humans still have the onus and capability to understand. Only understanding gives us the capability to guide these intelligent, yet still jagged systems.

The [previous article]({% post_url 2026-02-25-agentic-is-dead-long-live-the-llm %}) point is still correct. The LLM code today is 100x slower than the deterministic code. So, whatever can be code, should be code, of course created by an AI coding agent, but tested, so reliable and fast. But still, I was harsh on the **Agentic** part, so this apology. Also this is a full 'balti' from that title's perspective, and I wanted to use volte-face and mea culpa somewhere!

<img src="/assets/images/2026-05-03-long-live-agentic-ai/car-wash-llm-jaggedness.png" alt="ai-jaggedness" width="300">
