unit K5LearningDotCom.BaseTest;

interface

uses
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  ExpressionEvaluator,
  Exceptions;

type
  TK5LearningDotComBaseTest = class(TTestCase)
  protected
    FExpressionEvaluator: TExpressionEvaluator;
    procedure Setup; override;
    procedure TearDown; override;
  end;


implementation

procedure TK5LearningDotComBaseTest.Setup;
begin
  inherited;
  FExpressionEvaluator := TExpressionEvaluator.Create;
end;

procedure TK5LearningDotComBaseTest.TearDown;
begin
  if Assigned(FExpressionEvaluator) then
    FreeAndNil(FExpressionEvaluator);
  inherited;
end;

end.
