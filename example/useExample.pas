unit useExample;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  CustomCombo, CustomCombo.Interfaces, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Edit, FMX.Layouts, FMX.Colors, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FList: TStringList;
    FCombo1: ICustomCombo;
    FCombo2: ICustomCombo;
    FCombo3: ICustomCombo;
  end;

var
  Form1: TForm1;

implementation

uses
  CustomCombo.ContainerProps, CustomCombo.ItemProps;

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FCombo1.Initialize;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FCombo2.Initialize;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FCombo3.Initialize;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  FList := TStringList.Create;

  FList.Add('Valor 1 ');
  FList.Add('Valor 2 ');
  FList.Add('Valor 3 ');
  FList.Add('Valor 4 ');
  FList.Add('Valor 5 ');
  FList.Add('Valor 6 ');

  //Efetuando Requisições
  FCombo1 := TCustomCombo.New(Edit2)
    .Items('http://localhost:6564/item', 'nome');

  //Container Personalizado
  FCombo2 := TCustomCombo.New(Edit1).Items(FList)
    .Use(TCustomContainerProps.New.Fill($FF2EA59C).Height(150)
    .BorderColor($00FFFFFF).Border(0));

  //Itens Personalizado
  FCombo3 := TCustomCombo.New(Edit3).Items(FList)
    .Use(TCustomItemProps.New.TextColor($FF158763).Font('Arial')
    .TextPosition(TTextAlign.Leading).FontSize(15));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

end.
