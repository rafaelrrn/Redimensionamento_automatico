program QC_3;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uBotao in 'uBotao.pas',
  uComponente in 'uComponente.pas',
  uFrame in 'uFrame.pas',
  uLabel in 'uLabel.pas',
  uMemo in 'uMemo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
