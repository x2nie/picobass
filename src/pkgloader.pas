unit pkgloader;

{$mode objfpc}{$H+}

interface

uses
  dynlibs;


type
  // the placeholder class
  TSomeClass = class
    procedure Test; virtual; abstract;
    procedure Test2; virtual; abstract;
    function Test3: string; virtual; abstract;
  end;


const
 {$ifdef unix}
  LIB_PATH = './libpkg1.so';
 {$endif}
 {$ifdef win32}
  LIB_PATH = 'pkg1.dll';
 {$endif}

type
  TGetMemMan = procedure (out MemMan : TMemoryManager);


var
  SomeClass: TSomeClass;
  GetMemMan: procedure (out MemMan : TMemoryManager);

type
  TReturnSomeClass = procedure (var ASomeClass: TSomeClass);
var
  ReturnSomeClass: procedure (var ASomeClass: TSomeClass);




// storage buffer for imported memory manager from library
var
  GottenMemMan: TMemoryManager;
  OldMemMan: TMemoryManager;



var
  LibHandle: TLibHandle;
  


implementation



initialization
  LibHandle:= LoadLibrary(LIB_PATH);
  GetMemMan:= TGetMemMan(GetProcAddress(LibHandle, 'GetMemMan'));

  // store old memory manager
  GetMemoryManager(OldMemMan);
  // Get shared memory manager which is stored in the library
  GetMemMan(GottenMemMan);
  // Set gotten memory manager up before import *any* functions from library.
  SetMemoryManager(GottenMemMan);

  ReturnSomeClass:= TReturnSomeClass(GetProcAddress(LibHandle, 'ReturnSomeClass'));


finalization

  // always free library
  if LibHandle <> NilHandle then
  begin
    FreeLibrary(LibHandle)
  end;

  // restore original memory manager, this is good practice
  SetMemoryManager(OldMemMan);
end.

