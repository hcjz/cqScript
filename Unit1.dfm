object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Form1'
  ClientHeight = 404
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 232
    Top = 24
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 464
    Top = 24
    Width = 34
    Height = 15
    Caption = 'Label3'
  end
  object Image1: TImage
    Left = 24
    Top = 247
    Width = 100
    Height = 100
  end
  object Button1: TButton
    Left = 200
    Top = 336
    Width = 201
    Height = 73
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 368
    Top = 112
    Width = 185
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 24
    Top = 120
    Width = 185
    Height = 89
    Caption = 'Panel1'
    TabOrder = 2
  end
    object Panel2: TCaptionBar
    Left = 24
    Top = 120
    Width = 185
    Height = 89
  end
end