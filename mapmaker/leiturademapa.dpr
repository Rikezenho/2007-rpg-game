program leiturademapa;

uses
  Forms,
  teste in 'teste.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
