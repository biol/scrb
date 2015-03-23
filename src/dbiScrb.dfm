object dbScrb: TdbScrb
  OldCreateOrder = False
  Height = 321
  Width = 572
  object cnxScriba: TFDConnection
    Params.Strings = (
      'Database=C:\gdb\SCRB.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = cnxScribaBeforeConnect
    Left = 152
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 304
    Top = 32
  end
  object qryLastScribaOfBar: TFDQuery
    Connection = cnxScriba
    SQL.Strings = (
      'select first 1 * from SCRIBA'
      'where BAR_ID = :BAR_ID'
      'order by ID desc')
    Left = 224
    Top = 152
    ParamData = <
      item
        Name = 'BAR_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 123
      end>
  end
  object qryInsertScriba: TFDQuery
    Connection = cnxScriba
    SQL.Strings = (
      'insert into "SCRIBA"'
      '('
      '  "ID"'
      ', "BAR_ID"'
      ', "JOB_ID"'
      ', "RECIPE_ID"'
      ', "POSITION_ID"'
      ', "DROP_TIME"'
      ', "RECIPE_SECS"'
      ', "TANK_SECS"'
      ', "FLAGS"'
      ')'
      'values'
      '('
      '  :"ID"'
      ', :"BAR_ID"'
      ', :"JOB_ID"'
      ', :"RECIPE_ID"'
      ', :"POSITION_ID"'
      ', :"DROP_TIME"'
      ', :"RECIPE_SECS"'
      ', :"TANK_SECS"'
      ', :"FLAGS"'
      ')')
    Left = 224
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAR_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'JOB_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECIPE_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POSITION_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DROP_TIME'
        IsCaseSensitive = True
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECIPE_SECS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TANK_SECS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FLAGS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryUpdateScriba: TFDQuery
    Connection = cnxScriba
    SQL.Strings = (
      'update "SCRIBA"'
      'set'
      '  "BAR_ID" = :"BAR_ID"'
      ', "JOB_ID" = :"JOB_ID"'
      ', "RECIPE_ID" = :"RECIPE_ID"'
      ', "POSITION_ID" = :"POSITION_ID"'
      ', "DROP_TIME" = :"DROP_TIME"'
      ', "PICKUP_TIME" = :"PICKUP_TIME"'
      ', "RECIPE_SECS" = :"RECIPE_SECS"'
      ', "TANK_SECS" = :"TANK_SECS"'
      ', "FLAGS" = :"FLAGS"'
      'where'
      '  "ID" = :"ID"')
    Left = 224
    Top = 200
    ParamData = <
      item
        Name = 'BAR_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'JOB_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECIPE_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POSITION_ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DROP_TIME'
        IsCaseSensitive = True
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PICKUP_TIME'
        IsCaseSensitive = True
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECIPE_SECS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TANK_SECS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FLAGS'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrySelectScribaByDropTime: TFDQuery
    Connection = cnxScriba
    SQL.Strings = (
      'select * from SCRIBA'
      'where (DROP_TIME >= :FROM_DROP_TIME)'
      'and   (DROP_TIME <  :TO_DROP_TIME)'
      'order by ID')
    Left = 96
    Top = 104
    ParamData = <
      item
        Name = 'FROM_DROP_TIME'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42086.75d
      end
      item
        Name = 'TO_DROP_TIME'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42086.8125d
      end>
  end
  object cnxLOG: TFDConnection
    Params.Strings = (
      'Database=C:\gdb\GrupaKety_LOG.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = cnxLOGBeforeConnect
    Left = 456
    Top = 32
  end
  object qryLastJobOfBar: TFDQuery
    Connection = cnxLOG
    SQL.Strings = (
      'select first 1 * from LOGJOB1'
      'where IDBARRA= :BAR_ID'
      'order by IDJOB desc')
    Left = 456
    Top = 96
    ParamData = <
      item
        Name = 'BAR_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 123
      end>
  end
end
