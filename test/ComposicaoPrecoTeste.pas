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
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeFrete();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeFrete();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeFrete();
    procedure DeveSerPossivelConsiderarParaSomaAAliquotaDeICMSVenda();
    procedure DeveSerPossivelDesconsiderarAAliquotaDeICMSVenda();
    procedure DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMSVenda();
    procedure DeveSerPossivelInformarOCusto();
    procedure DeveSerPossivelInformarONumeroDeCasasDecimaisASerUtilizada();

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

    // Somente Outros
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaOutrosDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaOutrosDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaOutrosECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaOutrosDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaOutrosECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaOutrosECustoFor100();

    // Somente Substituição tributária
    procedure DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido110QuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido220QuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor200();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100();

    // Somente valor operacional
    procedure DeveCalcularPrecoSugerido123QuandoSubtrairValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularPrecoSugerido137QuandoSomarValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularPrecoSugerido130QuandoDesconsiderarValorOperacionalECustoFor130();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarValorOperacionalECustoFor130();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarValorOperacionalDe7ECustoFor130();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarValorOperacionalECustoFor130();

    // Somente ICMS de venda
    procedure DeveCalcularPrecoSugerido111E11QuandoSomarAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido111E11111111QuandoSomarAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido111QuandoSomarAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido88E89QuandoSubtrairAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSVendaECustoFor100();

    procedure DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSVendaECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSVendaDe10ECustoFor100();
    procedure DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSVendaECustoFor100();

  end;

implementation

uses
  Math;

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

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeFrete;
begin
  FComposicaoPreco.SomarFrete()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoFrete() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaFrete());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSomaAAliquotaDeICMSVenda;
begin
  FComposicaoPreco.SomarICMSVenda()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoFrete() = tcSomar);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMSVenda());
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

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeFrete;
begin
  FComposicaoPreco.SubtrairFrete()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoFrete() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaFrete());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelConsiderarParaSubtracaoAAliquotaDeICMSVenda;
begin
  FComposicaoPreco.SubtrairICMSVenda()
                  .ComAliquota(10);

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMSVenda() = tcSubtrair);
  CheckEquals(10, FComposicaoPreco.GetAliquotaICMSVenda());
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

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeFrete;
begin
  FComposicaoPreco.DesconsiderarFrete();

  CheckTrue(FComposicaoPreco.GetTipoCalculoFrete() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaFrete());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelDesconsiderarAAliquotaDeICMSVenda;
begin
  FComposicaoPreco.DesconsiderarICMSVenda();

  CheckTrue(FComposicaoPreco.GetTipoCalculoAliquotaICMSVenda() = tcDesconsiderar);
  CheckEquals(0, FComposicaoPreco.GetAliquotaICMSVenda());
end;

procedure TComposicaoPrecoTeste.DeveSerPossivelInformarONumeroDeCasasDecimaisASerUtilizada;
begin
  FComposicaoPreco.UtilizarNumeroDeCasasDecimais(5);
  CheckEquals(5, FComposicaoPreco.GetNumeroDeCasasDecimais());
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

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaOutrosECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarOutros()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaOutrosDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarOutros()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaOutrosDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairOutros()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaOutrosECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarOutros
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaOutrosDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarOutros()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaOutrosDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairOutros()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaOutrosECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarOutros()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaOutrosDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarOutros()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaOutrosDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairOutros()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaOutrosDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarCOFINS()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaOutrosDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairOutros()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarSubstituicaoTributaria()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarSubstituicaoTributaria()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairSubstituicaoTributaria()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarSubstituicaoTributaria
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarSubstituicaoTributaria()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairSubstituicaoTributaria()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaSubstituicaoTributariaECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .DesconsiderarSubstituicaoTributaria()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido110QuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SomarSubstituicaoTributaria()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(110, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido180QuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SubtrairSubstituicaoTributaria()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(180, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido220QuandoSomarAliquotaSubstituicaoTributariaDe10ECustoFor200;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(200)
                                .SomarSubstituicaoTributaria()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(220, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido90QuandoSubtrairAliquotaSubstituicaoTributariaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .SubtrairSubstituicaoTributaria()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(90, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido123QuandoSubtrairValorOperacionalDe7ECustoFor130;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(130)
                                .SubtrairValorOperacional()
                                .ComValor(7)
                                .Calcular();
  CheckEquals(123, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido130QuandoDesconsiderarValorOperacionalECustoFor130;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(130)
                                .SomarValorOperacional()
                                .ComValor(7)
                                .Calcular();
  CheckEquals(137, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido137QuandoSomarValorOperacionalDe7ECustoFor130;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(130)
                                .DesconsiderarValorOperacional()
                                .Calcular();
  CheckEquals(130, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarValorOperacionalECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .DesconsiderarValorOperacional()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarValorOperacionalDe7ECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .SomarValorOperacional()
                  .ComValor(7)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairValorOperacionalDe7ECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .SubtrairValorOperacional()
                  .ComValor(7)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarValorOperacionalECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .DesconsiderarValorOperacional()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarValorOperacionalDe7ECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .SomarValorOperacional()
                  .ComValor(7)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairValorOperacionalDe7ECustoFor130;
begin
  FComposicaoPreco.ComCusto(130)
                  .SubtrairValorOperacional()
                  .ComValor(7)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido111E11QuandoSomarAliquotaICMSVendaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .UtilizarNumeroDeCasasDecimais(2)
                                .SomarICMSVenda()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(111.11, lResultado, 0.001);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido111E11111111QuandoSomarAliquotaICMSVendaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .UtilizarNumeroDeCasasDecimais(8)
                                .SomarICMSVenda()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(111.11111111, lResultado, 0.000000001);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido111QuandoSomarAliquotaICMSVendaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .UtilizarNumeroDeCasasDecimais(0)
                                .SomarICMSVenda()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(111, lResultado, 0.1);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido88E89QuandoSubtrairAliquotaICMSVendaDe10ECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .UtilizarNumeroDeCasasDecimais(2)
                                .SubtrairICMSVenda()
                                .ComAliquota(10)
                                .Calcular();
  CheckEquals(88.89, lResultado, 0.001);
end;

procedure TComposicaoPrecoTeste.DeveCalcularPrecoSugerido100QuandoDesconsiderarAliquotaICMSVendaECustoFor100;
var
  lResultado: double;
begin
  lResultado := FComposicaoPreco.ComCusto(100)
                                .UtilizarNumeroDeCasasDecimais(2)
                                .DesconsiderarICMSVenda()
                                .Calcular();
  CheckEquals(100, lResultado);
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoDesconsiderarAliquotaICMSVendaECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMSVenda()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSomarAliquotaICMSVendaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMSVenda()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaLucroZeroQuandoSubtrairAliquotaICMSVendaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMSVenda()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaLucro());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoDesconsiderarAliquotaICMSVendaECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .DesconsiderarICMSVenda()
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSomarAliquotaICMSVendaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SomarICMSVenda()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

procedure TComposicaoPrecoTeste.DeveCalcularAliquotaMarkupZeroQuandoSubtrairAliquotaICMSVendaDe10ECustoFor100;
begin
  FComposicaoPreco.ComCusto(100)
                  .SubtrairICMSVenda()
                  .ComAliquota(10)
                  .Calcular();
  CheckEquals(0, FComposicaoPreco.GetAliquotaMarkup());
end;

initialization
  TestFramework.RegisterTest(TComposicaoPrecoTeste.Suite);

end.

