unit ExpressionLanguage4Delphi.Types;

interface

uses System.Classes;

type
{$SCOPEDENUMS ON}
  TCondicaoFiltro = (IGUAL, MAIOR, MAIOR_IGUAL, MENOR, MENOR_IGUAL, DIFERENTE, INTERVALO, COMECE, CONTENHA, TERMINE, NAO_NULO, NULO,
    SEQUENCIA, INTERVALO_NAO, COMECE_NAO, CONTENHA_NAO, TERMINE_NAO, SEQUENCIA_NAO, MES_IGUAL, ANO_IGUAL);
{$SCOPEDENUMS OFF}

  TCondicaoFiltroHelper = record helper for TCondicaoFiltro
    /// <returns>
    /// Retorna o valor referente á condição de filtro selecionada.
    /// </returns>
    function GetValue: Integer;
    /// <summary>
    /// Converte o enum para uma string de fácil entendimento para o usuário.
    /// </summary>
    function ToString: string;
    /// <summary>
    /// Converte o enum para o expression language;
    /// </summary>
    function ToExpressionLanguage: string;
  end;

procedure CondicaoLoadComboBox(const Items: TStrings);
function ExpressionLanguageToCondicaoFiltro(const AExpression: string): TCondicaoFiltro;

implementation

uses System.StrUtils;

function ExpressionLanguageToCondicaoFiltro(const AExpression: string): TCondicaoFiltro;
begin
  case AnsiIndexStr(AExpression, ['eq', 'gt', 'ge', 'lt', 'le', 'ne', 'gap', 'begin', 'c', 'eeq', 'nnull', 'null', 'seq', 'ngap',
    'nbegin', 'nc', 'neeq', 'nseq', 'meq', 'yeq']) of
    0:
      Result := TCondicaoFiltro.IGUAL;
    1:
      Result := TCondicaoFiltro.MAIOR;
    2:
      Result := TCondicaoFiltro.MAIOR_IGUAL;
    3:
      Result := TCondicaoFiltro.MENOR;
    4:
      Result := TCondicaoFiltro.MENOR_IGUAL;
    5:
      Result := TCondicaoFiltro.DIFERENTE;
    6:
      Result := TCondicaoFiltro.INTERVALO;
    7:
      Result := TCondicaoFiltro.COMECE;
    8:
      Result := TCondicaoFiltro.CONTENHA;
    9:
      Result := TCondicaoFiltro.TERMINE;
    10:
      Result := TCondicaoFiltro.NAO_NULO;
    11:
      Result := TCondicaoFiltro.NULO;
    12:
      Result := TCondicaoFiltro.SEQUENCIA;
    13:
      Result := TCondicaoFiltro.INTERVALO_NAO;
    14:
      Result := TCondicaoFiltro.COMECE_NAO;
    15:
      Result := TCondicaoFiltro.CONTENHA_NAO;
    16:
      Result := TCondicaoFiltro.TERMINE_NAO;
    17:
      Result := TCondicaoFiltro.SEQUENCIA_NAO;
    18:
      Result := TCondicaoFiltro.MES_IGUAL;
  else
    Result := TCondicaoFiltro.ANO_IGUAL;
  end;
end;

procedure CondicaoLoadComboBox(const Items: TStrings);
var
  Indice: Integer;
begin
  Items.Clear;
  for Indice := Ord(Low(TCondicaoFiltro)) to Ord(High(TCondicaoFiltro)) do
    Items.Add(TCondicaoFiltro(Indice).ToString);
end;

function TCondicaoFiltroHelper.GetValue: Integer;
begin
  Result := Ord(Self);
end;

function TCondicaoFiltroHelper.ToExpressionLanguage: string;
begin
  case Self of
    TCondicaoFiltro.IGUAL:
      Result := 'eq';
    TCondicaoFiltro.MAIOR:
      Result := 'gt';
    TCondicaoFiltro.MAIOR_IGUAL:
      Result := 'ge';
    TCondicaoFiltro.MENOR:
      Result := 'lt';
    TCondicaoFiltro.MENOR_IGUAL:
      Result := 'le';
    TCondicaoFiltro.DIFERENTE:
      Result := 'ne';
    TCondicaoFiltro.INTERVALO:
      Result := 'gap';
    TCondicaoFiltro.COMECE:
      Result := 'begin';
    TCondicaoFiltro.CONTENHA:
      Result := 'c';
    TCondicaoFiltro.TERMINE:
      Result := 'eeq';
    TCondicaoFiltro.NAO_NULO:
      Result := 'nnull';
    TCondicaoFiltro.NULO:
      Result := 'null';
    TCondicaoFiltro.SEQUENCIA:
      Result := 'seq';
    TCondicaoFiltro.INTERVALO_NAO:
      Result := 'ngap';
    TCondicaoFiltro.COMECE_NAO:
      Result := 'nbegin';
    TCondicaoFiltro.CONTENHA_NAO:
      Result := 'nc';
    TCondicaoFiltro.TERMINE_NAO:
      Result := 'neeq';
    TCondicaoFiltro.SEQUENCIA_NAO:
      Result := 'nseq';
    TCondicaoFiltro.MES_IGUAL:
      Result := 'meq';
  else
    Result := 'yeq';
  end;
end;

function TCondicaoFiltroHelper.ToString: string;
begin
  case Self of
    TCondicaoFiltro.IGUAL:
      Result := 'Igual';
    TCondicaoFiltro.MAIOR:
      Result := 'Maior';
    TCondicaoFiltro.MAIOR_IGUAL:
      Result := 'Maior/Igual';
    TCondicaoFiltro.MENOR:
      Result := 'Menor';
    TCondicaoFiltro.MENOR_IGUAL:
      Result := 'Menor/Igual';
    TCondicaoFiltro.DIFERENTE:
      Result := 'Diferente';
    TCondicaoFiltro.INTERVALO:
      Result := 'Intervalo';
    TCondicaoFiltro.COMECE:
      Result := 'Que Comece';
    TCondicaoFiltro.CONTENHA:
      Result := 'Que Contenha';
    TCondicaoFiltro.TERMINE:
      Result := 'Que Termine';
    TCondicaoFiltro.NAO_NULO:
      Result := 'Não Nulo';
    TCondicaoFiltro.NULO:
      Result := 'Nulo';
    TCondicaoFiltro.SEQUENCIA:
      Result := 'Sequência';
    TCondicaoFiltro.INTERVALO_NAO:
      Result := 'Intervalo (Não)';
    TCondicaoFiltro.COMECE_NAO:
      Result := 'Que Comece (Não)';
    TCondicaoFiltro.CONTENHA_NAO:
      Result := 'Que Contenha (Não)';
    TCondicaoFiltro.TERMINE_NAO:
      Result := 'Que Termine (Não)';
    TCondicaoFiltro.SEQUENCIA_NAO:
      Result := 'Sequência (Não)';
    TCondicaoFiltro.MES_IGUAL:
      Result := 'Mês Igual';
  else
    Result := 'Ano Igual';
  end;
end;

end.
