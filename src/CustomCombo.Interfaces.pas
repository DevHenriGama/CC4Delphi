unit CustomCombo.Interfaces;

interface

uses
  FMX.Edit, System.UITypes, FMX.Objects, System.Classes,
  CustomCombo.ContainerProps, Data.DB, CustomCombo.Props.Interfaces;

type

  ICustomCombo = interface
    ['{994AB9D4-F6A3-4936-AE0B-E0FE6517F8EE}']
    function Items(aItems: TStringList): ICustomCombo; overload;
    function Items(aItems: TDataSet; aFieldName: String): ICustomCombo;
      overload;
    function Items(aUrl: String; aFieldName: String): ICustomCombo; overload;
    function Use(aCustomContainer: ICustomContainerProps)
      : ICustomCombo; overload;
    function Use(aCustomItem: ICustomItemProps): ICustomCombo; overload;
    procedure Initialize;
  end;

  ICustomComboItem = interface
    ['{F8FB1B4A-C720-45BF-B2A0-020D5E61D41A}']
    function Item(aText: String): TRectangle;
  end;

  ICustomComboContent = interface
    ['{C26032DB-8073-4B86-B6B0-043BF512E398}']
    procedure populateList;
  end;

  ICustomComboContainer = interface
    ['{30229B5F-C2CD-4968-9D65-7C7F323E3BF2}']
    procedure ShowContainer;
  end;

implementation

end.
