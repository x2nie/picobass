program picobass;

{$mode objfpc}{$H+}

uses
  //pkgloader,
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  pkgloader,
  Interfaces, // this includes the LCL widgetset
  Forms, main
  //,pkgloader
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

