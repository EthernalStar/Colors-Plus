unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Windows;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);  //Initialize Dimensions
begin

  Form2.Width := Screen.Width;  //Initialize Overlay Width trough Screen Width
  Form2.Height := Screen.Height;  //Initialize Overlay Height trough Screen Height

end;

procedure TForm2.FormShow(Sender: TObject);  //Logic to make Overlay Click-through
begin

  SetWindowLongPtr(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) OR $00080020);  //Click-through Code from WinEdit Dx

end;

procedure TForm2.FormWindowStateChange(Sender: TObject);
begin

  Form2.WindowState := WsMaximized;  //Maximize Overlay

end;

end.

