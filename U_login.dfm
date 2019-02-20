object IW_login: TIW_login
  Left = 0
  Top = 0
  Width = 330
  Height = 500
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  PreHeader.Strings = (
    
      '<meta name="viewport" content="width=device-width, initial-scale' +
      '=1.0, maximum-scale=1.0, user-scalable=0">'
    '<script>'
    'var x=document.getElementById("demo");'
    ' function getLocation()'
    ' {'
    '     if (navigator.geolocation)'
    '     {'
    '         navigator.geolocation.getCurrentPosition(showPosition);'
    '     }'
    '     else'
    '     {'
    '         x.innerHTML="'#35813#27983#35272#22120#19981#25903#25345#33719#21462#22320#29702#20301#32622#12290'";'
    '     }'
    ' }'
    ''
    'function showPosition(position)'
    ' {'
    
      '    // alert("'#32428#24230': " + position.coords.latitude +  "<br>'#32463#24230': " + p' +
      'osition.coords.longitude); '
    'IWLBL4.value = position.coords.latitude;'
    'IWDT3IWCL.value = position.coords.longitude;'
    'IWDT4IWCL.value = position.coords.latitude;'
    ' IWLBL4IWCL.value ='#39#32463#24230#65306#39'+position.coords.longitude;'
    ' IWLBL5IWCL.value ='#39#32428#24230#65306#39'+position.coords.latitude; '
    ' } '
    '</script>')
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwrgn4: TIWRegion
    Left = 0
    Top = 441
    Width = 330
    Height = 60
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clMoneyGreen
    object iwlbl3: TIWLabel
      Left = 25
      Top = 6
      Width = 91
      Height = 16
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      HasTabOrder = False
      FriendlyName = 'iwlbl3'
      Caption = '   2017-8-15   '
    end
  end
  object iwrgn1: TIWRegion
    Left = 0
    Top = 60
    Width = 330
    Height = 381
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    object iwdt1: TIWEdit
      Left = 80
      Top = 56
      Width = 121
      Height = 21
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwdt1'
      SubmitOnAsyncEvent = True
      TabOrder = 0
    end
    object iwdt2: TIWEdit
      Left = 80
      Top = 104
      Width = 121
      Height = 21
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwdt2'
      SubmitOnAsyncEvent = True
      TabOrder = 1
    end
    object iwbtn1: TIWButton
      Left = 80
      Top = 152
      Width = 75
      Height = 25
      Caption = #30331#24405
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwbtn1'
      TabOrder = 2
      OnClick = iwbtn1Click
    end
    object iwlbl1: TIWLabel
      Left = 27
      Top = 56
      Width = 49
      Height = 16
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      HasTabOrder = False
      FriendlyName = 'iwlbl1'
      Caption = #29992#25143#21517
    end
    object iwlbl2: TIWLabel
      Left = 27
      Top = 104
      Width = 33
      Height = 16
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      HasTabOrder = False
      FriendlyName = 'iwlbl2'
      Caption = #23494#30721
    end
    object iwbtnreg: TIWButton
      Left = 161
      Top = 152
      Width = 75
      Height = 25
      Caption = #27880#20876
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'iwbtnreg'
      TabOrder = 3
      OnClick = iwbtnregClick
    end
  end
  object iwrgn3: TIWRegion
    Left = 0
    Top = 0
    Width = 330
    Height = 60
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clMoneyGreen
  end
end
