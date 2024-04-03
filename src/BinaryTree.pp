unit BinaryTree;

{$mode delphi}

interface

type
  TObjectBinaryTree<T: class> = class
  private
    FLeft: TObjectBinaryTree<T>;
    FRight: TObjectBinaryTree<T>;
    FOwnsObjects: boolean;
    FValue: T;
  public
    constructor Create(AValue: T; AOwnsObjects: boolean = true);
    destructor Destroy; override;
    property Left: TObjectBinaryTree<T> read FLeft write FLeft;
    property Right: TObjectBinaryTree<T> read FRight write FRight;
    property Value: T read FValue;
  end;

implementation

{ TObjectBinaryTree<T> }

constructor TObjectBinaryTree<T>.Create(AValue: T; AOwnsObjects: boolean = true);
begin
  inherited Create;
  FValue := AValue;
  FOwnsObjects := AOwnsObjects;
  FLeft := nil;
  FRight := nil;
end;

destructor TObjectBinaryTree<T>.Destroy;
begin
  if FOwnsObjects then
  begin
    if Assigned(FValue) then
      FValue.Free;
    if Assigned(FLeft) then
      FLeft.Free;
    if Assigned(FRight) then
      FRight.Free;
  end;
  inherited;
end;

end.
