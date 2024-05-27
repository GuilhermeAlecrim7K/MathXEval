unit SyntaxTree;

{$mode delphi}

interface

uses
  SysUtils,
  Generics.Collections,
  Token,
  TokenTree;

type
  TSyntaxTree = class
  private
    FTokenTreeRoot: TTokenTree;
    FLastTokenTree: TTokenTree;
    FCurrentPriorityLevel: Byte;
    function TokenSequenceAllowed(A, B: ETokenType): boolean;
    function AddTokenToTree(AToken: TToken; var ATokenTreeRoot: TTokenTree): TTokenTree;
    function EvaluateTokenTree(ATokenTree: TTokenTree): Variant;
    procedure ValidateLastToken;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PushToken(var AToken: TToken);
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
  FCurrentPriorityLevel := 1;
end;

destructor TSyntaxTree.Destroy;
begin
  FLastTokenTree := nil;
  if Assigned(FTokenTreeRoot) then
    FTokenTreeRoot.Free;
  inherited Destroy;
end;

procedure TSyntaxTree.PushToken(var AToken: TToken);
begin
  if
    (FLastTokenTree = nil)
    and not (AToken.TokenType in [INT, ETokenType.FLOAT, PARENTHESIS_OPENING])
  then
    raise EInvalidFirstToken.Create(
      'First element must be either a number or an opening parenthesis'
    );
  if
    (FLastTokenTree <> nil)
    and not TokenSequenceAllowed(
      FLastTokenTree.Value.TokenType, AToken.TokenType
    )
  then
    raise EInvalidTokenSequence.CreateFmt(
      'Sequence "%s %s" not accepted at position %d',
      [
        FLastTokenTree.Value.TokenString,
        AToken.TokenString,
        FLastTokenTree.Value.TokenPosition
      ]
    );
  case AToken.TokenType of
    PARENTHESIS_OPENING:
    begin
      try
        Inc(FCurrentPriorityLevel);
      finally
        FreeAndNil(AToken);
      end;
    end;
    PARENTHESIS_CLOSING:
    begin
      try
        if (FCurrentPriorityLevel = 1) then
          raise EParenthesesMismatch.CreateFmt(
            'There was an attempt to close a parenthesis that was not ' +
            'previously opened at position %d.',
            [AToken.TokenPosition]
          );
        ValidateLastToken;

        Dec(FCurrentPriorityLevel);
      finally
        FreeAndNil(AToken);
      end;
    end;
    EXPONENTIATION, MULTIPLICATION, DIVISION, ADDITION, SUBTRACTION, INT,
    ETokenType.FLOAT:
      FLastTokenTree := AddTokenToTree(AToken, FTokenTreeRoot);
  else
    raise ENotImplemented.Create('Token Type not implemented.');
  end;
end;

function TSyntaxTree.TokenSequenceAllowed(A, B: ETokenType): boolean;
begin
  case A of
    PARENTHESIS_OPENING, EXPONENTIATION, MULTIPLICATION, DIVISION, ADDITION,
    SUBTRACTION:
      Result := TTokenUtils.IsNumberToken(B) or (B = PARENTHESIS_OPENING);
    PARENTHESIS_CLOSING, INT, ETokenType.FLOAT:
      Result := TTokenUtils.IsOperationToken(B) or (B = PARENTHESIS_CLOSING);
  else
    raise ENotImplemented.Create('Token type not implemented');
  end;
end;

function TSyntaxTree.AddTokenToTree(AToken: TToken; var ATokenTreeRoot: TTokenTree): TTokenTree;
begin
  if ATokenTreeRoot = nil then
  begin
    ATokenTreeRoot := TTokenTree.Create(AToken, FCurrentPriorityLevel);
    exit(ATokenTreeRoot);
  end;
  if TTokenUtils.IsNumberToken(ATokenTreeRoot.Value.TokenType) then
  begin
    Result := TTokenTree.Create(AToken, FCurrentPriorityLevel);
    Result.Left := ATokenTreeRoot;
    ATokenTreeRoot := Result;
    exit;
  end;
  if TTokenUtils.IsNumberToken(AToken.TokenType) then
  begin
    FLastTokenTree.Right := TTokenTree.Create(AToken, FCurrentPriorityLevel);
    exit(FLastTokenTree.Right);
  end;
  if
    (FCurrentPriorityLevel > ATokenTreeRoot.PriorityLevel)
    or (
      TTokenUtils.CompareTokenPrecedence(
        ATokenTreeRoot.Value.TokenType,
        AToken.TokenType
      ) = LessThanValue
    )
  then
    exit(AddTokenToTree(AToken, ATokenTreeRoot.Right))
  else
  begin
    Result := TTokenTree.Create(AToken, FCurrentPriorityLevel);
    Result.Left := ATokenTreeRoot;
    ATokenTreeRoot := Result;
    exit;
  end;
end;

function TSyntaxTree.Evaluate: Variant;
begin
  if FLastTokenTree = nil then
    exit(0);
  if FCurrentPriorityLevel > 1 then
    raise EParenthesesMismatch.Create(
      'One or more parentheses have not been closed.'
    );
  ValidateLastToken;

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

procedure TSyntaxTree.ValidateLastToken;
begin
  if not TTokenUtils.IsNumberToken(FLastTokenTree.Value.TokenType) then
    raise EInvalidLastToken.CreateFmt(
      'Expression terminated with "%s" at position %d not accepted',
      [FLastTokenTree.Value.TokenString, FLastTokenTree.Value.TokenPosition]
    );
end;
end.
