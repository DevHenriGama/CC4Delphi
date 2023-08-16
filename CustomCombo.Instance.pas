unit CustomCombo.Instance;

interface

uses
  CustomCombo.Interfaces, FMX.Edit, CustomCombo, System.Generics.Collections;

type

  IComboInstanceManager = interface
    ['{079F83FC-9633-4680-A0BB-93E0460A232D}']
    function ComboInstance(aField: TEdit): TCustomCombo;
    procedure RemoveCombo(aField: TEdit);
  end;

  TComboInstanceManager = class(TInterfacedObject, IComboInstanceManager)
  private

    FCombomInstance: TDictionary<TEdit, TCustomCombo>;
    FKeyList: TList<TEdit>;
    procedure ClearInstances;
  public
    constructor Create;
    class function New: IComboInstanceManager;
    destructor Destroy; override;
    function ComboInstance(aField: TEdit): TCustomCombo;
    procedure RemoveCombo(aField: TEdit);
  end;

var
  CustomComboManager: IComboInstanceManager;

implementation

{ TComboInstanceManager }

procedure TComboInstanceManager.ClearInstances;
var
  I: Integer;
begin
  for I := 0 to Pred(FCombomInstance.Count) do
  begin
     FCombomInstance.Items[FKeyList[I]].Free;
  end;
end;

function TComboInstanceManager.ComboInstance(aField: TEdit): TCustomCombo;
begin

  if FCombomInstance.ContainsKey(aField) then
  begin
    Result := FCombomInstance.Items[aField]
  end
  else
  begin
    FKeyList.Add(aField);
    Result := TCustomCombo.Create(aField);
    FCombomInstance.Add(aField, Result);
  end;

end;

constructor TComboInstanceManager.Create;
begin
  FCombomInstance := TDictionary<TEdit, TCustomCombo>.Create;
  FKeyList := TList<TEdit>.Create;
end;

destructor TComboInstanceManager.Destroy;
begin
  ClearInstances;
  FCombomInstance.Free;
  FKeyList.Free;
  inherited;
end;

class function TComboInstanceManager.New: IComboInstanceManager;
begin
  Result := TComboInstanceManager.Create;
end;

procedure TComboInstanceManager.RemoveCombo(aField: TEdit);
begin
  FCombomInstance.Remove(aField);
  FKeyList.Remove(aField);
end;

initialization

CustomComboManager := TComboInstanceManager.New;

end.
