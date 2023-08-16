unit CustomCombo.Content;

interface

uses
  FMX.Objects, CustomCombo.Interfaces, FMX.Layouts,
  CustomCombo.Container, FMX.Edit, System.Classes;

type
  TCustomComboContent = class(TInterfacedObject, ICustomComboContent)
    procedure OnMouseExit(Sender: TObject);
  private
    FContainer: TCustomComboContainer;
    FContent: TVertScrollBox;
    FItem: ICustomComboItem;
    procedure ConfigureContent;
    procedure Clear;
  public
    constructor Create(aContainer: TCustomComboContainer);
    destructor Destroy; override;
    function Container : TCustomComboContainer;
    procedure populateList;

  end;

implementation

uses
  FMX.Types,
  CustomCombo.Item,
  FMX.Dialogs,
  System.SysUtils,
  System.Generics.Collections;

{ TCustomComboContent }

procedure TCustomComboContent.Clear;
var
  I: Integer;
  aCount: Integer;
begin
  aCount := FContent.Content.ChildrenCount;

  if aCount = 0 then
    Exit;

  FContent.BeginUpdate;
  try
    for I := Pred(aCount) downto 0 do
    begin
      if FContent.Content.Children[I] is TRectangle then
        TRectangle(FContent.Content.Children[I]).DisposeOf;
    end;
  finally
    FContent.EndUpdate;
  end;

end;

constructor TCustomComboContent.Create(aContainer: TCustomComboContainer);
begin
  FContainer := aContainer;
  FContent := TVertScrollBox.Create(nil);
  FItem := TCustomComboItem.Create(Self);
  ConfigureContent;
end;

destructor TCustomComboContent.Destroy;
begin

  inherited;
end;

procedure TCustomComboContent.ConfigureContent;
begin
  with FContent do
  begin
    OnMouseLeave := OnMouseExit;
    Parent := FContainer.Container;
    Align := TAlignLayout.Client;
  end;

end;

function TCustomComboContent.Container: TCustomComboContainer;
begin
Result := FContainer;
end;

procedure TCustomComboContent.OnMouseExit(Sender: TObject);
begin
  if FContent.ChildrenCount > 0 then
    FContainer.ChangeContainerVisibility;
end;

procedure TCustomComboContent.populateList;
var
  I: Integer;
  FTemp: TList<String>;
begin
  Clear;

  FTemp := FContainer.Combo.List;

  if FContent.Content.ChildrenCount = 0 then
  begin
    for I := 0 to Pred(FTemp.Count) do
      FContent.AddObject(FItem.Item(FTemp[I]));
  end;

end;

end.
