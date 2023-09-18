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
    Label14: TLabel;
    Edit2: TEdit;
    Label15: TLabel;
    Edit3: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;

    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure memo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  tWin = record
    hwin: HWND;
    title: string;
  end;

  Ptwin = ^tWin;
  // 得到所有窗口
function GetAllWin(title: string; memo: TMemo): Tlist;
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
  mlist1: Tlist;

procedure TForm1.Button1Click(Sender: TObject);
var
  b: TBitmap;
  r: TRect;

  point: TPoint;
  hwin: Cardinal;
  WasVisible: bool;
begin
  hwin := cWND;

  memo1.Lines.Clear;

  GetCursorPos(point);

  point := ScreenToClient(point);

  // b := TBitmap.Create;
  try

    ShowWindow(hwin, SW_RESTORE);
    GetWindowRect(hwin, r);

    SetForegroundWindow(hwin);

  MoveWindow(hwin, strtoint(Edit2.Text), strtoint(Edit3.Text),
      r.Right - r.Left, r.Bottom - r.Top, True);
    // ScreenShot(TRUE, b, memo1, point.X, point.Y);
    // b.SaveToFile('c:\cq\debug\text.bmp');
    // Image2.Picture.Bitmap.Assign(b);
  finally
    // b.FreeImage;
    // FreeAndNil(b);

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
    // GetWindowRect(hwin, r);
    GetClientRect(hwin, r);
    w := r.Right - r.Left;
    h := r.Bottom - r.Top;
    w := 20;
    h := 20;

//    memo.Clear;
//    memo.Lines.Add('left:' + inttostr(r.Left));
//    memo.Lines.Add('top:' + inttostr(r.Top));
//    memo.Lines.Add('px:' + inttostr(X));
//    memo.Lines.Add('py:' + inttostr(Y));
    X := X - 10 + 11;
    Y := Y - 10 + 11;
  end
  else
  begin
    hwin := GetDesktopWindow;
    GetClientRect(hwin, r);
    DC := GetDC(hwin);
    w := GetDeviceCaps(DC, HORZRES);
    h := GetDeviceCaps(DC, VERTRES);
    w := 20;
    h := 20;

//    memo.Clear;
//    memo.Lines.Add('left:' + inttostr(r.Left));
//    memo.Lines.Add('top:' + inttostr(r.Top));
//    memo.Lines.Add('px:' + inttostr(X));
//    memo.Lines.Add('py:' + inttostr(Y));
    X := X - 10;
    Y := Y - 10;
  end;

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
  pWin: ^tWin;

begin
  Timer1.Interval := 100;
  Timer1.Enabled := True;
  // Edit1.Text:=   '传奇';
  mlist1 := GetAllWin(Edit1.Text, memo1);
  for i := 0 to mlist1.Count - 1 do
  begin
    pWin := mlist1.Items[i];
    ComboBox1.AddItem('h:' + inttostr(pWin.hwin) + pWin.title, Sender);
  end;

end;


procedure TForm1.memo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var p1:tpoint;
begin
          p1:=Mouse.CursorPos;
  //up
  if key=VK_up then
   begin
     setCursorPos(p1.X,p1.Y-1);

     //down
   end else if  key=VK_DOWN then
   begin
        setCursorPos(p1.X,p1.Y+1);

     //home
   end else if  key=VK_LEFT then
   begin
        setCursorPos(p1.X-1,p1.Y);

   //end
   end else if  key=VK_RIGHT then
   begin
        setCursorPos(p1.X+1,p1.Y);

   end

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  b: TBitmap;
  rect: TRect;
  mrect: TRect;
  point: TPoint;
  hwin: Cardinal;
  mcolor: TColor;
  captionh: Integer;
  frameh: Integer;
begin
  GetCursorPos(point); // 取得鼠标坐标


  // Memo1.Lines.Clear;
  // Memo1.Lines.Add('px:' + inttostr(point.X));
  // Memo1.Lines.Add('py:' + inttostr(point.Y));
  Label17.Caption:=inttostr(point.X);
    Label19.Caption:=inttostr(point.y);
  b := TBitmap.Create;
  b.SetSize(20, 20);
  try

    if cWND <> 0 then
    begin
      ScreenShot(false, b, memo1, point.X, point.Y);
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

function GetAllWin(title: string; memo: TMemo): Tlist;
var
  i: Integer;
  mtitle: string;
  pWin: Ptwin;
  HWND: THandle;
  Buf: array [0 .. MAX_PATH] of char;
  mlist1: Tlist;
  r:trect;
begin
  try
    cTitle := '传奇';

    mlist1 := Tlist.Create;
    memo.Lines.Clear;
    // 遍历窗口
    HWND := GetDesktopWindow;
    HWND := GetWindow(HWND, GW_CHILD);

    while HWND <> 0 do
    begin
      GetWindowText(HWND, Buf, length(Buf));
      mtitle := strpas(Buf);

       GetWindowRect(HWND, r);
       if r.Right-r.Left<=0 then
       begin
              HWND := GetWindow(HWND, GW_HWNDNEXT);
              continue;
       end;
         if mtitle.Contains('.exe') then
       begin
              HWND := GetWindow(HWND, GW_HWNDNEXT);
              continue;
       end;


      if mtitle <> '' then
      begin

        if mtitle.Contains(cTitle) or mtitle.Contains('BLUEM2') then
        begin
          NEW(pWin);
          pWin.hwin := HWND;
          pWin.title := mtitle;

          mlist1.Add(pWin);

          memo.Lines.Add('hwnd:' + inttostr(HWND) + mtitle);
        end

        else

        begin
          if mtitle.Contains(title) then
          begin
            NEW(pWin);
            pWin.hwin := HWND;
            pWin.title := mtitle;

            mlist1.Add(pWin);
            memo.Lines.Add('hwnd:' + inttostr(HWND) + mtitle);

          end;
        end;

      end;
      HWND := GetWindow(HWND, GW_HWNDNEXT);
    end;
  finally

  end;
  Result := mlist1;
end;

procedure TForm1.Button2Click(Sender: TObject);
 var r: TRect;

  hwin: Cardinal;
begin
    
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  pWin: ^tWin;
begin
  pWin := mlist1.Items[ComboBox1.ItemIndex];
  cWND := pWin.hwin;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  i: Integer;
  pWin: ^tWin;
begin
  if mlist1 <> nil then
    mlist1.Free;
  ComboBox1.Clear;
  ComboBox1.TextHint := '绑定窗口';
  mlist1 := GetAllWin(Edit1.Text, memo1);
  for i := 0 to mlist1.Count - 1 do
  begin
    pWin := mlist1.Items[i];
    ComboBox1.AddItem('h:' + inttostr(pWin.hwin) + pWin.title, Sender);
  end;
end;

end.
