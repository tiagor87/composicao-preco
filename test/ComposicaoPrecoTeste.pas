unit ComposicaoPrecoTeste;

interface

uses
  Windows, SysUtils, Classes, TestFramework, TestExtensions, ComposicaoPreco;

type
  TComposicaoPrecoTeste = class(TTestCase)
  private
    FComposicaoPreco: IComposicaoPreco;

  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published
    procedure DeveSerPossivelInstanciarAClasse();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeICMS();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeICMS();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMS();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeIPI();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeIPI();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeIPI();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDePIS();
    procedure DeveSerPossivelDesconsiderarAAliquotaDePIS();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDePIS();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeCOFINS();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeCOFINS();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeCOFINS();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeSubstituicaoTributaria();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeSubstituicaoTributaria();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeSubstituicaoTributaria();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeOutros();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeOutros();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeOutros();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeValorOperacional();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeValorOperacional();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeValorOperacional();
    procedure DeveSerPossivelInformarOCusto();

    // Somente custo
    procedure DeveCalcularPrecoSugerido100QuandoTodasAsAliquotasEstiveremZeradasECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoTodasAsAliquotasEstiveremZeradasECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoTodasAsAliquotasEstiveremZeradasECustoFor100();

    // Com ICMS
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaICMSDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaICMSDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSECustoFor100();

    // Com IPI
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaIPODe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaIPIDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaIPIDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaIPIDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaIPIECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaIPIDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaIPIDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaIPIDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaIPIDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaIPIECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaIPIECustoFor100();


  end;

implementation

procedure TComposicaoPrecoTeste.Setup;
begin
  FComposicaoPreco := TComposicaoPreco.Create();
end;

procedure TComposicaoPrecoTeste.TearDown;
begin
  FComposicaoPreco := nil;
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelInstanciarAClasse();
var
  lComposicaoPreco: IComposicaoPreco;
begin
  try
    lComposicaoPreco := TComposicaoPreco.Create();
    CheckNotNull(lComposicaoPreco, 'A classe deve ser instanciável.');
  finally
    lComposicaoPreco := nil;
  end;
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeCOFINS();
begin
  FComposicaoPreco.SomarCOFINS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaCOFINS() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaCOFINS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeICMS();
begin
  FComposicaoPreco.SomarICMS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMS() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeIPI();
begin
  FComposicaoPreco.SomarIPI()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaIPI() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaIPI());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeOutros();
begin
  FComposicaoPreco.SomarOutros()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaOutros() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaOutros());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDePIS();
begin
  FComposicaoPreco.SomarPIS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaPIS() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaPIS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeSubstituicaoTributaria();
begin
  FComposicaoPreco.SomarSubstituicaoTributaria()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaSubstituicaoTributaria() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaSubstituicaoTributaria());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeValorOperacional();
begin
  FComposicaoPreco.SomarValorOperacional()
                  .ComValor(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoValorOperacional() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetValorOperacional());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeCOFINS();
begin
  FComposicaoPreco.SubtrairCOFINS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaCOFINS() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaCOFINS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMS();
begin
  FComposicaoPreco.SubtrairICMS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMS() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeIPI();
begin
  FComposicaoPreco.SubtrairIPI()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaIPI() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaIPI());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeOutros();
begin
  FComposicaoPreco.SubtrairOutros()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaOutros() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaOutros());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDePIS();
begin
  FComposicaoPreco.SubtrairPIS()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaPIS() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaPIS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeSubstituicaoTributaria();
begin
  FComposicaoPreco.SubtrairSubstituicaoTributaria()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaSubstituicaoTributaria() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaSubstituicaoTributaria());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeValorOperacional();
begin
  FComposicaoPreco.SubtrairValorOperacional()
                  .ComValor(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoValorOperacional() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetValorOperacional());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeCOFINS();
begin
  FComposicaoPreco.DesconsiderarCOFINS();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaCOFINS() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaCOFINS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeICMS();
begin
  FComposicaoPreco.DesconsiderarICMS();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMS() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaICMS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeIPI();
begin
  FComposicaoPreco.DesconsiderarIPI();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaIPI() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaIPI());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeOutros();
begin
  FComposicaoPreco.DesconsiderarOutros();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaOutros() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaOutros());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDePIS();
begin
  FComposicaoPreco.DesconsiderarPIS();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaPIS() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaPIS());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeSubstituicaoTributaria();
begin
  FComposicaoPreco.DesconsiderarSubstituicaoTributaria();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaSubstituicaoTributaria() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaSubstituicaoTributaria());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeValorOperacional();
begin
  FComposicaoPreco.DesconsiderarValorOperacional();

  CheckTrue(FComposicaoPreco.GetTipoCalculoValorOperacional() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetValorOperacional());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelInformarOCusto;
begin
  FComposicaoPreco.ComCusto(100);
  CheckEquals(100, FComposicaoPreco.GetCusto());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoTodasAsAliquotasEstiveremZeradasECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoTodasAsAliquotasEstiveremZeradasECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoTodasAsAliquotasEstiveremZeradasECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaICMSDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairICMS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaICMSDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairICMS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaICMSDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarICMS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaICMSDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarICMS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarICMS()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaIPIECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarIPI()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaIPIDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarIPI()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaIPIDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairIPI()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaIPIECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarIPI()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaIPIDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarIPI()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaIPIDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairIPI()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaIPIECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarIPI
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaIPIDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarIPI()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaIPIDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairIPI()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaIPIDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarIPI()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaIPODe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairIPI()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

initialization
  TestFramework.RegisterTest(TComposicaoPrecoTeste.Suite);

end.

