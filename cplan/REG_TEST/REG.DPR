program reg;

uses
  Forms,
  reg_u1 in 'reg_u1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
