unit DMmk;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMMkuliah = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMkuliah: TDMMkuliah;

implementation

{$R *.dfm}

end.
