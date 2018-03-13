program minigame;

uses
  Forms,
  game in 'game.pas' {Form1},
  shop in 'shop.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
