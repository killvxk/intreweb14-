object IWUserSession: TIWUserSession
  OldCreateOrder = False
  OnCreate = IWUserSessionBaseCreate
  Height = 424
  Width = 623
  object con1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'sxp20190125'
    Username = 'mysql'
    Server = '172.29.176.200'
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 64
    EncryptedPassword = '8FFF9EFF8CFF8CFF88FF90FF8DFF9BFF'
  end
  object unqry1: TUniQuery
    Connection = con1
    SQL.Strings = (
      'select * from zhoubao order by id desc')
    Active = True
    Left = 112
    Top = 64
  end
  object mysqlnprvdr1: TMySQLUniProvider
    Left = 240
    Top = 64
  end
  object ds1: TUniDataSource
    DataSet = unqry1
    Left = 176
    Top = 72
  end
  object qryPosition: TUniQuery
    Connection = con1
    SQL.Strings = (
      'select * from zhoubao')
    Active = True
    Left = 112
    Top = 112
  end
end
