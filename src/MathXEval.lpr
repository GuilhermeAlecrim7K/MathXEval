program MathXEval;

{$mode delphi}{+H}

uses
  SysUtils,
  ExpressionEvaluator in 'ExpressionEvaluator.pp';

var
  input: string;
  result: Variant;
  ExpressionEvaluator: TExpressionEvaluator;
begin
  try
    Readln(input);
    ExpressionEvaluator := TExpressionEvaluator.Create;
    try
      result := ExpressionEvaluator.Evaluate(input);
    finally
      ExpressionEvaluator.Free;
    end;
    Writeln(result);
  except
    on E:Exception do
      Writeln(E.Message);
  end;
end.
