unit DMJam;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMjm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMjm: TDMjm;

implementation

{$R *.dfm}

end.
