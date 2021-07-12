unit uFrame;

interface

uses
  uComponente;

type

  TFrame = class(TComponente)


     public

        procedure AdicionaComponente(aComponente: TComponente); override;
  end;

implementation

{ TFrame }




procedure TFrame.AdicionaComponente(aComponente: TComponente);
var
   aComponenteArray: TComponenteArray;
   I : Integer;
begin

   for I := 0 to length(Componentes) - 1 do
      if Componentes[I].Name = aComponente.Name then
         Exit;

   aComponenteArray := Componentes;
   SetLength(aComponenteArray,Length(Componentes) + 1);
   aComponenteArray[Length(aComponenteArray) - 1] := aComponente;

   Componentes := aComponenteArray;
end;


end.

