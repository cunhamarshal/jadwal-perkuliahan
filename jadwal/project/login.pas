unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TForm1 = class(TForm)
    Image2: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bersihkan_lgn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DMLogin, halaman_utama;

{$R *.dfm}

procedure TForm1.bersihkan_lgn;
begin
edit1.Clear;
edit2.clear;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  with DML.ADOQuery1 do begin
  close;
  SQL.clear;
  SQL.Add('select * from tb_login where username='+QuotedStr(Edit1.Text));
  open;
end;
  if DML.ADOQuery1.RecordCount=0 then
  application.MessageBox('Maaf, Username Tersebut Tidak Tersedia!','Informasi',MB_OK or MB_ICONINFORMATION)
  else begin
  if DML.ADOQuery1.FieldByName('password').AsString<>Edit2.text then
  application.MessageBox('Pastikan Password dan Username anda Benar!','error', MB_OK or MB_ICONERROR)
  else begin
  form1.Hide;
  form2.show;
  bersihkan_lgn
  end;
  end;
end;

end.
