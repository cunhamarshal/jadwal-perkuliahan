object DMIjadl: TDMIjadl
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 246
  Width = 232
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Jadwa' +
      'l_Perkuliahan'
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_ijadwal')
    Left = 88
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 160
    Top = 8
  end
end
