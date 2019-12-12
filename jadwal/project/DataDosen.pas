unit DataDosen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, OleCtrls, Crystal_TLB,
  Buttons, jpeg;

type
  TForm4 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    CrystalReport1: TCrystalReport;
    Timer1: TTimer;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    Edit4: TEdit;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Kode: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bersih;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses MasterData, DMDosen;

{$R *.dfm}

procedure TForm4.SpeedButton5Click(Sender: TObject);
begin
form4.Hide;
form3.show;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
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

begin
with DMDos.ADOQuery1 do
begin
close;
SQL.Text:='INSERT INTO tb_dosen (nip, nama, program_studi) VALUES ("'+Edit1.Text+'","'+Edit2.Text+'","'+combobox1.Text+'")';
ExecSQL;
SQL.Text:='SELECT * FROM tb_dosen';
Open;
      MessageDlg('Data Berhasil di Tambah !',mtInformation,[mbok],0);
      bersih;

end;
end;

end;

procedure TForm4.bersih;
begin
edit1.Clear;
edit2.Clear;
combobox1.Text:='pilih';
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
with DMDos.ADOQuery1 do
begin
sql.Clear;
SQL.Text:='update tb_dosen set nama='''+Edit2.Text+''',program_studi='''+combobox1.Text+''' where nip='''+edit1.Text+'''';
ExecSQL;
end;
FormActivate(sender);
MessageDlg('Data Berhasil di Ubah !',mtInformation,[mbok],0);
bersih;

end;

procedure TForm4.FormActivate(Sender: TObject);
begin
with DMDos.ADOQuery1 do
begin
Active :=false;
sql.Clear;
sql.add('select * from tb_dosen order by nip asc');
Active:=true;
end;

end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
with DMDos.ADOQuery1 do
begin
  edit1.Text:=FieldbyName('nip').AsString;
  edit2.Text:=FieldByName('nama').AsString;
  combobox1.Text:=FieldByName('program_studi').AsString;
end;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
with DMDos.ADOQuery1 do
begin
if mrYes=MessageDlg('Anda Yaking Ingin Menghapus?',mtwarning,[mbYes, mbNo],0) then
close;
SQL.Clear;
    SQL.text:=('delete from tb_dosen where nip='''+edit1.Text+'''');
    ExecSQL;
    SQL.Text:='SELECT * FROM tb_dosen';
    Open;
MessageDlg('Data Berhasil di Hapus !',mtInformation,[mbok],0);
bersih;
end;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
begin
with DMDos.ADOQuery1 do
begin
CrystalReport1.ReportFileName:= '../laporan/laporan_dosen.rpt';
CrystalReport1.Action:=1;
end;
end;

procedure TForm4.Edit4Change(Sender: TObject);
begin
if RadioButton1.Checked then
begin
with DMDos.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_dosen');
SQL.Add('where nama like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton2.Checked then
begin
with DMDos.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_dosen');
SQL.Add('where program_studi like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end;

end;

end.
