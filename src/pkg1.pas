{ This is the library that contains the class in Unit1. We also export the
  memory manager from the library so that the exe/elf can import it and use it.
  This is even better than using "shared memory manager" as you know it from
  delphi, because we don't need a sharemem dll shipped with application

  Regards,
   L505 (Lars)
   http://z505.com

}

library pkg1;

{$mode objfpc}{$H+}

uses
  unit1;
  
// export memory manager from library
procedure GetMemMan(out MemMan: TMemoryManager);
begin
  GetMemoryManager(MemMan);
end;

exports
  GetMemMan,
  ReturnSomeClass;
  
begin

end.

