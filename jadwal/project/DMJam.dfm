object DMjm: TDMjm
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
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from jam')
    Left = 40
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 104
    Top = 32
  end
end
