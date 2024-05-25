unit ExpressionEvaluatorTest;

{$mode delphi}{$H+}

interface

uses
  Classes,
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  ExpressionEvaluator,
  Exceptions;

type
  TExceptionType = TClass;

  TExpressionEvaluatorTest = class(TTestCase)
  private
    FExpressionEvaluator: TExpressionEvaluator;
    procedure TryCatchEvaluationException(const AExpression: string; AExceptionType: TExceptionType);
  protected
    procedure Setup; override;
    procedure TearDown; override;
  published
    procedure TestExpressionsStartingWithAnOperator;
    procedure TestExpressionsEndingWithAnOperator;
    procedure TestExpressionsHavingTwoOperatorsInSequence;
    procedure TestExpressionsHavingTwoNumbersInSequence;
    procedure TestExpressionsHavingInvalidFloatingPointNumbers;
    procedure TestAddition;
    procedure TestSubtraction;
    procedure TestMultiplication;
    procedure TestDivision;
    procedure TestExponentiation;
    procedure TestMultipleOperationsWithSamePrecedence;
    procedure TestPrecedenceOfOperations;
  end;

implementation

{ TExpressionEvaluatorTest }

procedure TExpressionEvaluatorTest.Setup;
begin
  inherited;
  FExpressionEvaluator := TExpressionEvaluator.Create;
end;

procedure TExpressionEvaluatorTest.TearDown;
begin
  FreeAndNil(FExpressionEvaluator);
  inherited;
end;

procedure TExpressionEvaluatorTest.TestExpressionsStartingWithAnOperator;
begin
  TryCatchEvaluationException('+1', EInvalidFirstToken);
  TryCatchEvaluationException('-1', EInvalidFirstToken);
  TryCatchEvaluationException('*1', EInvalidFirstToken);
  TryCatchEvaluationException('/1', EInvalidFirstToken);
  TryCatchEvaluationException('^1', EInvalidFirstToken);
end;

procedure TExpressionEvaluatorTest.TryCatchEvaluationException(
  const AExpression: string; AExceptionType: TExceptionType);
begin
  try
    FExpressionEvaluator.Evaluate(AExpression);
    Fail(
      Format(
        'Should have thrown exception of type %s with expression %s',
        [AExceptionType.ClassName, AExpression]
      )
    );
  except
    on E: Exception do
      CheckTrue(E is AExceptionType);
  end;
end;

procedure TExpressionEvaluatorTest.TestExpressionsEndingWithAnOperator;
begin
  TryCatchEvaluationException('1+', EInvalidLastToken);
  TryCatchEvaluationException('1-', EInvalidLastToken);
  TryCatchEvaluationException('1*', EInvalidLastToken);
  TryCatchEvaluationException('1/', EInvalidLastToken);
  TryCatchEvaluationException('1^', EInvalidLastToken);
end;

procedure TExpressionEvaluatorTest.TestExpressionsHavingTwoOperatorsInSequence;
begin
  TryCatchEvaluationException('1++1', EInvalidTokenSequence);
  TryCatchEvaluationException('1+-1', EInvalidTokenSequence);
  TryCatchEvaluationException('1+*1', EInvalidTokenSequence);
  TryCatchEvaluationException('1+/1', EInvalidTokenSequence);
  TryCatchEvaluationException('1+^1', EInvalidTokenSequence);
  TryCatchEvaluationException('1-+1', EInvalidTokenSequence);
  TryCatchEvaluationException('1--1', EInvalidTokenSequence);
  TryCatchEvaluationException('1-*1', EInvalidTokenSequence);
  TryCatchEvaluationException('1-/1', EInvalidTokenSequence);
  TryCatchEvaluationException('1-^1', EInvalidTokenSequence);
  TryCatchEvaluationException('1*+1', EInvalidTokenSequence);
  TryCatchEvaluationException('1*-1', EInvalidTokenSequence);
  TryCatchEvaluationException('1**1', EInvalidTokenSequence);
  TryCatchEvaluationException('1*/1', EInvalidTokenSequence);
  TryCatchEvaluationException('1*^1', EInvalidTokenSequence);
  TryCatchEvaluationException('1/+1', EInvalidTokenSequence);
  TryCatchEvaluationException('1/-1', EInvalidTokenSequence);
  TryCatchEvaluationException('1/*1', EInvalidTokenSequence);
  TryCatchEvaluationException('1//1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^/1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^+1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^-1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^*1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^/1', EInvalidTokenSequence);
  TryCatchEvaluationException('1^^1', EInvalidTokenSequence);
end;

procedure TExpressionEvaluatorTest.TestExpressionsHavingTwoNumbersInSequence;
begin
  TryCatchEvaluationException('1 1', EInvalidTokenSequence);
end;

procedure TExpressionEvaluatorTest.TestExpressionsHavingInvalidFloatingPointNumbers;
begin
  TryCatchEvaluationException('.1', EInvalidToken);
  TryCatchEvaluationException('1.1.1', EInvalidToken);
end;

procedure TExpressionEvaluatorTest.TestAddition;
begin
  CheckEquals(2, FExpressionEvaluator.Evaluate('1+1'));
  CheckEquals(0.3, FExpressionEvaluator.Evaluate('0.1 + 0.2'), 0.001);
  CheckEquals(15, FExpressionEvaluator.Evaluate('1 + 2 + 3 + 4 + 5'));
  CheckEquals(49982, FExpressionEvaluator.Evaluate('35568 + 4211 + 7826 + 2377'));
  CheckEquals(4716, FExpressionEvaluator.Evaluate('617 + 886 + 2882 + 320 + 11'));
  CheckEquals(13000, FExpressionEvaluator.Evaluate('380 + 909 + 898 + 9540 + 889 + 384'));
end;

procedure TExpressionEvaluatorTest.TestSubtraction;
begin
  CheckEquals(0, FExpressionEvaluator.Evaluate('1-1'));
  CheckEquals(-0.1, FExpressionEvaluator.Evaluate('0.1 - 0.2'), 0.001);
end;

procedure TExpressionEvaluatorTest.TestMultiplication;
begin
  CheckEquals(1, FExpressionEvaluator.Evaluate('1*1'));
  CheckEquals(0.5, FExpressionEvaluator.Evaluate('1 * 0.5'), 0.001);
end;

procedure TExpressionEvaluatorTest.TestDivision;
begin
  CheckEquals(3.33, FExpressionEvaluator.Evaluate('10/3'), 0.01);
  CheckEquals(5, FExpressionEvaluator.Evaluate('25/5'));
  CheckEquals(12.6046511628, FExpressionEvaluator.Evaluate('81.3/6.45'), 0.0000000001);
  TryCatchEvaluationException('1 / 0', EZeroDivide);
end;

procedure TExpressionEvaluatorTest.TestExponentiation;
begin
  CheckEquals(8, FExpressionEvaluator.Evaluate('2^3'));
  CheckEquals(0, FExpressionEvaluator.Evaluate('0^5'));
  CheckEquals(1, FExpressionEvaluator.Evaluate('0^0'));
  {
    - Make available when unary minus is implemented
  CheckEquals(1, FExpressionEvaluator.Evaluate('-3^1'));
  CheckEquals(-8, FExpressionEvaluator.Evaluate('-2^3'));
  CheckEquals(0.125, FExpressionEvaluator.Evaluate('2^-3'), 0.001);
  CheckEquals(0.25, FExpressionEvaluator.Evaluate('0.5^-2'), 0.01);
  CheckEquals(0.111, FExpressionEvaluator.Evaluate('-3^-2'), 0.01);
  TryCatchEvaluationException('-2 ^0.5', math.NaN);
  TryCatchEvaluationException('1+-2 ^0.5', ENaNOperation);
  }
  CheckEquals(2, FExpressionEvaluator.Evaluate('4^0.5'), 0.01);
  // Testing edge cases
  FExpressionEvaluator.Evaluate('2^1000');
  {FExpressionEvaluator.Evaluate('2^-1000');}
end;

procedure TExpressionEvaluatorTest.TestMultipleOperationsWithSamePrecedence;
begin
  CheckEquals(20, FExpressionEvaluator.Evaluate('18 - 12 - 2 + 15 + 1'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('1 + 9 - 8 + 20 - 13'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('11 + 9 - 14 - 5 + 6'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('2 + 14 + 17 - 5 + 3'));
  CheckEquals(0, FExpressionEvaluator.Evaluate('19 + 3 - 11 - 2 - 9'));
  CheckEquals(-14, FExpressionEvaluator.Evaluate('15 - 3 + 1 - 18 - 9'));
  CheckEquals(41, FExpressionEvaluator.Evaluate('14 + 11 + 11 - 8 + 13'));
  CheckEquals(4, FExpressionEvaluator.Evaluate('5 + 12 - 14 - 5 + 6'));
  CheckEquals(24, FExpressionEvaluator.Evaluate('18 - 4 + 12 - 5 + 3'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('18 - 2 + 9 - 1 + 3'));
  CheckEquals(12, FExpressionEvaluator.Evaluate('12 - 3 + 5 + 5 - 7'));
  CheckEquals(35, FExpressionEvaluator.Evaluate('15 + 11 - 7 - 1 + 17'));
  CheckEquals(27, FExpressionEvaluator.Evaluate('15 + 9 - 4 - 3 + 10'));
  CheckEquals(26, FExpressionEvaluator.Evaluate('20 - 3 + 6 - 2 + 5'));
  CheckEquals(31, FExpressionEvaluator.Evaluate('11 - 3 + 5 - 2 + 20'));
  CheckEquals(3, FExpressionEvaluator.Evaluate('12 + 18 - 19 - 17 + 9'));
  CheckEquals(1.5, FExpressionEvaluator.Evaluate('2 * 3 / 4'), 0.1);
  CheckEquals(1, FExpressionEvaluator.Evaluate('5 * 2 / 10'));
  CheckEquals(20, FExpressionEvaluator.Evaluate('10 / 2 * 4'));
  CheckEquals(4.5, FExpressionEvaluator.Evaluate('6 / 2 * 3 / 2'), 0.1);
  CheckEquals(2, FExpressionEvaluator.Evaluate('8 * 2 * 2 / 16'));
  CheckEquals(9, FExpressionEvaluator.Evaluate('9 / 3 * 6 / 2'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('12 / 3 / 2 * 4'));
  CheckEquals(20, FExpressionEvaluator.Evaluate('20 * 5 / 10 * 2'));
  CheckEquals(5, FExpressionEvaluator.Evaluate('25 / 5 * 3 / 3'));
  CheckEquals(25, FExpressionEvaluator.Evaluate('100 / 10 / 2 * 5'));
  CheckEquals(256, FExpressionEvaluator.Evaluate('2^2^3'));
end;

procedure TExpressionEvaluatorTest.TestPrecedenceOfOperations;
begin
  CheckEquals(14, FExpressionEvaluator.Evaluate('2 + 3 * 4'));
  CheckEquals(8, FExpressionEvaluator.Evaluate('10 - 4 / 2'));
  CheckEquals(7, FExpressionEvaluator.Evaluate('2 * 3 + 4 / 2 - 1'));
  CheckEquals(11, FExpressionEvaluator.Evaluate('2 + 3 * 4 - 6 / 2'));
  CheckEquals(2900, FExpressionEvaluator.Evaluate('1000000 / 1000 + 2000 - 100'));
  CheckEquals(23, FExpressionEvaluator.Evaluate('20 + 12 / 4'));
  CheckEquals(112, FExpressionEvaluator.Evaluate('50 + 6 * 11 - 4'));
  CheckEquals(104, FExpressionEvaluator.Evaluate('9 * 12 - 8 + 28 / 7'));
  CheckEquals(-21.2272727, FExpressionEvaluator.Evaluate('18 - 21 - 5 / 22 - 18'), 0.0000001);
  CheckEquals(21, FExpressionEvaluator.Evaluate('7 * 2 - 9 + 2 + 14'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('6 / 3 + 5 * 11 - 4'));
  CheckEquals(-33, FExpressionEvaluator.Evaluate('9 * 3 + 20 - 18 * 4 - 8'));
  CheckEquals(-255, FExpressionEvaluator.Evaluate('37 - 17 * 240 / 20 - 22 * 4'));
  CheckEquals(47.5, FExpressionEvaluator.Evaluate('11 * 4 - 6 + 3 + 13 / 2'), 0.1);
  CheckEquals(8, FExpressionEvaluator.Evaluate('64/2^3'));
  CheckEquals(53, FExpressionEvaluator.Evaluate('50+3^1'));
  CheckEquals(160, FExpressionEvaluator.Evaluate('7 + 6 * 5^ 2 + 3'));
  CheckEquals(40, FExpressionEvaluator.Evaluate('10^2 - 3^2 * 6 - 3 * 2 '));
  CheckEquals(149, FExpressionEvaluator.Evaluate('12 + 6^3 - 9^2 + 2'));
  CheckEquals(89, FExpressionEvaluator.Evaluate('11^2 - 3^2 + 12 - 33 - 2'));
end;

initialization
  RegisterTest(TExpressionEvaluatorTest);

end.
