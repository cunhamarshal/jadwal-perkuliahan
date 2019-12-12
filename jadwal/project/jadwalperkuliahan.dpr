program jadwalperkuliahan;

uses
  Forms,
  login in 'login.pas' {Form1},
  DMLogin in 'DMLogin.pas' {DML: TDataModule},
  halaman_utama in 'halaman_utama.pas' {Form2},
  MasterData in 'MasterData.pas' {Form3},
  DataDosen in 'DataDosen.pas' {Form4},
  DMDosen in 'DMDosen.pas' {DMDos: TDataModule},
  DataMK in 'DataMK.pas' {Form5},
  DMmk in 'DMmk.pas' {DMMkuliah: TDataModule},
  DataJam in 'DataJam.pas' {Form6},
  DMJam in 'DMJam.pas' {DMjm: TDataModule},
  iJadwal in 'iJadwal.pas' {Form7},
  DMiJadwal in 'DMiJadwal.pas' {DMIjadl: TDataModule},
  publish in 'publish.pas' {Form8},
  DMPubl in 'DMPubl.pas' {DMPublish: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDML, DML);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TDMDos, DMDos);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TDMMkuliah, DMMkuliah);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TDMjm, DMjm);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TDMIjadl, DMIjadl);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TDMPublish, DMPublish);
  Application.Run;
end.
