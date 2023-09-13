unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CaptionBar;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Memo1: TMemo;
    CaptionBar1: TCaptionBar;
    CaptionBar2: TCaptionBar;
    CaptionBar3: TCaptionBar;
    CaptionBar4: TCaptionBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  X = record
    a1: string;
    a2: string;
  end;

procedure ScreenShot(activeWindow: bool; destBitmap: TBitmap; memo: TMemo;x:Integer;y:Integer);

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  test1: Integer;

procedure TForm1.Button1Click(Sender: TObject);
var
  b: TBitmap;
  rect: TRect;

  point: TPoint;
  hWin: Cardinal;
begin
  hWin := GetForegroundWindow;
  GetWindowRect(hWin, rect);
  Memo1.Lines.Clear;
  Memo1.Lines.Add('left:' + inttostr(rect.Left));
  Memo1.Lines.Add('top:' + inttostr(rect.Top));

  GetCursorPos(point);

  point := ScreenToClient(point);
  Memo1.Lines.Add('px:' + inttostr(point.X));
  Memo1.Lines.Add('py:' + inttostr(point.Y));

  b := TBitmap.Create;
  try

    ScreenShot(TRUE, b, Memo1,0,0);
    // b.SaveToFile('c:\cq\debug\text.bmp');
    test1 := test1 + 1;
    Label1.Caption := inttostr(test1);

    Image1.Picture.Bitmap.Assign(b);
      Image2.Picture.Bitmap.Assign(b);
  finally
    b.FreeImage;
    FreeAndNil(b);

  end;
end;

procedure ScreenShot(activeWindow: bool; destBitmap: TBitmap; memo: TMemo;x:Integer;y:Integer);
var
  w, h: Integer;
  DC: HDC;
  hWin: Cardinal;
  r: TRect;
begin
  if activeWindow then
  begin
    hWin := GetForegroundWindow;

    DC := GetWindowDC(hWin);
    GetWindowRect(hWin, r);
    w := r.Right - r.Left;
    h := r.Bottom - r.Top;
    w := 100;
    h := 100;

  end
  else
  begin
    hWin := GetDesktopWindow;
    DC := GetDC(hWin);
    w := GetDeviceCaps(DC, HORZRES);
    h := GetDeviceCaps(DC, VERTRES);
    w:=25;
    h:=25;
    x:=x-5;
    y:=y-5;
  end;

  try
    destBitmap.Width := w;
    destBitmap.Height := h;
    BitBlt(destBitmap.Canvas.Handle, 0, 0, destBitmap.Width, destBitmap.Height,
      DC, x,y, SRCCOPY);
  finally
    ReleaseDC(hWin, DC);

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Interval := 100;
  Timer1.Enabled := TRUE;
end;

procedure TForm1.OnMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  b: TBitmap;
  rect: TRect;
  point: TPoint;
  hWin: Cardinal;
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  b: TBitmap;
  rect: TRect;
  point: TPoint;
  hWin: Cardinal;
begin
  GetCursorPos(point); // ȡ���������
  Memo1.Lines.Clear;
  Memo1.Lines.Add('px:' + inttostr(point.X));
  Memo1.Lines.Add('py:' + inttostr(point.Y));

  b := TBitmap.Create;
  try

    ScreenShot(false, b, Memo1,point.X,point.Y);
    // b.SaveToFile('c:\cq\debug\text.bmp');
    Image1.Picture.Bitmap.Assign(b);

  finally
    b.FreeImage;
    FreeAndNil(b);

  end;

end;

end.
