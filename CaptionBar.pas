unit CaptionBar;

interface

uses
  Windows, SysUtils, Classes, Controls, Graphics;

type
  TCaptionBar = class(TCustomControl)
  private
    FColor: TColor;
    FCaption: TCaption;
    FEllipsis: boolean;
    FIndent: integer;
    procedure SetCaption(const Value: TCaption);
    procedure SetColor(const Value: TColor);
    procedure SetEllipsis(const Value: boolean);
    procedure SetIndent(const Value: integer);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Font;
    property Anchors;
    property Align;
    property Caption: TCaption read FCaption write SetCaption;
    property Color: TColor read FColor write SetColor default clSkyBlue;
    property Ellipsis: boolean read FEllipsis write SetEllipsis default true;
    property Indent: integer read FIndent write SetIndent default 4;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Rejbrand 2009', [TCaptionBar]);
end;

{ TCaptionBar }

constructor TCaptionBar.Create(AOwner: TComponent);
begin
  inherited;
  FIndent := 4;
  FColor := clSkyBlue;
  FEllipsis := true;
end;

procedure TCaptionBar.Paint;
const
  Ellipsis: array[boolean] of cardinal = (0, DT_END_ELLIPSIS);
var
  r: TRect;
begin
  inherited;
  Canvas.Brush.Color := FColor;
  Canvas.FillRect(ClientRect);
  r := ClientRect;
  r.Left := r.Left + FIndent;
  Canvas.Font.Assign(Font);
  DrawText(Canvas.Handle,
    PChar(FCaption),
    length(FCaption),
    r,
    DT_SINGLELINE or DT_LEFT or DT_VCENTER or Ellipsis[FEllipsis]);
end;

procedure TCaptionBar.SetCaption(const Value: TCaption);
begin
  if not SameStr(FCaption, Value) then
  begin
    FCaption := Value;
    Invalidate;
  end;
end;

procedure TCaptionBar.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Invalidate;
  end;
end;

procedure TCaptionBar.SetEllipsis(const Value: boolean);
begin
  if FEllipsis <> Value then
  begin
    FEllipsis := Value;
    Invalidate;
  end;
end;

procedure TCaptionBar.SetIndent(const Value: integer);
begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    Invalidate;
  end;
end;

end.
