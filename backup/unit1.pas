unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, ExtDlgs, Unit2, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckGroup1: TCheckGroup;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    ToggleBox1: TToggleBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    TrayIcon1: TTrayIcon;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ColorPanelClick(Sender: TPanel);
    procedure Memo1Change(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure CheckDimensions(Sender: TTrackBar);
    function GetFullWidth: Integer;
    function GetFullHeight: Integer;
  private

  public

  end;

var
  Form1: TForm1;
  InitialFont: TFont;  //Font used to Reset the Font Dialog

  const License = 'Colors+ is licensed under the' + LineEnding +
                  'GNU General Public License v3.0.' + LineEnding +
                  'You should have received a copy of the ' + LineEnding +
                  'GNU General Public License' + LineEnding +
                  'along with this program.' + LineEnding +
                  'If not, see https://www.gnu.org/licenses/';  //The String used for Displaying the License Information

  const Changelog = 'Version 1.00: Initial Release';  //The String used for Displaying the latest Changelog

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.GetFullWidth: Integer;  //Get combined Screen Width
var
  i: Integer = 0;  //Temporary Counter Variable
begin

  Result := 0;  //Initialize Result

  for i := 0 to Screen.MonitorCount - 1 do begin  //Go through all Monitors

      Result := Result + Screen.Monitors[i].Width;  //Add up Widths

  end;

end;

function TForm1.GetFullHeight: Integer;  //Get combined Screen Height
var
  i: Integer = 0;  //Temporary Counter Variable
begin

  Result := 0;  //Initialize Result

  for i := 0 to Screen.MonitorCount -1 do begin  //Go through Monitors to get the one with the greatest height

      if Screen.Monitors[i].Height > Result then begin  //Check if height > than current Result

        Result := Screen.Monitors[i].Height;  //Set Result

      end;

  end;

end;

procedure TForm1.CheckDimensions(Sender: TTrackBar);  //Check if Trackbar crosses absolute Limits
begin

  if Sender.Min < -32000 then begin  //Check Min

    Sender.Min := -32000;

  end;

  if Sender.Max > 32000 then begin  //Check Max

    Sender.Max := 32000;

  end;

end;

procedure TForm1.TrackBar1Change(Sender: TObject);  //Transparency Trackbar
begin

  Form2.AlphaBlendValue := TrackBar1.Position;  //Change Transparency of Form2 (The Overlay)

  Label1.Caption := IntToStr(255 - Form2.AlphaBlendValue);  //Display current Transparency Value as Number over the TrackBar

end;

procedure TForm1.TrackBar2Change(Sender: TObject);  //Set Dimension and Position of Overlay (Gets called by all 4 TrackBars)
begin
  
  if PageControl1.Enabled = True then begin  //Check if Controls are enabled

    Form2.Left := Trackbar2.Position;  //Set X Position
    Form2.Top := Trackbar3.Position;  //Set Y Position
    Form2.Width := Trackbar4.Position;  //Set Width
    Form2.Height := Trackbar5.Position;  //Set Height

  end;

end;

procedure TForm1.TrackBar6Change(Sender: TObject);  //Set Dimension and Position of Overlay (Gets called by the 2 Text TrackBars)
begin

  if PageControl1.Enabled = True then begin  //Check if Controls are enabled

    Form2.Label1.Left := Trackbar6.Position;  //Set X Position
    Form2.Label1.Top := Trackbar7.Position;  //Set Y Position

  end;

end;

procedure TForm1.TrayIcon1Click(Sender: TObject);  //Hide or Show Mainform by Clicking the TrayIcon
begin

  Form1.Visible := NOT Form1.Visible;  //Boolean Switch the Visibility

end;

procedure TForm1.Button1Click(Sender: TObject);  //ColorKey Transparency (To Display Text or Images at full opacity)
begin

  SetWindowLong(Form2.Handle, GWL_EXSTYLE, GetWindowLongPtr(Form2.Handle, GWL_EXSTYLE) or WS_EX_LAYERED);  //Make choosen Window compatible with Transparency Mode

  SetLayeredWindowAttributes(Form2.Handle, Form2.Color, 0, LWA_COLORKEY);  //Set Window ColorKey Transparency

end;

procedure TForm1.Button10Click(Sender: TObject);  //Fit the Overlay on the Current Screen
begin

  PageControl1.Enabled := False;  //Toggle PageControl to prevent Bugs

  Form2.Width := Screen.Monitors[Application.MainForm.Monitor.MonitorNum].Width;  //Set Width
  Form2.Height := Screen.Monitors[Application.MainForm.Monitor.MonitorNum].Height;  //Set Height
  Form2.Top := Screen.Monitors[Application.MainForm.Monitor.MonitorNum].Top;  //Set Top
  Form2.Left := Screen.Monitors[Application.MainForm.Monitor.MonitorNum].Left;  //Set Left

  TrackBar2.Position := Form2.Left;  //Reset TrackBar
  TrackBar3.Position := Form2.Top;  //Reset TrackBar
  TrackBar4.Position := Form2.Width;  //Reset TrackBar
  TrackBar5.Position := Form2.Height;  //Reset TrackBar

  PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm1.Button11Click(Sender: TObject);  //Fullscreen Stretched Image Loading
begin

  if OpenPictureDialog1.Execute then begin  //Check for execution

    Form2.Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);  //Load choosen Image File

  end;

end;

procedure TForm1.Button12Click(Sender: TObject);  //Delete all Images
begin
  Form2.Image1.Picture.Clear;  //Reset Fullscreen Stretched Image
end;

procedure TForm1.Button13Click(Sender: TObject);  //Makes the Overlay appear as a normal Window wich can be edited by hand
begin

  Form2.Image1.Picture.PNG.LoadFromDevice(Screen.PrimaryMonitor.Handle);

end;

procedure TForm1.Button2Click(Sender: TObject);  //Open ColorDialog
begin

  If ColorDialog1.Execute then begin  //Check for decision

    Form2.Color := ColorDialog1.Color;  //Set choosen Color

  end;

end;

procedure TForm1.Button3Click(Sender: TObject);  //Set Random Color
begin

  Form2.Color := RGBtoColor(Random(255), Random(255), Random(255));  //Randomize Color

end;

procedure TForm1.Button4Click(Sender: TObject);  //Reset Overlay
begin

  Form2.Left := 0;  //X Position
  Form2.Top := 0;   //Y Position
  Form2.Width := Screen.Width;  //Width
  Form2.Height := Screen.Height;  //Height
  Form2.AlphaBlendValue := 55;  //Transparency
  Form2.Color := clblack;  //Color
  Form2.Visible := True;  //Make Visible

  ToggleBox1.Checked := False;  //Reset ToggleBox

  TrackBar1.Position := Form2.AlphaBlendValue;  //Reset Displayed Transparency Value
  Trackbar2.Position := 0;  //Reset Displayed Dimension and Position Values
  Trackbar3.Position := 0;  //Reset Displayed Dimension and Position Values
  Trackbar4.Position := Screen.Width;  //Reset Displayed Dimension and Position Values
  Trackbar5.Position := Screen.Height;  //Reset Displayed Dimension and Position Values  
  Trackbar6.Position := 0;  //Reset Displayed Text Position Values
  Trackbar7.Position := 0;  //Reset Displayed Text Position Values

  Memo1.Clear;  //Clears Text Memo

  Form2.Image1.Picture.Clear;  //Reset Fullscreen Stretched Image

  InitialFont := Label10.Font;  //Trick to get the default Label Font (The Label is a clone of the Overlay Text Label but invisible and on the Mainform

  FontDialog1.Font := InitialFont;  //Reset Font in Dialog
  Form2.Label1.Font := InitialFont;  //Reset Font for Label

end;

procedure TForm1.Button5Click(Sender: TObject);  //See latest Changelog Button
begin

  ShowMessage(Changelog);  //See latest Changelog

end;

procedure TForm1.Button6Click(Sender: TObject);  //See License Information Button
begin

  ShowMessage(License);  //Display License Information

end;

procedure TForm1.Button7Click(Sender: TObject);  //Change the displayed Font
begin

  FontDialog1.Font := Form2.Label1.Font;  //Update selected Font to match current Font

  if FontDialog1.Execute then begin  //Check for executed Font Dialog

    Form2.Label1.Font := FontDialog1.Font;  //Update Font

  end;

end;

procedure TForm1.Button8Click(Sender: TObject);  //Fixes the Color of the Overlay if it does not change on Multi Monitor Setups
var
  tempWidth: Integer = 0;  //Temporary Variable for saving the old Width
  tempHeight: Integer = 0;  //Temporary Variable for saving the old Height
begin

  tempWidth := Form2.Width;  //Save Width
  Form2.Width := 0;          //Reset Width
  Form2.Width := tempWidth;  //Load Width
  tempHeight := Form2.Height;  //Save Height
  Form2.Height := 0;  //Reset Height
  Form2.Height := tempHeight;  //Load Height

end;

procedure TForm1.Button9Click(Sender: TObject);  //Get full predicted Width and Height of the Monotors and set the Overlay size acording to this
begin

  PageControl1.Enabled := False;  //Toggle PageControl to prevent Bugs

  ShowMessage('The Software will now attempt to set the Overlay on all Monitors. If this does not look right please adjust the placement with the Position and Dimension TrackBars.');  //Display Infobox
  Form2.Width := GetFullWidth;  //Set Full Width
  Form2.Height := GetFullHeight;  //Set Fullt Height

  TrackBar2.Position := Form2.Left;  //Reset TrackBar
  TrackBar3.Position := Form2.Top;  //Reset TrackBar
  TrackBar4.Position := Form2.Width;  //Reset TrackBar
  TrackBar5.Position := Form2.Height;  //Reset TrackBar

  PageControl1.Enabled := True;  //Toggle PageControl to prevent Bugs

end;

procedure TForm1.CheckBox1Change(Sender: TObject);  //Self Settings to switch off Topmost mode
begin

  if CheckBox1.Checked then begin

    Form1.FormStyle := fsNormal;  //FormStyle Normal -> Application not Topmost

  end
  else begin

    Form1.FormStyle := fsSystemStayOnTop;  //FormStyle SystemStayOnTop -> Application Topmost

  end;

end;

procedure TForm1.CheckBox2Change(Sender: TObject);  //Selft Settings to switch off TrayIcon
begin

  if CheckBox2.Checked then begin

    TrayIcon1.Visible := False;  //Hide TrayIcon

  end
  else begin

    TrayIcon1.Visible := True;  //Show TrayIcon

  end;

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);  //On Close Cleanup
begin

  TrayIcon1.Visible := False;  //Hide TrayIcon before Closing to prevent Leftovers

end;

procedure TForm1.FormCreate(Sender: TObject);  //From Creation Events
begin

  PageControl1.Enabled := False;  //Disable Controls to prevent bugs

  TrayIcon1.Show;  //Show TrayIcon
  Randomize;  //Initialize Randomization

  TrackBar2.Max := 3 * Screen.Width;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar3.Max := 3 * Screen.Height;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar2.Min := -3 * Screen.Width;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar3.Min := -3 * Screen.Height;  //Allow for Tripple of Main Screen (In Case of more Monitors)

  TrackBar6.Max := 3 * Screen.Width;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar7.Max := 3 * Screen.Height;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar6.Min := -3 * Screen.Width;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar7.Min := -3 * Screen.Height;  //Allow for Tripple of Main Screen (In Case of more Monitors)

  TrackBar4.Max := 3 * Screen.Width;  //Allow for Tripple of Main Screen (In Case of more Monitors)
  TrackBar5.Max := 3 * Screen.Height;  //Allow for Tripple of Main Screen (In Case of more Monitors)

  Trackbar2.Position := 0;  //Initialize Displayed Dimension and Position Values
  Trackbar3.Position := 0;  //Initialize Displayed Dimension and Position Values
  Trackbar4.Position := Screen.Width;  //Initialize Displayed Dimension and Position Values
  Trackbar5.Position := Screen.Height;  //Initialize Displayed Dimension and Position Values

  PageControl1.Enabled := True;  //Enable Controls again

end;

procedure TForm1.ColorPanelClick(Sender: TPanel);  //Change Color directly by reading panel Colors
begin

  Form2.Color := Sender.Color;  //Set Color from Color of Element

end;

procedure TForm1.Memo1Change(Sender: TObject);  //Create Text on Overlay
begin

  Form2.Label1.Caption := Memo1.Text;  //Use Text typed in Memo

end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin

  Form2.Visible := NOT ToggleBox1.Checked;  //Toggle Overlay Visibility

  if ToggleBox1.Checked = True then begin   //Switch displayed Caption

    ToggleBox1.Caption := 'Turn Overlay On';

  end
  else begin

    ToggleBox1.Caption := 'Turn Overlay Off';

  end;

end;

end.

