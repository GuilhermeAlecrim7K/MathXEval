program Calculate;
{$mode delphi}
uses
  SysUtils,
  ExpressionEvaluator in 'ExpressionEvaluator.pp';

var
  input: string;
  result: Variant;
  ExpressionParser: TExpressionParser;
begin
  try
    Readln(input);
    ExpressionParser := TExpressionParser.Create;
    try
      result := ExpressionParser.EvaluateExpression(input);
    finally
      ExpressionParser.Free;
    end;
    Writeln(result);
  except
    on E:Exception do
      Writeln(E.Message);
  end;
end.
