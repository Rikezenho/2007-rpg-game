unit teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Salvar1: TMenuItem;
    Abrir1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Exit1: TMenuItem;
    N1: TMenuItem;
    SpeedButton9: TSpeedButton;
    ClearProject1: TMenuItem;
    iles1: TMenuItem;
    WhiteMarble1: TMenuItem;
    BlackMarble1: TMenuItem;
    Dirt1: TMenuItem;
    WhiteRock1: TMenuItem;
    Grass1: TMenuItem;
    Rock1: TMenuItem;
    NextLine1: TMenuItem;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BlackMarble2: TMenuItem;
    GrayMarble1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure WhiteMarble1Click(Sender: TObject);
    procedure BlackMarble1Click(Sender: TObject);
    procedure Dirt1Click(Sender: TObject);
    procedure WhiteRock1Click(Sender: TObject);
    procedure Grass1Click(Sender: TObject);
    procedure Rock1Click(Sender: TObject);
    procedure NextLine1Click(Sender: TObject);
    procedure ClearProject1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BlackMarble2Click(Sender: TObject);
    procedure GrayMarble1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mapa: string;
  posxatual,posyatual: integer;

implementation

{$R *.dfm}

type
TStrArray = array of string;

function Explode(var a: TStrArray; Border, S: string): Integer;
var
  S2: string;
begin
Result  := 0;
S2 := S + Border;
repeat
SetLength(A, Length(A) + 1);
a[Result] := Copy(S2, 0,Pos(Border, S2) - 1);
Delete(S2, 1,Length(a[Result] + Border));
Inc(Result);
until S2 = '';
end;

function faz(iniciox:integer;inicioy:integer;size:integer):string;
var
a:TStrArray;
tokens,aew,posxatual,posyatual: integer;
b,c,d,e,f,g,h,i: TBitmap;
begin
b:= TBitmap.Create;
b.LoadFromFile('tiles/white.bmp');
c:= TBitmap.Create;
c.LoadFromFile('tiles/blue.bmp');
d:= TBitmap.Create;
d.LoadFromFile('tiles/dirt.bmp');
e:= TBitmap.Create;
e.LoadFromFile('tiles/whiterock.bmp');
f:= TBitmap.Create;
f.LoadFromFile('tiles/grass.bmp');
g:= TBitmap.Create;
g.LoadFromFile('tiles/rock.bmp');
h:= TBitmap.Create;
h.LoadFromFile('tiles/black.bmp');
i:= TBitmap.Create;
i.LoadFromFile('tiles/gray.bmp');
posxatual:= iniciox;
posyatual:= inicioy;
Form1.Image1.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
tokens:= explode(a,',',mapa);
for aew := 0 to tokens -1 do
begin
if(A[aew] = '8')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,i);
posxatual:= posxatual+size;
end;
if(A[aew] = '7')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,h);
posxatual:= posxatual+size;
end;
if(A[aew] = '6')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,g);
posxatual:= posxatual+size;
end;
if(A[aew] = '5')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,f);
posxatual:= posxatual+size;
end;
if(A[aew] = '4')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,e);
posxatual:= posxatual+size;
end;
if(A[aew] = '3')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,d);
posxatual:= posxatual+size;
end;
if(A[aew] = '2')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,c);
posxatual:= posxatual+size;
end;
if(A[aew] = '1')then
begin
Form1.Image1.Canvas.Draw(posxatual,posyatual,b);
posxatual:= posxatual+size;
end;
if(A[aew] = '0')then
begin
posyatual:= posyatual+size;
posxatual:= 0;
end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
SaveDialog1.FileName:= '.rmap';
OpenDialog1.FileName:= '.rmap';
faz(0,0,32);
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
if(SaveDialog1.Execute)Then
begin
Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;
end;

procedure TForm1.Abrir1Click(Sender: TObject);
begin
if(OpenDialog1.Execute)Then
begin
Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
var
tudo: string;
i:integer;
begin
for i:= 0 to Memo1.Lines.Count do
begin
tudo:= tudo+Memo1.Lines[i];
end;
mapa:= tudo;
faz(0,0,32);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Memo1.Lines.Add('1,');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Memo1.Lines.Add('2,');
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Memo1.Lines.Add('3,');
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
Memo1.Lines.Add('4,');
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
Memo1.Lines.Add('5,');
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
Memo1.Lines.Add('6,');
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
Memo1.Lines.Add('0,');
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
Memo1.Clear;
end;

procedure TForm1.WhiteMarble1Click(Sender: TObject);
begin
SpeedButton2.Click;
end;

procedure TForm1.BlackMarble1Click(Sender: TObject);
begin
SpeedButton1.Click;
end;

procedure TForm1.Dirt1Click(Sender: TObject);
begin
SpeedButton3.Click;
end;

procedure TForm1.WhiteRock1Click(Sender: TObject);
begin
SpeedButton4.Click;
end;

procedure TForm1.Grass1Click(Sender: TObject);
begin
SpeedButton5.Click;
end;

procedure TForm1.Rock1Click(Sender: TObject);
begin
SpeedButton6.Click;
end;

procedure TForm1.NextLine1Click(Sender: TObject);
begin
SpeedButton7.Click;
end;

procedure TForm1.ClearProject1Click(Sender: TObject);
begin
SpeedButton9.Click;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
Memo1.Lines.Add('7,');
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
Memo1.Lines.Add('8,');
end;

procedure TForm1.BlackMarble2Click(Sender: TObject);
begin
SpeedButton8.Click;
end;

procedure TForm1.GrayMarble1Click(Sender: TObject);
begin
SpeedButton10.Click;
end;

initialization
mapa:= '1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0';
posxatual:= 0;
posyatual:= 0;

end.
