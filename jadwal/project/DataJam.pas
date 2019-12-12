unit DataJam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, OleCtrls, Crystal_TLB,
  Buttons;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    CrystalReport1: TCrystalReport;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    Edit4: TEdit;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Kode: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    DBGrid1: TDBGrid;
    procedure SpeedButton2Click(Sender: TObject);
    procedure bersih;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses DMJam, MasterData;

{$R *.dfm}

procedure TForm6.bersih;
begin
edit1.Clear;
combobox1.Text:='pilih';
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
if edit1.text = '' then
begin
  showmessage('Harus Di Isi');
  edit1.setfocus;
end else
if combobox1.text = '' then
begin
  showmessage('Harus Di Isi');
  combobox1.setfocus;
end else

begin
with DMjm.ADOQuery1 do
begin
close;
SQL.Text:='INSERT INTO jam (jam, kelas) VALUES ("'+Edit1.Text+'","'+combobox1.Text+'")';
ExecSQL;
SQL.Text:='SELECT * FROM jam';
Open;
MessageDlg('Data Berhasil di Tambah !',mtInformation,[mbok],0);
bersih;
end;
end;

end;

procedure TForm6.FormActivate(Sender: TObject);
begin
with DMjm.ADOQuery1 do
begin
Active :=false;
sql.Clear;
sql.add('select * from jam order by jam asc');
Active:=true;
end;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
with DMjm.ADOQuery1 do
begin
  edit1.Text:=FieldbyName('jam').AsString;
  combobox1.Text:=FieldByName('kelas').AsString;
end;
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
with DMjm.ADOQuery1 do
begin
sql.Clear;
SQL.Text:='update jam set jam='''+Edit1.Text+''',kelas='''+combobox1.Text+''' where jam='''+edit1.Text+'''';
ExecSQL;
end;
FormActivate(sender);
MessageDlg('Data Berhasil di Ubah !',mtInformation,[mbok],0);
bersih;

end;

procedure TForm6.SpeedButton4Click(Sender: TObject);
begin
with DMjm.ADOQuery1 do
begin
if mrYes=MessageDlg('Anda Yaking Ingin Menghapus?',mtwarning,[mbYes, mbNo],0) then
close;
SQL.Clear;
    SQL.text:=('delete from jam where jam='''+edit1.text+'''');
    ExecSQL;
    SQL.Text:='SELECT * FROM jam';
    Open;
MessageDlg('Data Berhasil di Hapus !',mtInformation,[mbok],0);
bersih;
end;

end;

procedure TForm6.Edit4Change(Sender: TObject);
begin
if RadioButton1.Checked then
begin
with DMjm.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from jam');
SQL.Add('where jam like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end
else if RadioButton2.Checked then
begin
with DMjm.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from jam');
SQL.Add('where kelas like''%'+edit4.text+'%''');
ExecSQL;
Open;
end;
end;

end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
form6.Hide;
form3.show;
end;

end.
