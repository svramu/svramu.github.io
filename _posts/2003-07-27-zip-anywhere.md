---
layout: post
title:  "Zip Anywhere"
author: venu
categories: [Article]
---

Using Java Zip API to automate your compression chores (*K Venu, S V Ramu)

**Motivation**

Downloading and browsing lot of stuff from Internet is one part, while storing and retrieving relevant information from it is another. Retrieval is tough and needs more thought, but storage is simple and hence should be automated. The usual model of storing the downloads is to have a separate folder for each topic and keeping these folders inside one 'downloads' folder. (Usually I also prefix with an underscore '_', to make it appear first when sorted). Once while trying to burn a CD of some 600mb of downloads (web pages and software), I faced with an interesting problem. CD formats are quirky and some times incompatible. Come to think of it, it is natural. CDs usually transcend the OS borders. We naturally like to copy from MS Windows, and maybe run it in Linux (assuming they are all documents of HTML or PDF format). If so, what should be the format of the CD? For this portability reason, CD's have their own file structure standardized by ISO. This standard restricts the number of sub directories that can be created (something like 8 sub folder or more), and the maximum size of the file name (usually 32 characters). Of course there are MS Windows friendly formats like 'Joliet'. But these too have restrictions.

The first time I burned a CD, I was oblivious to these nuances. So when I went ahead with the burning of my 600mb downloads, I faced an harangue of insults from my CD burning software. Being in a hurry, I looked around for some tool, which can rename all the long file names with small meaningful ones. Obviously this was a doomed search, moreover how am I to handle my deep folder structure? I looked for a solution with anxiety as I have to leave that place shortly. Also being conservative, I wanted to comply with basic CD rules, so that it will be readable in most machines.

Then it struck, *Why not zip each folder before burning the CD ?!?* This was indeed a good solution, as it elides both my long file name problem, and the deep folder problem. In fact, from then on it has become a constant practice to zip before archiving into a CD. Of course, it is prudent to have small zips, so make lot of root level folders, instead of sub folders (usually I prefix the grouping name for the flattened folders, like in the picture). But this means I need a flexible zipping solution within easy reach. I tried to use the command line tools of WinZip, but it lacked a way to dynamically specify all folders inside a folder. I tried Apache Ant, but that too did not have an handy way to iterate over the sub folders inside a folder. In fact if these tools provided a way to iterate over files in all the sub folders, we will have a potent tool (maybe this should be the next goal). Anyway, not having a canned tool for iterating over the file system, I'm forced to use programming. In Java, this means I needed a way to zip programatically.

**Java Zip API**

The `java.util` package has two sub packages for this purpose. `java.util.zip` and `java.util.jar`. For those who don't know, Jar files are just pure zip files with some optional extra meaning for a special folder (`META-INF`) and few special files ( typically `manifest.mf`). The javadoc says,

JAR file is a file format based on the popular ZIP file format and is used for aggregating many files into one. A JAR file is essentially a zip file that contains an optional META-INF directory... In many cases, JAR files are not just simple archives of java classes files and/or resources... The META-INF directory, if it exists, is used to store package and extension configuration data, including security, versioning, extension and services.

**J2SE 1.4.1 - JAR File Specification**

So we just need to concentrate on the zipping, and other things are easy. But, jar package does have some cute methods to associate a compressed file with an entry in the manifest file. So, zipping is not everything in the Java world! Anyway, for our archiving example above, zipping and file system recursion is more than enough.

**Recursion over sub folders**

Recursively iterating over the file system is pretty simple and an useful task. This is possible as Java treats both a file and a folder as a `java.io.File`. The idea is just to check if the given `File` object `isDirectory()`, and if so loop over that directory/folder and recursively so on.

```java
public static void iterate(File file) {
   if(file.isDirectory()) {
      File[] list = file.listFiles();
      for (int i = 0; i < list.length; i++) {
         iterate(list[i]);
      }
   } else {
      //Do something with the file.
   }
}
```

The recursion logic used in the above method can be effectively used for zipping a given folder or a file. If it is a folder, do nothing. If it is a file, you write it to the `java.util.zip.ZipOutputStream`.

**Zipping a file**

Zipping a file involves two steps: One, to put a zipentry, which is just the destination file path to be recorded inside the zip file (you can play tricks here!).

```java
//Create the output zip stream
OutputStream os = new FileOutputStream(target);
os = new BufferedOutputStream(os);
ZipOutputStream zos = new ZipOutputStream(os);
//Write the information entry for this file.
zos.flush();
zos.putNextEntry(new ZipEntry(source.getAbsolutePath()));
```

And two, write the content to the zip stream, which also compress it.

```java
//Write the content of this file.
//This also compresses it!
InputStream is = new BufferedInputStream(new FileInputStream(source));
for(int c = is.read(); c != -1; c = is.read()) zos.write(c);
//Close the outermost stream.
//It takes care of the inner ones.
zos.close();
```

**UnZipping a file**

Unzipping again is the reverse of these two steps: One, get the `ZipEntry` from the zip file. And two, read and write the content from the zip file to the filesystem. This reading, also decompresses it. Of course writing the file content, based on its zip entry needs some `File` manipulation. Also, since all these are based on `InputStream` and `OutputStream`, you read the compressed stream from anywhere and write it anywhere.

```java
ZipFile zip = new ZipFile(sourceFile);
for(Enumeration entries = zip.entries(); entries.hasMoreElements(); ) {
   ZipEntry zipEntry = (ZipEntry) entries.nextElement();
   //Create the appropriate folders for the file, based on the
   //above ZipEntry
   //Read/decompress the file content.
   InputStream is = zip.getInputStream(zipEntry);
   OutputStream os = new FileOutputStream(newFile);
   os = new BufferedOutputStream(os);
   int x = 0;
   //A cool way to read a value and check it.
   while ((x = is.read()) != -1) os.write(x);
   //Close the stream.
   os.close();
}
```

**Epilogue**

For a long time I was procrastinating to write this tool. But when Venu asked for a neat task that can be useful, I gave this. Venu, though a new comer to Java (hardly two months now), but since he was strong in C++, completed this tool within few days, working just in his spare time. Thanks to him, this article and the zip tool (Tattvum-20030727-ZipUnZip.zip) is before you.

To test this tool, run it in a test folder which contain one or more non-empty folders, and then use it for your regular archiving. Please note that this is a very early release, but it works fine with the 300mb+ downloads! Known bugs are, it doesn't handle empty folders (it stops), and unzip needs some tweaking to work with zips created by WinZip. Comments and bug reports are welcome.

