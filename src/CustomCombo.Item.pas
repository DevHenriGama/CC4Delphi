unit CustomCombo.Item;

interface

uses
  CustomCombo.Interfaces, FMX.StdCtrls, FMX.Types, FMX.Edit,
  CustomCombo.Content, FMX.Objects, CustomCombo.Props.Interfaces;

type
  TCustomComboItem = class(TInterfacedObject, ICustomComboItem)
    procedure ClickItem(Sender: TObject);
  private
    FContent: TCustomComboContent;
    FMouseOn: Boolean;
    FCustomItem: ICustomItemProps;
    function GetItemPropertys(aItem: TRectangle; aText: String): TRectangle;
    procedure DefText(aParent: TFMXObject; aText: String);
  public
    constructor Create(aContent: TCustomComboContent);
    destructor Destroy; override;
    function Item(aText: String): TRectangle;
  end;

implementation

uses
  System.UITypes, FMX.Dialogs, CustomCombo.ItemProps;

{ TCustomComboItem }

procedure TCustomComboItem.ClickItem(Sender: TObject);
begin
  FContent.Container.Combo.Field.Text := (Sender as TTExt).Text;
  FContent.Container.ChangeContainerVisibility;
end;

constructor TCustomComboItem.Create(aContent: TCustomComboContent);
begin
  FContent := aContent;
end;

procedure TCustomComboItem.DefText(aParent: TFMXObject; aText: String);
var
  TagText: TTExt;
begin
  TagText := TTExt.Create(nil);

  FCustomItem := FContent.Container.Combo.CustomItem;

  if not Assigned(FCustomItem) then
  begin
    FCustomItem := TCustomItemProps.New.Default;
  end;

  with TagText do
  begin
    Text := aText;
    TextSettings.FontColor := FCustomItem.TextColor;
    TextSettings.Font.Size := FCustomItem.FontSize;
    TextSettings.HorzAlign := FCustomItem.TextPosition;
    TextSettings.Font.Family := FCustomItem.Font;
  end;

  with TagText do
  begin
    Parent := aParent;
    Align := TAlignLayout.Client;
    OnClick := ClickItem;
  end;
end;

destructor TCustomComboItem.Destroy;
begin

  inherited;
end;

function TCustomComboItem.GetItemPropertys(aItem: TRectangle; aText: String)
  : TRectangle;
begin
  with aItem do
  begin
    Stroke.Thickness := 0;
    Height := 30;
    Align := TAlignLayout.Top;
    Margins.Left := 10;
    Margins.Right := 10;
    Fill.Color := 0;
    Cursor := crHandPoint;
  end;
  DefText(aItem, aText);

  Result := aItem;
end;

function TCustomComboItem.Item(aText: String): TRectangle;
begin
  Result := GetItemPropertys(TRectangle.Create(nil), aText);
end;

end.
