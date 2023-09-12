unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  x = record
    a1: string;
    a2: string;
  end;
            procedure ScreenShot(activeWindow: bool; destBitmap : TBitmap);
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
    var
   b:TBitmap;
begin
           b := TBitmap.Create;
  try
    ScreenShot(TRUE, b) ;
    Label1.Caption:=inttostr(GetForegroundWindow);
    Image1.Picture.Bitmap.Assign(b) ;
  finally
    b.FreeImage;
    FreeAndNil(b) ;

end;
end;
procedure ScreenShot(activeWindow: bool; destBitmap : TBitmap) ;
var
   w,h : integer;
   DC : HDC;
   hWin : Cardinal;
   r : TRect;
begin
   if activeWindow then
   begin
     hWin := GetForegroundWindow;

     dc := GetWindowDC(hWin) ;
     GetWindowRect(hWin,r) ;
     w := r.Right - r.Left;
     h := r.Bottom - r.Top;
     w:=100;
     h:=100;
   end
   else
   begin
     hWin := GetDesktopWindow;
     dc := GetDC(hWin) ;
     w := GetDeviceCaps (DC, HORZRES) ;
     h := GetDeviceCaps (DC, VERTRES) ;
   end;

   try
    destBitmap.Width := w;
    destBitmap.Height := h;
    BitBlt(destBitmap.Canvas.Handle,
           0,
           0,
           destBitmap.Width,
           destBitmap.Height,
           DC,
           0,
           0,
           SRCCOPY) ;
   finally
    ReleaseDC(hWin, DC) ;
   end;
end;

end.





