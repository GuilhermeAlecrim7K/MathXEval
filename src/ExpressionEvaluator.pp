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
    FSyntaxTree: TSyntaxTree;
    procedure PopulateTree(const AExpression: string);
  public
    function Evaluate(const AExpression: string): Variant;
  end;

implementation

uses
  Exceptions;

function TExpressionEvaluator.Evaluate(const AExpression: string): Variant;
begin
  FSyntaxTree := TSyntaxTree.Create;
  try
    PopulateTree(AExpression);
    Result := FSyntaxTree.Evaluate;
  finally
    FreeAndNil(FSyntaxTree);
  end;
end;

procedure TExpressionEvaluator.PopulateTree(const AExpression: string);
var
  I: integer;
  numberStr: string;
  isFloat: boolean;
begin
  I := 1;
  while I <= Length(AExpression) do
  begin
    numberStr := '';
    isFloat := false;
    case AExpression[I] of
      ' ': ;
      '*': FSyntaxTree.PushToken(TToken.Create(I, '*', MULTIPLICATION));
      '/': FSyntaxTree.PushToken(TToken.Create(I, '/', DIVISION));
      '-': FSyntaxTree.PushToken(TToken.Create(I, '-', SUBTRACTION));
      '+': FSyntaxTree.PushToken(TToken.Create(I, '+', ADDITION));
      '.', '0'..'9':
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
          FSyntaxTree.PushToken(TToken.Create(I, numberStr, FLOAT))
        else
          FSyntaxTree.PushToken(TToken.Create(I, numberStr, INT));
        continue;
      end;
    else
      raise EInvalidToken.CreateFmt('Token "%s" invalid at position %d', [AExpression[I], I]);
    end;
    Inc(I);
  end;
end;

end.
