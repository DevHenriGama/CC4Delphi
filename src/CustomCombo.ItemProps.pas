unit CustomCombo.ItemProps;

interface

uses
  CustomCombo.Props.Interfaces, System.UITypes, FMX.Types;

type
  TCustomItemProps = class(TInterfacedObject, ICustomItemProps)
  private
     FTextColor : TAlphaColor;
     FFont : String;
     FPosition : TTextAlign;
     FSize : Integer;
  public
    class function New : ICustomItemProps;
    function TextColor(aColor: TAlphaColor): ICustomItemProps; overload;
    function TextColor: TAlphaColor; overload;
    function Font(aFont: String): ICustomItemProps; overload;
    function Font: String; overload;
    function TextPosition(aAlign: TTextAlign): ICustomItemProps; overload;
    function TextPosition: TTextAlign; overload;
    function FontSize(aSize: Integer): ICustomItemProps; overload;
    function FontSize: Integer; overload;
    function Default : ICustomItemProps;
  end;

implementation

{ TCustomItemProps }

function TCustomItemProps.Default: ICustomItemProps;
begin
 Result := Self;

 FTextColor := $FF000000;
 FFont := 'Roboto';
 FPosition := TTextAlign.Center;
 FSize := 12;
end;

function TCustomItemProps.Font: String;
begin
  Result := FFont;
end;

function TCustomItemProps.Font(aFont: String): ICustomItemProps;
begin
  Result := Self;
  FFont := aFont;
end;

function TCustomItemProps.FontSize(aSize: Integer): ICustomItemProps;
begin
 Result := Self;
 FSize := aSize;
end;

function TCustomItemProps.FontSize: Integer;
begin
Result := FSize;
end;

class function TCustomItemProps.New: ICustomItemProps;
begin
 Result := TCustomItemProps.Create;
end;

function TCustomItemProps.TextColor: TAlphaColor;
begin
Result := FTextColor;
end;

function TCustomItemProps.TextColor(aColor: TAlphaColor): ICustomItemProps;
begin
 Result := Self;
 FTextColor := aColor;
end;

function TCustomItemProps.TextPosition(aAlign: TTextAlign): ICustomItemProps;
begin
  Result := Self;
  FPosition := aAlign;
end;

function TCustomItemProps.TextPosition: TTextAlign;
begin
 Result := FPosition;
end;

end.
