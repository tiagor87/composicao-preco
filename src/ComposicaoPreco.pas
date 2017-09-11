unit ComposicaoPreco;

interface

uses
  SysUtils;

type
  TTipoCalculo = (tcSomar, tcDesconsiderar, tcSubtrair);

  IComposicaoPrecoAliquota = interface;
  IComposicaoPrecoValor = interface;

  IComposicaoPreco = interface
  ['{1DDFE24C-3577-44DD-989F-14593A120F24}']
    function SomarICMSCompra(): IComposicaoPrecoAliquota;
    function DesconsiderarICMSCompra(): IComposicaoPreco;
    function SubtrairICMSCompra(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaICMSCompra(): TTipoCalculo;
    function GetAliquotaICMSCompra(): double;

    function SomarIPI(): IComposicaoPrecoAliquota;
    function DesconsiderarIPI(): IComposicaoPreco;
    function SubtrairIPI(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaIPI(): TTipoCalculo;
    function GetAliquotaIPI(): double;

    function SomarPIS(): IComposicaoPrecoAliquota;
    function DesconsiderarPIS(): IComposicaoPreco;
    function SubtrairPIS(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaPIS(): TTipoCalculo;
    function GetAliquotaPIS(): double;

    function SomarCOFINS(): IComposicaoPrecoAliquota;
    function DesconsiderarCOFINS(): IComposicaoPreco;
    function SubtrairCOFINS(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaCOFINS(): TTipoCalculo;
    function GetAliquotaCOFINS(): double;

    function SomarSubstituicaoTributaria(): IComposicaoPrecoAliquota;
    function DesconsiderarSubstituicaoTributaria(): IComposicaoPreco;
    function SubtrairSubstituicaoTributaria(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaSubstituicaoTributaria(): TTipoCalculo;
    function GetAliquotaSubstituicaoTributaria(): double;

    function SomarOutros(): IComposicaoPrecoAliquota;
    function DesconsiderarOutros(): IComposicaoPreco;
    function SubtrairOutros(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaOutros(): TTipoCalculo;
    function GetAliquotaOutros(): double;

    function SomarValorOperacional(): IComposicaoPrecoValor;
    function DesconsiderarValorOperacional(): IComposicaoPreco;
    function SubtrairValorOperacional(): IComposicaoPrecoValor;
    function GetTipoCalculoValorOperacional(): TTipoCalculo;
    function GetValorOperacional(): double;

    function SomarFrete(): IComposicaoPrecoAliquota;
    function DesconsiderarFrete(): IComposicaoPreco;
    function SubtrairFrete(): IComposicaoPrecoAliquota;
    function GetTipoCalculoFrete(): TTipoCalculo;
    function GetAliquotaFrete(): double;

    function SomarICMSVenda(): IComposicaoPrecoAliquota;
    function DesconsiderarICMSVenda(): IComposicaoPreco;
    function SubtrairICMSVenda(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaICMSVenda(): TTipoCalculo;
    function GetAliquotaICMSVenda(): double;

    function ComCusto(const Value: double): IComposicaoPreco;
    function GetCusto(): double;

    function ComPrecoSugerido(const Value: double): IComposicaoPreco;

    function UtilizarNumeroDeCasasDecimais(const Value: Integer): IComposicaoPreco;
    function GetNumeroDeCasasDecimais(): Integer;

    function UtilizarMarkup(): IComposicaoPrecoAliquota;
    function GetAliquotaMarkup(): double;

    function UtilizarLucro(): IComposicaoPrecoAliquota;
    function GetAliquotaLucro(): double;

    function Calcular(): double;

  end;

  IComposicaoPrecoAliquota = interface
  ['{4B167D59-A636-4844-AC8D-C754D8505F4C}']
    function ComAliquota(pAliquota: double): IComposicaoPreco;
  end;

  IComposicaoPrecoValor = interface
  ['{AE5A8692-654C-4D0D-9C21-C90685571D1E}']
    function ComValor(pValor: double): IComposicaoPreco;
  end;

  ECustoFinalInvalido = class(Exception)
  end;

  TComposicaoPreco = class(TInterfacedObject, IComposicaoPreco)
  private
    FAliquotaICMSCompra: double;
    FTipoCalculoAliquotaICMSCompra: TTipoCalculo;
    FAliquotaIPI: double;
    FTipoCalculoAliquotaIPI: TTipoCalculo;
    FAliquotaCOFINS: double;
    FTipoCalculoAliquotaCOFINS: TTipoCalculo;
    FAliquotaPIS: double;
    FTipoCalculoAliquotaPIS: TTipoCalculo;
    FAliquotaSubstituicaoTributaria: double;
    FTipoCalculoAliquotaSubstituicaoTributaria: TTipoCalculo;
    FAliquotaOutros: double;
    FTipoCalculoAliquotaOutros: TTipoCalculo;
    FValorOperacional: double;
    FTipoCalculoValorOperacional: TTipoCalculo;
    FAliquotaFrete: double;
    FTipoCalculoFrete: TTipoCalculo;
    FAliquotaICMSVenda: double;
    FTipoCalculoICMSVenda: TTipoCalculo;

    FCusto: double;
    FNumeroDeCasasDecimais: Integer;
    FUtilizarMarkup: Boolean;
    FAliquotaMarkup: double;
    FAliquotaLucro: double;

    function CalcularValorPorAliquota(pAliquota: Double; pTipoCalculo: TTipoCalculo): Double;
    function CalcularValorICMSCompra(): Double;
    function CalcularValorIPI: Double;
    function CalcularValorPIS: Double;
    function CalcularValorCOFINS: Double;
    function CalcularValorOutros: Double;
    function CalcularValorSubstituicaoTributaria: Double;
    function CalcularValorOperacional: Double;
    function CalcularValorICMSVenda(const pValorCusto: Double): Double;
    function CalcularValorLucro(const pValorCusto: Double): Double;
    function CalcularValorMarkup(const pValorCusto: Double): Double;
    function CalcularCustoTotal(): Double;
    function CalcularAliquotaLucroAPartirDoMarkup(const pValorCusto: Double): Double;
    function ConverterAliquotaMarkupParaCalculo(): Double;

  protected
    procedure SetAliquotaCOFINS(const Value: Double);
    procedure SetAliquotaICMSCompra(const Value: Double);
    procedure SetAliquotaIPI(const Value: Double);
    procedure SetAliquotaOutros(const Value: Double);
    procedure SetAliquotaPIS(const Value: Double);
    procedure SetAliquotaSubstituicaoTributaria(const Value: Double);
    procedure SetValorOperacional(const Value: Double);
    procedure SetAliquotaFrete(const Value: Double);
    procedure SetAliquotaICMSVenda(const Value: Double);
    procedure SetAliquotaMarkup(const Value: Double);
    procedure SetAliquotaLucro(const Value: Double);

  public
    constructor Create();

    function Calcular(): double;

    function DesconsiderarFrete(): IComposicaoPreco;
    function DesconsiderarCOFINS: IComposicaoPreco;
    function DesconsiderarICMSCompra: IComposicaoPreco;
    function DesconsiderarIPI: IComposicaoPreco;
    function DesconsiderarOutros: IComposicaoPreco;
    function DesconsiderarPIS: IComposicaoPreco;
    function DesconsiderarSubstituicaoTributaria: IComposicaoPreco;
    function DesconsiderarValorOperacional: IComposicaoPreco;
    function DesconsiderarICMSVenda(): IComposicaoPreco;

    function SomarCOFINS: IComposicaoPrecoAliquota;
    function SomarICMSCompra: IComposicaoPrecoAliquota;
    function SomarIPI: IComposicaoPrecoAliquota;
    function SomarOutros: IComposicaoPrecoAliquota;
    function SomarPIS: IComposicaoPrecoAliquota;
    function SomarSubstituicaoTributaria: IComposicaoPrecoAliquota;
    function SomarValorOperacional: IComposicaoPrecoValor;
    function SomarFrete(): IComposicaoPrecoAliquota;
    function SomarICMSVenda(): IComposicaoPrecoAliquota;

    function SubtrairCOFINS: IComposicaoPrecoAliquota;
    function SubtrairICMSCompra: IComposicaoPrecoAliquota;
    function SubtrairIPI: IComposicaoPrecoAliquota;
    function SubtrairOutros: IComposicaoPrecoAliquota;
    function SubtrairPIS: IComposicaoPrecoAliquota;
    function SubtrairSubstituicaoTributaria: IComposicaoPrecoAliquota;
    function SubtrairValorOperacional: IComposicaoPrecoValor;
    function SubtrairFrete(): IComposicaoPrecoAliquota;
    function SubtrairICMSVenda(): IComposicaoPrecoAliquota;

    function UtilizarNumeroDeCasasDecimais(const Value: Integer): IComposicaoPreco;

    function ComCusto(const Value: double): IComposicaoPreco;
    function ComPrecoSugerido(const Value: double): IComposicaoPreco;

    function UtilizarMarkup(): IComposicaoPrecoAliquota;
    function UtilizarLucro(): IComposicaoPrecoAliquota;

    function GetAliquotaCOFINS: Double;
    function GetAliquotaICMSCompra: Double;
    function GetAliquotaIPI: Double;
    function GetAliquotaOutros: Double;
    function GetAliquotaPIS: Double;
    function GetAliquotaSubstituicaoTributaria: Double;
    function GetValorOperacional: Double;
    function GetAliquotaFrete(): double;
    function GetAliquotaICMSVenda(): double;
    function GetCusto: Double;
    function GetNumeroDeCasasDecimais(): Integer;

    function GetTipoCalculoAliquotaICMSCompra: TTipoCalculo;
    function GetTipoCalculoAliquotaCOFINS: TTipoCalculo;
    function GetTipoCalculoAliquotaIPI: TTipoCalculo;
    function GetTipoCalculoAliquotaOutros: TTipoCalculo;
    function GetTipoCalculoAliquotaPIS: TTipoCalculo;
    function GetTipoCalculoAliquotaSubstituicaoTributaria: TTipoCalculo;
    function GetTipoCalculoValorOperacional: TTipoCalculo;
    function GetTipoCalculoFrete(): TTipoCalculo;
    function GetTipoCalculoAliquotaICMSVenda(): TTipoCalculo;

    function GetAliquotaLucro(): Double;
    function GetAliquotaMarkup(): Double;

  end;

implementation

uses Math;

{ TComposicaoPreco }

type
  TSetMethod = procedure(const Value: double) of object;

  TComposicaoPrecoAtribuicaoValor = class(TInterfacedObject, IComposicaoPrecoAliquota, IComposicaoPrecoValor)
  private
    FComposicaoPreco: IComposicaoPreco;
    FSet: TSetMethod;

  public
    constructor Create(pComposicaoPreco: IComposicaoPreco; pSet: TSetMethod);

    function ComAliquota(pAliquota: Double): IComposicaoPreco;
    function ComValor(pValor: Double): IComposicaoPreco;

  end;

function TComposicaoPreco.Calcular: Double;
begin
  Result := Self.CalcularCustoTotal();
  Result := Result + Self.CalcularValorLucro(Result);
  Result := Result + Self.CalcularValorMarkup(Result);
  Result := RoundTo(Result, -FNumeroDeCasasDecimais);
end;

function TComposicaoPreco.CalcularCustoTotal(): Double;
begin
  Result := FCusto
    + Self.CalcularValorICMSCompra()
    + Self.CalcularValorIPI()
    + Self.CalcularValorPIS()
    + Self.CalcularValorCOFINS()
    + Self.CalcularValorOutros()
    + Self.CalcularValorSubstituicaoTributaria()
    + Self.CalcularValorOperacional();

  Result := Result + Self.CalcularValorICMSVenda(Result);

  if (Result <= 0) then
  begin
    raise ECustoFinalInvalido.Create(Format('O custo final está com o valor de %f e deveria ser maior que zero.', [RoundTo(Result, -2)]));
  end;
end;

function TComposicaoPreco.CalcularValorPorAliquota(pAliquota: Double; pTipoCalculo: TTipoCalculo): Double;
begin
  if ((pAliquota <= 0) or (pTipoCalculo = tcDesconsiderar)) then
  begin
    Result := 0;
    Exit;
  end;

  Result := FCusto * pAliquota / 100;
  if (pTipoCalculo = tcSubtrair) then
    Result := -Result;
end;

function TComposicaoPreco.CalcularValorICMSCompra: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaICMSCompra, FTipoCalculoAliquotaICMSCompra);
end;

function TComposicaoPreco.CalcularValorIPI: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaIPI, FTipoCalculoAliquotaIPI);
end;

function TComposicaoPreco.CalcularValorPIS: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaPIS, FTipoCalculoAliquotaPIS);
end;

function TComposicaoPreco.CalcularValorCOFINS: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaCOFINS, FTipoCalculoAliquotaCOFINS);
end;

function TComposicaoPreco.CalcularValorOutros: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaOutros, FTipoCalculoAliquotaOutros);
end;

function TComposicaoPreco.CalcularValorSubstituicaoTributaria: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaSubstituicaoTributaria, FTipoCalculoAliquotaSubstituicaoTributaria);
end;

function TComposicaoPreco.CalcularValorOperacional: Double;
begin
  if ((FValorOperacional <= 0) or (FTipoCalculoValorOperacional = tcDesconsiderar)) then
  begin
    Result := 0;
    Exit;
  end;

  Result := FValorOperacional;

  if (FTipoCalculoValorOperacional = tcSubtrair) then
    Result := -Result;
end;

function TComposicaoPreco.CalcularValorICMSVenda(const pValorCusto: Double): Double;
begin
  if ((FAliquotaICMSVenda <= 0) or (FTipoCalculoICMSVenda = tcDesconsiderar)) then
  begin
    Result := 0;
    Exit;
  end;

  Result := pValorCusto / (1 - FAliquotaICMSVenda / 100) - pValorCusto;
  if (FTipoCalculoICMSVenda = tcSubtrair) then
    Result := -Result;
end;

function TComposicaoPreco.CalcularValorLucro(const pValorCusto: Double): Double;
var
  lValorLucro: double;
begin
  if ((FAliquotaLucro <= 0) or (FUtilizarMarkup)) then
  begin
    Result := 0;
    Exit;
  end;

  lValorLucro := pValorCusto / (1 - FAliquotaLucro / 100) - pValorCusto;
  FAliquotaMarkup := lValorLucro * 100 / pValorCusto;
  Result := lValorLucro;
end;

function TComposicaoPreco.CalcularValorMarkup(const pValorCusto: Double): Double;
begin
  if ((FAliquotaMarkup <= 0) or (not FUtilizarMarkup)) then
  begin
    Result := 0;
    Exit;
  end;

  FAliquotaLucro := Self.CalcularAliquotaLucroAPartirDoMarkup(pValorCusto);
  Result := pValorCusto * Self.ConverterAliquotaMarkupParaCalculo() - pValorCusto;
end;

function TComposicaoPreco.ConverterAliquotaMarkupParaCalculo(): Double;
begin
  Result := (100 + FAliquotaMarkup) / 100; // Adequa a alíquota de markup para o cálculo.
end;

function TComposicaoPreco.CalcularAliquotaLucroAPartirDoMarkup(const pValorCusto: Double): Double;
var
  lAliquotaMarkup: double;
begin
  lAliquotaMarkup := Self.ConverterAliquotaMarkupParaCalculo();
  Result := (100 * lAliquotaMarkup - 100) / lAliquotaMarkup;
end;

function TComposicaoPreco.ComCusto(const Value: double): IComposicaoPreco;
begin
  FCusto := Value;
  Result := Self;
end;

function TComposicaoPreco.ComPrecoSugerido(const Value: double): IComposicaoPreco;
var
  lCustoTotal: Double;
begin
  lCustoTotal := Self.CalcularCustoTotal();
  FUtilizarMarkup := true;
  FAliquotaMarkup := Value * 100 / lCustoTotal - 100;
  FAliquotaLucro := Self.CalcularAliquotaLucroAPartirDoMarkup(lCustoTotal);
end;

constructor TComposicaoPreco.Create;
begin
  FAliquotaICMSCompra := 0;
  FTipoCalculoAliquotaICMSCompra := tcSomar;
  FAliquotaIPI := 0;
  FTipoCalculoAliquotaIPI := tcSomar;
  FAliquotaCOFINS := 0;
  FTipoCalculoAliquotaCOFINS := tcSomar;
  FAliquotaPIS := 0;
  FTipoCalculoAliquotaPIS := tcSomar;
  FAliquotaSubstituicaoTributaria := 0;
  FTipoCalculoAliquotaSubstituicaoTributaria := tcSomar;
  FAliquotaOutros := 0;
  FTipoCalculoAliquotaOutros := tcSomar;
  FValorOperacional := 0;
  FTipoCalculoValorOperacional := tcSomar;

  FCusto := 0;
  FAliquotaMarkup := 0;
  FAliquotaLucro := 0;
end;

function TComposicaoPreco.DesconsiderarCOFINS: IComposicaoPreco;
begin
  FTipoCalculoAliquotaCOFINS := tcDesconsiderar;
  FAliquotaCOFINS := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarICMSCompra: IComposicaoPreco;
begin
  FTipoCalculoAliquotaICMSCompra := tcDesconsiderar;
  FAliquotaICMSCompra := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarIPI: IComposicaoPreco;
begin
  FTipoCalculoAliquotaIPI := tcDesconsiderar;
  FAliquotaIPI := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarOutros: IComposicaoPreco;
begin
  FTipoCalculoAliquotaOutros := tcDesconsiderar;
  FAliquotaOutros := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarPIS: IComposicaoPreco;
begin
  FTipoCalculoAliquotaPIS := tcDesconsiderar;
  FAliquotaPIS := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarSubstituicaoTributaria: IComposicaoPreco;
begin
  FTipoCalculoAliquotaSubstituicaoTributaria := tcDesconsiderar;
  FAliquotaSubstituicaoTributaria := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarValorOperacional: IComposicaoPreco;
begin
  FTipoCalculoValorOperacional := tcDesconsiderar;
  FValorOperacional := 0;
  Result := Self;
end;

function TComposicaoPreco.GetAliquotaCOFINS: Double;
begin
  Result := FAliquotaCOFINS;
end;

function TComposicaoPreco.GetAliquotaICMSCompra: Double;
begin
  Result := FAliquotaICMSCompra;
end;

function TComposicaoPreco.GetAliquotaIPI: Double;
begin
  Result := FAliquotaIPI;
end;

function TComposicaoPreco.GetAliquotaLucro: Double;
begin
  Result := RoundTo(FAliquotaLucro, -FNumeroDeCasasDecimais);
end;

function TComposicaoPreco.GetAliquotaMarkup: Double;
begin
  Result := RoundTo(FAliquotaMarkup, -FNumeroDeCasasDecimais);
end;

function TComposicaoPreco.GetAliquotaOutros: Double;
begin
  Result := FAliquotaOutros;
end;

function TComposicaoPreco.GetAliquotaPIS: Double;
begin
  Result := FAliquotaPIS;
end;

function TComposicaoPreco.GetAliquotaSubstituicaoTributaria: Double;
begin
  Result := FAliquotaSubstituicaoTributaria;
end;

function TComposicaoPreco.GetCusto: Double;
begin
  Result := FCusto;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaCOFINS: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaCOFINS;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaICMSCompra: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaICMSCompra;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaIPI: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaIPI;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaOutros: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaOutros;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaPIS: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaPIS;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaSubstituicaoTributaria: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaSubstituicaoTributaria;
end;

function TComposicaoPreco.GetTipoCalculoValorOperacional: TTipoCalculo;
begin
  Result := FTipoCalculoValorOperacional;
end;

function TComposicaoPreco.GetValorOperacional: Double;
begin
  Result := FValorOperacional;
end;

procedure TComposicaoPreco.SetAliquotaCOFINS(const Value: Double);
begin
  FAliquotaCOFINS := Value;
end;

procedure TComposicaoPreco.SetAliquotaICMSCompra(const Value: Double);
begin
  FAliquotaICMSCompra := Value;
end;

procedure TComposicaoPreco.SetAliquotaIPI(const Value: Double);
begin
  FAliquotaIPI := Value;
end;

procedure TComposicaoPreco.SetAliquotaOutros(const Value: Double);
begin
  FAliquotaOutros := Value;
end;

procedure TComposicaoPreco.SetAliquotaPIS(const Value: Double);
begin
  FAliquotaPIS := Value;
end;

procedure TComposicaoPreco.SetAliquotaSubstituicaoTributaria(const Value: Double);
begin
  FAliquotaSubstituicaoTributaria := Value;
end;

procedure TComposicaoPreco.SetValorOperacional(const Value: Double);
begin
  FValorOperacional := Value;
end;

function TComposicaoPreco.SomarCOFINS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaCOFINS := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaCOFINS);
end;

function TComposicaoPreco.SomarICMSCompra: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaICMSCompra := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMSCompra);
end;

function TComposicaoPreco.SomarIPI: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaIPI := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaIPI);
end;

function TComposicaoPreco.SomarOutros: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaOutros := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaOutros);
end;

function TComposicaoPreco.SomarPIS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaPIS := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaPIS);
end;

function TComposicaoPreco.SomarSubstituicaoTributaria: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaSubstituicaoTributaria := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaSubstituicaoTributaria);
end;

function TComposicaoPreco.SomarValorOperacional: IComposicaoPrecoValor;
begin
  FTipoCalculoValorOperacional := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetValorOperacional);
end;

function TComposicaoPreco.SubtrairCOFINS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaCOFINS := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaCOFINS);
end;

function TComposicaoPreco.SubtrairICMSCompra: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaICMSCompra := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMSCompra);
end;

function TComposicaoPreco.SubtrairIPI: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaIPI := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaIPI);
end;

function TComposicaoPreco.SubtrairOutros: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaOutros := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaOutros);
end;

function TComposicaoPreco.SubtrairPIS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaPIS := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaPIS);
end;

function TComposicaoPreco.SubtrairSubstituicaoTributaria: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaSubstituicaoTributaria := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaSubstituicaoTributaria);
end;

function TComposicaoPreco.SubtrairValorOperacional: IComposicaoPrecoValor;
begin
  FTipoCalculoValorOperacional := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetValorOperacional);
end;

function TComposicaoPreco.DesconsiderarFrete: IComposicaoPreco;
begin
  FTipoCalculoFrete := tcDesconsiderar;
  FAliquotaFrete := 0;
  Result := Self;
end;

function TComposicaoPreco.GetAliquotaFrete: double;
begin
  Result := FAliquotaFrete;
end;

function TComposicaoPreco.GetTipoCalculoFrete: TTipoCalculo;
begin
  Result := FTipoCalculoFrete;
end;

function TComposicaoPreco.SomarFrete: IComposicaoPrecoAliquota;
begin
  FTipoCalculoFrete := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaFrete);
end;

function TComposicaoPreco.SubtrairFrete: IComposicaoPrecoAliquota;
begin
  FTipoCalculoFrete := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaFrete);
end;

procedure TComposicaoPreco.SetAliquotaFrete(const Value: Double);
begin
  FAliquotaFrete := Value;
end;

function TComposicaoPreco.DesconsiderarICMSVenda: IComposicaoPreco;
begin
  FTipoCalculoICMSVenda := tcDesconsiderar;
  FAliquotaICMSVenda := 0;
  Result := Self;
end;

function TComposicaoPreco.GetAliquotaICMSVenda: double;
begin
  Result := FAliquotaICMSVenda;
end;

function TComposicaoPreco.GetTipoCalculoAliquotaICMSVenda: TTipoCalculo;
begin
  Result := FTipoCalculoICMSVenda;
end;

function TComposicaoPreco.SomarICMSVenda: IComposicaoPrecoAliquota;
begin
  FTipoCalculoICMSVenda := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMSVenda);
end;

function TComposicaoPreco.SubtrairICMSVenda: IComposicaoPrecoAliquota;
begin
  FTipoCalculoICMSVenda := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMSVenda);
end;

procedure TComposicaoPreco.SetAliquotaICMSVenda(const Value: Double);
begin
  FAliquotaICMSVenda := Value;
end;

function TComposicaoPreco.GetNumeroDeCasasDecimais: Integer;
begin
  Result := FNumeroDeCasasDecimais;
end;

function TComposicaoPreco.UtilizarNumeroDeCasasDecimais(const Value: Integer): IComposicaoPreco;
begin
  FNumeroDeCasasDecimais := Value;
  Result := Self;
end;

function TComposicaoPreco.UtilizarMarkup: IComposicaoPrecoAliquota;
begin
  FUtilizarMarkup := true;
  FAliquotaLucro := 0;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaMarkup);
end;

procedure TComposicaoPreco.SetAliquotaMarkup(const Value: Double);
begin
  FAliquotaMarkup := Value;
end;

procedure TComposicaoPreco.SetAliquotaLucro(const Value: Double);
begin
  FAliquotaLucro := Value;
end;

function TComposicaoPreco.UtilizarLucro: IComposicaoPrecoAliquota;
begin
  FUtilizarMarkup := false;
  FAliquotaMarkup := 0;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaLucro);
end;

{ TComposicaoPrecoAtribuicaoValor }

function TComposicaoPrecoAtribuicaoValor.ComAliquota(pAliquota: Double): IComposicaoPreco;
begin
  FSet(pAliquota);
  Result := FComposicaoPreco;
end;

function TComposicaoPrecoAtribuicaoValor.ComValor(pValor: Double): IComposicaoPreco;
begin
  FSet(pValor);
  Result := FComposicaoPreco;
end;

constructor TComposicaoPrecoAtribuicaoValor.Create(pComposicaoPreco: IComposicaoPreco; pSet: TSetMethod);
begin
  FComposicaoPreco := pComposicaoPreco;
  FSet := pSet;
end;

end.
