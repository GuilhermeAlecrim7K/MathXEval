program TestProject;

{$mode objfpc}{$H+}

uses
  Classes,
  {$IFDEF CONSOLE_RUNNER}
  consoletestrunner,
  {$ELSE GUI}
  Interfaces,
  GuiTestRunner, fpcunittestrunner,
  Forms,
  {$ENDIF}
  Exceptions in '../src/Exceptions.pp',
  Operations in '../src/Operations.pp',
  BinaryTree in '../src/BinaryTree.pp',
  Token in '../src/Token.pp',
  TokenTree in '../src/TokenTree.pp',
  SyntaxTree in '../src/SyntaxTree.pp',
  ExpressionEvaluator in '../src/ExpressionEvaluator.pp',
  ExpressionEvaluatorTest in 'ExpressionEvaluatorTest.pp',
  K5LearningDotCom.MathDrills.OrderOfOperations.AddSubtract5Terms in
    'K5LearningDotCom/K5LearningDotCom.MathDrills.OrderOfOperations.AddSubtract5Terms.pp';

{$IFDEF CONSOLE_RUNNER}
type

  { TMathXEvalTestRunner }

  TMathXEvalTestRunner = class(TTestRunner)
  protected
  // override the protected methods of TTestRunner to customize its behavior
  end;

var
  Application: TMathXEvalTestRunner;
{$ENDIF}

begin
  {$IFDEF CONSOLE_RUNNER}
  Application := TMathXEvalTestRunner.Create(nil);
  {$ENDIF}
  Application.Initialize;
  {$IFDEF CONSOLE_RUNNER}
  Application.Title := 'MathXEval Tests';
  {$ELSE}
  Application.CreateForm(TGuiTestRunner, TestRunner);
  {$ENDIF}
  Application.Run;
  {$IFDEF CONSOLE_RUNNER}
  Application.Free;
  {$ENDIF}
end.
