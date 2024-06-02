unit K5LearningDotCom.Grade5.OrderOfOperations.NestedParenthesis;

{ https://www.k5learning.com/free-math-worksheets/fifth-grade-5/order-operations-pemdas/pemdas-nested-parenthesis }

interface

uses
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  ExpressionEvaluator,
  Exceptions,
  K5LearningDotCom.BaseTest;

type
  TNestedParenthesisTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
  end;

implementation

procedure TNestedParenthesisTests.Worksheet1Tests;
begin
  CheckEquals(4, FExpressionEvaluator.Evaluate('6^2 / (32 - 29)^2'));
  CheckEquals(400, FExpressionEvaluator.Evaluate('((21 - 17) * (14 - 9))^2'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('11^2 - 3 * 8 - 5^2 - 19'));
  CheckEquals(115, FExpressionEvaluator.Evaluate('11^2 - (3 * (8 - (5^2 - 19)))'));
  CheckEquals(75, FExpressionEvaluator.Evaluate('11^2 - (3 * (8 - 5)^2 ) - 19'));
  CheckEquals(30, FExpressionEvaluator.Evaluate('12 * (3 + 11 + 6) / 2^3'));
  CheckEquals(56, FExpressionEvaluator.Evaluate('4^2 + 2^2 * (40 / (31 - 29)^2 )'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('1^3 * (9 + ((9 - 21 / 7) - (2^3 - 5)))'));
  CheckEquals(876, FExpressionEvaluator.Evaluate('10^2 * 9 - (4^3 - 4 * 10)'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('4^2 + 3^2 - (25 - (2 * (11 + 9 - 13)))'));
end;

procedure TNestedParenthesisTests.Worksheet2Tests;
begin
  CheckEquals(2, FExpressionEvaluator.Evaluate('(12 - 7)^2 - 23'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(15 - 9)^2 / (7 - 4)^2'));
  CheckEquals(38, FExpressionEvaluator.Evaluate('4^3 / (8 - 6) + 18 / (6 - 3)'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('4^3 / 8 - 6 + 18 / 6 - 3'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('4^3 / 8 - (((6 + 18) / 6) - 3)'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('((3^3 - 21) * (15 - 9)) / 3'));
  CheckEquals(88, FExpressionEvaluator.Evaluate('2 * (76 - ((15 - 9)^2 - (5^2 - 3 * 7)))'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('5 * (4 + 17 + 10) - 11^2'));
  CheckEquals(108, FExpressionEvaluator.Evaluate('2^2 * (2 + (12 - 9)^3 ) - 8'));
  CheckEquals(50, FExpressionEvaluator.Evaluate('80 - (((17 - 9)^2 - (7^2 - 3 * 9)) - 12)'));
end;

procedure TNestedParenthesisTests.Worksheet3Tests;
begin
  CheckEquals(8, FExpressionEvaluator.Evaluate('72 / (22 - 19)^2'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('(5^2 - 3^2 ) - (5 - 3)^2'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('5^2 - 3 ^2 - 5 - 3 ^2'));
  CheckEquals(24, FExpressionEvaluator.Evaluate('5^2 - ((3^2 - 5) - 3)^2'));
  CheckEquals(36, FExpressionEvaluator.Evaluate('2 * (6 + (7 * (12 - 8))) - 32'));
  CheckEquals(119, FExpressionEvaluator.Evaluate('7 * 5 + (10^2 - 2 * 8)'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('3 * (45 - (9 * (21 - 11 - 8)^2 ))'));
  CheckEquals(13, FExpressionEvaluator.Evaluate('80 - (2 * (21 + 10)) - (38 - 3) / 7'));
  CheckEquals(42, FExpressionEvaluator.Evaluate('(3 * ((9 - 3)^2 - (21 - 19) * 4)) / 2'));
  CheckEquals(33, FExpressionEvaluator.Evaluate('(6 * (27 - (12 - 8)^2 )) / 2'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.Grade5.OrderOfOperations.NestedParenthesis',
    TNestedParenthesisTests
  );

end.
