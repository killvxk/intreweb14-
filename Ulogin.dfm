object IWFormlogin: TIWFormlogin
  Left = 0
  Top = 0
  Width = 900
  Height = 400
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = iwtmpltprcsrhtml1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwrgn1: TIWRegion
    Left = 90
    Top = 136
    Width = 631
    Height = 261
    RenderInvisibleControls = False
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clWebAQUA
    object IWEdit1: TIWEdit
      Left = 120
      Top = 24
      Width = 441
      Height = 57
      Css = 'class'
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'IWEdit1'
      SubmitOnAsyncEvent = True
      TabOrder = 0
      Text = 'IWEdit1'#27993#27743#29233#20320#20010#20154#27665' '#22763#22823#22827#38463#26031#39039#39134#31532#19977#26041
    end
    object IWListbox1: TIWListbox
      Left = 48
      Top = 111
      Width = 465
      Height = 121
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      TabOrder = 1
      FriendlyName = 'IWListbox1'
      NoSelectionText = '-- No Selection --'
    end
    object iwbtn1: TIWButton
      Left = 24
      Top = 24
      Width = 75
      Height = 25
      Caption = 'iwbtn1'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwbtn1'
      TabOrder = 2
      OnClick = iwbtn1Click
    end
    object iwbtn2: TIWButton
      Left = 24
      Top = 64
      Width = 75
      Height = 25
      Caption = 'iwbtn2'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwbtn2'
      TabOrder = 3
    end
  end
  inline iwfrm1: TIWFrame
    Left = 56
    Top = 40
    Width = 900
    Height = 66
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 56
    ExplicitTop = 40
    ExplicitWidth = 900
    ExplicitHeight = 66
    inherited IWFrameRegion: TIWRegion
      Width = 900
      TabOrder = 4
      ExplicitWidth = 900
    end
  end
  object iwtmpltprcsrhtml1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Left = 40
    Top = 328
  end
end
