unit Operations;

{$mode delphi}

interface

uses
  SysUtils;

function Multiply(A, B: real): real;
function Add(A, B: real): real;
function Subtract(A, B: real): real;
function Divide(A, B: real): real;

implementation

function Multiply(A, B: real): real;
begin
  Result := A * B;
end;

function Add(A, B: real): real;
begin
  Result := A + B;
end;

function Subtract(A, B: real): real;
begin
  Result := A - B;
end;

function Divide(A, B: real): real;
begin
  if B = 0 then
    raise Exception.Create('It''s not possible to divide by zero');
  Result := A / B;
end;

end.
