unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject); 
    procedure CreateNewImage(const filename: String);
    procedure CustomOnDblClick(Sender: TObject);
    procedure BringImageToFront(Sender: TObject);
    procedure DragCustomImage(Sender: TObject; Button: TMouseButton; Shift: TShiftState; x,y: Integer);
    procedure MoveCustomObject(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure StopDragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private 
    FCurrentDragObject: TImage;
    FStartDragPos: TPoint;

  public

  end;

var
  Form2: TForm2;
  FirstStart: Boolean = True;  //Variable to check if its the first start of the Overlay

implementation

uses unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.BringImageToFront(Sender: TObject);  //Bring Dynamically Created Images to Front by Right Click
var
  img: TImage;  //Temporary Image
begin

  img := TImage(Sender);  //Assign Sender to Image

  img.BringToFront;

end;

procedure TForm2.DragCustomImage(Sender: TObject; Button: TMouseButton; Shift: TShiftState; x,y: Integer);
begin

  if Button = mbLeft then begin

    FCurrentDragObject := TImage(Sender);
    FStartDragPos := FCurrentDragObject.ClientToScreen(Point(x,y));

  end
  else if Button = mbRight then begin

    FCurrentDragObject := TImage(Sender);
    FCurrentDragObject.BringToFront;

  end;

end;

procedure TForm2.MoveCustomObject(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  CurrentPos, DeltaPos: TPoint;
begin

  if FCurrentDragObject <> nil then begin

    CurrentPos := Mouse.CursorPos;
    DeltaPos.X := CurrentPos.X - FStartDragPos.X;
    DeltaPos.Y := CurrentPos.Y - FStartDragPos.Y;

    FCurrentDragObject.Left := FStartDragPos.X + DeltaPos.X - Form2.ClientOrigin.X;
    FCurrentDragObject.Top := FStartDragpos.Y + DeltaPos.y - Form2.ClientOrigin.Y;

  end;

end;

procedure TForm2.StopDragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FCurrentDragObject := nil;
end;

procedure TForm2.CustomOnDblClick(Sender: TObject);
begin

  Form1.PageControl1.Enabled := False;  //Toggle PageControl to prevent Bugs

  Form2.BorderStyle := bsNone;  //Reset Borderstyle

  SetWindowLongPtr(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) OR $00080020);  //Click-through Code from WinEdit Dx

  Form1.TrackBar2.Position := Form2.Left;  //Reset TrackBar
  Form1.TrackBar3.Position := Form2.Top;  //Reset TrackBar
  Form1.TrackBar4.Position := Form2.Width;  //Reset TrackBar
  Form1.TrackBar5.Position := Form2.Height;  //Reset TrackBar

  Form1.PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm2.CreateNewImage(const filename: String);  //Create new Image
var
  img: TImage = nil;  //New Image Variable
begin

  img := TImage.Create(Self);
  img.Parent := Form2;

  img.Stretch := True;

  img.AutoSize := Form1.RadioButton1.Checked;  //If Full Size is Checked in RadioGroup

  if Form1.RadioButton2.Checked = True then begin

    img.Height := Form1.SpinEdit1.Value;
    img.Width := Form1.SpinEdit2.Value;

  end;

  img.Caption := 'CDI';

  img.Left := 0;
  img.Top := 0;

  img.Picture.LoadFromFile(filename);

  img.OnMouseDown := @DragCustomImage;
  img.OnMouseMove := @MoveCustomObject;
  img.OnMouseUp := @StopDragging;
  img.OnDblClick := @CustomOnDblClick;

end;

procedure TForm2.FormCreate(Sender: TObject);  //Initialize Dimensions
begin

  Form2.Width := Screen.Width;  //Initialize Overlay Width trough Screen Width
  Form2.Height := Screen.Height;  //Initialize Overlay Height trough Screen Height

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);  //Prevent Closig of the Overlay
begin

  CanClose := False;  //Can not close

  Form2.Visible := False;  //Make Invisible

  Form1.ToggleBox1.Checked := NOT Form2.Visible;  //Set the  Turn Off / On Button

end;

procedure TForm2.FormDblClick(Sender: TObject);  //Reset Click Through state after manual edit
begin

  Form1.PageControl1.Enabled := False;  //Toggle PageControl to prevent Bugs

  Form2.BorderStyle := bsNone;  //Reset Borderstyle

  SetWindowLongPtr(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) OR $00080020);  //Click-through Code from WinEdit Dx

  Form1.TrackBar2.Position := Form2.Left;  //Reset TrackBar
  Form1.TrackBar3.Position := Form2.Top;  //Reset TrackBar
  Form1.TrackBar4.Position := Form2.Width;  //Reset TrackBar
  Form1.TrackBar5.Position := Form2.Height;  //Reset TrackBar

  Form1.PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm2.FormShow(Sender: TObject);  //Logic to make Overlay Click-through
begin

  if FirstStart = True then begin  //Check for FirstStart

    SetWindowLongPtr(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) OR $00080020);  //Click-through Code from WinEdit Dx

    FirstStart := False;  //Unset FirstStart

  end;

end;

procedure TForm2.FormWindowStateChange(Sender: TObject);
begin

  Form2.WindowState := WsMaximized;  //Maximize Overlay

end;

end.

