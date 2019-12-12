unit DMPubl;

interface

uses
  SysUtils, Classes, MemDS, VirtualTable, DB, ADODB;

type
  TDMPublish = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    VirtualTable1: TVirtualTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPublish: TDMPublish;

implementation

{$R *.dfm}

end.
