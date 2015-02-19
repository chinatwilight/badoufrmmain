unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils, Wininet, StrUtils, MPlayer,
  mmsystem, ToolWin, IniFiles, System.Zip, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, IdHashSHA, Typinfo,
  Vcl.ImgList;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

function PropertyExists(const AObject: TObject;
  const APropName: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  Result := Assigned(PropInfo);
end;

function GetObjectProperty(const AObject: TObject;
  const APropName: string): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  if Assigned(PropInfo) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := GetObjectProp(AObject, PropInfo);
end;

procedure FitDeviceResolution(Sender: TForm);
const
  OriWidth = 1280;
  OriHeight = 800;
var
  i: Integer;
  j: Integer;
  LocAnchors: array of TAnchors;
  LocAlign: array of TAlign;
  LocList: TList;
  LocFontSize: Integer;
  LocFont: TFont;
  LocCmp: TComponent;
  ScrResolutionRateH, ScrResolutionRateW, LocFontRate: Double;
begin
  ScrResolutionRateH := Screen.Height / OriHeight;
  ScrResolutionRateW := Screen.Width / OriWidth;
  if Abs(ScrResolutionRateH - 1) < Abs(ScrResolutionRateW - 1) then
    LocFontRate := ScrResolutionRateH
  else
    LocFontRate := ScrResolutionRateW;
  LocList := TList.Create;
  try
    try
      if (Screen.Width <> OriWidth) or (Screen.Height <> OriHeight) then
      begin
        Sender.Scaled := False;
        for i := Sender.ComponentCount - 1 downto 0 do
        begin
          LocCmp := Sender.Components[i];
          if LocCmp is TControl then
            LocList.Add(LocCmp);
          if PropertyExists(LocCmp, 'FONT') then
          begin
            LocFont := TFont(GetObjectProperty(LocCmp, 'FONT'));
            LocFontSize := Round(LocFontRate * LocFont.Size);
            LocFont.Size := LocFontSize;
          end;
        end;
        SetLength(LocAnchors, LocList.Count);
        SetLength(LocAlign, LocList.Count);
        for i := 0 to LocList.Count - 1 do
          with TControl(LocList.Items[i]) do
          begin
            LocAnchors[i] := Anchors;
            LocAlign[i] := Align;
            Align := alNone;
            Anchors := [akLeft, akTop];
          end;
        Sender.Top := Round(Sender.Top * ScrResolutionRateH);
        Sender.Left := Round(Sender.Left * ScrResolutionRateW);
        Sender.Height := Round(Sender.Height * ScrResolutionRateH);
        Sender.Width := Round(Sender.Width * ScrResolutionRateW);
        Sender.Font.Size := Round(LocFontRate * Sender.Font.Size);
        for i := 0 to LocList.Count - 1 do
        begin
          with TControl(LocList.Items[i]) do
          begin
            Top := Round(Top * ScrResolutionRateH);
            Left := Round(Left * ScrResolutionRateW);
            Height := Round(Height * ScrResolutionRateH);
            Width := Round(Width * ScrResolutionRateW);
          end;
        end;
        for i := 0 to LocList.Count - 1 do
          TControl(LocList.Items[i]).Align := LocAlign[i];
        for i := 0 to LocList.Count - 1 do
          TControl(LocList.Items[i]).Anchors := LocAnchors[i];
      end;
    except
      MessageDlg(LocCmp.Name, mtInformation, [mbOK], 0);
    end;
  finally
    LocList.Free;
  end;
end;
{ 自动适应屏幕 ---结束 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Top := (Screen.Height - Form2.Height) div 2;
  Form2.Left := (Screen.Width - Form2.Width) div 2;
end;

procedure TForm2.FormHide(Sender: TObject);
begin
  AnimateWindow(Self.Handle, 500, AW_BLEND or AW_HIDE);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  AnimateWindow(Self.Handle, 2000, AW_BLEND or AW_ACTIVATE);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Self.Hide;
end;

end.
