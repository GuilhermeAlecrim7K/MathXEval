unit ExpressionEvaluator;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  SyntaxTree,
  Token;

type
  TExpressionEvaluator = class
  private
    procedure PopulateTree(ASyntaxTree: TSyntaxTree; const AExpression: string);
  public
    function Evaluate(const AExpression: string): Variant;
  end;

implementation

uses
  Exceptions;

function TExpressionEvaluator.Evaluate(const AExpression: string): Variant;
var
  SyntaxTree: TSyntaxTree;
begin
  SyntaxTree := TSyntaxTree.Create;
  try
    PopulateTree(SyntaxTree, AExpression);
    Result := SyntaxTree.Evaluate;
  finally
    FreeAndNil(SyntaxTree);
  end;
end;

procedure TExpressionEvaluator.PopulateTree(ASyntaxTree: TSyntaxTree;
  const AExpression: string);
var
  I: integer;
  numberStr: string;
  isFloat: boolean;
  CurToken: TToken;
  procedure ParseNumber;
  begin
    while (I <= Length(AExpression)) and ((AExpression[I] in ['0'..'9']) or (AExpression[I] = '.')) do
    begin
      if
        ((numberStr = '') and (AExpression[I] = '.'))
        or (isFloat and (AExpression[I] = '.'))
      then
        raise EInvalidToken.Create('Invalid floating point number');
      isFloat := isFloat or (AExpression[I] = '.');
      numberStr := numberStr + AExpression[I];
      Inc(I);
    end;
    if isFloat then
      CurToken := TToken.Create(I, numberStr, FLOAT)
    else
      CurToken := TToken.Create(I, numberStr, INT);
    Dec(I);
  end;
begin
  I := 1;
  while I <= Length(AExpression) do
  begin
    numberStr := '';
    isFloat := false;
    CurToken := nil;
    case AExpression[I] of
      ' ': ;
      '*': CurToken := TToken.Create(I, '*', MULTIPLICATION);
      '/': CurToken := TToken.Create(I, '/', DIVISION);
      '-': CurToken := TToken.Create(I, '-', SUBTRACTION);
      '+': CurToken := TToken.Create(I, '+', ADDITION);
      '.', '0'..'9': ParseNumber;
    else
      raise EInvalidToken.CreateFmt('Token "%s" invalid at position %d', [AExpression[I], I]);
    end;
    try
      if CurToken <> nil then
        ASyntaxTree.PushToken(CurToken);
    except
      FreeAndNil(CurToken);
      raise;
    end;
    Inc(I);
  end;
end;

end.
