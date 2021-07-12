unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    memo_log: TMemo;
    btn_CriarObjComponentes: TButton;
    btn_LimparObjComponentes: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure btn_CriarObjComponentesClick(Sender: TObject);
    procedure btn_LimparObjComponentesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayComponentes;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrame, uBotao, uLabel, uMemo;

var
   frame  : uFrame.TFrame;
   botao  : TBotao;
   vlabel : uLabel.TLabel;
   memo   : uMemo.TMemo;

procedure TfrmPrincipal.btn_CriarObjComponentesClick(Sender: TObject);
begin

   try
      if not Assigned(frame) then
      begin
         frame := uFrame.TFrame.Create;
         frame.Name      := 'FramePai_1';
         frame.ClasseName := 'TFrame';
         frame.X         := 10;
         frame.Y         := 10;
         frame.Largura   := 500;
         frame.Altura    := 600;
         frame.RegistraLog(memo_log);
      end;

      if not Assigned(botao) then
      begin
         botao := TBotao.Create;
         botao.Name      := 'Botao_1';
         botao.ClasseName := 'TBotao';
         botao.X         := 16;
         botao.Y         := 112;
         botao.Largura   := 30;
         botao.Altura    := 60;
         botao.RegistraLog(memo_log);
      end;

      if not Assigned(vlabel) then
      begin
         vlabel := uLabel.TLabel.Create;
         vlabel.Name      := 'Label_1';
         vlabel.ClasseName := 'TLabel';
         vlabel.X         := 16;
         vlabel.Y         := 93;
         vlabel.Largura   := 30;
         vlabel.Altura    := 13;
         vlabel.RegistraLog(memo_log);
      end;

      if not Assigned(memo) then
      begin
         memo := uMemo.TMemo.Create;
         memo.Name        := 'Memo_1';
         memo.ClasseName   := 'TMemo';
         memo.X           := 16;
         memo.Y           := 300;
         memo.Largura     := 460;
         memo.Altura      := 255;
         memo.RegistraLog(memo_log);
      end;

      frame.AdicionaComponente(botao);
      frame.AdicionaComponente(vlabel);
      frame.AdicionaComponente(memo);

      // esta ação gerará um erro, respeitando a regra do exercício.
      // Regra --> Frames são os únicos componentes que permitem ser adicionados componentes em si
      // botao.AdicionaComponente(vlabel);

      DisplayComponentes;

   finally
   end;
end;

procedure TfrmPrincipal.btn_LimparObjComponentesClick(Sender: TObject);
begin
   if Assigned(frame) then
      FreeAndNil(frame);

   if Assigned(botao) then
      FreeAndNil(botao);

   if Assigned(vlabel)then
      FreeAndNil(vlabel);

   if Assigned(memo)  then
      FreeAndNil(memo);

   DisplayComponentes;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
   if Assigned(frame) then
   begin
      frame.Altura  := 650;
      frame.Largura := 800;
   end;

   DisplayComponentes;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
   if Assigned(frame) then
   begin
      frame.Largura := frame.Largura + 100;
      frame.Altura  := frame.Altura  + 100;
   end;

   DisplayComponentes;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
   if Assigned(frame) then
   begin
      frame.Largura := frame.Largura - 100;
      frame.Altura  := frame.Altura  - 100;
   end;

   DisplayComponentes;
end;

procedure TfrmPrincipal.DisplayComponentes;
var
   I : Integer;
begin

   memo_log.Clear;

   if Assigned(frame) then
   begin
      frame.RegistraLog(memo_log);

      for I := 0 to length(frame.Componentes) - 1 do
         frame.Componentes[I].RegistraLog(memo_log);
   end;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   btn_LimparObjComponentesClick(Sender);
end;

end.
