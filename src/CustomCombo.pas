unit CustomCombo;

interface

uses
  System.Generics.Collections,
  System.Classes,
  FMX.Objects,
  FMX.ListBox,
  FMX.Edit,
  System.UITypes,
  CustomCombo.Interfaces,
  CustomCombo.ContainerProps,
  Data.DB,
  CustomCombo.Props.Interfaces;

type

  TCustomCombo = class(TInterfacedObject, ICustomCombo)
  private
    FList: TList<String>;
    FField: TEdit;
    FContainer: ICustomComboContainer;
    FCustomContainer: ICustomContainerProps;
    FCustomItem : ICustomItemProps;
  public
    constructor Create(aField: TEdit);
    destructor Destroy; override;
    class function New(aField: TEdit): ICustomCombo;
    function List: TList<String>;
    function Field: TEdit;
    function ContainerProps: ICustomContainerProps;
    function CustomItem : ICustomItemProps;
    function Items(aItems: TStringList): ICustomCombo; overload;
    function Items(aItems: TDataSet; aFieldName: String): ICustomCombo;
      overload;
    function Items(aUrl: String; aFieldName: String): ICustomCombo; overload;
    function Use(aCustomContainer: ICustomContainerProps)
      : ICustomCombo; overload;
    function Use(aCustomItem : ICustomItemProps) : ICustomCombo; overload;
    procedure Initialize;
  end;

implementation

uses
  FMX.Types,
  CustomCombo.Container,
  System.SysUtils,
  RESTRequest4D.Response.Contract,
  RESTRequest4D,
  FireDAC.Comp.Client,
  DataSet.Serialize, DataSet.Serialize.Adapter.RESTRequest4D, FMX.Dialogs;

{ TCustomComboDVH }

function TCustomCombo.ContainerProps: ICustomContainerProps;
begin
  Result := FCustomContainer;
end;

constructor TCustomCombo.Create(aField: TEdit);
begin
  FField := aField;
  FContainer := TCustomComboContainer.Create(Self);
  FList := TList<String>.Create;
end;

function TCustomCombo.CustomItem: ICustomItemProps;
begin
Result := FCustomItem;
end;

destructor TCustomCombo.Destroy;
begin
  FList.Free;

  inherited;
end;

function TCustomCombo.Field: TEdit;
begin
  Result := FField;
end;

class function TCustomCombo.New(aField: TEdit): ICustomCombo;
begin
  Result := TCustomCombo.Create(aField);
end;

function TCustomCombo.Use(aCustomItem: ICustomItemProps): ICustomCombo;
begin
  Result := Self;
  FCustomItem := aCustomItem;
end;

function TCustomCombo.Use(aCustomContainer: ICustomContainerProps)
  : ICustomCombo;
begin
  Result := Self;
  FCustomContainer := aCustomContainer;
end;

procedure TCustomCombo.Initialize;
begin
  FContainer.ShowContainer;
end;

function TCustomCombo.Items(aItems: TStringList): ICustomCombo;
var
  I: Integer;
begin
  Result := Self;

  if Assigned(aItems) then
  begin
    for I := 0 to aItems.Count - 1 do
      FList.Add(aItems[I]);
  end;
end;

function TCustomCombo.Items(aItems: TDataSet; aFieldName: String): ICustomCombo;
var
  I: Integer;
begin
  Result := Self;
  if Assigned(aItems) then
  begin
    for I := 0 to Pred(aItems.RecordCount) do
    begin
      FList.Add(aItems.FieldByName(aFieldName).AsString);
      aItems.Next;
    end;
  end;
end;

function TCustomCombo.Items(aUrl, aFieldName: String): ICustomCombo;
var
  LResponse: IResponse;
  LAdapter: TFDMemTable;
begin
  Result := Self;
  LAdapter := TFDMemTable.Create(NIL);
  try
    try
      LResponse := TRequest.New.BaseURL(aUrl)
        .Adapters(TDataSetSerializeAdapter.New(LAdapter)).Get;

      if LResponse.StatusCode = 200 then
      begin
        Items(LAdapter, aFieldName);
      end
      else
      begin
        ShowMessage('Erro na Requisição:' + LResponse.Content);
      end;

    except
      ShowMessage('Erro ao Efetuar a Requisição.');
    end;

  finally
    LAdapter.Free;
  end;
end;

function TCustomCombo.List: TList<String>;
begin
  Result := FList;
end;

end.
