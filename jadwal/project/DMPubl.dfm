object DMPublish: TDMPublish
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 167
  Width = 215
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Jadwa' +
      'l_Perkuliahan'
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_ijadwal')
    Left = 104
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
    Top = 64
  end
  object VirtualTable1: TVirtualTable
    Left = 112
    Top = 72
    Data = {03000000000000000000}
  end
end
