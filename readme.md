Bigbang
-------


Anonymous said...
"You cannot share or exchange classes, objects, global variables or let alone strings (unless the client is a Delphi app and both the DLL and client use ShareMem)."

Hallvard, there is one way to share Strings across a DLL without using sharemem. It is kind of a bit like sharemem - you just export the memory manager from either the EXE or DLL instead of using sharemem.dll.

For example:
(demo is FPC, but Delphi code is similar)
Export Classes And Strings from DLL

However, as you say, BPL packages are easier in the long run to use anyway. Still the problem with Exporting strings from a DLL is that a C++ program couldn't use them - just as with a BPL.

05 OCTOBER, 2006 22:13

@ https://hallvards.blogspot.com/2006/09/hack13-access-globals-faster.html