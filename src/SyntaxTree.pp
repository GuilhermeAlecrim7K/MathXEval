unit SyntaxTree;

{$mode delphi}

interface

uses
  SysUtils,
  Generics.Collections,
  Token;

type
  TSyntaxTree = class
  private
    FTokenTreeRoot: TTokenTree;
    FLastTokenTree: TTokenTree;
    function TokenSequenceAllowed(A, B: ETokenType): boolean;
    function AddTokenToTree(AToken: TToken): TTokenTree;
    function EvaluateTokenTree(ATokenTree: TTokenTree): Variant;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PushToken(AToken: TToken);
    function Evaluate: Variant;
  end;

implementation

uses
  Math,
  Operations;

constructor TSyntaxTree.Create;
begin
  inherited Create;
  FLastTokenTree := nil;
end;

destructor TSyntaxTree.Destroy;
begin
  if Assigned(FTokenTreeRoot) then
    FTokenTreeRoot.Free;
  inherited;
end;

procedure TSyntaxTree.PushToken(AToken: TToken);
begin
  if (FLastTokenTree = nil) and not TTokenUtils.IsNumberToken(AToken.TokenType) then
    raise Exception.Create('First element must be a number');
  if
    (FLastTokenTree <> nil)
    and not TokenSequenceAllowed(FLastTokenTree.Value.TokenType, AToken.TokenType)
  then
      raise Exception.CreateFmt(
        'Sequence of "%s"("%s" "%s") not accepted at position %d',
        [
          TOKEN_TYPE_NAMES[AToken.TokenType],
          FLastTokenTree.Value.TokenString,
          AToken.TokenString,
          FLastTokenTree.Value.TokenPosition
        ]
      );
  FLastTokenTree := AddTokenToTree(AToken);
end;

function TSyntaxTree.TokenSequenceAllowed(A, B: ETokenType): boolean;
begin
  Result :=
    (TTokenUtils.IsOperationToken(A) and TTokenUtils.IsNumberToken(B))
    or (TTokenUtils.IsNumberToken(A) and TTokenUtils.IsOperationToken(B));
end;

function TSyntaxTree.AddTokenToTree(AToken: TToken): TTokenTree;
begin
  Result := TTokenTree.Create(AToken);
  if FTokenTreeRoot = nil then
  begin
    FTokenTreeRoot := Result;
    exit;
  end;
  if TTokenUtils.IsNumberToken(AToken.TokenType) then
  begin
    FLastTokenTree.Right := Result;
    exit;
  end;
  if TTokenUtils.IsNumberToken(FTokenTreeRoot.Value.TokenType) then
  begin
    Result.Left := FTokenTreeRoot;
    FTokenTreeRoot := Result;
    exit;
  end;
  if
    TTokenUtils.CompareTokenPrecedence(
      AToken.TokenType,
      FTokenTreeRoot.Value.TokenType
    ) = GreaterThanValue then
  begin
    Result.Left := FTokenTreeRoot.Right;
    FTokenTreeRoot.Right := Result;
    exit;
  end
  else
  begin
    Result.Left := FTokenTreeRoot;
    FTokenTreeRoot := Result;
    exit;
  end;
end;

function TSyntaxTree.Evaluate: Variant;
begin
  if FLastTokenTree = nil then
    exit(0);
  if not (FLastTokenTree.Value.TokenType in [INT, ETokenType.FLOAT]) then
    raise Exception.CreateFmt('Expression terminated with "%s" not accepted', [FLastTokenTree.Value.TokenString]);

  Result := EvaluateTokenTree(FTokenTreeRoot);
end;

function TSyntaxTree.EvaluateTokenTree(ATokenTree: TTokenTree): Variant;
var
  IntResult: integer;
  FloatResult: double;
  ErrorInteger: integer;
  procedure CheckForConversionError;
  begin
    if ErrorInteger <> 0 then
      raise Exception.CreateFmt(
        'Error converting "%s" to "%s" at position %d',
        [
          ATokenTree.Value.TokenString,
          TOKEN_TYPE_NAMES[ATokenTree.Value.TokenType],
          ATokenTree.Value.TokenPosition
        ]
      );
  end;
begin
  if ATokenTree = nil then
    Exit(0);
  case ATokenTree.Value.TokenType of
    MULTIPLICATION, DIVISION, ADDITION, SUBTRACTION:
    begin
      if not Assigned(ATokenTree.Left) or not Assigned(ATokenTree.Right) then
        raise Exception.CreateFmt(
          'Binary expression missing left and/or right operand at position %d',
          [ATokenTree.Value.TokenPosition]
        );
      case ATokenTree.Value.TokenType of
        MULTIPLICATION: Result := Multiply(EvaluateTokenTree(ATokenTree.Left), EvaluateTokenTree(ATokenTree.Right));
        DIVISION: Result := Divide(EvaluateTokenTree(ATokenTree.Left), EvaluateTokenTree(ATokenTree.Right));
        ADDITION: Result := Add(EvaluateTokenTree(ATokenTree.Left), EvaluateTokenTree(ATokenTree.Right));
        SUBTRACTION: Result := Subtract(EvaluateTokenTree(ATokenTree.Left), EvaluateTokenTree(ATokenTree.Right));
      end;
    end;
    INT:
    begin
      Val(ATokenTree.Value.TokenString, IntResult, ErrorInteger);
      CheckForConversionError;
      Result := IntResult;
    end;
    ETokenType.FLOAT:
    begin
      Val(ATokenTree.Value.TokenString, FloatResult, ErrorInteger);
      CheckForConversionError;
      Result := FloatResult;
    end;
  else
    raise Exception.CreateFmt(
      'Token "%s" of type %d not implemented',
      [ATokenTree.Value.TokenString, Ord(ATokenTree.Value.TokenType)]
    );
  end;
end;
end.
