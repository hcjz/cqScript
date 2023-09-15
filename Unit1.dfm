object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #21462#33394#22120
  ClientHeight = 424
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 280
    Top = 64
    Width = 10
    Height = 15
    Caption = 'R:'
  end
  object Label2: TLabel
    Left = 280
    Top = 85
    Width = 11
    Height = 15
    Caption = 'G:'
  end
  object Label3: TLabel
    Left = 281
    Top = 106
    Width = 10
    Height = 15
    Caption = 'B:'
  end
  object Label4: TLabel
    Left = 80
    Top = 257
    Width = 39
    Height = 15
    Caption = #25918#22823#38236
  end
  object Label5: TLabel
    Left = 8
    Top = 280
    Width = 55
    Height = 15
    Caption = #25918#22823#20493#25968':'
  end
  object Label6: TLabel
    Left = 69
    Top = 278
    Width = 12
    Height = 15
    Caption = '10'
  end
  object Label7: TLabel
    Left = 280
    Top = 127
    Width = 25
    Height = 15
    Caption = 'HEX:'
  end
  object Label8: TLabel
    Left = 328
    Top = 64
    Width = 6
    Height = 15
    Caption = '0'
  end
  object Label9: TLabel
    Left = 328
    Top = 86
    Width = 6
    Height = 15
    Caption = '0'
  end
  object Label10: TLabel
    Left = 328
    Top = 107
    Width = 6
    Height = 15
    Caption = '0'
  end
  object Label11: TLabel
    Left = 328
    Top = 127
    Width = 36
    Height = 15
    Caption = 'FFFFFF'
  end
  object Label12: TLabel
    Left = 281
    Top = 148
    Width = 78
    Height = 15
    Caption = #24403#21069#23631#24149#22352#26631
  end
  object Label13: TLabel
    Left = 8
    Top = 312
    Width = 52
    Height = 15
    Caption = #31383#21475#26631#39064
  end
  object memo1: TMemo
    Left = 280
    Top = 173
    Width = 169
    Height = 122
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 49
    Width = 202
    Height = 202
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Image2: TImage
      Left = 1
      Top = 1
      Width = 200
      Height = 200
      Stretch = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 41
    Align = alTop
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 8
      Width = 129
      Height = 22
      Caption = #20851#20110':qq137405188'
    end
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 349
    Width = 145
    Height = 23
    TabOrder = 3
    Text = #32465#23450#31383#21475
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 72
    Top = 304
    Width = 121
    Height = 23
    TabOrder = 4
    Text = #21462#33394#22120
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 352
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 552
    Top = 368
  end
end
