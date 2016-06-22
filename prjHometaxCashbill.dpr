program prjHometaxCashbill;

uses
  Forms,
  Example in 'Example.pas' {TFormExample},
  PopbillHTCashbill in 'PopbillHTCashbill\PopbillHTCashbill.pas',
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTFormExample, TFormExample);
  Application.Run;
end.
