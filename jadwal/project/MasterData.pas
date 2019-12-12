unit MasterData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, jpeg;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Timer1: TTimer;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses halaman_utama, DataDosen, DataMK, DataJam;

{$R *.dfm}

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
form3.Hide;
form2.show;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
form3.hide;
form4.show;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
form3.Hide;
form5.show;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
form3.Hide;
form6.show;
end;

end.
