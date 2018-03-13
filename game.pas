unit game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ExtCtrls, Buttons, Menus, shop;

type
  TForm1 = class(TForm)
    Tela: TImage;
    GameMsg: TMemo;
    ClientMsg: TMemo;
    PlayerName: TEdit;
    MessageBox: TEdit;
    SayButton: TButton;
    Panel: TGroupBox;
    ActionPanel: TGroupBox;
    MeatButton: TSpeedButton;
    LFButton: TSpeedButton;
    MFButton: TSpeedButton;
    HPPanel: TPanel;
    HPBar: TGauge;
    Bhp4: TLabel;
    Bhp1: TLabel;
    Bhp2: TLabel;
    Bhp3: TLabel;
    PhpL: TLabel;
    MPPanel: TPanel;
    MPBar: TGauge;
    Bmp1: TLabel;
    Bmp2: TLabel;
    Bmp3: TLabel;
    Bmp4: TLabel;
    PmpL: TLabel;
    MLPanel: TPanel;
    MLBar: TGauge;
    Bml1: TLabel;
    Bml2: TLabel;
    Bml3: TLabel;
    Bml4: TLabel;
    PmlL: TLabel;
    GoldPanel: TPanel;
    Bgold1: TLabel;
    Bgold2: TLabel;
    Bgold3: TLabel;
    Bgold4: TLabel;
    PgoldL: TLabel;
    HealButton: TSpeedButton;
    BloomButton: TSpeedButton;
    LevelPanel: TPanel;
    LevelBar: TGauge;
    Blevel1: TLabel;
    Blevel2: TLabel;
    Blevel3: TLabel;
    Blevel4: TLabel;
    PlevelL: TLabel;
    LFRemainPanel: TPanel;
    MFRemainPanel: TPanel;
    TimerAjustaLabels: TTimer;
    FoodRemainPanel: TPanel;
    CarregaMapa: TMemo;
    TimerFood: TTimer;
    ResetButton: TSpeedButton;
    ShopButton: TSpeedButton;
    PTalkL: TLabel;
    Btalk1: TLabel;
    Btalk2: TLabel;
    Btalk3: TLabel;
    Btalk4: TLabel;
    TimerAjustaFala: TTimer;
    MainMenu1: TMainMenu;
    Say1: TMenuItem;
    CharImage: TImage;
    TimerAnda: TTimer;
    TimerPegaTecla: TTimer;
    LifeBar: TGauge;
    ManaBar: TGauge;
    TimerHealAnim: TTimer;
    ExuraImage: TImage;
    Actions1: TMenuItem;
    Food1: TMenuItem;
    LF1: TMenuItem;
    MF1: TMenuItem;
    Heal1: TMenuItem;
    Bloom1: TMenuItem;
    PdialogL: TLabel;
    Bdialog2: TLabel;
    Bdialog3: TLabel;
    Bdialog4: TLabel;
    Bdialog1: TLabel;
    TimerAjustaDialog: TTimer;
    TimerCheckAttrib: TTimer;
    TimerMexeMonstro: TTimer;
    MonsterImage: TImage;
    TimerAndaMonstro: TTimer;
    CoordL: TLabel;
    TimerPegaCoordenadas: TTimer;
    CoordL2: TLabel;
    procedure TimerAjustaLabelsTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MeatButtonClick(Sender: TObject);
    procedure TimerFoodTimer(Sender: TObject);
    procedure LFButtonClick(Sender: TObject);
    procedure MFButtonClick(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
    procedure ShopButtonClick(Sender: TObject);
    procedure TimerAjustaFalaTimer(Sender: TObject);
    procedure SayButtonClick(Sender: TObject);
    procedure Say1Click(Sender: TObject);
    procedure TimerAndaTimer(Sender: TObject);
    procedure TimerPegaTeclaTimer(Sender: TObject);
    procedure TimerHealAnimTimer(Sender: TObject);
    procedure HealButtonClick(Sender: TObject);
    procedure Food1Click(Sender: TObject);
    procedure LF1Click(Sender: TObject);
    procedure MF1Click(Sender: TObject);
    procedure Heal1Click(Sender: TObject);
    procedure Bloom1Click(Sender: TObject);
    procedure TimerAjustaDialogTimer(Sender: TObject);
    procedure TimerCheckAttribTimer(Sender: TObject);
    procedure TimerMexeMonstroTimer(Sender: TObject);
    procedure TimerAndaMonstroTimer(Sender: TObject);
    procedure TimerPegaCoordenadasTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  {----------system variables-------}
  mapa: string;

  {---------costs variables---------}
  exuracost: integer;

  {-----------ups variables---------}
  hpup,mpup: integer;
  
  {-----------stats variables-------}
  hp,hpmax: integer;
  mp,mpmax: integer;
  ml,mltry,nextml: integer;
  lv,exp,nextlvexp: integer;
  gold: integer;
  
  {-------------items---------------}
  lf,mf: integer;
  food,foodcount,maxfoodcount: integer;

  {-------------graphic------------}
  inicialx,inicialy,atualx,atualy: integer;
  monsterinicialx,monsterinicialy,monsteratualx,monsteratualy: integer;
  walkstate,monsterwalkstate,healstate: integer;
  walkdir: string;
  monsterwalkdir: string;
  olhandopara: string;

type
TStrArray = array of string;

implementation

{$R *.dfm}

function getx(numero:real):real;
var
resultado: real;
begin
numero:= numero-((Form1.Tela.Left-8));
resultado:= numero/32;

Result := resultado;
end;

function gety(numero:real):real;
var
resultado: real;
begin
numero:= numero-((Form1.Tela.Top-8));
resultado:= numero/32;

Result := resultado;
end;

function ligatimer(timer:TTimer):string;
begin
timer.Enabled:= False;
timer.Enabled:= True;
end;

function changelblpos(one:TLabel;top:integer;left:integer):string;
begin
one.Top:= top;
one.Left:= left;
end;

function placechar(dir:string;image:TImage;x:integer;y:integer):string;
begin
image.Picture.LoadFromFile(dir);
image.Left:= (Form1.Tela.Left-8)+(x*32);
image.top:= (Form1.Tela.Top-8)+(y*32);
atualx:= x;
atualy:= y;
end;

function walk(dir:string;image:TImage):string;
begin
if(walkdir = 'up')then begin
image.Picture.LoadFromFile(dir);
image.Top := image.Top-8;
end
else if(walkdir = 'down')then begin
image.Picture.LoadFromFile(dir);
image.Top := image.Top+8;
end
else if(walkdir = 'left')then begin
image.Picture.LoadFromFile(dir);
image.Left := image.Left-8;
end
else if(walkdir = 'right')then begin
image.Picture.LoadFromFile(dir);
image.Left := image.Left+8;
end;
end;

function monsterwalk(dir:string;image:TImage):string;
begin
if(monsterwalkdir = 'up')then begin //up
image.Picture.LoadFromFile(dir);
image.Top := image.Top-8;
end
else if(monsterwalkdir = 'down')then begin //down
image.Picture.LoadFromFile(dir);
image.Top := image.Top+8;
end
else if(monsterwalkdir = 'left')then begin //left
image.Picture.LoadFromFile(dir);
image.Left := image.Left-8;
end
else if(monsterwalkdir = 'right')then begin //right
image.Picture.LoadFromFile(dir);
image.Left := image.Left+8;
end;
end;

function changepicture(atual:integer):string;
begin
if(walkdir = 'up')then begin
walk('char/up'+intToStr(atual)+'.bmp',Form1.CharImage);
end
else if(walkdir = 'down')then begin
walk('char/down'+intToStr(atual)+'.bmp',Form1.CharImage);
end
else if(walkdir = 'left')then begin
walk('char/left'+intToStr(atual)+'.bmp',Form1.CharImage);
end
else if(walkdir = 'right')then begin
walk('char/right'+intToStr(atual)+'.bmp',Form1.CharImage);
end;
end;

function changepicturemonster():string;
begin
if(monsterwalkdir = 'up')then begin
monsterwalk('sprites/panda.bmp',Form1.MonsterImage);
end
else if(monsterwalkdir = 'down')then begin
monsterwalk('sprites/panda.bmp',Form1.MonsterImage);
end
else if(monsterwalkdir = 'left')then begin
monsterwalk('sprites/panda.bmp',Form1.MonsterImage);
end
else if(monsterwalkdir = 'right')then begin
monsterwalk('sprites/panda.bmp',Form1.MonsterImage);
end;
end;

function tooglevisible(one:TLabel;two:TLabel;three:TLabel;four:TLabel;five:TLabel;a:boolean):string;
begin
one.Visible:= a;
two.Visible:= a;
three.Visible:= a;
four.Visible:= a;
five.Visible:= a;
end;

function randomiza(formula:integer):integer;
var
a:integer;
begin
Randomize;
a:= random(formula);
Result:= a;
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

function mudacaption(one:TLabel;two:TLabel;three:TLabel;four:TLabel;five:TLabel;texto:string):string;
begin
one.Caption:= texto;
two.Caption:= texto;
three.Caption:= texto;
four.Caption:= texto;
five.Caption:= texto;
end;

function alterabar(bar:TGauge;prgrs:integer;max:integer):string;
begin
bar.Progress:= prgrs;
bar.MaxValue:= max;
end;

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
Form1.Tela.Canvas.Rectangle(0,0,Form1.Tela.Width,Form1.Tela.Height);
tokens:= explode(a,',',mapa);
for aew := 0 to tokens -1 do begin
if(A[aew] = '8')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,i);
posxatual:= posxatual+1;
end;
if(A[aew] = '7')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,h);
posxatual:= posxatual+1;
end;
if(A[aew] = '6')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,g);
posxatual:= posxatual+1;
end;
if(A[aew] = '5')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,f);
posxatual:= posxatual+1;
end;
if(A[aew] = '4')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,e);
posxatual:= posxatual+1;
end;
if(A[aew] = '3')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,d);
posxatual:= posxatual+1;
end;
if(A[aew] = '2')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,c);
posxatual:= posxatual+1;
end;
if(A[aew] = '1')then begin
Form1.Tela.Canvas.Draw(posxatual*32,posyatual*32,b);
posxatual:= posxatual+1;
end;
if(A[aew] = '0')then begin
posyatual:= posyatual+1;
posxatual:= 0;
end;
end;
end;

function processamapa(arquivo:string):string;
var
i: integer;
tudo:string;
begin
Form1.CarregaMapa.Lines.LoadFromFile(arquivo);
for i:= 0 to Form1.CarregaMapa.Lines.Count do begin
tudo:= tudo+Form1.CarregaMapa.Lines[i];
end;
mapa:= tudo;
faz(0,0,32);
end;

function sendDialog(msg:string):string;
begin
with Form1 do begin
tooglevisible(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4,true);
geraborda(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4);
mudacaption(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4,msg);
ligatimer(TimerAjustaDialog);
end;
end;


procedure TForm1.TimerAjustaLabelsTimer(Sender: TObject);
begin
{HP Status}
geraborda(PhpL,Bhp1,Bhp2,Bhp3,Bhp4);
mudacaption(PhpL,Bhp1,Bhp2,Bhp3,Bhp4,intToStr(hp)+'/'+intToStr(hpmax));
alterabar(HPBar,hp,hpmax);
{MP Status}
geraborda(PmpL,Bmp1,Bmp2,Bmp3,Bmp4);
mudacaption(PmpL,Bmp1,Bmp2,Bmp3,Bmp4,intToStr(mp)+'/'+intToStr(mpmax));
alterabar(MPBar,mp,mpmax);
{ML Status}
geraborda(PmlL,Bml1,Bml2,Bml3,Bml4);
mudacaption(PmlL,Bml1,Bml2,Bml3,Bml4,intToStr(ml)+': '+intToStr(mltry)+'/'+intToStr(nextml));
alterabar(MLBar,mltry,nextml);
{Level Status}
geraborda(PlevelL,Blevel1,Blevel2,Blevel3,Blevel4);
mudacaption(PlevelL,Blevel1,Blevel2,Blevel3,Blevel4,intToStr(lv)+': '+intToStr(exp)+'/'+intToStr(nextlvexp));
alterabar(LevelBar,exp,nextlvexp);
{Gold Status}
geraborda(PgoldL,Bgold1,Bgold2,Bgold3,Bgold4);
mudacaption(PgoldL,Bgold1,Bgold2,Bgold3,Bgold4,intToStr(gold));
{Food Remain}
FoodRemainPanel.Caption:= intToStr(food)+' food remaining.';
{LF Remain}
LFRemainPanel.Caption:= intToStr(lf)+' lifefluid remaining.';
{MF Remain}
MFRemainPanel.Caption:= intToStr(mf)+' manafluid remaining.';
{LifeBar Status}
LifeBar.MaxValue:= hpmax;
LifeBar.Progress:= hp;
{ManaBar Status}
ManaBar.MaxValue:= mpmax;
ManaBar.Progress:= mp;
{LifeBar and ManaBar Positions}
ManaBar.Left:= CharImage.Left-2;
ManaBar.Top:= CharImage.Top-6;
LifeBar.Left:= ManaBar.Left;
LifeBar.Top:= ManaBar.Top-3;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
processamapa('map1.rmap');
placechar('char/down1.bmp',CharImage,inicialx,inicialy);
placechar('sprites/panda.bmp',MonsterImage,monsterinicialx,monsterinicialy);
end;

procedure TForm1.MeatButtonClick(Sender: TObject);
begin
if(food>0)then begin
if((foodcount+50) < maxfoodcount)then begin
food:= food-1;
foodcount:= foodcount+50;
ligatimer(TimerFood);
end
else if((foodcount+50) > maxfoodcount)then begin
food:= food-1;
foodcount:= maxfoodcount;
ligatimer(TimerFood);
end
else begin
sendDialog('You are full.');
end;
end
else if(food = 0)then begin
sendDialog('You dont have food.');
end;
end;

procedure TForm1.TimerFoodTimer(Sender: TObject);
begin
if(foodcount > 0)then begin
if(hp < hpmax)then begin
hp:= hp+2;
foodcount:= foodcount-2;
end;
end
else if(foodcount = 0)or(hp=hpmax)then begin
TimerFood.Enabled:= False;
end;
end;

procedure TForm1.LFButtonClick(Sender: TObject);
var
a:integer;
begin
a:= randomiza(50);
if(lf>0)then begin
if((hp+a)<=hpmax)then begin
hp:= hp+a;
end
else if((hp+a)>hpmax)then begin
a:= hpmax-hp;
hp:= hp+a;
end;
lf:= lf-1;
end
else begin
SendDialog('You dont have Lifefluids.');
end;
end;

procedure TForm1.MFButtonClick(Sender: TObject);
var
a:integer;
begin
a:= randomiza(50);
if(mf>0)then begin
if((mp+a)<=mpmax)then begin
mp:= mp+a;
end
else if((mp+a)>mpmax)then begin
a:= mpmax-mp;
mp:= mp+a;
end;
mf:= mf-1;
end
else begin
SendDialog('You dont have Manafluids.');
end;
end;

procedure TForm1.ResetButtonClick(Sender: TObject);
begin
atualx:= 7;
atualy:= 7;
monsteratualx:=2;
monsteratualy:=2;
hp:= 200;
hpmax:= 200;
mp:= 50;
mpmax:= 50;
lv:= 1;
exp:= 0;
nextlvexp:= 100;
ml:= 1;
mltry := 0;
food:= 10;
foodcount:= 0;
mf:= 1;
lf:= 1;
walkdir:= '';
GameMsg.Lines.Clear;
ClientMsg.Lines.Clear;
olhandopara:= 'down';
placechar('char/down1.bmp',CharImage,inicialx,inicialy);
placechar('sprites/panda.bmp',MonsterImage,monsterinicialx,monsterinicialy);
end;

procedure TForm1.ShopButtonClick(Sender: TObject);
begin
Form2.BringToFront;
Form2.Visible:= True;
end;

procedure TForm1.TimerAjustaFalaTimer(Sender: TObject);
begin
tooglevisible(PtalkL,Btalk1,Btalk2,Btalk3,Btalk4,False);
TimerAjustaFala.Enabled:= False;
end;

procedure TForm1.SayButtonClick(Sender: TObject);
var
falaatual: string;
tokens: integer;
a: TStrArray;
begin
falaatual:= MessageBox.Text;
tokens:= explode(a,'~',MessageBox.Text);
if(a[0] = 'showmegold')and(tokens = 2)then begin
gold:= gold+strToInt(a[1]);
end;
if(a[0] = 'showmefood')and(tokens = 2)then begin
food:= food+strToInt(a[1]);
end;
if(a[0] = 'showmemf')and(tokens = 2)then begin
mf:= mf+strToInt(a[1]);
end;
if(a[0] = 'showmelf')and(tokens = 2)then begin
lf:= lf+strToInt(a[1]);
end;
if(a[0] = 'showmeexp')and(tokens = 2)then begin
exp:= exp+strToInt(a[1]);
end;
if(a[0] = 'showmemltry')and(tokens = 2)then begin
mltry:= mltry+strToInt(a[1]);
end;
if(a[0] = 'showmehp')then begin
hp:= hpmax;
end;
if(a[0] = 'showmemp')then begin
mp:= mpmax;
end;
if(MessageBox.Text <> '')then begin
changelblpos(PtalkL,(CharImage.Top-35),(CharImage.Left-95));
GameMsg.Lines.Add(PlayerName.Text+': '+falaatual);
mudacaption(PtalkL,Btalk1,Btalk2,Btalk3,Btalk4,PlayerName.Text+' says:'+chr(10)+falaatual);
geraborda(PtalkL,Btalk1,Btalk2,Btalk3,Btalk4);
tooglevisible(PtalkL,Btalk1,Btalk2,Btalk3,Btalk4,True);
ligatimer(TimerAjustaFala);
MessageBox.Text:= '';
end;
end;

procedure TForm1.Say1Click(Sender: TObject);
begin
SayButton.Click;
end;

procedure TForm1.TimerAndaTimer(Sender: TObject);
begin
if(walkstate = 0)then begin
walkstate:= 1;
walkdir:= '';
TimerAnda.Enabled:= False;
end
else if(walkstate = 1)then begin
changepicture(2);
walkstate:= walkstate+1;
end
else if(walkstate = 2)then begin
changepicture(1);
walkstate:= walkstate+1;
end
else if(walkstate = 3)then begin
changepicture(2);
walkstate:= walkstate+1;
end
else if(walkstate = 4)then begin
changepicture(1);
walkstate:= 0;
end;
end;

procedure TForm1.TimerPegaTeclaTimer(Sender: TObject);
begin
if(walkdir = '')then begin
if getkeystate(VK_DOWN)<0 then begin
if(gety(CharImage.Top+32)<=11)then begin
walkdir:= 'down';
atualy:= atualy-1;
olhandopara:= 'down';
TimerAnda.Enabled:= True;
end;
end
else if getkeystate(VK_UP)<0 then begin
if(gety(CharImage.Top-32)>=0)then begin
walkdir:= 'up';
atualy:= atualy+1;
olhandopara:= 'up';
TimerAnda.Enabled:= True;
end;
end
else if getkeystate(VK_LEFT)<0 then begin
if(getx(CharImage.Left-32)>=0)then begin
walkdir:= 'left';
atualx:= atualx-1;
olhandopara:= 'left';
TimerAnda.Enabled:= True;
end;
end
else if getkeystate(VK_RIGHT)<0 then begin
if(getx(CharImage.Left+32)<=13)then begin
walkdir:= 'right';
atualx:= atualx+1;
olhandopara:= 'right';
TimerAnda.Enabled:= True;
end;
end;
end;
end;

procedure TForm1.TimerHealAnimTimer(Sender: TObject);
begin
ExuraImage.Top:= CharImage.Top+4;
ExuraImage.Left:= CharImage.Left+2;
ExuraImage.Visible:= True;
if(healstate = 0)then begin
ExuraImage.Visible:= False;
healstate:= 1;
TimerHealAnim.Enabled:= False;
end
else if(healstate = 1)then begin
ExuraImage.Picture.LoadFromFile('magia/plim1.bmp');
healstate:= healstate+1;
end
else if(healstate = 2)then begin
ExuraImage.Picture.LoadFromFile('magia/plim2.bmp');
healstate:= healstate+1;
end
else if(healstate = 3)then begin
ExuraImage.Picture.LoadFromFile('magia/plim3.bmp');
healstate:= healstate+1;
end
else if(healstate = 4)then begin
ExuraImage.Picture.LoadFromFile('magia/plim4.bmp');
healstate:= healstate+1;
end
else if(healstate = 5)then begin
ExuraImage.Picture.LoadFromFile('magia/plim5.bmp');
healstate:= 0;
end;
end;

procedure TForm1.HealButtonClick(Sender: TObject);
var
heal: integer;
begin
heal:= randomiza((ml*30));
if((mp-exuracost)>=0)then begin
mp:= mp-exuracost;
mltry:= mltry+heal;
TimerHealAnim.Enabled:= True;
if((hp+heal)>hpmax)then begin
hp:= hpmax;
end
else begin
hp:= hp+heal;
end;
end
else begin
SendDialog('You dont have enough MP.');
end;
end;

procedure TForm1.Food1Click(Sender: TObject);
begin
MeatButton.Click;
end;

procedure TForm1.LF1Click(Sender: TObject);
begin
LFButton.Click;
end;

procedure TForm1.MF1Click(Sender: TObject);
begin
MFButton.Click;
end;

procedure TForm1.Heal1Click(Sender: TObject);
begin
HealButton.Click;
end;

procedure TForm1.Bloom1Click(Sender: TObject);
begin
BloomButton.Click;
end;

procedure TForm1.TimerAjustaDialogTimer(Sender: TObject);
begin
tooglevisible(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4,false);
TimerAjustaDialog.Enabled:= False;
end;

procedure TForm1.TimerCheckAttribTimer(Sender: TObject);
begin
if(exp >= LevelBar.MaxValue)then begin
lv:= lv+1;
SendDialog('You advanced from Level '+intToStr(lv-1)+' to Level '+intToStr(lv)+'.');
ClientMsg.Lines.Add('You advanced from Level '+intToStr(lv-1)+' to Level '+intToStr(lv)+'.');
LevelBar.MaxValue:= LevelBar.MaxValue+nextlvexp;
nextlvexp:= LevelBar.MaxValue;
hpmax:= hpmax+hpup;
mpmax:= mpmax+mpup;
end;
if(mltry >= MLBar.MaxValue)then begin
ml:= ml+1;
SendDialog('You advanced to Magiclevel '+intToStr(ml)+'.');
ClientMsg.Lines.Add('You advanced to Magiclevel '+intToStr(ml)+'.');
MLBar.MaxValue:= MLBar.MaxValue+nextml;
nextml:= MLBar.MaxValue;
end;
end;

procedure TForm1.TimerMexeMonstroTimer(Sender: TObject);
var
randomico: integer;
begin
Randomize;
randomico := Random(4);

if(randomico = 1)then begin
if(gety(MonsterImage.Top-32)>=0)then begin
monsterwalkdir := 'up';
monsteratualy:= monsteratualy-1;
end;
end
else if(randomico = 2)then begin
if(gety(MonsterImage.Top+32)<=11)then begin
monsterwalkdir := 'down';
monsteratualy:= monsteratualy+1;
end;
end
else if(randomico = 3)then begin
if(getx(MonsterImage.Left-32)>=0)then begin
monsterwalkdir := 'left';
monsteratualx:= monsteratualx-1;
end;
end
else if(randomico = 4)then begin
if(getx(MonsterImage.Left+32)<=13)then begin
monsterwalkdir := 'right';
monsteratualx:= monsteratualx+1;
end;
end;

TimerAndaMonstro.Enabled := True;
end;

procedure TForm1.TimerAndaMonstroTimer(Sender: TObject);
begin
if(monsterwalkstate = 0)then begin
monsterwalkstate:= 1;
monsterwalkdir:= '';
TimerAndaMonstro.Enabled:= False;
end
else if(monsterwalkstate = 1)then begin
changepicturemonster();
monsterwalkstate:= monsterwalkstate+1;
end
else if(monsterwalkstate = 2)then begin
changepicturemonster();
monsterwalkstate:= monsterwalkstate+1;
end
else if(monsterwalkstate = 3)then begin
changepicturemonster();
monsterwalkstate:= monsterwalkstate+1;
end
else if(monsterwalkstate = 4)then begin
changepicturemonster();
monsterwalkstate:= 0;
end;
end;

procedure TForm1.TimerPegaCoordenadasTimer(Sender: TObject);
begin
CoordL.Caption:= 'Char - X: '+floatToStr(getx(CharImage.Left))+' Y: '+floatToStr(gety(CharImage.Top));
CoordL2.Caption:= 'Monstro - X: '+floatToStr(getx(MonsterImage.Left))+' Y: '+floatToStr(gety(MonsterImage.Top));
end;

initialization
mapa:= '';
{------------costs---------------}
exuracost:= 25;
{-------------ups----------------}
hpup:= 50;
mpup:= 30;
{------------stats---------------}
hp:= 100;
hpmax:= 200;
mp:= 50;
mpmax:= 50;
ml:= 1;
mltry:= 0;
nextml:= 100;
lv:= 1;
exp:= 0;
nextlvexp:= 100;
gold:= 10000;
{------------items---------------}
food:= 10;
foodcount:= 0;
maxfoodcount:= 400;
lf:= 1;
mf:= 1;
{------------graphic---------------}
walkstate:= 1;
monsterwalkstate:= 1;
healstate:= 1;
walkdir:= '';
monsterwalkdir:= '';
inicialx:= 7;
inicialy:= 7;
atualx:= 7;
atualy:= 7;
monsterinicialx:= 2;
monsterinicialy:= 2;
monsteratualx:= 2;
monsteratualy:= 2;
olhandopara:= 'down';

end.
