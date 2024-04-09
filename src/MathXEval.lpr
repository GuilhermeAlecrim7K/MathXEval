program MathXEval;

{$mode delphi}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp,
  Exceptions in './Exceptions.pp',
  Token in './Token.pp',
  BinaryTree in './BinaryTree.pp',
  ExpressionEvaluator in './ExpressionEvaluator.pp',
  Operations in './Operations.pp',
  SyntaxTree in './SyntaxTree.pp';

type

  { TMathXEval }

  TMathXEval = class(TCustomApplication)
  private
    procedure RunProgram;
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TMathXEval }

procedure TMathXEval.DoRun;
var
  ErrorMsg: String;
begin
  ErrorMsg := CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  RunProgram;

  Terminate;
end;

constructor TMathXEval.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TMathXEval.Destroy;
begin
  inherited Destroy;
end;

procedure TMathXEval.WriteHelp;
begin
  writeln('Usage: ', ExeName, ' -h');
  writeln;
  writeln('Execute with parameters:');
  writeln(ExtractFileName(ExeName), ' 1+3');
  writeln;
  writeln('Execute without parameters:');
  writeln(ExtractFileName(ExeName));
  writeln;
end;

procedure TMathXEval.RunProgram;
var
  I: Integer;
  input: string;
  result: Variant;
  ExpressionEvaluator: TExpressionEvaluator;
begin
  if ParamCount < 1 then
  begin
    Write('Type the expression that should be evaluated: ');
    Readln(input);
  end
  else for I := 1 to ParamCount do
    input := input + ' ' + Params[I];
  try
    ExpressionEvaluator := TExpressionEvaluator.Create;
    try
      result := ExpressionEvaluator.Evaluate(input);
    finally
      ExpressionEvaluator.Free;
    end;
    Writeln('Result: ', result);
  except
    on E:Exception do
      Writeln(E.Message);
  end;
end;

var
  Application: TMathXEval;

{$R *.res}

begin
  Application := TMathXEval.Create(nil);
  Application.Title := 'MathXEval';
  Application.Run;
  Application.Free;
end.
