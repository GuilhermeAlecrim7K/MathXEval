unit K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsFiveTerms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/4-operations-5-terms }

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
  TFourOperationsFiveTermsTests = class(TK5LearningDotComBaseTest)
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;


implementation

procedure TFourOperationsFiveTermsTests.Worksheet1Tests;
begin
  CheckEquals(123, FExpressionEvaluator.Evaluate('16/4+6*20-1'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('18+17-2*16+5'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('17+2*15+7-23'));
  CheckEquals(95, FExpressionEvaluator.Evaluate('16*9-7*8+7'));
  CheckEquals(86, FExpressionEvaluator.Evaluate('13+5*15-8/4'));
  CheckEquals(13, FExpressionEvaluator.Evaluate('20/2+19-2*8'));
  CheckEquals(188, FExpressionEvaluator.Evaluate('10+9*20-16/8'));
  CheckEquals(36, FExpressionEvaluator.Evaluate('19*4+14-9*6'));
  CheckEquals(45, FExpressionEvaluator.Evaluate('8/2+4*14-15'));
  CheckEquals(79, FExpressionEvaluator.Evaluate('19+6*14-4*6'));
end;

procedure TFourOperationsFiveTermsTests.Worksheet2Tests;
begin
  CheckEquals(31, FExpressionEvaluator.Evaluate('2*14+6-12/4'));
  CheckEquals(26, FExpressionEvaluator.Evaluate('18+11-2*6+9'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('15-3*2+19/1'));
  CheckEquals(263, FExpressionEvaluator.Evaluate('19+14*18-16/2'));
  CheckEquals(450, FExpressionEvaluator.Evaluate('12*19*2+2-8'));
  CheckEquals(93, FExpressionEvaluator.Evaluate('10*8+18+9-14'));
  CheckEquals(812, FExpressionEvaluator.Evaluate('15*3*18+18/9'));
  CheckEquals(265, FExpressionEvaluator.Evaluate('17*16-12+16-11'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('19-9*2+18/3'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('15-2*6+15/3'));
end;

procedure TFourOperationsFiveTermsTests.Worksheet3Tests;
begin
  CheckEquals(79, FExpressionEvaluator.Evaluate('12/3+(13*7-4)-12'));
  CheckEquals(184, FExpressionEvaluator.Evaluate('5*(5+19+13)-1'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('1+6*(11-5)+16'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('(18+13)-2*(11+3)'));
  CheckEquals(195, FExpressionEvaluator.Evaluate('1*(17+2-6)*15'));
  CheckEquals(13, FExpressionEvaluator.Evaluate('18/6+5*(6-4)'));
  CheckEquals(242, FExpressionEvaluator.Evaluate('20*(12/2+7)-18'));
  CheckEquals(52, FExpressionEvaluator.Evaluate('16/8+10*(10-5)'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('16*4+14-3*19'));
  CheckEquals(32, FExpressionEvaluator.Evaluate('15*(16+6-19)-13'));
end;

procedure TFourOperationsFiveTermsTests.Worksheet4Tests;
begin

  CheckEquals(84, FExpressionEvaluator.Evaluate('12/6+(11*9-17)'));
  CheckEquals(129, FExpressionEvaluator.Evaluate('18/3+(16*8-5)'));
  CheckEquals(127, FExpressionEvaluator.Evaluate('8+10*(12-2)+19'));
  CheckEquals(32, FExpressionEvaluator.Evaluate('4*(11+9-14)+8'));
  CheckEquals(67, FExpressionEvaluator.Evaluate('8*7+12+3-4'));

  CheckEquals(290, FExpressionEvaluator.Evaluate('20*(3+20)-(17*10)'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('14*(4+6)-(7*16)'));


  CheckEquals(447, FExpressionEvaluator.Evaluate('9*18+(17-2)*19'));
  CheckEquals(33, FExpressionEvaluator.Evaluate('(6-4)*12+18/2'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('(19+2)*(10-2)/6'));
end;

procedure TFourOperationsFiveTermsTests.Worksheet6Tests;
begin
  CheckEquals(768, FExpressionEvaluator.Evaluate('12*16*(1+11-8)'));
  CheckEquals(46, FExpressionEvaluator.Evaluate('(33+40)-4*(7+3)+13'));
  CheckEquals(3549, FExpressionEvaluator.Evaluate('39*(2+16-5)*7'));

  CheckEquals(1170, FExpressionEvaluator.Evaluate('26*(27+4+15)-26'));
  CheckEquals(276, FExpressionEvaluator.Evaluate('30/10+(20*15-27)'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('32+(39/3)-20*2'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('34+(36/4)-2*19'));
  CheckEquals(3035, FExpressionEvaluator.Evaluate('40*(21+23+32)-5'));


  CheckEquals(356, FExpressionEvaluator.Evaluate('(33-5)*13+21/7-11'));
  CheckEquals(91, FExpressionEvaluator.Evaluate('(16+40)*(38-12)/16'));
end;

procedure TFourOperationsFiveTermsTests.Worksheet7Tests;
begin
  CheckEquals(38, FExpressionEvaluator.Evaluate('4*(19+32)-(5*31)-11'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('27/3+3*(13-5)-21'));
  CheckEquals(127, FExpressionEvaluator.Evaluate('5*(10+34)-3*(26+5)'));
  CheckEquals(142, FExpressionEvaluator.Evaluate('35/7+(12*11-7)+12'));
  CheckEquals(1871, FExpressionEvaluator.Evaluate('12*4*(28+27-16)-1'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('31+(32/4)-3*12-1'));
  CheckEquals(309, FExpressionEvaluator.Evaluate('33+24*(34-23)+12'));
  CheckEquals(85, FExpressionEvaluator.Evaluate('39+8*(31-26)+6'));
  CheckEquals(132, FExpressionEvaluator.Evaluate('14+6*(34-13)-31+23'));
  CheckEquals(2967, FExpressionEvaluator.Evaluate('23*3*(36+22-15)'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.FourOperationsFiveTerms',
    TFourOperationsFiveTermsTests
  );

end.
