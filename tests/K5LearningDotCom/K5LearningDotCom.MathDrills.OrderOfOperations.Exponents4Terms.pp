unit K5LearningDotCom.MathDrills.OrderOfOperations.Exponents4Terms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/exponents-4-terms }

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
  TExponents4TermsTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;

implementation

procedure TExponents4TermsTests.Worksheet1Tests;
begin
  CheckEquals(169, FExpressionEvaluator.Evaluate('5 * 10 + 11^2 - 2'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('8 * 2 - 3^2 + 12'));
  CheckEquals(100, FExpressionEvaluator.Evaluate('7 + 4 * 5^2 - 7'));
  CheckEquals(208, FExpressionEvaluator.Evaluate('6^3 - 12 + 12 / 3'));
  CheckEquals(41, FExpressionEvaluator.Evaluate('3^3 - 10 + 2 * 12'));
  CheckEquals(48, FExpressionEvaluator.Evaluate('2 * 5^2 - 10 / 5'));
  CheckEquals(84, FExpressionEvaluator.Evaluate('12 + 9 * 4^2 / 2'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('10^2 / 5 - 3 * 5'));
  CheckEquals(54, FExpressionEvaluator.Evaluate('6 * 2^3 + 12 / 2'));
  CheckEquals(1459, FExpressionEvaluator.Evaluate('2 * 9^3 + 2 / 2'));
  CheckEquals(140, FExpressionEvaluator.Evaluate('10^3 / 5 - 6 * 10'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('4 * 6 + 2^2 - 10'));
end;

procedure TExponents4TermsTests.Worksheet2Tests;
begin
  CheckEquals(61, FExpressionEvaluator.Evaluate('9^2 + 7 - 3^2 * 3'));
  CheckEquals(650, FExpressionEvaluator.Evaluate('10 / 5 + 9^2 * 8'));
  CheckEquals(40, FExpressionEvaluator.Evaluate('12^2 / 4 - 2 + 6'));
  CheckEquals(222, FExpressionEvaluator.Evaluate('8 + 6^3 - 12 / 6'));
  CheckEquals(131, FExpressionEvaluator.Evaluate('11 * 11 + 4^2 - 6'));
  CheckEquals(108, FExpressionEvaluator.Evaluate('4^3 - 4 + 4 * 12'));
  CheckEquals(1460, FExpressionEvaluator.Evaluate('2 * 9^3 + 12 / 6'));
  CheckEquals(44, FExpressionEvaluator.Evaluate('11 * 12 - 9^2 - 7'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('9 + 12 / 2^2 - 11'));
  CheckEquals(111, FExpressionEvaluator.Evaluate('12 / 4 + 3^3 * 4'));
  CheckEquals(33, FExpressionEvaluator.Evaluate('4^3 / 2 - 9 + 10'));
  CheckEquals(396, FExpressionEvaluator.Evaluate('8^3 + 4 - 10 * 12'));
end;

procedure TExponents4TermsTests.Worksheet3Tests;
begin
  CheckEquals(9, FExpressionEvaluator.Evaluate('9^2 / (2 * 6 - 3)'));
  CheckEquals(167, FExpressionEvaluator.Evaluate('(9 + 9^2 * 2) - 4'));
  CheckEquals(136, FExpressionEvaluator.Evaluate('(12 + 12 * 11) - 2^3'));
  CheckEquals(243, FExpressionEvaluator.Evaluate('2 * (5^3 + 2) - 11'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('2 + 5^2 - (4 * 6)'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('6^3 / (4 * 6 - 12)'));
  CheckEquals(142, FExpressionEvaluator.Evaluate('(12 / 2) * 5^2 - 8'));
  CheckEquals(128, FExpressionEvaluator.Evaluate('(3 + 1 * 9)^2 - 4^2'));
  CheckEquals(375, FExpressionEvaluator.Evaluate('(11^2 - 8 + 12) * 3'));
  CheckEquals(722, FExpressionEvaluator.Evaluate('(3^3 - 10 + 2)^2 * 2'));
  CheckEquals(309, FExpressionEvaluator.Evaluate('8^2 * (3 + 2) - 11'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('2^3 * 3 + 1 - 6'));
end;

procedure TExponents4TermsTests.Worksheet4Tests;
begin
  CheckEquals(128, FExpressionEvaluator.Evaluate('(11 + 7) / 9 * 4^3'));
  CheckEquals(180, FExpressionEvaluator.Evaluate('(5^2 - 7 + 2) * 9'));
  CheckEquals(32, FExpressionEvaluator.Evaluate('8^2 / (3 + 11 - 12)'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(3^3 - 7) / (1 * 5)'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('(12 * 12) - (9^2 + 10)'));
  CheckEquals(1448, FExpressionEvaluator.Evaluate('(9^3 - 10 + 5) * 2'));
  CheckEquals(25, FExpressionEvaluator.Evaluate('5^3 / (2 * 8 - 11)'));
  CheckEquals(126, FExpressionEvaluator.Evaluate('(8^2 - 8 + 7) * 2'));
  CheckEquals(189, FExpressionEvaluator.Evaluate('(4^3 / 2) * 6 - 3'));
  CheckEquals(48, FExpressionEvaluator.Evaluate('(11 - 1) * 4 + 8'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('(9^2 * 10) / (12 + 6)'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('(8^2 + 3 - 4) / 3'));
end;

procedure TExponents4TermsTests.Worksheet6Tests;
begin
  CheckEquals(2916, FExpressionEvaluator.Evaluate('(14^2 * 15) - (2^2 + 20)'));
  CheckEquals(102, FExpressionEvaluator.Evaluate('8^2 * 2 - 14 - 12'));
  CheckEquals(23, FExpressionEvaluator.Evaluate('(6^2 + 18 - 8) / 2'));
  CheckEquals(68, FExpressionEvaluator.Evaluate('(14 + 2 * 2)^2 - 16^2'));
  CheckEquals(406, FExpressionEvaluator.Evaluate('(19 + 7^2 * 8) - 5'));
  CheckEquals(2336, FExpressionEvaluator.Evaluate('(12^2 - 15 + 17) * 16'));
  CheckEquals(303, FExpressionEvaluator.Evaluate('11 * (5^2 + 3) - 5'));
  CheckEquals(1529, FExpressionEvaluator.Evaluate('(16^3 / 8) * 3 - 7'));
  CheckEquals(17, FExpressionEvaluator.Evaluate('(6^3 - 12) / (20 - 8)'));
  CheckEquals(6056, FExpressionEvaluator.Evaluate('15^2 * (18 + 9) - 19'));
  CheckEquals(25, FExpressionEvaluator.Evaluate('4^2 + (8 - 2)^2 / 4'));
  CheckEquals(4608, FExpressionEvaluator.Evaluate('10 + (16^2 - 14) * 19'));
end;

procedure TExponents4TermsTests.Worksheet7Tests;
begin
  CheckEquals(756, FExpressionEvaluator.Evaluate('(4 * 14^2 ) - (8 + 20)'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('(6^2 + 4) / (18 - 14)'));
  CheckEquals(884, FExpressionEvaluator.Evaluate('(15^2 - 11 + 7) * 4'));
  CheckEquals(892, FExpressionEvaluator.Evaluate('(15^2 - 3) * 4 + 4'));
  CheckEquals(80, FExpressionEvaluator.Evaluate('(18 + 2)^2 / 10 * 2'));
  CheckEquals(2040, FExpressionEvaluator.Evaluate('(16^2 - 6 + 5) * 8'));
  CheckEquals(2205, FExpressionEvaluator.Evaluate('(5 + 10)^2 / 5 * 7^2'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('4^2 + (20 - 14)^2 / 2'));
  CheckEquals(147, FExpressionEvaluator.Evaluate('(13 + 8)^2 / (14 - 11)'));
  CheckEquals(417, FExpressionEvaluator.Evaluate('(15^2 - 9) * 2 - 15'));
  CheckEquals(17, FExpressionEvaluator.Evaluate('(6 + 11 * 12) - 11^2'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('(15 * 12) / (2^3 + 2)'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.Exponents4Terms',
    TExponents4TermsTests
  );

end.
