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
    function AddTokenToTree(AToken: TToken; var ATokenTreeRoot: TTokenTree): TTokenTree;
    function EvaluateTokenTree(ATokenTree: TTokenTree): Variant;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PushToken(AToken: TToken);
    function Evaluate: Variant;
  end;

implementation

uses
  math,
  Operations,
  Exceptions;

constructor TSyntaxTree.Create;
begin
  inherited Create;
  FTokenTreeRoot := nil;
  FLastTokenTree := nil;
end;

destructor TSyntaxTree.Destroy;
begin
  FLastTokenTree := nil;
  if Assigned(FTokenTreeRoot) then
    FTokenTreeRoot.Free;
  inherited;
end;

procedure TSyntaxTree.PushToken(AToken: TToken);
begin
  if (FLastTokenTree = nil) and not TTokenUtils.IsNumberToken(AToken.TokenType) then
    raise EInvalidFirstToken.Create('First element must be a number');
  if
    (FLastTokenTree <> nil)
    and not TokenSequenceAllowed(FLastTokenTree.Value.TokenType, AToken.TokenType)
  then
      raise EInvalidTokenSequence.CreateFmt(
        'Sequence of "%s"("%s" "%s") not accepted at position %d',
        [
          TOKEN_TYPE_NAMES[AToken.TokenType],
          FLastTokenTree.Value.TokenString,
          AToken.TokenString,
          FLastTokenTree.Value.TokenPosition
        ]
      );
  FLastTokenTree := AddTokenToTree(AToken, FTokenTreeRoot);
end;

function TSyntaxTree.TokenSequenceAllowed(A, B: ETokenType): boolean;
begin
  Result :=
    (TTokenUtils.IsOperationToken(A) and TTokenUtils.IsNumberToken(B))
    or (TTokenUtils.IsNumberToken(A) and TTokenUtils.IsOperationToken(B));
end;

function TSyntaxTree.AddTokenToTree(AToken: TToken; var ATokenTreeRoot: TTokenTree): TTokenTree;
begin
  if ATokenTreeRoot = nil then
  begin
    ATokenTreeRoot := TTokenTree.Create(AToken);
    exit(ATokenTreeRoot);
  end;
  if TTokenUtils.IsNumberToken(ATokenTreeRoot.Value.TokenType) then
  begin
    Result := TTokenTree.Create(AToken);
    Result.Left := ATokenTreeRoot;
    ATokenTreeRoot := Result;
    exit;
  end;
  if TTokenUtils.IsNumberToken(AToken.TokenType) then
  begin
    FLastTokenTree.Right := TTokenTree.Create(AToken);
    exit(FLastTokenTree.Right);
  end;
  if
    TTokenUtils.CompareTokenPrecedence(
      ATokenTreeRoot.Value.TokenType,
      AToken.TokenType
    ) = LessThanValue then
  begin
    exit(AddTokenToTree(AToken, ATokenTreeRoot.Right));
  end
  else
  begin
    Result := TTokenTree.Create(AToken);
    Result.Left := ATokenTreeRoot;
    ATokenTreeRoot := Result;
    exit;
  end;
end;

function TSyntaxTree.Evaluate: Variant;
begin
  if FLastTokenTree = nil then
    exit(0);
  if not (FLastTokenTree.Value.TokenType in [INT, ETokenType.FLOAT]) then
    raise EInvalidLastToken.CreateFmt('Expression terminated with "%s" not accepted', [FLastTokenTree.Value.TokenString]);

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
      raise EConvertError.CreateFmt(
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
    EXPONENTIATION, MULTIPLICATION, DIVISION, ADDITION, SUBTRACTION:
    begin
      if not Assigned(ATokenTree.Left) or not Assigned(ATokenTree.Right) then
        raise EMissingOperand.CreateFmt(
          'Binary expression missing left and/or right operand at position %d',
          [ATokenTree.Value.TokenPosition]
        );
      case ATokenTree.Value.TokenType of
        EXPONENTIATION:
          Result :=
            math.Power(
              EvaluateTokenTree(ATokenTree.Left),
              EvaluateTokenTree(ATokenTree.Right)
            );
        MULTIPLICATION:
          Result :=
            Multiply(
              EvaluateTokenTree(ATokenTree.Left),
              EvaluateTokenTree(ATokenTree.Right)
            );
        DIVISION:
          Result :=
            Divide(
              EvaluateTokenTree(ATokenTree.Left),
              EvaluateTokenTree(ATokenTree.Right)
            );
        ADDITION:
          Result :=
            Add(
              EvaluateTokenTree(ATokenTree.Left),
              EvaluateTokenTree(ATokenTree.Right)
            );
        SUBTRACTION:
          Result :=
            Subtract(
              EvaluateTokenTree(ATokenTree.Left),
              EvaluateTokenTree(ATokenTree.Right)
            );
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
    raise ENotImplemented.CreateFmt(
      'Token "%s" of type %d not implemented',
      [ATokenTree.Value.TokenString, Ord(ATokenTree.Value.TokenType)]
    );
  end;
end;
end.
