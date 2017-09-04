unit ComposicaoPreco;

interface

type
  TTipoCalculo = (tcSomar, tcDesconsiderar, tcSubtrair);

  IComposicaoPrecoAliquota = interface;
  IComposicaoPrecoValor = interface;

  IComposicaoPreco = interface
  ['{1DDFE24C-3577-44DD-989F-14593A120F24}']
    function SomarICMS(): IComposicaoPrecoAliquota;
    function DesconsiderarICMS(): IComposicaoPreco;
    function SubtrairICMS(): IComposicaoPrecoAliquota;
    function GetTipoCalculoAliquotaICMS(): TTipoCalculo;
    function GetAliquotaICMS(): double;

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

    function ComCusto(const Value: double): IComposicaoPreco;
    function GetCusto(): double;

    function GetAliquotaLucro(): double;
    function GetAliquotaMarkup(): double;

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

  TComposicaoPreco = class(TInterfacedObject, IComposicaoPreco)
  private
    FAliquotaICMS: double;
    FTipoCalculoAliquotaICMS: TTipoCalculo;
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

    FCusto: double;

    function CalcularValorPorAliquota(pAliquota: Double; pTipoCalculo: TTipoCalculo): Double;
    function CalcularValorICMS(): Double;
    function CalcularValorIPI: Double;
    function CalcularValorPIS: Double;

  protected
    procedure SetAliquotaCOFINS(const Value: Double);
    procedure SetAliquotaICMS(const Value: Double);
    procedure SetAliquotaIPI(const Value: Double);
    procedure SetAliquotaOutros(const Value: Double);
    procedure SetAliquotaPIS(const Value: Double);
    procedure SetAliquotaSubstituicaoTributaria(const Value: Double);
    procedure SetValorOperacional(const Value: Double);

  public
    constructor Create();

    function Calcular(): double;
    
    function DesconsiderarCOFINS: IComposicaoPreco;
    function DesconsiderarICMS: IComposicaoPreco;
    function DesconsiderarIPI: IComposicaoPreco;
    function DesconsiderarOutros: IComposicaoPreco;
    function DesconsiderarPIS: IComposicaoPreco;
    function DesconsiderarSubstituicaoTributaria: IComposicaoPreco;
    function DesconsiderarValorOperacional: IComposicaoPreco;
    function SomarCOFINS: IComposicaoPrecoAliquota;
    function SomarICMS: IComposicaoPrecoAliquota;
    function SomarIPI: IComposicaoPrecoAliquota;
    function SomarOutros: IComposicaoPrecoAliquota;
    function SomarPIS: IComposicaoPrecoAliquota;
    function SomarSubstituicaoTributaria: IComposicaoPrecoAliquota;
    function SomarValorOperacional: IComposicaoPrecoValor;
    function SubtrairCOFINS: IComposicaoPrecoAliquota;
    function SubtrairICMS: IComposicaoPrecoAliquota;
    function SubtrairIPI: IComposicaoPrecoAliquota;
    function SubtrairOutros: IComposicaoPrecoAliquota;
    function SubtrairPIS: IComposicaoPrecoAliquota;
    function SubtrairSubstituicaoTributaria: IComposicaoPrecoAliquota;
    function SubtrairValorOperacional: IComposicaoPrecoValor;

    function ComCusto(const Value: double): IComposicaoPreco;

    function GetAliquotaCOFINS: Double;
    function GetAliquotaICMS: Double;
    function GetAliquotaIPI: Double;
    function GetAliquotaOutros: Double;
    function GetAliquotaPIS: Double;
    function GetAliquotaSubstituicaoTributaria: Double;
    function GetValorOperacional: Double;
    function GetCusto: Double;

    function GetTipoCalculoAliquotaICMS: TTipoCalculo;
    function GetTipoCalculoAliquotaCOFINS: TTipoCalculo;
    function GetTipoCalculoAliquotaIPI: TTipoCalculo;
    function GetTipoCalculoAliquotaOutros: TTipoCalculo;
    function GetTipoCalculoAliquotaPIS: TTipoCalculo;
    function GetTipoCalculoAliquotaSubstituicaoTributaria: TTipoCalculo;
    function GetTipoCalculoValorOperacional: TTipoCalculo;

    function GetAliquotaLucro(): Double;
    function GetAliquotaMarkup(): Double;

  end;

implementation

{ TComposicaoPreco }

type
  TSetMethod = procedure(const value: double) of object;

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
var
  lResultado: double;
begin
  lResultado := FCusto;
  lResultado := lResultado + Self.CalcularValorICMS();
  lResultado := lResultado + Self.CalcularValorIPI();
  lResultado := lResultado + Self.CalcularValorPIS();
  Result := lResultado;
end;

function TComposicaoPreco.CalcularValorPorAliquota(pAliquota: Double; pTipoCalculo: TTipoCalculo): Double;
var
  lValor: double;
begin
  if (pAliquota = 0) then
  begin
    Result := 0;
    Exit;
  end;

  lValor := FCusto * pAliquota / 100;
  case pTipoCalculo of
    tcSomar: Result := lValor;
    tcSubtrair: Result := -lValor;
  else
    Result := 0;
  end;
end;

function TComposicaoPreco.CalcularValorICMS: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaICMS, FTipoCalculoAliquotaICMS);
end;

function TComposicaoPreco.CalcularValorIPI: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaIPI, FTipoCalculoAliquotaIPI);
end;

function TComposicaoPreco.CalcularValorPIS: Double;
begin
  Result := Self.CalcularValorPorAliquota(FAliquotaPIS, FTipoCalculoAliquotaPIS);
end;

function TComposicaoPreco.ComCusto(const Value: double): IComposicaoPreco;
begin
  FCusto := Value;
  Result := Self;
end;

constructor TComposicaoPreco.Create;
begin
  FAliquotaICMS := 0;
  FTipoCalculoAliquotaICMS := tcSomar;
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
end;

function TComposicaoPreco.DesconsiderarCOFINS: IComposicaoPreco;
begin
  FTipoCalculoAliquotaCOFINS := tcDesconsiderar;
  FAliquotaCOFINS := 0;
  Result := Self;
end;

function TComposicaoPreco.DesconsiderarICMS: IComposicaoPreco;
begin
  FTipoCalculoAliquotaICMS := tcDesconsiderar;
  FAliquotaICMS := 0;
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

function TComposicaoPreco.GetAliquotaICMS: Double;
begin
  Result := FAliquotaICMS;
end;

function TComposicaoPreco.GetAliquotaIPI: Double;
begin
  Result := FAliquotaIPI;
end;

function TComposicaoPreco.GetAliquotaLucro: Double;
begin
  Result := 0;
end;

function TComposicaoPreco.GetAliquotaMarkup: Double;
begin
  Result := 0;
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

function TComposicaoPreco.GetTipoCalculoAliquotaICMS: TTipoCalculo;
begin
  Result := FTipoCalculoAliquotaICMS;
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

procedure TComposicaoPreco.SetAliquotaICMS(const Value: Double);
begin
  FAliquotaICMS := Value;
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

function TComposicaoPreco.SomarICMS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaICMS := tcSomar;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMS);
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

function TComposicaoPreco.SubtrairICMS: IComposicaoPrecoAliquota;
begin
  FTipoCalculoAliquotaICMS := tcSubtrair;
  Result := TComposicaoPrecoAtribuicaoValor.Create(Self, Self.SetAliquotaICMS);
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
