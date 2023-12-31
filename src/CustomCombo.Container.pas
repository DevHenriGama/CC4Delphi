unit CustomCombo.Container;

interface

uses
  CustomCombo.Interfaces, FMX.Objects, FMX.Edit, System.UITypes,
  System.Classes, CustomCombo, CustomCombo.ContainerProps,
  CustomCombo.Props.Interfaces;

type
  TCustomComboContainer = class(TInterfacedObject, ICustomComboContainer)
  private
    FCombo: TCustomCombo;
    FContainer: TRectangle;
    FContent: ICustomComboContent;
    FCustomProps: ICustomContainerProps;
    procedure InitializeContainer;
    procedure OnMouseExitContainer(aObject: TObject);
  public
    constructor Create(aCombo: TCustomCombo);
    destructor Destroy; override;
    function Combo: TCustomCombo;
    function Container: TRectangle;
    procedure ChangeContainerVisibility;
    procedure ShowContainer;
  end;

implementation

uses
  FMX.Types, CustomCombo.Content, System.SysUtils;

{ TCustomComboContainer }

procedure TCustomComboContainer.InitializeContainer;
begin

  // Define o estilo do Container
  FCustomProps := FCombo.ContainerProps;

  if not Assigned(FCustomProps) then
  begin
    FCustomProps := TCustomContainerProps.New.Default;
  end;

  with FContainer do
  begin
    Stroke.Thickness := FCustomProps.Border;
    Stroke.Color := FCustomProps.BorderColor;
    Fill.Color := FCustomProps.Fill;
    Height := FCustomProps.Height;
  end;

  // Configura o container
  with FContainer do
  begin
    Align := TAlignLayout.Bottom;
    Margins.Bottom := -FCustomProps.Height;
    OnMouseLeave := OnMouseExitContainer;
    Parent := FCombo.Field;
  end;
end;

procedure TCustomComboContainer.OnMouseExitContainer(aObject: TObject);
begin
  ChangeContainerVisibility;
end;

procedure TCustomComboContainer.ShowContainer;
begin
  if (FContainer.Visible = false) then
  begin
    InitializeContainer;
    FContent.populateList;
    ChangeContainerVisibility;
  end;
end;

procedure TCustomComboContainer.ChangeContainerVisibility;
begin
  FContainer.Visible := not FContainer.Visible;
end;

function TCustomComboContainer.Combo: TCustomCombo;
begin
  Result := FCombo;
end;

function TCustomComboContainer.Container: TRectangle;
begin
  Result := FContainer;
end;

constructor TCustomComboContainer.Create(aCombo: TCustomCombo);
begin
  FCombo := aCombo;
  FContainer := TRectangle.Create(FCombo.Field);
  FContent := TCustomComboContent.Create(Self);

  // Inicia com o container Invisivel
  FContainer.Visible := false;
end;

destructor TCustomComboContainer.Destroy;
begin

  inherited;
end;

end.
