unit DMLogin;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDML = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DML: TDML;

implementation

{$R *.dfm}

end.
