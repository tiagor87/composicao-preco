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
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeICMSCompra();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeICMSCompra();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMSCompra();
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

    // Somente ICMS de compra
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaICMSCompraDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaICMSCompraDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSCompraECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSCompraDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSCompraECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSCompraECustoFor100();

    // Somente IPI
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaIPIDe10ECustoFor100();
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

    // Somente PIS
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaPISDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaPISDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaPISECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaPISDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaPISECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaPISECustoFor100();

    // Somente COFINS
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaCOFINSDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaCOFINSDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaCOFINSECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaCOFINSDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaCOFINSECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaCOFINSECustoFor100();

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

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeICMSCompra();
begin
  FComposicaoPreco.SomarICMSCompra()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMSCompra() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMSCompra());
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

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMSCompra();
begin
  FComposicaoPreco.SubtrairICMSCompra()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMSCompra() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMSCompra());
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

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeICMSCompra();
begin
  FComposicaoPreco.DesconsiderarICMSCompra();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMSCompra() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaICMSCompra());
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

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaICMSCompraDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairICMSCompra()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaICMSCompraDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairICMSCompra()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaICMSCompraDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarICMSCompra()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaICMSCompraDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarICMSCompra()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSCompraECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarICMSCompra()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSCompraDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMSCompra()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSCompraDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMSCompra()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSCompraECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMSCompra()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSCompraECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMSCompra()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSCompraDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMSCompra()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSCompraDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMSCompra()
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

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaIPIDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairIPI()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaPISECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarPIS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaPISDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarPIS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaPISDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairPIS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaPISECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarPIS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaPISDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarPIS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaPISDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairPIS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaPISECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarPIS()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaPISDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarPIS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaPISDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairPIS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaPISDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarPIS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaPISDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairPIS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaCOFINSECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarCOFINS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaCOFINSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarCOFINS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaCOFINSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairCOFINS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaCOFINSECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarCOFINS()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaCOFINSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarCOFINS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaCOFINSDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairCOFINS()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaCOFINSECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarCOFINS()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaCOFINSDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarCOFINS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaCOFINSDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairCOFINS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaCOFINSDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarCOFINS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaCOFINSDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairCOFINS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

initialization
  TestFramework.RegisterTest(TComposicaoPrecoTeste.Suite);

end.

