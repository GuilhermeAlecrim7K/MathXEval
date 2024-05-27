unit Exceptions;

{$mode delphi}

interface

uses
  SysUtils, Classes;

type
  EInvalidFirstToken = class(Exception);
  EInvalidLastToken = class(Exception);
  EInvalidTokenSequence = class(Exception);
  EMissingOperand = class(Exception);
  EInvalidToken = class(Exception);
  EParenthesesMismatch = class(Exception);

implementation


end.
