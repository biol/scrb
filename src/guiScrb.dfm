object FormScrb: TFormScrb
  Left = 0
  Top = 0
  Caption = 'FormScrb'
  ClientHeight = 345
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 41
    Align = alTop
    TabOrder = 0
    OnDblClick = pnlHeadDblClick
    DesignSize = (
      478
      41)
    object lblRel: TLabel
      Left = 416
      Top = 14
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'lblRel'
    end
    object lblStep: TLabel
      Left = 462
      Top = 14
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '*'
    end
    object cbStep: TCheckBox
      Left = 8
      Top = 10
      Width = 49
      Height = 17
      Caption = 'Step'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  object tmrStep: TTimer
    OnTimer = tmrStepTimer
    Left = 432
    Top = 56
  end
end
