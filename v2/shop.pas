unit shop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TForm2 = class(TForm)
    BuyItems: TComboBox;
    Count: TSpinEdit;
    BuyButton: TSpeedButton;
    TotalLabel: TLabel;
    TimerAtualizaLbl: TTimer;
    procedure BuyButtonClick(Sender: TObject);
    procedure TimerAtualizaLblTimer(Sender: TObject);
    procedure CountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  quantd: integer;

implementation

uses game;

{$R *.dfm}

function tooglevisible(one:TLabel;two:TLabel;three:TLabel;four:TLabel;five:TLabel;a:boolean):string;
begin
one.Visible:= a;
two.Visible:= a;
three.Visible:= a;
four.Visible:= a;
five.Visible:= a;
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

function sendDialog(msg:string):string;
begin
with Form1 do begin
tooglevisible(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4,true);
geraborda(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4);
mudacaption(PdialogL,Bdialog1,Bdialog2,Bdialog3,Bdialog4,msg);
TimerAjustaDialog.Enabled:= False;
TimerAjustaDialog.Enabled:= True;
end;
end;

procedure TForm2.BuyButtonClick(Sender: TObject);
begin
if(Count.Value > 0)then
begin
if(BuyItems.ItemIndex = 0)then
begin
if((gold-(Count.Value*20))>=0)then
begin
lf:= lf+Count.Value;
gold:= (gold-(Count.Value*20));
SendDialog('You bought '+intToStr(Count.Value)+' Lifefluids.');
end
else
begin
SendDialog('You dont have enough gold.');
end;
end;
if(BuyItems.ItemIndex = 1)then
begin
if((gold-(Count.Value*50))>=0)then
begin
mf:= mf+Count.Value;
gold:= (gold-(Count.Value*50));
SendDialog('You bought '+intToStr(Count.Value)+' Manafluids.');
end
else
begin
SendDialog('You dont have enough gold.');
end;
end;
if(BuyItems.ItemIndex = 2)then
begin
if((gold-(Count.Value*5))>=0)then
begin
food:= food+Count.Value;
gold:= (gold-(Count.Value*5));
SendDialog('You bought '+intToStr(Count.Value)+' Food.');
end
else
begin
SendDialog('You dont have enough gold.');
end;
end;
end;
Form2.Close;
end;

procedure TForm2.TimerAtualizaLblTimer(Sender: TObject);
begin
if(BuyItems.ItemIndex = 0)then
begin
TotalLabel.Caption:= 'Total: '+intToStr(quantd*20)+' gold';
end;
if(BuyItems.ItemIndex = 1)then
begin
TotalLabel.Caption:= 'Total: '+intToStr(quantd*50)+' gold';
end;
if(BuyItems.ItemIndex = 2)then
begin
TotalLabel.Caption:= 'Total: '+intToStr(quantd*5)+' gold';
end;
end;

procedure TForm2.CountChange(Sender: TObject);
begin
quantd:= Count.Value;
end;

end.
