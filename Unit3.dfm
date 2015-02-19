object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #40594#40607#39564#35777#31243#24207
  ClientHeight = 299
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 99
    Width = 153
    Height = 57
    AutoSize = False
    Caption = #36755#20837#23562#36149'VIP '#36523#20221#39564#35777#30721':'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #26426#22120#30721':'
  end
  object Memo1: TMemo
    Left = 192
    Top = 96
    Width = 457
    Height = 153
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    OnMouseDown = Memo1MouseDown
  end
  object Button1: TButton
    Left = 40
    Top = 176
    Width = 121
    Height = 49
    Caption = #39564#35777
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 192
    Top = 48
    Width = 457
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 2
    Text = 'Edit1'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 258
    Width = 717
    Height = 41
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 544
    Top = 328
  end
end
