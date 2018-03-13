unit game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Buttons, Gauges, jpeg;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Shape1: TImage;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Recomear1: TMenuItem;
    Image2: TImage;
    Timer2: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    Image3: TImage;
    Timer5: TTimer;
    Timer6: TTimer;
    Edit1: TEdit;
    Edit2: TEdit;
    Timer7: TTimer;
    Label3: TLabel;
    Button1: TButton;
    Falar1: TMenuItem;
    Timer8: TTimer;
    Image4: TImage;
    Timer9: TTimer;
    Magias1: TMenuItem;
    LightHealing1: TMenuItem;
    Label5: TLabel;
    Timer10: TTimer;
    Label6: TLabel;
    Image6: TImage;
    Shape2: TShape;
    Timer11: TTimer;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Image5: TImage;
    Label7: TLabel;
    Timer12: TTimer;
    Timer13: TTimer;
    Timer14: TTimer;
    Image7: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Attacks1: TMenuItem;
    Bloom1: TMenuItem;
    Timer15: TTimer;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Timer16: TTimer;
    Timer17: TTimer;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Timer18: TTimer;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Image8: TImage;
    Button4: TButton;
    Gauge1: TGauge;
    Timer19: TTimer;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Timer20: TTimer;
    N1: TMenuItem;
    Cancelall1: TMenuItem;
    Timer21: TTimer;
    Info1: TMenuItem;
    ProgressBar1: TGauge;
    ProgressBar2: TGauge;
    Label33: TLabel;
    Timer22: TTimer;
    Label40: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label36: TLabel;
    Loja1: TMenuItem;
    Lifefluid1: TMenuItem;
    Manafluid1: TMenuItem;
    GroupBox4: TGroupBox;
    Button5: TSpeedButton;
    Button6: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Button3: TSpeedButton;
    Button2: TSpeedButton;
    Actions1: TMenuItem;
    UseManafluid1: TMenuItem;
    UseManafluid2: TMenuItem;
    Eatfood1: TMenuItem;
    Memo2: TMemo;
    LoadMap1: TMenuItem;
    Image9: TImage;
    Label4: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Recomear1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Falar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure Timer9Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LightHealing1Click(Sender: TObject);
    procedure Timer10Timer(Sender: TObject);
    procedure Timer11Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer12Timer(Sender: TObject);
    procedure Timer13Timer(Sender: TObject);
    procedure Timer14Timer(Sender: TObject);
    procedure Bloom1Click(Sender: TObject);
    procedure Timer15Timer(Sender: TObject);
    procedure Timer16Timer(Sender: TObject);
    procedure Timer17Timer(Sender: TObject);
    procedure Timer18Timer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer19Timer(Sender: TObject);
    procedure Cancelall1Click(Sender: TObject);
    procedure Timer21Timer(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer22Timer(Sender: TObject);
    procedure Lifefluid1Click(Sender: TObject);
    procedure Manafluid1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Eatfood1Click(Sender: TObject);
    procedure UseManafluid1Click(Sender: TObject);
    procedure UseManafluid2Click(Sender: TObject);
    procedure LoadMap1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  velocidade: integer;
  modo,fim,avisadofogo,sdclicado,creature,alive,mapa,canheal,canbloom,canwalk: string;
  level,exp,bloomdano,bloom,danosobe,maxhp,maxmana,hp,mana,food,fogo:integer;
  exura,velorec,vezesrec,totalfood,fogueirastate: integer;
  sheephp,expsobe,expdada,foodrand,danofogosobe,expsheep,maxsheephp:integer;
  gold,lf,mf,reclf,recmf,goldrand,goldsobe,precolf,precomf,cheatquantd:integer;
  andaanim:integer;

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

function mudacaption(one:TLabel;two:TLabel;three:TLabel;four:TLabel;five:TLabel;texto:string):string;
begin
one.Caption:= texto;
two.Caption:= texto;
three.Caption:= texto;
four.Caption:= texto;
five.Caption:= texto;
end;

function geraborda(one:TLabel;two:TLabel;three:TLabel;four:TLabel;five:TLabel):string;
begin
two.Top:= one.Top+1;
two.Left:= one.Left;
three.Top:= one.Top-1;
three.Left:= one.Left;
four.Top:= one.Top;
four.Left:= one.Left+1;
five.Top:= one.Top;
five.Left:= one.Left-1;
end;

function atualizalevel(para:integer;hpmax:integer;manamax:integer):string;
begin
level:= para;
maxhp:= hpmax;
maxmana:= manamax;
end;

function randomiza(formula:integer):integer;
var
res: integer;
begin
Randomize;
res:= random(formula);
Result:= res;
end;
function randomizafood(formula:integer):string;
begin
Randomize;
foodrand:= random(formula);
end;

function anda(direcao:string;arquivo:string):string;
begin
with Form1 do
begin
if(direcao = 'up')then
begin
Shape1.Top:= Shape1.Top-velocidade;
end
else if(direcao = 'down')then
begin
Shape1.Top:= Shape1.Top+velocidade;
end
else if(direcao = 'left')then
begin
Shape1.Left:= Shape1.Left-velocidade;
end
else if(direcao = 'right')then
begin
Shape1.Left:= Shape1.Left+velocidade;
end;
Shape1.Picture.LoadFromFile(arquivo);
modo:= direcao;
Timer1.Enabled:= True;
end;
end;

function verificaexp():string;
var
eita: array[0..100] of integer;
begin
eita[0]:= 0;
eita[1]:= 100;
eita[2]:= 200;
eita[3]:= 400;
eita[4]:= 800;
eita[5]:= 1600;
eita[6]:= 1600;
eita[7]:= 2600;
eita[8]:= 4200;
eita[9]:= 6800;
eita[10]:= 11000;
if(exp >= eita[0])and(exp < eita[1])then
begin
atualizalevel(1,200,50);
end
else if(exp >= eita[1])and(exp < eita[2])then
begin
atualizalevel(2,230,80);
end
else if(exp >= eita[2])and(exp < eita[3])then
begin
atualizalevel(3,260,110);
end
else if(exp >= eita[3])and(exp < eita[4])then
begin
atualizalevel(4,290,140);
end
else if(exp >= eita[4])and(exp < eita[5])then
begin
atualizalevel(5,320,170);
end
else if(exp >= eita[5])and(exp < eita[6])then
begin
atualizalevel(6,350,200);
end
else if(exp >= eita[6])and(exp < eita[7])then
begin
atualizalevel(7,380,230);
end
else if(exp >= eita[7])and(exp < eita[8])then
begin
atualizalevel(8,410,260);
end
else if(exp >= eita[8])and(exp <= eita[9])then
begin
atualizalevel(9,440,290);
end
else if(exp >= eita[9])and(exp <= eita[10])then
begin
atualizalevel(10,470,320);
end
else if(exp >= eita[10])then
begin
atualizalevel(11,500,350);
end;
end;

function processamapa(arquivo:string):string;
var
i: integer;
tudo:string;
begin
Form1.Memo2.Lines.LoadFromFile(arquivo);
for i:= 0 to Form1.Memo2.Lines.Count do
begin
tudo:= tudo+Form1.Memo2.Lines[i];
end;
mapa:= tudo;
faz(0,0,32);
end;

function timeranda(num:string):string;
begin
if modo = 'up' then
begin
Form1.Shape1.Picture.LoadFromFile('char/up'+num+'.bmp');
end;
if modo = 'down' then
begin
Form1.Shape1.Picture.LoadFromFile('char/down'+num+'.bmp');
end;
if modo = 'left' then
begin
Form1.Shape1.Picture.LoadFromFile('char/right'+num+'.bmp');
end;
if modo = 'right' then
begin
Form1.Shape1.Picture.LoadFromFile('char/left'+num+'.bmp');
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
bloomdano:= randomiza((level*50));
reclf:= randomiza((level*20));
recmf:= randomiza((level*20));
goldrand:= randomiza((20));
geraborda(Label1,Label4,Label34,Label35,Label41);
mudacaption(Label1,Label4,Label34,Label35,Label41,'HP: '+intToStr(hp)+'/'+intToStr(maxhp));
geraborda(Label2,Label42,Label43,Label44,Label45);
mudacaption(Label2,Label42,Label43,Label44,Label45,'Mana: '+intToStr(mana)+'/'+intToStr(maxmana));
geraborda(Label8,Label46,Label47,Label48,Label49);
mudacaption(Label8,Label46,Label47,Label48,Label49,'Level: '+intToStr(level));
geraborda(Label9,Label50,Label51,Label52,Label53);
mudacaption(Label9,Label50,Label51,Label52,Label53,'Exp: '+intToStr(exp));
geraborda(Label33,Label54,Label55,Label56,Label57);
mudacaption(Label33,Label54,Label55,Label56,Label57,'Gold: '+intToStr(gold));
Button5.Caption:= 'Lifefluid['+intToStr(lf)+']';
Button6.Caption:= 'Manafluid['+intToStr(mf)+']';
Button2.Caption:= 'Eat['+intToStr(food)+']';
Timer16.Interval:= 50;
Memo1.Focused();
processamapa('map1.rmap');
Image9.Width:= Form1.Width;
Image9.Height:= Form1.Height;
Image9.Picture.LoadFromFile('imgs/bg.jpg');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
timeranda('1');
Timer1.Enabled:= false;
end;

procedure TForm1.Recomear1Click(Sender: TObject);
begin
Shape1.Left:= 8;
Shape1.Top:= 8;
hp:= 200;
mana:= 50;
Shape1.Picture.LoadFromFile('char/down1.bmp');
Shape1.Visible:= True;
Image6.Picture.LoadFromFile('sprites/empty.bmp');
fogo:= 5;
fim:= 'não';
alive:= 'sim';
totalfood:= 0;
mudacaption(Label6,Label29,Label30,Label31,Label32,'');
Label5.Caption:= '';
maxhp:= 200;
maxmana:= 50;
food:= 10;
level:= 1;
exp:= 0;
sheephp:= 100;
lf:= 0;
mf:= 0;
gold:= 0;
Image5.Picture.LoadFromFile('sprites/panda.bmp');
Gauge1.Visible:= True;
Gauge3.Visible:= True;
canheal:='sim';
cheatquantd:= 0;
canbloom:='sim';
canwalk:= 'sim';
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if(alive = 'sim') then
begin
if (Shape1.Left>=0) and (Shape1.Left<=296) and
(Shape1.Top>=0) and (Shape1.Top<=296) then
begin
if getkeystate(VK_UP)<0 then
begin
if((Shape1.Top-velocidade)>=0)then
begin
anda('up','char/up2.bmp');
end;
end;
if getkeystate(VK_DOWN)<0 then
begin
if((Shape1.Top+velocidade)<=296)then
begin
anda('down','char/down2.bmp');
end;
end;
if getkeystate(VK_LEFT)<0 then
begin
if((Shape1.Left-velocidade)>=0)then
begin
anda('left','char/right2.bmp');
end;
end;
if getkeystate(VK_RIGHT)<0 then
begin
if((Shape1.Left+velocidade)<=296)then
begin
anda('right','char/left2.bmp');
end;
end;
end;
end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
avisadofogo:= 'não';
if (fogo<5) then
begin
hp:= hp-10;
fogo:= fogo+1;
Image3.Top:= Shape1.Top;
Image3.Left:= Shape1.Left;
Image3.Picture.LoadFromFile('sprites/fogo.bmp');
Timer5.Enabled:= True;
Memo1.Lines.Add('You lose 10 hitpoints.');
Label5.Caption:= 'You lose 10 hitpoints.';
mudacaption(Label24,Label25,Label26,Label27,Label28,'10');
Timer17.Enabled:= False;
Timer17.Enabled:= True;
Timer10.Enabled:= False;
Timer10.Enabled:= True;
end;
if fogo = 5 then
begin
Image6.Picture.LoadFromFile('status/empty.bmp');
Timer3.Enabled:= False;
end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
geraborda(Label1,Label4,Label34,Label35,Label41);
mudacaption(Label1,Label4,Label34,Label35,Label41,'HP: '+intToStr(hp)+'/'+intToStr(maxhp));
geraborda(Label2,Label42,Label43,Label44,Label45);
mudacaption(Label2,Label42,Label43,Label44,Label45,'Mana: '+intToStr(mana)+'/'+intToStr(maxmana));
geraborda(Label8,Label46,Label47,Label48,Label49);
mudacaption(Label8,Label46,Label47,Label48,Label49,'Level: '+intToStr(level));
geraborda(Label9,Label50,Label51,Label52,Label53);
mudacaption(Label9,Label50,Label51,Label52,Label53,'Exp: '+intToStr(exp));
geraborda(Label33,Label54,Label55,Label56,Label57);
mudacaption(Label33,Label54,Label55,Label56,Label57,'Gold: '+intToStr(gold));
ProgressBar1.MaxValue:= maxhp;
ProgressBar2.MaxValue:= maxmana;
ProgressBar1.Progress:= hp;
ProgressBar2.Progress:= mana;
Button5.Caption:= 'Lifefluid['+intToStr(lf)+']';
Button6.Caption:= 'Manafluid['+intToStr(mf)+']';
Button2.Caption:= 'Eat['+intToStr(food)+']';
if(hp <= 0)and(fim = 'não') then
begin
if(hp<0)then
begin
hp:= 0;
end;
Label6.Left:= Shape1.Left-85;
Label6.Top:= Shape1.Top+20;
geraborda(Label6,Label29,Label30,Label31,Label32);
mudacaption(Label6,Label29,Label30,Label31,Label32,'You are dead.');
Label5.Caption:= 'You are dead.';
Shape1.Top:= 8;
Shape1.Left:= 8;
Shape1.Visible:= False;
fogo:= 5;
fim := 'sim';
Memo1.Lines.Add('You are dead.');
totalfood:= 0;
alive:= 'não';
Gauge1.Visible:= False;
Gauge3.Visible:= False;
end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
Image3.Picture.LoadFromFile('sprites/empty.bmp');
Timer5.Enabled:= false;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
if(Shape1.Top>=168-32)and(Shape1.Top<=168+32)and
(Shape1.Left>=168-32)and(Shape1.Left<=168+32) then
begin
fogo:= 0;
if(avisadofogo = 'não')then
begin
Memo1.Lines.Add('You are burning.');
Label5.Caption:= 'You are burning.';
Image6.Picture.LoadFromFile('status/fire.bmp');
Timer10.Enabled:= False;
Timer10.Enabled:= True;
avisadofogo:= 'sim';
end;
Timer3.Enabled:= true;
end;
end;

procedure TForm1.Falar1Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
i: TStrArray;
begin
explode(i,'"',Edit1.Text);
if(alive = 'sim') then
begin
if(Edit1.Text <> '')then
begin
if(i[0] = 'gimmefood') then
begin
food:= strToInt(i[1]);
cheatquantd:= cheatquantd+1;
end
else if(i[0] = 'gimmehp') then
begin
hp:= maxhp;
cheatquantd:= cheatquantd+1;
end
else if(i[0] = 'gimmemana') then
begin
mana:= maxmana;
cheatquantd:= cheatquantd+1;
end
else if(i[0] = 'gimmelf') then
begin
lf:= strToInt(i[1]);
cheatquantd:= cheatquantd+1;
end
else if(i[0] = 'gimmeexp') then
begin
exp:= strToInt(i[1]);
cheatquantd:= cheatquantd+1;
verificaexp();
end
else if(i[0] = 'gimmemf') then
begin
mf:= strToInt(i[1]);
cheatquantd:= cheatquantd+1;
end
else if(i[0] = 'gimmegold') then
begin
gold:= strToInt(i[1]);
cheatquantd:= cheatquantd+1;
end;
end;
if(Edit1.Text <> '')and(Edit1.Text <> 'exura') then
begin
Label3.Top:= Shape1.Top-25;
Label3.Left:= Shape1.Left-90;
mudacaption(Label3,Label15,Label16,Label17,Label18,Edit2.Text+' says:'+chr(10)+Edit1.Text);
geraborda(Label3,Label15,Label16,Label17,Label18);
Timer7.Enabled:= False;
Timer7.Enabled:= True;
Memo1.Lines.Add(Edit2.Text+' says: '+Edit1.Text);
Edit1.Text:= '';
end
else if(canheal = 'sim')and
(Edit1.Text = 'exura')and((mana-25)>=0)then
begin
canheal:= 'não';
Randomize;
Timer8.Enabled:= True;
hp:= hp+random(50);
mana:= mana-25;
Label3.Top:= Shape1.Top-25;
Label3.Left:= Shape1.Left-90;
mudacaption(Label3,Label15,Label16,Label17,Label18,Edit2.Text+' says:'+chr(10)+Edit1.Text);
geraborda(Label3,Label15,Label16,Label17,Label18);
Timer7.Enabled:= False;
Timer7.Enabled:= True;
Memo1.Lines.Add(Edit2.Text+' says: '+Edit1.Text);
Edit1.Text:= '';
if(hp >= maxhp)then
begin
hp:= maxhp;
end;
end
else if(canheal = 'sim')and
(Edit1.Text = 'exura')and((mana-25)<0) then
begin
Label3.Top:= Shape1.Top-25;
Label3.Left:= Shape1.Left-90;
mudacaption(Label3,Label15,Label16,Label17,Label18,Edit2.Text+' says:'+chr(10)+Edit1.Text);
geraborda(Label3,Label15,Label16,Label17,Label18);
Timer7.Enabled:= False;
Timer7.Enabled:= True;
Label5.Caption:= 'You dont have enough mana.';
Timer10.Enabled:= False;
Timer10.Enabled:= True;
Memo1.Lines.Add('You dont have enough mana.');
Edit1.Text:= '';
end;
end;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
begin
mudacaption(Label3,Label15,Label16,Label17,Label18,'');
Timer7.Enabled:= False;
end;

procedure TForm1.Timer8Timer(Sender: TObject);
begin
Image4.Top:= Shape1.Top+8;
Image4.Left:= Shape1.Left+2;
if(exura = 0) then
begin
Image4.Picture.LoadFromFile('sprites/empty.bmp');
exura:= 1;
canheal:= 'sim';
Timer8.Enabled:= False;
end
else if(exura = 1) then
begin
Image4.Picture.LoadFromFile('magia/plim1.bmp');
exura:= exura+1;
end
else if(exura = 2) then
begin
Image4.Picture.LoadFromFile('magia/plim2.bmp');
exura:= exura+1;
end
else if(exura = 3) then
begin
Image4.Picture.LoadFromFile('magia/plim3.bmp');
exura:= exura+1;
end
else if(exura = 4) then
begin
Image4.Picture.LoadFromFile('magia/plim4.bmp');
exura:= exura+1;
end
else if(exura = 5) then
begin
Image4.Picture.LoadFromFile('magia/plim5.bmp');
exura:= 0;
end;
end;

procedure TForm1.Timer9Timer(Sender: TObject);
begin
if(vezesrec<totalfood)then
begin
if(hp<maxhp)then
begin
hp:= hp+velorec;
end;
if(mana<maxmana)then
begin
mana:= mana+velorec;
end;
vezesrec:= vezesrec+1;
end;
if(vezesrec=totalfood)and((mana >= maxmana)or(hp >= maxhp))then
begin
mana:= maxmana;
hp:= maxhp;
Timer9.Enabled:= false;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if(alive = 'sim')then
begin
if(food>0)and((mana < maxmana)or(hp < maxhp)) then
begin
totalfood:= totalfood+10;
Timer9.Enabled:= True;
food:= food-1;
end
else
begin
Label5.Caption:= 'You dont have food, or are full of life/mana.';
Timer10.Enabled:= False;
Timer10.Enabled:= True;
Memo1.Lines.Add('You dont have food, or are full of life/mana.');
end;
end;
end;

procedure TForm1.LightHealing1Click(Sender: TObject);
begin
Edit1.Text:= 'exura';
Button1.Click;
end;

procedure TForm1.Timer10Timer(Sender: TObject);
begin
Label5.Caption:= '';
Timer10.Enabled:= False;
end;

procedure TForm1.Timer11Timer(Sender: TObject);
begin
if(fogueirastate =  1)then
begin
Image2.Picture.LoadFromFile('sprites/fogueira2.bmp');
fogueirastate:= fogueirastate+1;
end
else if(fogueirastate = 2)then
begin
Image2.Picture.LoadFromFile('sprites/fogueira3.bmp');
fogueirastate:= fogueirastate-1;
end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Edit1.Text:='exura';
Button1.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
sdclicado:= 'sim';
Form1.Cursor:= crCross;
end;

procedure TForm1.Timer12Timer(Sender: TObject);
begin
Timer18.Enabled:= False;
if(danosobe = 0)then
begin
mudacaption(Label10,Label11,Label12,Label13,Label14,'');
danosobe:= 1;
Timer18.Enabled:= True;
Timer12.Enabled:= False;
end
else if(danosobe = 1)then
begin
Label10.Top:= Image5.Top+6;
Label10.Left:= Image5.Left-10;
geraborda(Label10,Label11,Label12,Label13,Label14);
danosobe:= danosobe+1;
end
else if(danosobe = 2)then
begin
Label10.Top:= Image5.Top+4;
Label10.Left:= Image5.Left-10;
geraborda(Label10,Label11,Label12,Label13,Label14);
danosobe:= danosobe+1;
end
else if(danosobe = 3)then
begin
Label10.Top:= Image5.Top+2;
Label10.Left:= Image5.Left-10;
geraborda(Label10,Label11,Label12,Label13,Label14);
danosobe:= danosobe+1;
end
else if(danosobe = 4)then
begin
Label10.Top:= Image5.Top;
Label10.Left:= Image5.Left-10;
geraborda(Label10,Label11,Label12,Label13,Label14);
danosobe:= 0;
end;
end;

procedure TForm1.Timer13Timer(Sender: TObject);
begin
Label7.Top:= Shape1.Top+6;
Label7.Left:= Shape1.Left-10;
geraborda(Label3,Label15,Label16,Label17,Label18);
Label19.Top:= Shape1.Top+6;
Label19.Left:= Shape1.Left-10;
geraborda(Label19,Label20,Label21,Label22,Label23);
Label24.Top:= Shape1.Top+6;
Label24.Left:= Shape1.Left-10;
geraborda(Label24,Label25,Label26,Label27,Label28);
Label36.Top:= Shape1.Top+6;
Label36.Left:= Shape1.Left+2;
geraborda(Label36,Label37,Label38,Label39,Label40);
end;

procedure TForm1.Timer14Timer(Sender: TObject);
begin
Image7.Top:= Image5.Top+5;
Image7.Left:= Image5.Left;
mudacaption(Label10,Label11,Label12,Label13,Label14,intToStr(bloomdano));
Timer12.Enabled:= False;
Timer12.Enabled:= True;
if(bloom = 0) then
begin
Image7.Picture.LoadFromFile('sprites/empty.bmp');
bloom:= 1;
canbloom:= 'sim';
Timer14.Enabled:= False;
end
else if(bloom = 1) then
begin
Image7.Picture.LoadFromFile('magia/bloom1.bmp');
bloom:= bloom+1;
end
else if(bloom = 2) then
begin
Image7.Picture.LoadFromFile('magia/bloom2.bmp');
bloom:= bloom+1;
end
else if(bloom = 3) then
begin
Image7.Picture.LoadFromFile('magia/bloom3.bmp');
bloom:= bloom+1;
end
else if(bloom = 4) then
begin
Image7.Picture.LoadFromFile('magia/bloom2.bmp');
bloom:= bloom+1;
end
else if(bloom = 5) then
begin
Image7.Picture.LoadFromFile('magia/bloom1.bmp');
bloom:= 0;
end;
end;

procedure TForm1.Bloom1Click(Sender: TObject);
begin
Button3.Click;
end;

procedure TForm1.Timer15Timer(Sender: TObject);
begin
sheephp:= 100;
Image5.Picture.LoadFromFile('sprites/panda.bmp');
Image8.Visible:= True;
Gauge2.Visible:= True;
Timer15.Enabled:= False;
end;

procedure TForm1.Timer16Timer(Sender: TObject);
begin
Timer13.Enabled:= False;
mudacaption(Label19,Label20,Label21,Label22,Label23,intToStr(expdada));
if(expsobe = 0)then
begin
mudacaption(Label19,Label20,Label21,Label22,Label23,'');
expsobe:= 1;
Timer13.Enabled:= True;
Timer16.Enabled:= False;
end
else if(expsobe = 1)then
begin
Label19.Top:= Shape1.Top+6;
Label19.Left:= Shape1.Left-6;
geraborda(Label19,Label20,Label21,Label22,Label23);
expsobe:= expsobe+1;
end
else if(expsobe = 2)then
begin
Label19.Top:= Shape1.Top+4;
Label19.Left:= Shape1.Left-6;
geraborda(Label19,Label20,Label21,Label22,Label23);
expsobe:= expsobe+1;
end
else if(expsobe = 3)then
begin
Label19.Top:= Shape1.Top+2;
Label19.Left:= Shape1.Left-6;
geraborda(Label19,Label20,Label21,Label22,Label23);
expsobe:= expsobe+1;
end
else if(expsobe = 4)then
begin
Label19.Top:= Shape1.Top;
Label19.Left:= Shape1.Left-6;
geraborda(Label19,Label20,Label21,Label22,Label23);
expsobe:= 0;
end;
end;

procedure TForm1.Timer17Timer(Sender: TObject);
begin
Timer13.Enabled:= False;
if(danofogosobe = 0)then
begin
mudacaption(Label24,Label25,Label26,Label27,Label28,'');
danofogosobe:= 1;
Timer13.Enabled:= True;
Timer17.Enabled:= False;
end
else if(danofogosobe = 1)then
begin
Label24.Top:= Shape1.Top+6;
Label24.Left:= Shape1.Left-10;
geraborda(Label24,Label25,Label26,Label27,Label28);
danofogosobe:= danofogosobe+1;
end
else if(danofogosobe = 2)then
begin
Label24.Top:= Shape1.Top+4;
Label24.Left:= Shape1.Left-10;
geraborda(Label24,Label25,Label26,Label27,Label28);
danofogosobe:= danofogosobe+1;
end
else if(danofogosobe = 3)then
begin
Label24.Top:= Shape1.Top+2;
Label24.Left:= Shape1.Left-10;
geraborda(Label24,Label25,Label26,Label27,Label28);
danofogosobe:= danofogosobe+1;
end
else if(danofogosobe = 4)then
begin
Label24.Top:= Shape1.Top;
Label24.Left:= Shape1.Left-10;
geraborda(Label24,Label25,Label26,Label27,Label28);
danofogosobe:= 0;
end;
end;

procedure TForm1.Timer18Timer(Sender: TObject);
begin
Label10.Top:= Image5.Top+6;
Label10.Left:= Image5.Left-10;
geraborda(Label10,Label11,Label12,Label13,Label14);
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
bloomdano:= randomiza((level*50));
goldrand:= randomiza((20));
canbloom:= 'não';
if(alive = 'sim')and(sdclicado = 'sim')and((sheephp-bloomdano)>0)then
begin
sdclicado:= 'não';
Timer14.Enabled:= True;
Memo1.Lines.Add('You hit '+intToStr(bloomdano)+' hitpoints in a '+creature+'.');
sheephp:= sheephp-bloomdano;
Form1.Cursor:= crDefault;
end;
if(alive = 'sim')and(sdclicado = 'sim')and((sheephp-bloomdano)<=0)then
begin
Gauge2.Visible:= False;
sdclicado:= 'não';
Timer14.Enabled:= True;
bloomdano:= sheephp;
sheephp:= sheephp-bloomdano;
Memo1.Lines.Add('You hit '+intToStr(bloomdano)+' hitpoints in a '+creature+'.');
Memo1.Lines.Add('You killed the '+creature+'!');
exp:= exp+expsheep;
expdada:= expsheep;
randomizafood(5);
if(foodrand <> 0)then
begin
Memo1.Lines.Add('You gained '+intToStr(foodrand)+' food!');
food:= food+foodrand;
end;
if(goldrand <> 0)then
begin
Memo1.Lines.Add('You gained '+intToStr(goldrand)+' gold!');
gold:= gold+goldrand;
end;
Timer16.Enabled:= True;
Timer22.Enabled:= True;
Image5.Picture.LoadFromFile('sprites/empty.bmp');
Image8.Visible:= False;
Timer15.Enabled:= True;
verificaexp();
end;
Form1.Cursor:= crDefault;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
sdclicado:= 'não';
Form1.Cursor:= crDefault;
end;

procedure TForm1.Timer19Timer(Sender: TObject);
begin
Gauge1.Top:= Shape1.Top-10;
Gauge1.Left:= Shape1.Left-3;
Gauge1.Progress:= hp;
Gauge1.MaxValue:= maxhp;
Gauge2.Top:= Image5.Top-10;
Gauge2.Left:= Image5.Left-8;
Gauge2.Progress:= sheephp;
Gauge3.Top:= Gauge1.Top+4;
Gauge3.Left:= Gauge1.Left;
Gauge3.Progress:= mana;
Gauge3.MaxValue:= maxmana;
end;

procedure TForm1.Cancelall1Click(Sender: TObject);
begin
Button4.Click;
end;

procedure TForm1.Timer21Timer(Sender: TObject);
begin
Image8.BringToFront;
end;

procedure TForm1.Info1Click(Sender: TObject);
begin
ShowMessage('Sheep HP Remaining: '+intToStr(sheephp)+chr(10)+
'Sheep Total HP: '+intToStr(maxsheephp)+chr(10)+
'Last Bloom Hit: '+intToStr(bloomdano)+chr(10)+
'Number of cheats used: '+intToStr(cheatquantd));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
begin
if(alive = 'sim')then
begin
if(lf>0)and((hp < maxhp)) then
begin
reclf:= randomiza((50));
if((hp+reclf) > maxhp)then
begin
reclf:= maxhp-hp;
end;
hp:= hp+reclf;
lf:= lf-1;
Memo1.Lines.Add('You gained '+intToStr(reclf)+' hitpoints.');
end
else
begin
Label5.Caption:= 'You dont have lifefluid, or are full of life.';
Timer10.Enabled:= False;
Timer10.Enabled:= True;
Memo1.Lines.Add('You dont have lifefluid, or are full of life.');
end;
end;
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if(alive = 'sim')then
begin
if(mf>0)and((mana < maxmana)) then
begin
recmf:= randomiza((100));
if((mana+recmf) > maxmana)then
begin
recmf:= maxmana-mana;
end;
mana:= mana+recmf;
mf:= mf-1;
Memo1.Lines.Add('You gained '+intToStr(recmf)+' mana.');
end
else
begin
Label5.Caption:= 'You dont have manafluid, or are full of mana.';
Timer10.Enabled:= False;
Timer10.Enabled:= True;
Memo1.Lines.Add('You dont have manafluid, or are full of mana.');
end;
end;
end;

procedure TForm1.Timer22Timer(Sender: TObject);
begin
Timer13.Enabled:= False;
mudacaption(Label36,Label37,Label38,Label39,Label40,intToStr(goldrand));
if(goldsobe = 0)then
begin
mudacaption(Label36,Label37,Label38,Label39,Label40,'');
goldsobe:= 1;
Timer13.Enabled:= True;
Timer22.Enabled:= False;
end
else if(goldsobe = 1)then
begin
Label36.Top:= Shape1.Top+6;
Label36.Left:= Shape1.Left+2;
geraborda(Label36,Label37,Label38,Label39,Label40);
goldsobe:= goldsobe+1;
end
else if(goldsobe = 2)then
begin
Label36.Top:= Shape1.Top+4;
Label36.Left:= Shape1.Left+2;
geraborda(Label36,Label37,Label38,Label39,Label40);
goldsobe:= goldsobe+1;
end
else if(goldsobe = 3)then
begin
Label36.Top:= Shape1.Top+2;
Label36.Left:= Shape1.Left+2;
geraborda(Label36,Label37,Label38,Label39,Label40);
goldsobe:= goldsobe+1;
end
else if(goldsobe = 4)then
begin
Label36.Top:= Shape1.Top;
Label36.Left:= Shape1.Left+2;
geraborda(Label36,Label37,Label38,Label39,Label40);
goldsobe:= 0;
end;
end;

procedure TForm1.Lifefluid1Click(Sender: TObject);
var
quantd: string;
begin
if(alive = 'sim')then
begin
quantd:= inputBox('LifeFluid','How many lifefluids you want to buy(20gold each)?','0');
if(strToInt(quantd) <> 0)then
begin
if((gold-(precolf*strToInt(quantd)))>=0)then
begin
lf:= lf+strToInt(quantd);
gold:= gold-(precolf*strToInt(quantd));
Memo1.Lines.Add('You bought '+quantd+' lifefluids.');
end
else
begin
Label5.Caption:= 'You dont have enough gold.';
Timer10.Enabled:= True;
end;
end;
end;
end;

procedure TForm1.Manafluid1Click(Sender: TObject);
var
quantd: string;
begin
if(alive = 'sim')then
begin
quantd:= inputBox('ManaFluid','How many manafluids you want to buy(50gold each)?','0');
if(strToInt(quantd) <> 0)then
begin
if((gold-(precomf*strToInt(quantd)))>=0)then
begin
mf:= mf+strToInt(quantd);
gold:= gold-(precomf*strToInt(quantd));
Memo1.Lines.Add('You bought '+quantd+' manafluids.');
end
else
begin
Label5.Caption:= 'You dont have enough gold.';
Timer10.Enabled:= True;
end;
end;
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
LifeFluid1.Click;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
ManaFluid1.Click;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
LifeFluid1.Click;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
ManaFluid1.Click;
end;

procedure TForm1.Eatfood1Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TForm1.UseManafluid1Click(Sender: TObject);
begin
Button5.Click;
end;

procedure TForm1.UseManafluid2Click(Sender: TObject);
begin
Button6.Click;
end;

procedure TForm1.LoadMap1Click(Sender: TObject);
var
arq:string;
begin
arq:= inputBox('Load Map','Type the name of the map here','');
if(FileExists(arq))and(arq <> '')then
begin
processamapa(arq);
end
else
begin
ShowMessage('File not found.');
end;
end;

initialization
fogo:= 5;
velocidade:= 16;
hp:= 200;
mana:= 50;
food:= 10;
fim:= 'não';
alive:= 'sim';
avisadofogo:= 'não';
sdclicado:= 'não';
exura:= 1;
velorec:= 2;
vezesrec:= 0;
maxhp:= 200;
maxmana:= 50;
danosobe:= 1;
fogueirastate:= 1;
bloom:= 1;
level:= 1;
exp:= 0;
sheephp:= 100;
maxsheephp:= 100;
expsobe:= 1;
foodrand:= 0;
danofogosobe:= 1;
expsheep:= 50;
creature:= 'panda';
gold:= 0;
lf:= 0;
mf:= 0;
goldsobe:= 1;
precolf:= 20;
precomf:= 50;
cheatquantd:= 0;
canheal:= 'sim';
canbloom:= 'sim';
canwalk:= 'sim';
andaanim:= 1;

end.
