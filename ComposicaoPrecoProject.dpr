//{$DEFINE DUNIT_CONSOLE_MODE}

program ComposicaoPrecoProject;

uses
  SysUtils,
  TestFramework,
  TestExtensions,
  GUITestRunner,
  TextTestRunner,
  XMLTestRunner2,
  ComposicaoPrecoTeste in 'test\ComposicaoPrecoTeste.pas',
  ComposicaoPreco in 'src\ComposicaoPreco.pas';

{$IFDEF DUNIT_CONSOLE_MODE}
  {$APPTYPE CONSOLE}
{$ELSE}
  {$R *.RES}
{$ENDIF}

begin
{$IFDEF DUNIT_CONSOLE_MODE}
  if not FindCmdLineSwitch('Graphic', ['-','/'], True) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
{$ENDIF}
    if not FindCmdLineSwitch('Xml', ['-','/'], True) then
      GUITestRunner.RunRegisteredTests
    else
      XmlTestRunner2.RunRegisteredTests('Resultados.xml');
end.
