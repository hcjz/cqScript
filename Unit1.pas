unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CaptionBar,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox1: TComboBox;
    Label13: TLabel;
    Edit1: TEdit;
    Button1: TButton;

    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  tWin = record
    hwin: HWND;
    title: string;
  end;

  tList1 = array [0 .. 99] of tWin;
  // 得到所有窗口
function GetAllWin(title: string; memo: TMemo): tList1;
function TColorToHex(Color: TColor): string;
procedure ScreenShot(activeWindow: bool; destBitmap: TBitmap; memo: TMemo;
  X: Integer; Y: Integer);

var
  Form1: TForm1;
  // 选中的当前窗口句柄
  cWND: THandle;
  // 当前过滤的窗口标题
  cTitle: string;

implementation

{$R *.dfm}

var
  test1: Integer;
  mlist1: tList1;

procedure TForm1.Button1Click(Sender: TObject);
var
  b: TBitmap;
  rect: TRect;

  point: TPoint;
  hwin: Cardinal;
begin
  hwin := cWND;
  GetWindowRect(hwin, rect);
  memo1.Lines.Clear;
  memo1.Lines.Add('left:' + inttostr(rect.Left));
  memo1.Lines.Add('top:' + inttostr(rect.Top));

  GetCursorPos(point);

  point := ScreenToClient(point);
  memo1.Lines.Add('px:' + inttostr(point.X));
  memo1.Lines.Add('py:' + inttostr(point.Y));

  b := TBitmap.Create;
  try

    ScreenShot(TRUE, b, memo1, point.X, point.Y);
    b.SaveToFile('c:\cq\debug\text.bmp');
    Image2.Picture.Bitmap.Assign(b);
  finally
    b.FreeImage;
    FreeAndNil(b);

  end;
end;

procedure ScreenShot(activeWindow: bool; destBitmap: TBitmap; memo: TMemo;
  X: Integer; Y: Integer);
var
  w, h: Integer;
  DC: HDC;
  hwin: Cardinal;
  r: TRect;
  point: TPoint;
begin

  if activeWindow then
  begin
    hwin := cWND;
    DC := GetWindowDC(hwin);
    GetWindowRect(hwin, r);
    w := r.Right - r.Left;
    h := r.Bottom - r.Top;
    w := 20;
    h := 20;
    memo.Clear;
      memo.Lines.Add('left:' + inttostr(r.Left));
      memo.Lines.Add('top:' + inttostr(r.Top));
       memo.Lines.Add('px:' + inttostr(X));
       memo.Lines.Add('py:' + inttostr(Y));


  end
  else
  begin
    hwin := GetDesktopWindow;
    DC := GetDC(hwin);
    w := GetDeviceCaps(DC, HORZRES);
    h := GetDeviceCaps(DC, VERTRES);
    w := 20;
    h := 20;
  end;
  X := X - 10;
  Y := Y - 10;
  try
    destBitmap.Width := w;
    destBitmap.Height := h;
    BitBlt(destBitmap.Canvas.Handle, 0, 0, destBitmap.Width, destBitmap.Height,
      DC, X, Y, SRCCOPY);
  finally
    ReleaseDC(hwin, DC);

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Timer1.Interval := 100;
  Timer1.Enabled := TRUE;
  cTitle := '取色器';
  mlist1 := GetAllWin(Edit1.Text, memo1);
  for i := 0 to 99 do
  begin
    if mlist1[i].hwin > 0 then
    begin
      ComboBox1.AddItem(mlist1[i].title, Sender);
    end;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  b: TBitmap;
  rect: TRect;
  mrect: TRect;
  point: TPoint;
  hwin: Cardinal;
  mcolor: TColor;
  captionh:integer;
  frameh:integer;
begin
  GetCursorPos(point); // 取得鼠标坐标


  // Memo1.Lines.Clear;
  // Memo1.Lines.Add('px:' + inttostr(point.X));
  // Memo1.Lines.Add('py:' + inttostr(point.Y));

  b := TBitmap.Create;
  b.SetSize(20, 20);
  try

    if cWND <> 0 then
    begin
      point := ScreenToClient(point);
      //边框高
  frameh := GetSystemMetrics(SM_CXFRAME);
//标题高
  captionh := GetSystemMetrics(SM_CYCAPTION);
//菜单高
 //menuh:=GetSystemMetrics(SM_CYMENU);
      label13.Caption:=  inttostr(frameh);
      ScreenShot(TRUE, b, memo1, point.X+11, point.Y+45);
    end
    else
      ScreenShot(false, b, memo1, point.X, point.Y);

    // b.SaveToFile('c:\cq\debug\text.bmp');
    // Image2.Picture.Bitmap.Assign(b);

    mrect.Left := 0;
    mrect.Top := 0;
    mrect.Right := 200;
    mrect.Bottom := 200;
    Image2.Canvas.StretchDraw(mrect, b);
    Image2.Canvas.Pen.Style := Tpenstyle(0);
    Image2.Canvas.Pen.Color := $FFFF00;
    Image2.Canvas.Pen.Width := 1;
    Image2.Canvas.MoveTo(100, 100);
    Image2.Canvas.LineTo(100, 110);
    Image2.Canvas.LineTo(110, 110);
    Image2.Canvas.LineTo(110, 100);
    Image2.Canvas.LineTo(100, 100);
    mcolor := Image2.Canvas.Pixels[101, 101];

    Label8.Caption := inttostr(mcolor and $FF);
    Label9.Caption := inttostr((mcolor shr 8) and $FF);
    Label10.Caption := inttostr((mcolor shr 16) and $FF);
    Label11.Caption := TColorToHex(mcolor);

  finally
    b.FreeImage;
    FreeAndNil(b);

  end;

end;

function TColorToHex(Color: TColor): string;
begin
  Result :=

    IntToHex(GetBValue(Color), 2) + IntToHex(GetGValue(Color), 2) +
    IntToHex(GetRValue(Color), 2);
end;

function GetAllWin(title: string; memo: TMemo): tList1;
var
  i: Integer;
  mtitle: string;
  mWin: tWin;
  HWND: THandle;
  Buf: array [0 .. MAX_PATH] of char;
  mlist1: tList1;
begin
  memo.Lines.Clear;
  // 遍历窗口
  HWND := GetDesktopWindow;
  HWND := GetWindow(HWND, GW_CHILD);
  i := 0;
  while HWND <> 0 do
  begin
    GetWindowText(HWND, Buf, length(Buf));
    mtitle := strpas(Buf);
    if mtitle <> '' then
    begin
      if title <> cTitle then
      begin
        if mtitle.Contains(title) then
        begin
          mWin.hwin := HWND;
          mWin.title := mtitle;
          mlist1[i] := mWin;
          i := i + 1;
          memo.Lines.Add('hwnd:' + inttostr(HWND) + mtitle);
        end;
      end
      else

      begin
        if mtitle.Contains(title) then
        begin
          if i < 100 then
          begin
            mWin.hwin := HWND;
            mWin.title := mtitle;
            mlist1[i] := mWin;
            i := i + 1;
            memo.Lines.Add('hwnd:' + inttostr(HWND) + mtitle);
          end;

        end;
      end;

    end;
    HWND := GetWindow(HWND, GW_HWNDNEXT);
  end;
  Result := mlist1;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  cWND := mlist1[ComboBox1.ItemIndex].hwin;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  i: Integer;
begin
  mlist1 := GetAllWin(cTitle, memo1);
  for i := 0 to 99 do
  begin
    if mlist1[i].hwin > 0 then
    begin
      ComboBox1.AddItem(mlist1[i].title, Sender);
    end;
  end;
end;

end.
