program Conversor;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  HMAC in 'HMAC.pas',
  synacode in '..\synapse\synacode.pas',
  SecureBlackBox in 'SecureBlackBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
