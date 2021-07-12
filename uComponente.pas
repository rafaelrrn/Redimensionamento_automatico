unit uComponente;

interface

uses
  Vcl.StdCtrls, System.SysUtils;

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;
    FName: String;
    FClassName: String;
    FAlterou_Altura: Boolean;
    FAlterou_Largura: Boolean;
    FProporcao_Aumento_Altura: Double;
    FProporcao_Aumento_Largura: Double;
    FRedimensionar_S_N: Boolean;


    procedure SetAltura(const Value: Integer);
    procedure SetLargura(const Value: Integer);
    procedure SetX(const Value: integer);
    procedure SetY(const Value: integer);
    procedure SetClassName(const Value: String);
    procedure SetName(const Value: String);
    procedure SetComponentes(const Value: TComponenteArray);
    procedure SetAlterou_Altura(const Value: Boolean);
    procedure SetAlterou_Largura(const Value: Boolean);
    procedure SetProporcao_Aumento_Altura(const Value: Double);
    procedure SetProporcao_Aumento_Largura(const Value: Double);
    procedure SetRedimensionar_S_N(const Value: Boolean);

  public

    property X : integer read FX write SetX; //left
    property Y : integer read FY write SetY; //top
    property Altura: Integer read FAltura write SetAltura;
    property Largura: Integer read FLargura write SetLargura;
    property Componentes: TComponenteArray read FComponentes write SetComponentes;

    property Name : String read FName write SetName;
    property ClasseName : String read FClassName write SetClassName;

    property Alterou_Altura : Boolean read FAlterou_Altura write SetAlterou_Altura;
    property Alterou_Largura : Boolean read FAlterou_Largura write SetAlterou_Largura;
    property Proporcao_Aumento_Largura  : Double read FProporcao_Aumento_Largura write SetProporcao_Aumento_Largura;
    property Proporcao_Aumento_Altura   : Double read FProporcao_Aumento_Altura write SetProporcao_Aumento_Altura;
    property Redimensionar_S_N :Boolean read FRedimensionar_S_N write SetRedimensionar_S_N;

    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;

    procedure RegistraLog( aterminal : TMemo);
    procedure RedimensionaComp_filhos;
    function  CalculaProporcao( valor_ant, valor_nov : Double):Double;
  end;

implementation

uses
  Vcl.Dialogs;

procedure TComponente.AdicionaComponente(aComponente: TComponente);
begin
   if Self.ClasseName <> 'TFrame' then
      raise Exception.Create('Apenas a Classe TFrame pode adicionar componentes em si.');
end;

function TComponente.CalculaProporcao(valor_ant, valor_nov: Double): Double;
var
   percentual : Double;
begin
   try
      valor_nov := valor_nov * 100;
      percentual := round(valor_nov / valor_ant);
   except
      percentual := 0.00;
   end;

   Result := percentual;
end;

procedure TComponente.RedimensionaComp_filhos;
var
   I : Integer;
begin
   FAlterou_Altura    := false;
   FAlterou_Largura   := false;
   FRedimensionar_S_N := false;

   for I := 0 to length(Self.Componentes) - 1 do
   begin

       if (Self.Componentes[I].ClasseName = 'TBotao') then
       begin

          Self.Componentes[I].Largura := round((Self.Componentes[I].Largura * Self.Proporcao_Aumento_Largura ) / 100);
          Self.Componentes[I].X       := round((Self.Componentes[I].X       * Self.Proporcao_Aumento_Largura ) / 100);
          Self.Componentes[I].Y       := round((Self.Componentes[I].Y       * Self.Proporcao_Aumento_Altura  ) / 100);
       end;

       if (Self.Componentes[I].ClasseName = 'TMemo') or (Self.Componentes[I].ClasseName = 'TFrame') then
       begin

          Self.Componentes[I].Largura := round((Self.Componentes[I].Largura * Self.Proporcao_Aumento_Largura ) / 100);
          Self.Componentes[I].Altura  := round((Self.Componentes[I].Altura  * Self.Proporcao_Aumento_Altura  ) / 100);
          Self.Componentes[I].X       := round((Self.Componentes[I].X       * Self.Proporcao_Aumento_Largura ) / 100);
          Self.Componentes[I].Y       := round((Self.Componentes[I].Y       * Self.Proporcao_Aumento_Altura  ) / 100);
       end;

       if (Self.Componentes[I].ClasseName = 'TLabel') then
       begin

          Self.Componentes[I].X       := round((Self.Componentes[I].X       * Self.Proporcao_Aumento_Largura ) / 100);
          Self.Componentes[I].Y       := round((Self.Componentes[I].Y       * Self.Proporcao_Aumento_Altura  ) / 100);
       end;

   end;

end;

procedure TComponente.RegistraLog( aterminal : TMemo);
var
   I      : Integer;
   filhos : String;
begin
   try
      if (Self.ClasseName = 'TFrame') and (Length(Self.Componentes) > 0) then
         for I := 0 to length(Self.Componentes) - 1 do
            filhos := filhos + Self.Componentes[I].Name + ' | ';

      aterminal.Lines.Add
      (
          'Componente: ' + Self.Name + #13#10 +
          'X: ' + Self.X.ToString    + '| Y: ' + Self.Y.ToString  + #13#10 +
          'Altura: ' + Self.Altura.ToString    + '| Largura: ' + Self.Largura.ToString
      );

      if (filhos <> EmptyStr) then
         aterminal.lines.Add('filhos: '+ filhos );

      aterminal.lines.Add('==================');

   finally
      filhos := '';
   end;
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
begin
end;
  
procedure TComponente.SetAlterou_Altura(const Value: Boolean);
begin
  FAlterou_Altura := Value;

  if (Value) and (Alterou_Largura) then
     Redimensionar_S_N := true;


end;

procedure TComponente.SetAlterou_Largura(const Value: Boolean);
begin
  FAlterou_Largura := Value;

  if (Value) and (Alterou_Altura) then
     Redimensionar_S_N := true;

end;

procedure TComponente.SetAltura(const Value: Integer);
var
  valor : Integer;
begin

  valor   := FAltura;

  FAltura := Value;

  if (Value <> valor)            and
     (Self.ClasseName = 'TFrame')   and
     (length(Self.Componentes) > 0)
  then
  begin
     FProporcao_Aumento_Altura := CalculaProporcao(valor,Value);
     Alterou_Altura := true;
  end;

end;

procedure TComponente.SetClassName(const Value: String);
begin
  FClassName := Value;
end;

procedure TComponente.SetComponentes(const Value: TComponenteArray);
begin
  FComponentes := Value;
end;

procedure TComponente.SetLargura(const Value: Integer);
var
  valor : Integer;
begin

  valor   := FLargura;

  FLargura := Value;

  if (Value <> valor)          and
     (Self.ClasseName = 'TFrame')  and
     (length(Self.Componentes) > 0)
  then
  begin
     FProporcao_Aumento_Largura := CalculaProporcao(valor,Value);
     Alterou_Largura := true;
  end;
end;

procedure TComponente.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TComponente.SetProporcao_Aumento_Altura(const Value: Double);
begin
  FProporcao_Aumento_Altura := Value;
end;

procedure TComponente.SetProporcao_Aumento_Largura(const Value: Double);
begin
  FProporcao_Aumento_Largura := Value;
end;

procedure TComponente.SetRedimensionar_S_N(const Value: Boolean);
begin
  FRedimensionar_S_N := Value;

  if (Value) then
     RedimensionaComp_filhos;

end;

procedure TComponente.SetX(const Value: integer);
begin
  FX := Value;
end;

procedure TComponente.SetY(const Value: integer);
begin
  FY := Value;
end;

end.

