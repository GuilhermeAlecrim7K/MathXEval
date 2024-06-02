unit K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsFourTerms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/4-operations-4-terms }

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
  TFourOperationsFourTermsTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;

implementation

procedure TFourOperationsFourTermsTests.Worksheet1Tests;
begin
  CheckEquals(86, FExpressionEvaluator.Evaluate('9 + 8 * 12 - 19'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('14 + 15 - 3 * 5'));
  CheckEquals(120, FExpressionEvaluator.Evaluate('18 - 10 + 8 * 14'));
  CheckEquals(54, FExpressionEvaluator.Evaluate('20 + 17 * 14 / 7'));
  CheckEquals(81, FExpressionEvaluator.Evaluate('7 / 1 * 9 + 18'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('17 + 16 - 3 * 4'));
  CheckEquals(87, FExpressionEvaluator.Evaluate('12 / 6 + 5 * 17'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('8 * 14 / 4 - 18'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('19 - 7 + 20 / 10'));
  CheckEquals(35, FExpressionEvaluator.Evaluate('18 / 9 * 12 + 11'));
  CheckEquals(6, FExpressionEvaluator.Evaluate('18 - 6 / 2 * 4'));
  CheckEquals(189, FExpressionEvaluator.Evaluate('18 / 2 + 10 * 18'));
end;

procedure TFourOperationsFourTermsTests.Worksheet2Tests;
begin
  CheckEquals(177, FExpressionEvaluator.Evaluate('19 - 10 + 14 * 12'));
  CheckEquals(26, FExpressionEvaluator.Evaluate('18 - 2 + 20 / 2'));
  CheckEquals(26, FExpressionEvaluator.Evaluate('18 + 4 * 6 / 3'));
  CheckEquals(69, FExpressionEvaluator.Evaluate('9 / 3 * 18 + 15'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('16 * 15 / 10 - 19'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('20 / 5 - 3 + 13'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('16 + 15 * 12 / 10'));
  CheckEquals(119, FExpressionEvaluator.Evaluate('7 * 18 - 8 + 1'));
  CheckEquals(122, FExpressionEvaluator.Evaluate('7 * 18 - 5 + 1'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('20 / 10 * 5 + 9'));
  CheckEquals(41, FExpressionEvaluator.Evaluate('4 * 8 + 10 - 1'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('19 - 5 * 6 / 2'));
end;

procedure TFourOperationsFourTermsTests.Worksheet3Tests;
begin
  CheckEquals(109, FExpressionEvaluator.Evaluate('(10 + 20 * 5) - 1'));
  CheckEquals(243, FExpressionEvaluator.Evaluate('17 * (5 + 10) - 12'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('14 / (8 - 5 + 4)'));
  CheckEquals(80, FExpressionEvaluator.Evaluate('(12 + 13) / 5 * 16'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(20 + 20) / (11 - 1)'));
  CheckEquals(120, FExpressionEvaluator.Evaluate('(15 - 9) * 19 + 6'));
  CheckEquals(61, FExpressionEvaluator.Evaluate('4 * (1 + 15) - 3'));
  CheckEquals(100, FExpressionEvaluator.Evaluate('(16 - 11 + 20) * 4'));
  CheckEquals(123, FExpressionEvaluator.Evaluate('(14 + 6 * 19) - 5'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('14 + 19 - (2 * 13)'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('16 / (15 - 6 - 5)'));
  CheckEquals(83, FExpressionEvaluator.Evaluate('18 * 4 + 16 - 5'));
end;

procedure TFourOperationsFourTermsTests.Worksheet4Tests;
begin
  CheckEquals(8, FExpressionEvaluator.Evaluate('(11 - 7) * (6 / 3)'));
  CheckEquals(6, FExpressionEvaluator.Evaluate('18 / (12 - 3 - 6)'));
  CheckEquals(30, FExpressionEvaluator.Evaluate('(13 - 8) * (18 / 3)'));
  CheckEquals(161, FExpressionEvaluator.Evaluate('(14 - 4) * 15 + 11'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('14 / 7 * 12 - 10'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('16 / (15 - 2 - 9)'));
  CheckEquals(361, FExpressionEvaluator.Evaluate('(12 - 7 + 14) * 19'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('(12 * 6) / (4 + 4)'));
  CheckEquals(64, FExpressionEvaluator.Evaluate('(11 + 9 * 8) - 19'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('(20 / 4) * 5 - 16'));
  CheckEquals(30, FExpressionEvaluator.Evaluate('(19 - 9) * (12 / 4)'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('5 * (15 + 11 - 17)'));
end;

procedure TFourOperationsFourTermsTests.Worksheet6Tests;
begin
  CheckEquals(207, FExpressionEvaluator.Evaluate('(14 * 18) - (9 + 36)'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('(17 + 3 * 8) - 30'));
  CheckEquals(33, FExpressionEvaluator.Evaluate('(31 + 35) / (18 - 16)'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('(32 * 20) / (18 + 22)'));
  CheckEquals(242, FExpressionEvaluator.Evaluate('(16 + 6 * 40) - 14'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('(22 + 20) - 40 / 5'));
  CheckEquals(785, FExpressionEvaluator.Evaluate('(26 * 32) - (35 + 12)'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('(29 + 3) / (11 - 9)'));
  CheckEquals(64, FExpressionEvaluator.Evaluate('(15 + 35 * 2) - 21'));
  CheckEquals(621, FExpressionEvaluator.Evaluate('(38 - 31 + 20) * 23'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('(34 - 19) * (33 / 11)'));
  CheckEquals(84, FExpressionEvaluator.Evaluate('(33 - 26) * (36 / 3)'));
end;

procedure TFourOperationsFourTermsTests.Worksheet7Tests;
begin
  CheckEquals(36, FExpressionEvaluator.Evaluate('(36 * 28) / (18 + 10)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('35 + 29 - (2 * 28)'));
  CheckEquals(87, FExpressionEvaluator.Evaluate('(28 / 4) * 15 - 18'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('35 / (37 - 28 - 4)'));
  CheckEquals(480, FExpressionEvaluator.Evaluate('(25 * 21) - (17 + 28)'));
  CheckEquals(447, FExpressionEvaluator.Evaluate('(12 * 40) - (22 + 11)'));
  CheckEquals(75, FExpressionEvaluator.Evaluate('(37 + 40) - 22 / 11'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('(32 * 8) / (11 + 5)'));
  CheckEquals(136, FExpressionEvaluator.Evaluate('(37 - 9 + 6) * 4'));
  CheckEquals(869, FExpressionEvaluator.Evaluate('(30 * 31) - (33 + 28)'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('38 / (28 - 7 - 2)'));
  CheckEquals(184, FExpressionEvaluator.Evaluate('6 * (3 + 31) - 20'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsFourTerms',
    TFourOperationsFourTermsTests
  );

end.
