unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation
uses pkgloader;

{$R *.lfm}

var
  Fudgebar: string;


procedure TestClass;
begin

  // get pointer to class in library
  ReturnSomeClass(SomeClass);

  // now try some methods from the class in library..
  SomeClass.test;
  SomeClass.test2;

  // we can use ansistrings from the DLL - we are using the same memory manager!
  // forget all those myths you've heard about not being able to use ansistrings
  // or classes from a dll. This is possible because of COMMON memory manager
  // being imported first
  FudgeBar:= SomeClass.test3;
  writeln(Fudgebar + '...');
  writeln('done');
  //readln;
end;

{ TfrmMain }


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TestClass;
end;

end.

