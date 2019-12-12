unit DataMK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, OleCtrls, Crystal_TLB, StdCtrls,
  Buttons, jpeg;

type
  TForm5 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    Edit4: TEdit;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Kode: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Edit1: TEdit;
    Timer1: TTimer;
    CrystalReport1: TCrystalReport;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bersih;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses MasterData, DMmk;

{$R *.dfm}

procedure TForm5.bersih;
begin
edit1.Clear;
edit2.Clear;
combobox1.Text:='pilih';
combobox2.Text:='pilih';
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
form5.Hide;
form3.show;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
if edit1.text = '' then
begin
  showmessage('Harus Di Isi');
  edit1.setfocus;
end else
if edit2.text = '' then
begin
  showmessage('Harus Di Isi');
  edit2.setfocus;
end else
if combobox1.text = '' then
begin
  showmessage('Harus Di Isi');
  combobox1.SetFocus;
  end else
if combobox2.text = '' then
begin
  showmessage('Harus Di Isi');
  combobox2.SetFocus;
  end else

begin
with DMMkuliah.ADOQuery1 do
begin
close;
SQL.Text:='INSERT INTO tb_mk (kode_mk, nama, sks, semester) VALUES ("'+Edit1.Text+'","'+Edit2.Text+'","'+combobox1.Text+'","'+combobox2.Text+'")';
ExecSQL;
SQL.Text:='SELECT * FROM tb_mk';
Open;
MessageDlg('Data Berhasil di Tambah !',mtInformation,[mbok],0);
bersih;
end;
end;

end;

procedure TForm5.FormActivate(Sender: TObject);
begin
with DMMkuliah.ADOQuery1 do
begin
Active :=false;
sql.Clear;
sql.add('select * from tb_mk order by kode_mk asc');
Active:=true;
end;
end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
with DMMkuliah.ADOQuery1 do
begin
  edit1.Text:=FieldbyName('kode_mk').AsString;
  edit2.Text:=FieldByName('nama').AsString;
  combobox1.Text:=FieldByName('sks').AsString;
  combobox2.Text:=FieldByName('semester').AsString;
end;
end;

procedure TForm5.SpeedButton3Click(Sender: TObject);
begin
with DMMkuliah.ADOQuery1 do
begin
sql.Clear;
SQL.Text:='update tb_mk set kode_mk='''+Edit1.Text+''',nama='''+edit2.Text+''',sks='''+combobox1.Text+''',semester='''+combobox2.Text+''' where kode_mk='''+edit1.Text+'''';
ExecSQL;
end;
FormActivate(sender);
MessageDlg('Data Berhasil di Ubah !',mtInformation,[mbok],0);
bersih;

end;

procedure TForm5.SpeedButton4Click(Sender: TObject);
begin
with DMMkuliah.ADOQuery1 do
begin
if mrYes=MessageDlg('Anda Yaking Ingin Menghapus?',mtwarning,[mbYes, mbNo],0) then
close;
SQL.Clear;
    SQL.text:=('delete from tb_mk where kode_mk='''+edit1.Text+'''');
    ExecSQL;
    SQL.Text:='SELECT * FROM tb_mk';
    Open;
MessageDlg('Data Berhasil di Hapus !',mtInformation,[mbok],0);
bersih;
end;
end;

procedure TForm5.Edit4Change(Sender: TObject);
begin
if RadioButton1.Checked then
begin
with DMMkuliah.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_mk');
SQL.Add('where kode_mk like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton2.Checked then
begin
with DMMkuliah.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_mk');
SQL.Add('where nama like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end;

end;

procedure TForm5.SpeedButton5Click(Sender: TObject);
begin
with DMMKuliah.ADOQuery1 do
begin
CrystalReport1.ReportFileName:= '../laporan/laporan_mk.rpt';
CrystalReport1.Action:=1;
end;
end;

end.
