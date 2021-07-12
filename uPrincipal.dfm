object frmPrincipal: TfrmPrincipal
  Left = 10
  Top = 10
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exerc'#237'cio - Complexo 3 - Rafael R.'
  ClientHeight = 571
  ClientWidth = 494
  Color = 14143423
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object memo_log: TMemo
    Left = 16
    Top = 300
    Width = 460
    Height = 255
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btn_CriarObjComponentes: TButton
    Left = 24
    Top = 48
    Width = 185
    Height = 41
    Caption = 'Criar os objetos dos Componentes'
    TabOrder = 1
    OnClick = btn_CriarObjComponentesClick
  end
  object btn_LimparObjComponentes: TButton
    Left = 256
    Top = 48
    Width = 185
    Height = 41
    Caption = 'Limpar os objetos dos Componentes'
    TabOrder = 2
    OnClick = btn_LimparObjComponentesClick
  end
  object Button1: TButton
    Left = 144
    Top = 129
    Width = 162
    Height = 41
    Hint = 
      'Esses percentuais s'#227'o em rela'#231#227'o aos valores do Frame  quando cr' +
      'iado apenas.'
    Caption = 'Redimensiona Frame             (alt: 650(8%) | lar: 800(60%)'
    TabOrder = 3
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 224
    Width = 162
    Height = 41
    Caption = ' Redimensiona Frame            (alt: +100 | lar: +100)'
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 224
    Width = 162
    Height = 41
    Caption = ' Redimensiona Frame             (alt: -100 | lar: -100)'
    TabOrder = 5
    WordWrap = True
    OnClick = Button3Click
  end
end
