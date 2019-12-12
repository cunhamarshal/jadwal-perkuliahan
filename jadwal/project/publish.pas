unit publish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Grids, DBGrids;

type
  TForm8 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure bersih;
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses DMmk, DMPubl, DMDosen;

{$R *.dfm}

procedure TForm8.FormActivate(Sender: TObject);
begin
with DMPublish.ADOQuery1 do
begin
Active :=false;
sql.Clear;
sql.add('select * from tb_ijadwal order by id_ijadwal asc');
Active:=true;
end;
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
begin
with DMPublish.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where id_ijadwal like''%'+combobox1.text+'%''');
ExecSQL;
Open;
end;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
with DMPublish.ADOQuery1 do
begin
  label2.Caption:=FieldbyName('id_ijadwal').AsString;
  edit1.Text:=FieldbyName('ket').AsString;
end;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
with DMPublish.ADOQuery1 do
begin
sql.Clear;
SQL.Text:='update tb_ijadwal set ket='''+edit1.Text+''' where id_ijadwal='''+label2.caption+'''';
ExecSQL;
end;
FormActivate(sender);
MessageDlg('Data Berhasil di Ubah !',mtInformation,[mbok],0);
bersih;
end;

procedure TForm8.bersih;
begin
edit1.Text:='';
end;

procedure TForm8.FormShow(Sender: TObject);
begin
DMPublish.ADOQuery1.First;
  while not DMPublish.ADOQuery1.Eof do
  begin
  combobox1.Items.Add(DMPublish.ADOQuery1['id_ijadwal']);
  DMPublish.ADOQuery1.Next;
  end;
  DMPublish.ADOQuery1.First;
  while not DMPublish.ADOQuery1.Eof do
  begin
  combobox2.Items.Add(DMPublish.ADOQuery1['jam']);
  DMPublish.ADOQuery1.Next;
  end;
  DMPublish.ADOQuery1.First;
  while not DMPublish.ADOQuery1.Eof do
  begin
  combobox3.Items.Add(DMPublish.ADOQuery1['semester']);
  DMPublish.ADOQuery1.Next;
  end;
end;

procedure TForm8.ComboBox2Change(Sender: TObject);
begin
with DMPublish.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where jam like''%'+combobox2.text+'%''');
ExecSQL;
Open;
end;
end;

procedure TForm8.ComboBox3Change(Sender: TObject);
begin
with DMPublish.ADOQuery1 do
begin
close;
SQL.Clear;
SQL.Add('select * from tb_ijadwal');
SQL.Add('where semester like''%'+combobox3.text+'%''');
ExecSQL;
Open;
end;
end;

end.
