{ This unit is part of the library, abd implements the classes needed for the
  EXE/ELF to use

  Warning: On linux, if you use smartlinking on a DSO, finalization will not
           occur on FPC 2.0.2 .. This has nothing to do with classes, just an
           fpc bug (see bug #4971)
  
  Regards,
   L505 (Lars)
   http://z505.com
}

unit Unit1; 

{$mode objfpc}{$H+}

interface

type
  // we must make a placeholder class
  TSomeClass = class
    procedure Test; virtual; abstract;
    procedure Test2; virtual; abstract;
    function Test3: string; virtual; abstract;
  end;

  // the implementation class
  TSomeDerived = class(TSomeClass)
    procedure Test; override;
    procedure Test2; override;
    function Test3: string; override;
  end;


procedure ReturnSomeClass(var ASomeClass: TSomeClass);
  
var
  SomeClass: TSomeDerived;

implementation


procedure TSomeDerived.Test;
begin
  writeln('Using class from DLL/DSO!');
end;

procedure TSomeDerived.Test2;
begin
  writeln('Another test, from DLL/DSO');
end;

function TSomeDerived.Test3: string;
begin
  result:= 'I dropped a brown fudge bar in the park';
end;


// returns an existing instance (pointer to) a class for the exe/elf to use.
procedure ReturnSomeClass(var ASomeclass: TSomeClass);
begin
  ASomeClass:= someclass;
end;

initialization
  Someclass:= TSomeDerived.create; // you don't have to create it here, this is
                                   // just a lazy way of doing it
finalization
  Someclass.free; // Again, you don't have to free it here, just a lazy example
                  // You could make a procedure to do this and export it.
end.


