unit uPrincipal;

interface

uses
  Winapi.Windows, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.SysUtils, HMAC,
  IdHMACSHA1, synacode, SecureBlackBox;

type
  TfrmPrincipal = class(TForm)
    lbHmacSha1: TLabel;
    lbText: TLabel;
    edtText: TEdit;
    lbKey: TLabel;
    edtKey: TEdit;
    btnConverter01: TBitBtn;
    edtResultado: TEdit;
    btnConverter02: TBitBtn;
    btnLimpar: TBitBtn;
    btnConverter03: TBitBtn;
    lbResult: TLabel;
    procedure lbHmacSha1DblClick(Sender: TObject);
    procedure btnConverter01Click(Sender: TObject);
    procedure btnConverter02Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConverter03Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.lbHmacSha1DblClick(Sender: TObject);
begin
  edtText.Clear;
  edtKey.Clear;
  edtResultado.Clear;
end;

procedure TfrmPrincipal.btnConverter01Click(Sender: TObject);
begin
  edtResultado.Text := THMACUtils<TIdHMACSHA1>.HMAC_Base64(Trim(edtKey.Text), Trim(edtText.Text));
end;

procedure TfrmPrincipal.btnConverter02Click(Sender: TObject);
begin
  edtResultado.Text := EncodeBase64(HMAC_SHA1(Trim(edtText.Text), Trim(edtKey.Text)));
end;

procedure TfrmPrincipal.btnConverter03Click(Sender: TObject);
begin
  edtResultado.Text := HmacSha1Base64(Trim(edtKey.Text), Trim(edtText.Text));
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  edtResultado.Clear;
end;

end.
