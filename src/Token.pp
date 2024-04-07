unit Token;

{$mode delphi}

interface

uses
  SysUtils,
  Math,
  Generics.Collections,
  BinaryTree;

type
  ETokenType = (
    MULTIPLICATION,
    DIVISION,
    ADDITION,
    SUBTRACTION,
    INT,
    FLOAT
  );

const
  TOKEN_TYPE_NAMES: array [ETokenType] of string = (
    'Multiplication',
    'Division',
    'Addition',
    'Subtraction',
    'Integer',
    'Float'
  );

type
  TToken = class
  private
    FTokenPosition: integer;
    FTokenString: string;
    FTokenType: ETokenType;
  public
    constructor Create(ATokenPosition: integer; const ATokenString: string; ATokenType: ETokenType);
    property TokenPosition: integer read FTokenPosition;
    property TokenString: string read FTokenString;
    property TokenType: ETokenType read FTokenType;
  end;

  TTokenTree = TObjectBinaryTree<TToken>;

  TTokenUtils = class
  public
    class function IsOperationToken(ATokenType: ETokenType): boolean;
    class function IsNumberToken(ATokenType: ETokenType): boolean;
    class function CompareTokenPrecedence(A, B: ETokenType): TValueRelationship;
  end;

implementation

{ TToken }

constructor TToken.Create(ATokenPosition: integer; const ATokenString: string; ATokenType: ETokenType);
begin
  inherited Create;
  FTokenPosition := ATokenPosition;
  FTokenString := ATokenString;
  FTokenType := ATokenType;
end;

{ TTokenUtils }

class function TTokenUtils.IsOperationToken(ATokenType: ETokenType): boolean;
begin
  Result := ATokenType in [MULTIPLICATION, DIVISION, ADDITION, SUBTRACTION];
end;

class function TTokenUtils.IsNumberToken(ATokenType: ETokenType): boolean;
begin
  Result := ATokenType in [INT, FLOAT];
end;

class function TTokenUtils.CompareTokenPrecedence(A, B: ETokenType): TValueRelationship;
begin
  if IsNumberToken(A) or IsNumberToken(B) then
    raise Exception.Create('Cannot compare precedence with a number token');
  Result := GreaterThanValue;
  case A of
    MULTIPLICATION, DIVISION:
    begin
      case B of
        MULTIPLICATION, DIVISION: Result := EqualsValue;
      end;
    end;
    ADDITION, SUBTRACTION:
    begin
      case B of
        ADDITION, SUBTRACTION: Result := EqualsValue;
        MULTIPLICATION, DIVISION: Result := LessThanValue;
      end;
    end;
  else
    raise Exception.CreateFmt('Token type %d not implemented', [Ord(A)]);
  end;
end;

end.
