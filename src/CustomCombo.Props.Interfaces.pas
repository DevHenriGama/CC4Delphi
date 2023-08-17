unit CustomCombo.Props.Interfaces;

interface

uses
  System.UITypes, FMX.Types;

type
  ICustomContainerProps = interface
    ['{6FA8F9EA-D616-43A6-8639-A664846FC841}']
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

  ICustomItemProps = interface
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

end.
