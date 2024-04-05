unit Unit2;

{$mode ObjFPC}{$H+}

{$DEFINE GIF_SUPPORT}  //Comment out this line both here and in the other Unit to disable GIF support and therefore the dependency to the TGIFViewer Component

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, IniFiles
  {$IFDEF GIF_SUPPORT} , uGifViewer {$ENDIF};

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject); 
    procedure CreateNewImage(const filename: String; const isGIF: Boolean = False);
    procedure CustomOnDblClick(Sender: TObject);
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

procedure TForm2.DragCustomImage(Sender: TObject; Button: TMouseButton; Shift: TShiftState; x,y: Integer);   //Click Logic on Images
begin

  if Button = mbLeft then begin  //Left Mouse Button Event

    FCurrentDragObject := TImage(Sender);  //Set new Object
    FStartDragPos := FCurrentDragObject.ClientToScreen(Point(x, y));  //Get Start Position for Dragging

  end
  else if Button = mbRight then begin  //Right Mouse Button Event

    FCurrentDragObject := TImage(Sender);  //Set new Object
    FCurrentDragObject.BringToFront;  //Bring to Front

  end;

end;

procedure TForm2.MoveCustomObject(Sender: TObject; Shift: TShiftState; X, Y: Integer);  //Dynamic Image Movement Code
var
  CurrentPos, DeltaPos: TPoint;  //Point Variables for Positions
begin

  if FCurrentDragObject <> nil then begin   //Check if Object is not empty

    CurrentPos := Mouse.CursorPos;  //Get Mouse Position
    DeltaPos.X := CurrentPos.X - FStartDragPos.X;  //Delta of Position
    DeltaPos.Y := CurrentPos.Y - FStartDragPos.Y;  //Delta of Position

    FCurrentDragObject.Left := FStartDragPos.X + DeltaPos.X - Form2.ClientOrigin.X - Round(FCurrentDragObject.Width / 2);  //Set new Left Value and take notice of Object Width
    FCurrentDragObject.Top := FStartDragpos.Y + DeltaPos.y - Form2.ClientOrigin.Y - Round(FCurrentDragObject.Height / 2);  //Set new Top Value and take notice of Object Height

  end;

end;

procedure TForm2.StopDragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);  //Stop Dragging of Dynamic Images
begin

  FCurrentDragObject := nil;  //Just unselect the current Object

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

  Form2.Height := Form2.Height + 35;  //Add missing Height from the TitleBar

  Form1.PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm2.CreateNewImage(const filename: String; const isGIF: Boolean = False);  //Create new Image
var
  {$IFDEF GIF_SUPPORT} gif: TGIFViewer = nil; {$ENDIF} //New GIF Object
  img: TImage = nil; //New Image Object
begin

  {$IFDEF GIF_SUPPORT}

  if isGIF = True then begin

    gif := TGIFViewer.Create(Self);  //Create new Image
    gif.Parent := Form2;  //Set Overlay as Parent
    gif.AutoSize := Form1.RadioButton1.Checked;  //If Full Size is Checked in RadioGroup

    if Form1.RadioButton2.Checked = True then begin
      gif.Stretch := True;  //Set Strectch True
      gif.Height := Form1.SpinEdit1.Value;  //Set Height
      gif.Width := Form1.SpinEdit2.Value;  //Set Width
    end;

    gif.Caption := 'CDI';  //Set Caption to mark this Image as a Dynamic one (For later Image Deletion)
    gif.Left := 0;  //Set Left
    gif.Top := 0;  //Set Top
    gif.FileName := filename;  //Load the Image from the selected File
    gif.AutoPlay := True;
    gif.OnMouseDown := @DragCustomImage;  //References to needed custom functions
    gif.OnMouseMove := @MoveCustomObject;  //References to needed custom functions
    gif.OnMouseUp := @StopDragging;  //References to needed custom functions
    //gif.OnDblClick := @CustomOnDblClick;  //References to needed custom functions

    gif.Start;

  end
  else begin

  {$ENDIF}

    img := TImage.Create(Self);  //Create new Image
    img.Parent := Form2;  //Set Overlay as Parent
    img.AutoSize := Form1.RadioButton1.Checked;  //If Full Size is Checked in RadioGroup

    if Form1.RadioButton2.Checked = True then begin
      img.Stretch := True;  //Set Strectch True
      img.Height := Form1.SpinEdit1.Value;  //Set Height
      img.Width := Form1.SpinEdit2.Value;  //Set Width
    end;

    img.Caption := 'CDI';  //Set Caption to mark this Image as a Dynamic one (For later Image Deletion)
    img.Left := 0;  //Set Left
    img.Top := 0;  //Set Top
    img.Picture.LoadFromFile(filename);  //Load the Image from the selected File
    img.OnMouseDown := @DragCustomImage;  //References to needed custom functions
    img.OnMouseMove := @MoveCustomObject;  //References to needed custom functions
    img.OnMouseUp := @StopDragging;  //References to needed custom functions
    img.OnDblClick := @CustomOnDblClick;  //References to needed custom functions

  {$IFDEF GIF_SUPPORT}
  end;

  {$ENDIF}

end;

procedure TForm2.FormCreate(Sender: TObject);  //Initialize Dimensions
begin

  Form2.Width := Screen.Width;  //Initialize Overlay Width trough Screen Width
  Form2.Height := Screen.Height;  //Initialize Overlay Height trough Screen Height

  if FileExists(ExtractFilePath(Application.ExeName) + 'Colors+.ini') then begin  //Check if Settings File is Present

    Settings := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Colors+.ini');

    try

     Form1.CheckBox1.Checked := StrToBool(Settings.ReadString('Settings', 'Disable Topmost Status', '0'));
     Form1.CheckBox3.Checked := StrToBool(Settings.ReadString('Settings', 'Disable Overlay Topmost Status', '0'));
     Form1.CheckBox2.Checked := StrToBool(Settings.ReadString('Settings', 'Disable Tray Icon', '0'));
     Form1.ToggleBox4.Checked := StrToBool(Settings.ReadString('Settings', 'Strobelight Effect', '0'));
     Form1.TrackBar8.Position := StrToInt(Settings.ReadString('Settings', 'Strobelight Intensity', '0'));
     Form1.SpinEdit1.Value := StrToInt(Settings.ReadString('Settings', 'Image Dimensions W', '64'));
     Form1.SpinEdit2.Value := StrToInt(Settings.ReadString('Settings', 'Image Dimensions H', '64'));
     Form1.RadioButton2.Checked := StrToBool(Settings.ReadString('Settings', 'Image Stretched Res', '0'));
     Form1.TrackBar6.Position := StrToInt(Settings.ReadString('Settings', 'Text Position X', '0'));
     Form1.TrackBar7.Position := StrToInt(Settings.ReadString('Settings', 'Text Position Y', '0'));
     Form1.TrackBar1.Position := StrToInt(Settings.ReadString('Settings', 'Transparency', '55'));
     Form2.Color := StringToColor(Settings.ReadString('Settings', 'Color', 'clblack'));
     Form1.ToggleBox3.Checked := StrToBool(Settings.ReadString('Settings', 'Attach to Window', '0'));
     Form1.Edit1.Text := Settings.ReadString('Settings', 'Handle', '0');
     Form1.SpinEdit4.Value := StrToInt(Settings.ReadString('Settings', 'Correction', '0'));
     Form1.TrackBar2.Position := StrToInt(Settings.ReadString('Settings', 'X', '0'));
     Form1.TrackBar3.Position := StrToInt(Settings.ReadString('Settings', 'Y', '0'));
     Form1.TrackBar4.Position := StrToInt(Settings.ReadString('Settings', 'W', '0'));
     Form1.TrackBar5.Position := StrToInt(Settings.ReadString('Settings', 'H', '0'));
     Form1.CheckBox4.Checked := StrToBool(Settings.ReadString('Settings', 'Auto Save/Load Settings', '-1'));
     Form1.Memo1.Text := StringReplace(Settings.ReadString('Settings', 'Overlay Text', ''), '?|*<|?', #13#10, [rfReplaceAll]); 
     Label1.Font.Size := StrToInt(Settings.ReadString('Settings', 'Font Size', '12'));
     Label1.Font.Color := StringToColor(Settings.ReadString('Settings', 'Font Color', 'clwhite'));

    finally

      Settings.Free //Free Settings File

    end;

  end;

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

  Form2.Height := Form2.Height + 35;  //Add missing Height from the TitleBar

  Form1.TrackBar2.Position := Form2.Left;  //Reset TrackBar
  Form1.TrackBar3.Position := Form2.Top;  //Reset TrackBar
  Form1.TrackBar4.Position := Form2.Width;  //Reset TrackBar
  Form1.TrackBar5.Position := Form2.Height;  //Reset TrackBar

  Form1.PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);  //Press the RETURN Key to reapply the Overlay
begin

  if Key = VK_RETURN then begin

    CustomOnDblClick(nil);

  end;

end;

procedure TForm2.FormShow(Sender: TObject);  //Logic to make Overlay Click-through
begin

  if FirstStart = True then begin  //Check for FirstStart

    SetWindowLongPtr(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) OR $00080020);  //Click-through Code from WinEdit Dx

    FirstStart := False;  //Unset FirstStart

    if FileExists(ExtractFilePath(Application.ExeName) + 'Colors+.ini') then begin  //Check if Settings File is Present

    Settings := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Colors+.ini');

    try

     Form2.Left := StrToInt(Settings.ReadString('Settings', 'X', '0'));   //Set X Position
     Form2.Top := StrToInt(Settings.ReadString('Settings', 'Y', '0'));   //Set Y Position
     Form2.Width := StrToInt(Settings.ReadString('Settings', 'W', '0'));   //Set Width
     Form2.Height := StrToInt(Settings.ReadString('Settings', 'H', '0'));   //Set Height

    finally

      Settings.Free //Free Settings File

    end;

  end;

  end;

end;

procedure TForm2.FormWindowStateChange(Sender: TObject);
begin

  Form2.WindowState := WsMaximized;  //Maximize Overlay

end;

end.

