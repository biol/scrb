object dbScrb: TdbScrb
  OldCreateOrder = False
  Height = 321
  Width = 572
  object cnx: TFDConnection
    Params.Strings = (
      'Database=C:\gdb\SCRB.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = cnxBeforeConnect
    Left = 320
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 104
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 400
    Top = 152
  end
  object qryLastScribaOfBar: TFDQuery
    Connection = cnx
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
    Connection = cnx
    SQL.Strings = (
      'insert into "SCRIBA"'
      '('
      '  "ID"'
      ', "BAR_ID"'
      ', "JOB_ID"'
      ', "RECIPE_ID"'
      ', "POSITION_ID"'
      ', "DROP_TIME"'
      ', "PICKUP_TIME"'
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
      ', :"PICKUP_TIME"'
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
      end>
  end
  object qryUpdateScriba: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'update "SCRIBA"'
      'set'
      ', "BAR_ID" = :"BAR_ID"'
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
end
