object FormScrb: TFormScrb
  Left = 0
  Top = 0
  Caption = 'FormScrb'
  ClientHeight = 457
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 41
    Align = alTop
    TabOrder = 0
    OnDblClick = pnlHeadDblClick
    ExplicitTop = -6
    DesignSize = (
      700
      41)
    object lblRel: TLabel
      Left = 586
      Top = 14
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'lblRel'
    end
    object lblStep: TLabel
      Left = 684
      Top = 14
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '*'
    end
    object cbStep: TCheckBox
      Left = 629
      Top = 12
      Width = 49
      Height = 17
      Caption = 'Step'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 10
      Width = 125
      Height = 25
      DataSource = dsSelectScribaByDropTime
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      TabOrder = 1
    end
    object dtpDateFrom: TDateTimePicker
      Left = 162
      Top = 12
      Width = 76
      Height = 21
      Hint = 'pickup Date From'
      Date = 42086.793398877310000000
      Time = 42086.793398877310000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dtpTimeFrom: TDateTimePicker
      Left = 258
      Top = 12
      Width = 70
      Height = 21
      Hint = 'pickup Time From'
      Date = 42086.793398877310000000
      Time = 42086.793398877310000000
      Kind = dtkTime
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dtpTimeTo: TDateTimePicker
      Left = 332
      Top = 12
      Width = 70
      Height = 21
      Hint = 'pickup Time To'
      Date = 42086.793398877310000000
      Time = 42086.793398877310000000
      Kind = dtkTime
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object btnSelect: TBitBtn
      Left = 412
      Top = 10
      Width = 25
      Height = 25
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnSelectClick
    end
    object btnNow: TBitBtn
      Left = 443
      Top = 10
      Width = 25
      Height = 25
      Caption = 'now'
      NumGlyphs = 2
      TabOrder = 6
      OnClick = btnNowClick
    end
  end
  object dbgScriba: TDBGrid
    Left = 0
    Top = 41
    Width = 700
    Height = 416
    Align = alClient
    DataSource = dsSelectScribaByDropTime
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object tmrStep: TTimer
    OnTimer = tmrStepTimer
    Left = 656
    Top = 48
  end
  object dsSelectScribaByDropTime: TDataSource
    DataSet = dbScrb.qrySelectScribaByDropTime
    Left = 152
    Top = 32
  end
end
