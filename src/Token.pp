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
    EXPONENTIATION,
    MULTIPLICATION,
    DIVISION,
    ADDITION,
    SUBTRACTION,
    INT,
    FLOAT
  );

const
  TOKEN_TYPE_NAMES: array [ETokenType] of string = (
    'Exponentiation',
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
    class function CompareTokenPrecedence(APrevious, ANew: ETokenType): TValueRelationship;
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
  Result :=
    ATokenType in [
      EXPONENTIATION, MULTIPLICATION, DIVISION, ADDITION, SUBTRACTION
    ];
end;

class function TTokenUtils.IsNumberToken(ATokenType: ETokenType): boolean;
begin
  Result := ATokenType in [INT, FLOAT];
end;

class function TTokenUtils.CompareTokenPrecedence(APrevious, ANew: ETokenType): TValueRelationship;
begin
  if IsNumberToken(APrevious) or IsNumberToken(ANew) then
    raise Exception.Create('Cannot compare precedence with a number token');
  case APrevious of
    EXPONENTIATION:
    begin
      if ANew = EXPONENTIATION then
        Result := LessThanValue
      else
        Result := GreaterThanValue;
    end;
    MULTIPLICATION, DIVISION:
    begin
      case ANew of
        MULTIPLICATION, DIVISION: Result := EqualsValue;
        EXPONENTIATION: Result := LessThanValue;
        ADDITION, SUBTRACTION: Result := GreaterThanValue;
      else
        raise ENotImplemented.CreateFmt('Token type %d not implemented', [Ord(ANew)]);
      end;
    end;
    ADDITION, SUBTRACTION:
    begin
      case ANew of
        ADDITION, SUBTRACTION: Result := EqualsValue;
        MULTIPLICATION, DIVISION, EXPONENTIATION: Result := LessThanValue;
      else
        raise ENotImplemented.CreateFmt('Token type %d not implemented', [Ord(ANew)]);
      end;
    end;
  else
    raise ENotImplemented.CreateFmt('Token type %d not implemented', [Ord(APrevious)]);
  end;
end;

end.
