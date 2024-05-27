unit K5LearningDotCom.MathDrills.OrderOfOperations.Exponents5Terms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/exponents-5-terms }

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
  TExponents5TermsTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;


implementation

procedure TExponents5TermsTests.Worksheet1Tests;
begin
  CheckEquals(31, FExpressionEvaluator.Evaluate('2^3 + 5 * 5 - 12 / 6'));
  CheckEquals(196, FExpressionEvaluator.Evaluate('7^2 * 4 - 10 - 1 + 11'));
  CheckEquals(149, FExpressionEvaluator.Evaluate('11 * 12 - 3 + 2^2 * 5'));
  CheckEquals(66, FExpressionEvaluator.Evaluate('12 * 1 + 4^3 + 1 - 11'));
  CheckEquals(24, FExpressionEvaluator.Evaluate('3 + 9^2 / 3 - 3 * 2'));
  CheckEquals(166, FExpressionEvaluator.Evaluate('11 * 4 + 5^3 - 9 / 3'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('12 / 4 + 12 - 8 / 2'));
  CheckEquals(192, FExpressionEvaluator.Evaluate('3^3 * 1 * 7 - 6 + 3^2'));
  CheckEquals(948, FExpressionEvaluator.Evaluate('8 * 1 + 10^3 - 10 * 6'));
  CheckEquals(202, FExpressionEvaluator.Evaluate('5^2 * 7 + 12 / 4 * 9'));
end;

procedure TExponents5TermsTests.Worksheet2Tests;
begin
  CheckEquals(202, FExpressionEvaluator.Evaluate('3^3 * 10 + 4 - 12 * 6'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('12 / 6 + 5 * 11 - 12'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('6^2 / 3 + 1 * 3^3 - 12'));
  CheckEquals(39, FExpressionEvaluator.Evaluate('3 + 2^3 * 5 - 8 / 2'));
  CheckEquals(30, FExpressionEvaluator.Evaluate('9 / 3 + 2 * 4^2 - 5'));
  CheckEquals(36, FExpressionEvaluator.Evaluate('9^2 + 6 / 2 - 12 * 4'));
  CheckEquals(75, FExpressionEvaluator.Evaluate('10 + 8^3 / 4 - 9 * 7'));
  CheckEquals(82, FExpressionEvaluator.Evaluate('10 / 2 + 2^3 * 10 - 3'));
  CheckEquals(147, FExpressionEvaluator.Evaluate('5^2 * 10 + 5 - 12 * 9'));
  CheckEquals(103, FExpressionEvaluator.Evaluate('12 / 6 + 2 * 10 + 9^2'));
end;

procedure TExponents5TermsTests.Worksheet3Tests;
begin
  CheckEquals(12, FExpressionEvaluator.Evaluate('11 / 1 + (3^2 - 4 * 2)'));
  CheckEquals(273, FExpressionEvaluator.Evaluate('5 * 10 + (7^3 - 10 * 12)'));
  CheckEquals(59, FExpressionEvaluator.Evaluate('6 * 3^2 + (11 - 2 * 3)'));



  CheckEquals(37, FExpressionEvaluator.Evaluate('6 * (6 + 9 + 12) - 5^3'));
  CheckEquals(1440, FExpressionEvaluator.Evaluate('12 * 12 * (4 + 11 - 5)'));

  CheckEquals(95, FExpressionEvaluator.Evaluate('(11 + 3^3) * (13 - 8)^2 / 10'));
  CheckEquals(414, FExpressionEvaluator.Evaluate('10 * 9 + (4 - 1)^3 * 12'));
  CheckEquals(90, FExpressionEvaluator.Evaluate('2^3 * 9 + (13 - 11) * 9'));
end;

procedure TExponents5TermsTests.Worksheet4Tests;
begin

  CheckEquals(3, FExpressionEvaluator.Evaluate('11 + (6^3 / 9) - 8 * 4'));
  CheckEquals(112, FExpressionEvaluator.Evaluate('7 + 7 * (12 - 4) + 7^2'));
  CheckEquals(493, FExpressionEvaluator.Evaluate('10 / 2 + (7^2 * 10 - 2)'));


  CheckEquals(20, FExpressionEvaluator.Evaluate('12^2 / (1 + 5) - (12 / 3)'));


  CheckEquals(263, FExpressionEvaluator.Evaluate('3 * (1 + 3 + 7)^2 - 10^2'));
  CheckEquals(77, FExpressionEvaluator.Evaluate('8 + 1 * (12 - 4)^2 + 5'));
  CheckEquals(167, FExpressionEvaluator.Evaluate('(4 + 11)^2 - 7 * 10 + 12'));
  CheckEquals(103, FExpressionEvaluator.Evaluate('(9^3 - 11 + 3) / 7'));
end;

procedure TExponents5TermsTests.Worksheet6Tests;
begin
  CheckEquals(1273, FExpressionEvaluator.Evaluate('(7 + 11^3) - 5 * 15 + 10'));
  CheckEquals(93, FExpressionEvaluator.Evaluate('16 / 8 + (4^2 * 6 - 5)'));
  CheckEquals(434, FExpressionEvaluator.Evaluate('2 * (19 - 14 + 12) + 20^2'));
  CheckEquals(495, FExpressionEvaluator.Evaluate('18 / 9 + (4^3 * 8 - 19)'));
  CheckEquals(94, FExpressionEvaluator.Evaluate('19 + 13 * (18 - 16) + 7^2'));



  CheckEquals(211, FExpressionEvaluator.Evaluate('11 + 1 * (5 - 3)^2 + 14^2'));
  CheckEquals(2500, FExpressionEvaluator.Evaluate('4 * 5 * (12 - 2 - 5)^3'));
  CheckEquals(188, FExpressionEvaluator.Evaluate('4^2 * 10 + (16 - 9) * 4'));
end;

procedure TExponents5TermsTests.Worksheet7Tests;
begin

  CheckEquals(147, FExpressionEvaluator.Evaluate('17 * 12 - (15^2 - 12 * 14)'));
  CheckEquals(756, FExpressionEvaluator.Evaluate('15 / 5 + (8^2 * 12 - 15)'));

  CheckEquals(364284, FExpressionEvaluator.Evaluate('18 * (15^3 + 7 - 9) * 6'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('15 + (16^2 / 8) - 2 * 18'));



  CheckEquals(384, FExpressionEvaluator.Evaluate('2 * 3 * (17 + 2 - 11)^2'));
  CheckEquals(68, FExpressionEvaluator.Evaluate('16 / 4 + 2^2 * (15 - 11)^2'));
  CheckEquals(57, FExpressionEvaluator.Evaluate('(5^2 - 7) * 3 + 18 / 6'));
  CheckEquals(638, FExpressionEvaluator.Evaluate('(7^3 - 2 * 12) * (15 - 11) / 2'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.Exponents5Terms',
    TExponents5TermsTests
  );

end.
