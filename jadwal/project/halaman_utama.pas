unit halaman_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Menus, jpeg;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    keluar1: TMenuItem;
    Jadwal1: TMenuItem;
    Publish1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    keluar2: TMenuItem;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses MasterData, iJadwal, publish;

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
form2.Hide;
form3.show;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
form2.Hide;
form7.show;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
form2.Hide;
form8.show;
end;

end.
