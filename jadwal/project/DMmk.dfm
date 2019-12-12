object DMMkuliah: TDMMkuliah
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 150
  Width = 215
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Jadwa' +
      'l_Perkuliahan'
    LoginPrompt = False
    Left = 8
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_mk')
    Left = 64
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 128
    Top = 8
  end
end
