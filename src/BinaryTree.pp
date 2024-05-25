unit BinaryTree;

{$mode delphi}

interface

type
  TObjectBinaryTree<T: class> = class
  private
    FOwnsObjects: boolean;
    FValue: T;
  public
    Left: TObjectBinaryTree<T>;
    Right: TObjectBinaryTree<T>;
  public
    constructor Create(AValue: T; AOwnsObjects: boolean = true);
    destructor Destroy; override;
    property Value: T read FValue;
  end;

implementation

{ TObjectBinaryTree<T> }

constructor TObjectBinaryTree<T>.Create(AValue: T; AOwnsObjects: boolean = true);
begin
  inherited Create;
  FValue := AValue;
  FOwnsObjects := AOwnsObjects;
  Left := nil;
  Right := nil;
end;

destructor TObjectBinaryTree<T>.Destroy;
begin
  if FOwnsObjects then
  begin
    if Assigned(FValue) then
      FValue.Free;
    if Assigned(Left) then
      Left.Free;
    if Assigned(Right) then
      Right.Free;
  end;
  inherited;
end;

end.
