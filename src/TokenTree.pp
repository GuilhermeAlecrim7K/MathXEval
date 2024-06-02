unit TokenTree;

interface

uses
  SysUtils,
  Classes,
  BinaryTree,
  Token;

type
  TTokenTree = class(TObjectBinaryTree<Token.TToken>)
  private
    FPriorityLevel: Byte;
  public
    Left: TTokenTree;
    Right: TTokenTree;
    constructor Create(AToken: TToken; APriorityLevel: Byte; AOwnsObjects: Boolean = True); reintroduce;
    destructor Destroy; override;
    property PriorityLevel: Byte read FPriorityLevel;
  end;

implementation

{ TTokenTree }

constructor TTokenTree.Create(AToken: TToken; APriorityLevel: Byte; AOwnsObjects: Boolean);
begin
  inherited Create(AToken,  AOwnsObjects);
  FPriorityLevel := APriorityLevel;
end;

destructor TTokenTree.Destroy;
begin
  if Assigned(Left) then
    FreeAndNil(Left);
  if Assigned(Right) then
    FreeAndNil(Right);
  inherited Destroy;
end;

end.
