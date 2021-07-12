object dtModule: TdtModule
  OldCreateOrder = False
  Height = 337
  Width = 446
  object FDMySQLDriver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 328
    Top = 240
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=db_devdelphi'
      'User_Name=root'
      'Password=master'
      'UseSSL=True'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 176
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 200
    Top = 224
  end
  object qryBusca: TFDQuery
    Connection = FDConnection
    Left = 176
    Top = 160
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection
    Left = 264
    Top = 64
  end
  object dtsBusca: TDataSource
    DataSet = qryBusca
    Left = 248
    Top = 160
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection
    Left = 312
    Top = 136
  end
end
