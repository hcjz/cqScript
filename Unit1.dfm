object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnMouseMove = OnMouseMove
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
    Left = 25
    Top = 121
    Width = 100
    Height = 100
    Center = True
    Stretch = True
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
    Top = 121
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object CaptionBar1: TCaptionBar
    Left = 24
    Top = 120
    Width = 1
    Height = 101
    Caption = ''
  end
  object CaptionBar2: TCaptionBar
    Left = 24
    Top = 120
    Width = 101
    Height = 1
    Caption = ''
  end
  object CaptionBar3: TCaptionBar
    Left = 125
    Top = 120
    Width = 1
    Height = 101
    Caption = ''
  end
  object CaptionBar4: TCaptionBar
    Left = 24
    Top = 221
    Width = 101
    Height = 1
    Caption = ''
  end
  object Panel1: TPanel
    Left = 132
    Top = 208
    Width = 233
    Height = 97
    Caption = 'Panel1'
    TabOrder = 6
    object Image2: TImage
      Left = 160
      Top = 8
      Width = 57
      Height = 73
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 552
    Top = 368
  end
end
