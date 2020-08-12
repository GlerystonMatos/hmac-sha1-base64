object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conversor HMAC-SHA1 > Base64'
  ClientHeight = 129
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbHmacSha1: TLabel
    Left = 43
    Top = 8
    Width = 112
    Height = 13
    Caption = 'HMAC-SHA1 > Base64:'
    OnDblClick = lbHmacSha1DblClick
  end
  object lbText: TLabel
    Left = 14
    Top = 31
    Width = 26
    Height = 13
    Caption = 'Text:'
  end
  object lbKey: TLabel
    Left = 18
    Top = 54
    Width = 22
    Height = 13
    Caption = 'Key:'
  end
  object lbResult: TLabel
    Left = 6
    Top = 104
    Width = 34
    Height = 13
    Caption = 'Result:'
  end
  object edtText: TEdit
    Left = 43
    Top = 27
    Width = 597
    Height = 21
    TabOrder = 0
  end
  object edtKey: TEdit
    Left = 43
    Top = 50
    Width = 597
    Height = 21
    TabOrder = 1
  end
  object btnConverter01: TBitBtn
    Left = 147
    Top = 73
    Width = 100
    Height = 25
    Caption = 'Indy'
    TabOrder = 3
    OnClick = btnConverter01Click
  end
  object edtResultado: TEdit
    Left = 43
    Top = 101
    Width = 597
    Height = 21
    TabOrder = 6
  end
  object btnConverter02: TBitBtn
    Left = 251
    Top = 73
    Width = 100
    Height = 25
    Caption = 'Synacode'
    TabOrder = 4
    OnClick = btnConverter02Click
  end
  object btnLimpar: TBitBtn
    Left = 43
    Top = 73
    Width = 100
    Height = 25
    Caption = 'Limpar'
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object btnConverter03: TBitBtn
    Left = 355
    Top = 73
    Width = 100
    Height = 25
    Caption = 'Secure Black Box'
    TabOrder = 5
    OnClick = btnConverter03Click
  end
end
