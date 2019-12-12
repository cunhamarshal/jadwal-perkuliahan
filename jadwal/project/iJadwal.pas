unit iJadwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Buttons, StdCtrls, jpeg, DBCtrls;

type
  TForm7 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Label2: TLabel;
    Edit4: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure ComboBox4Select(Sender: TObject);
    procedure ComboBox3Select(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bersih;
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses DMmk, DMiJadwal, DMJam, DMDosen, MasterData, halaman_utama;

{$R *.dfm}

procedure TForm7.FormActivate(Sender: TObject);
begin
  DMMkuliah.ADOQuery1.First;
  while not DMMkuliah.ADOQuery1.Eof do
  begin
  combobox2.Items.Add(DMMkuliah.ADOQuery1['kode_mk']);
  DMMkuliah.ADOQuery1.Next;
  end;
  DMjm.ADOQuery1.First;
  while not DMjm.ADOQuery1.Eof do
  begin
  combobox3.Items.Add(DMjm.ADOQuery1['jam']);
  DMjm.ADOQuery1.Next;
  end;
  DMDos.ADOQuery1.First;
  while not DMDos.ADOQuery1.Eof do
  begin
  combobox4.Items.Add(DMDos.ADOQuery1['nip']);
  DMDos.ADOQuery1.Next;
  end;
end;

procedure TForm7.ComboBox2Select(Sender: TObject);
begin
with DMMkuliah.ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from tb_mk where kode_mk='''+combobox2.Text+'''');
DMMkuliah.ADOQuery1.Open;
edit2.Text:=DMMkuliah.ADOQuery1['nama'];
edit9.Text:=DMMkuliah.ADOQuery1['sks'];
edit10.Text:=DMMkuliah.ADOQuery1['semester'];
end;
end;

procedure TForm7.ComboBox4Select(Sender: TObject);
begin
with DMDos.ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from tb_dosen where nip='''+combobox4.Text+'''');
DMDos.ADOQuery1.Open;
edit6.Text:=DMDos.ADOQuery1['nama'];
edit7.Text:=DMDos.ADOQuery1['program_studi'];
end;
end;

procedure TForm7.ComboBox3Select(Sender: TObject);
begin
with DMjm.ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from jam where jam='''+combobox3.Text+'''');
DMjm.ADOQuery1.Open;
edit3.Text:=DMjm.ADOQuery1['kelas'];
end;
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
form7.Hide;
form2.show;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Text:='INSERT INTO tb_ijadwal (id_ijadwal, hari, jam, kelas, kode_mk, nama, sks, semester, nip, dosen, program_studi) VALUES ("'+edit4.Text+'", "'+combobox1.Text+'","'+combobox3.Text+'","'+edit3.Text+'","'+combobox2.Text+'","'+edit2.Text+'","'+edit9.Text+'","'+edit10.Text+'","'+combobox4.Text+'","'+edit6.Text+'","'+edit7.Text+'")';
ExecSQL;
SQL.Text:='SELECT * FROM tb_ijadwal';
Open;
      MessageDlg('Data Berhasil di Tambah !',mtInformation,[mbok],0);
      bersih;

end;
end;

procedure TForm7.bersih;
begin
edit4.text:='';
combobox1.Text:='input hari';
combobox3.Text:='pilih jam';
edit3.Text:='';
combobox2.Text:='pilih kode MK';
edit2.Text:='';
edit9.Text:='';
edit10.Text:='';
combobox4.Text:='pilih nip';
edit6.Text:='';
edit7.Text:='';
end;


procedure TForm7.SpeedButton3Click(Sender: TObject);
begin
with DMIjadl.ADOQuery1 do
begin
if mrYes=MessageDlg('Anda Yaking Ingin Menghapus?',mtwarning,[mbYes, mbNo],0) then
close;
SQL.Clear;
    SQL.text:=('delete from tb_ijadwal where id_ijadwal='''+edit4.text+'''');
    ExecSQL;
    SQL.Text:='SELECT * FROM tb_ijadwal';
    Open;
MessageDlg('Data Berhasil di Hapus !',mtInformation,[mbok],0);
bersih;
end;
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
with DMIjadl.ADOQuery1 do
begin
  edit4.text:=fieldbyName('id_ijadwal').AsString;
  combobox1.Text:=FieldbyName('hari').AsString;
  combobox3.Text:=FieldByName('jam').AsString;
  edit3.Text:=FieldByName('kelas').AsString;
  combobox2.Text:=FieldbyName('kode_mk').AsString;
  edit2.Text:=FieldByName('nama').AsString;
  edit9.Text:=FieldByName('sks').AsString;
  edit10.Text:=FieldbyName('semester').AsString;
  combobox4.Text:=FieldByName('nip').AsString;
  edit6.Text:=FieldByName('dosen').AsString;
  edit7.Text:=FieldbyName('program_studi').AsString;
end;
end;

procedure TForm7.Edit1Change(Sender: TObject);
begin
if RadioButton1.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where hari like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton2.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where jam like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end;
if RadioButton5.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where kelas like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton6.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where kode_mk like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end;
if RadioButton7.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where nama like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton3.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where sks like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end;
if RadioButton4.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where semester like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton8.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where nip like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end;
if RadioButton9.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where dosen like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton10.Checked then
begin
with DMIjadl.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where program_studi like''%'+edit1.text+'%''');
ExecSQL;
Open;
end;
end;

end;

end.
