unit DMiJadwal;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMIjadl = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMIjadl: TDMIjadl;

implementation

{$R *.dfm}

end.
