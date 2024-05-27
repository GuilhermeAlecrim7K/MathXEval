unit K5LearningDotCom.MathDrills.OrderOfOperations.AddSubtract5Terms;

{ https://www.k5learning.com/free-math-worksheets/math-drills/order-of-operations/add-subtract-5-terms }

interface

uses
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  ExpressionEvaluator,
  Exceptions;

type
  TAddSubtract5TermsTests = class(TTestCase)
  private
    FExpressionEvaluator: TExpressionEvaluator;
  protected
    procedure Setup; override;
    procedure TearDown; override;
  published
    procedure Worksheet1Tests;
    procedure Worksheet2Tests;
    procedure Worksheet3Tests;
    procedure Worksheet4Tests;
    procedure Worksheet6Tests;
    procedure Worksheet7Tests;
  end;

implementation

procedure TAddSubtract5TermsTests.Setup;
begin
  inherited;
  FExpressionEvaluator := TExpressionEvaluator.Create;
end;

procedure TAddSubtract5TermsTests.TearDown;
begin
  FreeAndNil(FExpressionEvaluator);
  inherited;
end;

procedure TAddSubtract5TermsTests.Worksheet1Tests;
begin
  CheckEquals(24, FExpressionEvaluator.Evaluate('18-(12-2)+15+1'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('1+(9-8)+(20-13)'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('11+9-(14-5+6)'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('(2+14+17)-5+3'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(19+3)-(11-2)-9'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('15-(3+1)-(18-9)'));
  CheckEquals(15, FExpressionEvaluator.Evaluate('(14+11+11)-(8+13)'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('5+12-(14-5+6)'));
  CheckEquals(24, FExpressionEvaluator.Evaluate('(18-4)+(12-5)+3'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('18-2+9-1+3'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('12-3+5+5-7'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('15+11-(7-1+17)'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('(15+9-4)-(3+10)'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('20-(3+6)-(2+5)'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('11-(3+5)-2+20'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('12+18-(19-17+9)'));
end;

procedure TAddSubtract5TermsTests.Worksheet2Tests;
begin
  CheckEquals(27, FExpressionEvaluator.Evaluate('18-(14-9)+5+9'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('(18+9-11)-(9+5)'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('12-(11-9)+5-3'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('(2+15+8)-11+5'));
  CheckEquals(18, FExpressionEvaluator.Evaluate('14-(19-16+1)+8'));
  CheckEquals(26, FExpressionEvaluator.Evaluate('(15+9+1)-18+19'));
  CheckEquals(37, FExpressionEvaluator.Evaluate('(7+14+8)-6+14'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('(18+9+19)-(18+16)'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('11-(8+2)+4+9'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('(20-15)+(18-9)+17'));
  CheckEquals(17, FExpressionEvaluator.Evaluate('17-(20+4-19)+5'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('12+(20-8)+(18-15)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('(11+18)-(10-1)-12'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('(14-8)+(14-9)+8'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('(14-2)+(15-11)+15'));
  CheckEquals(19, FExpressionEvaluator.Evaluate('17-(4+15-12)+9'));
end;

procedure TAddSubtract5TermsTests.Worksheet3Tests;
begin
  CheckEquals(20, FExpressionEvaluator.Evaluate('19-(8+1+2)+(2+12-2)'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('17+13-(19-3-7+10)'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('19+13+16-(20+2+14)'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('(4+17+13)-(19+8)'));
  CheckEquals(28, FExpressionEvaluator.Evaluate('12-(14-6)+14+10'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('(20+12-18)-(12+4-12)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('15+17+18-(6+20+3)-13'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('19-(5+7)-(3+1)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('(7+20)-(7-6)-18'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('(10+10-9)-(9+1-3)'));
end;

procedure TAddSubtract5TermsTests.Worksheet4Tests;
begin
  CheckEquals(29, FExpressionEvaluator.Evaluate('19-(1+16)+13+14'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('10+2-(18-2-14+6)'));
  CheckEquals(35, FExpressionEvaluator.Evaluate('(18-1)+(15-6)+9'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('(14+14)-(16-12)-8'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('14+13-10+5+2-14'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('19-13+16-(2+7-1)-4'));
  CheckEquals(2, FExpressionEvaluator.Evaluate('18-(8+3)-(12-7)'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('13-(7+3)+17-12'));
  CheckEquals(10, FExpressionEvaluator.Evaluate('(13-7)+8+18-(20-17)-19'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('(17+15)-(16-1)-9'));
end;

procedure TAddSubtract5TermsTests.Worksheet6Tests;
begin
  CheckEquals(7, FExpressionEvaluator.Evaluate('21+19-(32-18+19)'));
  CheckEquals(16, FExpressionEvaluator.Evaluate('20+30-(38-32+28)'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('(29-16)+(26-7)+(32-30)'));
  CheckEquals(34, FExpressionEvaluator.Evaluate('25-(31-12)+(38-33+15)+8'));
  CheckEquals(15, FExpressionEvaluator.Evaluate('28+27-27-9-4'));
  CheckEquals(15, FExpressionEvaluator.Evaluate('34-(15+5+8)+11-2'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('(12+40+12)-(17+26)+4-22'));
  CheckEquals(39, FExpressionEvaluator.Evaluate('32+18-(38-36+9)'));
  CheckEquals(36, FExpressionEvaluator.Evaluate('38+6+31-(17+15+7)'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('(32-4)+(40-16)+(31-30)'));
end;

procedure TAddSubtract5TermsTests.Worksheet7Tests;
begin
  CheckEquals(13, FExpressionEvaluator.Evaluate('23+17-(3+14)-10'));
  CheckEquals(41, FExpressionEvaluator.Evaluate('27+(35-29)-(30-23)+15'));
  CheckEquals(14, FExpressionEvaluator.Evaluate('25+39-(6+18)-(14+4)-8'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('(39+14-8)-(24+12)'));
  CheckEquals(79, FExpressionEvaluator.Evaluate('(33-2)+(38-3)+13'));
  CheckEquals(21, FExpressionEvaluator.Evaluate('(32-24)-(18-15)+11+5'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('17+25+35-(16+24+26)'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('(34-12)+(26-14)+19'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('(4+37+33)-(20+30)+11-8'));
  CheckEquals(38, FExpressionEvaluator.Evaluate('35-(14+6)-10+33'));
end;

initialization
  RegisterTest(
    'K5LearningDotCom.MathDrills.OrderOfOperations.AddSubtract5Terms',
    TAddSubtract5TermsTests
  );

end.
