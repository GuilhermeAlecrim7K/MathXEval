unit K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsThreeTerms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/4-operations-3-terms }

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
  TFourOperationsThreeTermsTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;

implementation

procedure TFourOperationsThreeTermsTests.Worksheet1Tests;
begin
  CheckEquals(12, FExpressionEvaluator.Evaluate('18 / 6 * 4'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('9 * 14 / 6'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('16 / 2 - 6'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('15 + 1 - 8'));
  CheckEquals(232, FExpressionEvaluator.Evaluate('16 * 14 + 8'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('19 - 6 - 6'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('18 / 3 - 5'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('6 * 10 / 12'));
  CheckEquals(270, FExpressionEvaluator.Evaluate('15 * 9 * 2'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('6 * 24 / 9'));
  CheckEquals(42, FExpressionEvaluator.Evaluate('6 * 5 + 12'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('17 - 11 - 5'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('19 - 70 / 7'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('4 - 18 / 6'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('3 + 20 / 5'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('3 + 13 + 18'));
  CheckEquals(22, FExpressionEvaluator.Evaluate('13 - 7 + 16'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('18 / 9 + 12'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('18 * 6 / 12'));
  CheckEquals(25, FExpressionEvaluator.Evaluate('17 + 14 - 6'));
  CheckEquals(84, FExpressionEvaluator.Evaluate('(5 * 20) - 16'));
end;

procedure TFourOperationsThreeTermsTests.Worksheet2Tests;
begin
  CheckEquals(5, FExpressionEvaluator.Evaluate('11 - 9 + 3'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('19 - 1 - 15'));
  CheckEquals(44, FExpressionEvaluator.Evaluate('13 * 2 + 18'));
  CheckEquals(62, FExpressionEvaluator.Evaluate('8 * 10 - 18'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('8 + 18 / 3'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('60 / 10 + 3'));
  CheckEquals(6, FExpressionEvaluator.Evaluate('4+2/1'));
  CheckEquals(50, FExpressionEvaluator.Evaluate('16 + 2 * 17'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('18 - 5 - 11'));
  CheckEquals(296, FExpressionEvaluator.Evaluate('14 * 20 + 16'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('17 + 8 - 16'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('10 - 2 + 19'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('4*3-7'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('27 / 3 + 12'));
  CheckEquals(200, FExpressionEvaluator.Evaluate('20 * 20 / 2'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('4 + 18 / 3'));
  CheckEquals(160, FExpressionEvaluator.Evaluate('16 * 11 - 16'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('20 / 5 + 15'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('2 * 15 / 10'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('7+1-6'));
end;

procedure TFourOperationsThreeTermsTests.Worksheet3Tests;
begin
  CheckEquals(104, FExpressionEvaluator.Evaluate('13 * (5 + 3)'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('(20 + 16) / 18'));
  CheckEquals(24, FExpressionEvaluator.Evaluate('12 * (11 - 9)'));
  CheckEquals(103, FExpressionEvaluator.Evaluate('(13 * 9) - 14'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('16 / (19 - 15)'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('10 + (18 / 3)'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('6 + 17 - 7'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('18 - (3 - 1)'));
  CheckEquals(72, FExpressionEvaluator.Evaluate('18 * (13 - 9)'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('15 - (4 * 3)'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('14 + (20 - 6)'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('(21 * 3) / 9'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('3 / (17 / 17)'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('13 - (6 / 3)'));
  CheckEquals(36, FExpressionEvaluator.Evaluate('(12 / 6) * 18'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('(14 / 7) + 16'));
  CheckEquals(25, FExpressionEvaluator.Evaluate('20 + (14 - 9)'));
  CheckEquals(88, FExpressionEvaluator.Evaluate('4 * (4 + 18)'));
  CheckEquals(84, FExpressionEvaluator.Evaluate('(14 / 2) * 12'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('2 + (2 * 13)'));
end;

procedure TFourOperationsThreeTermsTests.Worksheet4Tests;
begin
  CheckEquals(304, FExpressionEvaluator.Evaluate('16 * (1 + 18)'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('10 / (20 / 4)'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(14 * 2) / 7'));
  CheckEquals(151, FExpressionEvaluator.Evaluate('(7 * 19) + 18'));
  CheckEquals(6, FExpressionEvaluator.Evaluate('(18 - 6) / 2'));
  CheckEquals(38, FExpressionEvaluator.Evaluate('(7 * 8) - 18'));
  CheckEquals(80, FExpressionEvaluator.Evaluate('(8 * 20) / 2'));
  CheckEquals(104, FExpressionEvaluator.Evaluate('8 * (1 + 12)'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('19 - (8 + 1)'));
  CheckEquals(17, FExpressionEvaluator.Evaluate('(1 + 20) - 4'));
  CheckEquals(187, FExpressionEvaluator.Evaluate('(20 * 10) - 13'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('18 - (10 / 5)'));
  CheckEquals(117, FExpressionEvaluator.Evaluate('3 * (13 * 3)'));
  CheckEquals(39, FExpressionEvaluator.Evaluate('6 * 9 - 15'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('19 - (2 * 6)'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('5 * (18 / 2)'));
  CheckEquals(324, FExpressionEvaluator.Evaluate('12 * (9 + 18)'));
  CheckEquals(57, FExpressionEvaluator.Evaluate('19 * (15 / 5)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('13 - (6 - 1)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('(6 * 12) / 9'));
end;

procedure TFourOperationsThreeTermsTests.Worksheet6Tests;
begin
  CheckEquals(30, FExpressionEvaluator.Evaluate('25 + (30 / 6)'));
  CheckEquals(13, FExpressionEvaluator.Evaluate('36 - (5 + 18)'));
  CheckEquals(348, FExpressionEvaluator.Evaluate('29 * (24 / 2)'));
  CheckEquals(55, FExpressionEvaluator.Evaluate('35 + (26 - 6)'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(31 + 33) / 16'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('(40 - 4) / 12'));
  CheckEquals(62, FExpressionEvaluator.Evaluate('(19 - 17) * 31'));
  CheckEquals(43, FExpressionEvaluator.Evaluate('37 + (38 - 32)'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('33 / (25 - 14)'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('20 + (33 / 3)'));
  CheckEquals(1080, FExpressionEvaluator.Evaluate('36 * (23 + 7)'));
  CheckEquals(796, FExpressionEvaluator.Evaluate('12 + (28 * 28)'));
  CheckEquals(33, FExpressionEvaluator.Evaluate('39 - (32 - 26)'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('38 - (4 + 24)'));
  CheckEquals(93, FExpressionEvaluator.Evaluate('(38 - 35) * 31'));
  CheckEquals(17, FExpressionEvaluator.Evaluate('(32 + 12) - 27'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('35 / (13 - 6)'));
  CheckEquals(35, FExpressionEvaluator.Evaluate('(15 / 5) + 32'));
  CheckEquals(1140, FExpressionEvaluator.Evaluate('(28 + 2) * 38'));
end;

procedure TFourOperationsThreeTermsTests.Worksheet7Tests;
begin
  CheckEquals(14, FExpressionEvaluator.Evaluate('8 + (30 - 24)'));
  CheckEquals(990, FExpressionEvaluator.Evaluate('(30 + 25) * 18'));
  CheckEquals(114, FExpressionEvaluator.Evaluate('4 * 24 + 18'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('36 / (4 / 1)'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('(30 + 21) - 23'));
  CheckEquals(107, FExpressionEvaluator.Evaluate('(7 * 16) - 5'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('33 / (15 + 18)'));
  CheckEquals(324, FExpressionEvaluator.Evaluate('27 * (33 - 21)'));
  CheckEquals(228, FExpressionEvaluator.Evaluate('(30 / 5) * 38'));
  CheckEquals(918, FExpressionEvaluator.Evaluate('(24 + 3) * 34'));
  CheckEquals(319, FExpressionEvaluator.Evaluate('(9 + 2) * 29'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('(35 - 21) / 2'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('(37 - 3) - 15'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('32 - (40 - 26)'));
  CheckEquals(40, FExpressionEvaluator.Evaluate('(26 - 4) + 18'));
  CheckEquals(140, FExpressionEvaluator.Evaluate('(8 / 2) * 35'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('28 / (32 - 28)'));
  CheckEquals(663, FExpressionEvaluator.Evaluate('39 * (16 + 1)'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsThreeTerms',
    TFourOperationsThreeTermsTests
  );

end.
