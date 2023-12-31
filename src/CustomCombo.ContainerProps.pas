unit CustomCombo.ContainerProps;

interface

uses
  System.UITypes, FMX.Objects, CustomCombo.Props.Interfaces;

type
  TCustomContainerProps = class(TInterfacedObject, ICustomContainerProps)
  private
    FColor: TAlphaColor;
    FHeight: Single;
    FStrokeColor: TAlphaColor;
    FStrokeThickness: Integer;
  public
    class function New : ICustomContainerProps;
    function Fill(aColor: TAlphaColor): ICustomContainerProps; overload;
    function Fill: TAlphaColor; overload;
    function Height(aHeight: Single): ICustomContainerProps; overload;
    function Height: Single; overload;
    function BorderColor(aColor: TAlphaColor): ICustomContainerProps; overload;
    function BorderColor: TAlphaColor; overload;
    function Border(aThickness: Integer): ICustomContainerProps; overload;
    function Border: Integer; overload;
    function Default: ICustomContainerProps;
  end;

var
  CustomContainerProps: TCustomContainerProps;

implementation

{ TCustomContainerProps }

function TCustomContainerProps.Fill(aColor: TAlphaColor)
  : ICustomContainerProps;
begin
  Result := Self;
  FColor := aColor;
end;

function TCustomContainerProps.Fill: TAlphaColor;
begin
Result := FColor;
end;

function TCustomContainerProps.Default: ICustomContainerProps;
begin
  FColor := $FFFFFFFF;
  FHeight := 120;
  FStrokeColor := $FF000000;
  FStrokeThickness  := 1;
  Result := Self;
end;

function TCustomContainerProps.Height: Single;
begin
Result := FHeight;
end;

function TCustomContainerProps.Height(aHeight: Single): ICustomContainerProps;
begin
  Result := Self;
  FHeight := aHeight;
end;

class function TCustomContainerProps.New: ICustomContainerProps;
begin
  Result := TCustomContainerProps.Create;
end;

function TCustomContainerProps.BorderColor: TAlphaColor;
begin
Result := FStrokeColor;
end;

function TCustomContainerProps.BorderColor(aColor: TAlphaColor)
  : ICustomContainerProps;
begin
  Result := Self;
  FStrokeColor := aColor;
end;

function TCustomContainerProps.Border: Integer;
begin
Result := FStrokeThickness;
end;

function TCustomContainerProps.Border(aThickness: Integer)
  : ICustomContainerProps;
begin
  Result := Self;
  FStrokeThickness := aThickness;
end;

end.
