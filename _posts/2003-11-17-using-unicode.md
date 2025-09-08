---
layout: post
title:  "Using Unicode"
author: senthil
categories: [Article]
---

A first hand report on using Unicode with XML

**The New Code: Unicode**

![](/assets/images/Using%20Unicode/8849b988b82bd396096b1a040d74e7d4.jpg)

As we all know, Unicode is the standard for encoding characters of different languages, independent of the Programming Language and the Operating System. Normally a single Character is represented in single-byte character set (SBCS), multi-byte character set (MBCS) or double-byte character sets (DBCS). In Unicode character set, each character is represented by two bytes. Thus a Unicode string is a sequence not of individual bytes but of two-byte words. Check more about [Unicode](https://www.unicode.org/). Technology

Our company mostly work on Microsoft Technology. We were using Windows 2000 Server, Microsoft SQL Server 2000 (MSSQL), Internet Information Server 5.1 (IIS), Microsoft Active Data Objects 2.7 (ADO) and Microsoft Active XML Objects 3 (MSXML)

**The Start**

![](/assets/images/Using%20Unicode/d1a96482361f472a6763394ea1455bdd.jpg)

One of our clients asked for Chinese Language support in one of our web application. Our instance reflex was to use Extensible Markup Language (XML) and Extensible Stylesheet Language (XSL). That is, use a static XML file to store the different linguistic data and to transform the default language (English) to the regional language with XSL. It was very easy to create the XML with Unicode character, enable the language you need in the windows 2000 from the regional settings and browse the web and copy the words and paste into the XML file. I was trying to find some web site in Tamil rather than Chinese (Better to work with the devil you know ;-)) I found a nice site [https://www.jaffnalibrary.com/tools/Unicode.htm](https://www.jaffnalibrary.com/tools/Unicode.htm) which works with Tamil phonetic just type in English and get words in Tamil.

**Set Backs**

We created the XML file and changed using XSL file, thus transforming the XML to HTML. And to our surprise, we were able to see only junk characters in the 'TeamName'. Another problem was transforming our big XML file twice; one for English and next for the regional language, was slow (This was our design problem, of having 2000+ lines in the XML file directly from the ADO).

**MSSQL Server**

I was left with no other choice other than storing the linguistic 'TeamName's in the database. The initial idea was to create a new database to store Unicode character, because by default MSSQL server use COLLATE SQL_Latin1_General_CP1_CI_AS for varchar field types which will not encode the Unicode Characters.

After doing some research and by searching in Google, an easy way was found to store the Unicode character in the existing database, with the field type nvarchar. Insert or update can be made to this field by just prefixing 'N' to the string (INSERT INTO Teams (TeamName) VALUES (N 'UnicodeString') )

**Mission complete**

The storing of Unicode in database went without any qualms. But we were still stuck with the set back one: junk XSLT output. We tried to set the encoding to 'utf-8', 'utf-16' and so on... But at last our problem came to end when we set the encoding to 'iso-8859-1'. Finally, we stored the linguistic data in database, instead of a static XML file, and thus only one transformation was required, to the required regional language.

