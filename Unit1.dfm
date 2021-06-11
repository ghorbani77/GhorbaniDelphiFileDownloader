object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ghorbani File Downloader'
  ClientHeight = 215
  ClientWidth = 635
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
  object Label1: TLabel
    Left = 20
    Top = 27
    Width = 82
    Height = 13
    Caption = 'File to download:'
  end
  object Label2: TLabel
    Left = 60
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Progress:'
  end
  object Label3: TLabel
    Left = 116
    Top = 88
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 24
    Top = 155
    Width = 112
    Height = 13
    Caption = 'Ghorbani77@gmail.com'
  end
  object Label5: TLabel
    Left = 44
    Top = 174
    Width = 92
    Height = 13
    Caption = '+98-919-143-7539'
  end
  object Edit1: TEdit
    Left = 116
    Top = 24
    Width = 417
    Height = 21
    TabOrder = 0
    Text = 'http://www.'
  end
  object ProgressBar1: TProgressBar
    Left = 116
    Top = 56
    Width = 417
    Height = 17
    TabOrder = 1
  end
  object Button1: TButton
    Left = 458
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Download'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 552
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = Button2Click
  end
  object SaveDialog1: TSaveDialog
    Left = 20
    Top = 88
  end
  object IdHTTP1: TIdHTTP
    OnWork = IdHTTP1Work
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 68
    Top = 88
  end
end
