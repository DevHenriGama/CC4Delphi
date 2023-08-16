program example;

uses
  System.StartUpCopy,
  FMX.Forms,
  useExample in 'useExample.pas' {Form1},
  CustomCombo.Container in '..\CustomCombo.Container.pas',
  CustomCombo.ContainerProps in '..\CustomCombo.ContainerProps.pas',
  CustomCombo.Content in '..\CustomCombo.Content.pas',
  CustomCombo.Interfaces in '..\CustomCombo.Interfaces.pas',
  CustomCombo.Item in '..\CustomCombo.Item.pas',
  CustomCombo in '..\CustomCombo.pas',
  CustomCombo.Props.Interfaces in '..\CustomCombo.Props.Interfaces.pas',
  CustomCombo.ItemProps in '..\CustomCombo.ItemProps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
