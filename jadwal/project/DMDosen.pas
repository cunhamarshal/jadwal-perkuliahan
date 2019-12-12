unit DMDosen;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMDos = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDos: TDMDos;

implementation

{$R *.dfm}

end.
