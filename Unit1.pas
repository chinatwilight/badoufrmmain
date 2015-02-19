unit Unit1;

interface

// kylinagent code
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils, Wininet, StrUtils, MPlayer,
  mmsystem, ToolWin, IniFiles, System.Zip, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, IdHashSHA, Typinfo,
  Vcl.ImgList, Vcl.Grids, FireDAC.Stan.Def, FireDAC.Phys.ASAWrapper,
  IdBaseComponent, IdAntiFreezeBase, Vcl.IdAntiFreeze, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.ASA,math;

const
  // aimDir = 'C:\Documents and Settings\Administrator\Application Data\Mozilla';
  protect = 'C:\windows\kylin-proxy\proxy.ini';

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    WebBrowser1: TWebBrowser;
    Timer1: TTimer;
    N15: TMenuItem;
    N9: TMenuItem;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    Timer2: TTimer;
    BalloonHint1: TBalloonHint;
    N5: TMenuItem;
    N13: TMenuItem;
    N8: TMenuItem;
    Timer3: TTimer;
    VIP1: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N16: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N14: TMenuItem;
    Timer4: TTimer;
    ImageList2: TImageList;
    TrayIcon2: TTrayIcon;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure onionDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N13Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N18DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N19DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N20DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N21DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure O1Click(Sender: TObject);
    procedure DNS2Click(Sender: TObject);
    procedure DNS1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure O1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure DNS2DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N26Click(Sender: TObject);
    procedure ASDL1Click(Sender: TObject);
    procedure N26DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure ASDL1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N27DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure FormShow(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure RC41Click(Sender: TObject);
    procedure aes256cfb1Click(Sender: TObject);
    procedure bfcfb1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure youtubegaoqing1Click(Sender: TObject);
    procedure YouTube1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure IP1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N1111Click(Sender: TObject);
    procedure N1221Click(Sender: TObject);
    procedure N1321Click(Sender: TObject);
    procedure N1441Click(Sender: TObject);
  private
    { Private declarations }
    procedure SysCommand(var SysMsg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }

  end;

function SetLayeredWindowAttributes(hwnd: hwnd; crKey: Longint; bAlpha: byte;
  dwFlags: Longint): Longint; stdcall; external user32; // 函数声明

var
  Form1: TForm1;
  item: TListItem;
  Summ: Word; // read process
  ContinueLoop: BOOL;
  NewItem: TListItem;
  StrVIP: string; // 尊贵VIP身份验证
  ee1, filename1: string; // 控制火狐浏览器启动
  slist: TStringList; // 存储文本文件内容
  pstrarray: array of string; // 数组
  i, icount: Integer;
  mytitle, mytext: string;
  createini: TiniFile; // ------------
  p, dynamic, ini, pp, newday: Integer;
  delappid, aa, c, d, self1, strHideFile, strdec: string;
  ai, strfox, strgo, Temfox, Temgo: string;
  icondata: tnotifyicondata;
  myinifile, myinifile1: TiniFile;
  e, b: string;
  vi, a, ComA, ComB: Integer;
  filename: string;
  MyStream: TMemIniFile;
  // --------------
  Reg: TRegistry;
  proxya: string; // 智能代理全局申明
  SEX: Integer;
  info: INTERNET_PROXY_INFO;
  StrEncrypt, StrEncrypt1: string;
  protectFile: TFileStream;
  myThread: TThread;
  buffer: array [0 .. 86] of byte = (
    $46,
    $00,
    $00,
    $00,
    $01,
    $00,
    $00,
    $00,
    $05,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $1F,
    $00,
    $00,
    $00,
    $68,
    $74,
    $74,
    $70,
    $3A,
    $2F,
    $2F,
    $31,
    $32,
    $37,
    $2E,
    $30,
    $2E,
    $30,
    $2E,
    $31,
    $3A,
    $38,
    $30,
    $38,
    $36,
    $2F,
    $70,
    $72,
    $6F,
    $78,
    $79,
    $2E,
    $70,
    $61,
    $63,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00
  );
  buffer1: array [0 .. 86] of byte = (
    $46,
    $00,
    $00,
    $00,
    $02,
    $00,
    $00,
    $00,
    $01,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $1F,
    $00,
    $00,
    $00,
    $68,
    $74,
    $74,
    $70,
    $3A,
    $2F,
    $2F,
    $31,
    $32,
    $37,
    $2E,
    $30,
    $2E,
    $30,
    $2E,
    $31,
    $3A,
    $38,
    $30,
    $38,
    $36,
    $2F,
    $70,
    $72,
    $6F,
    $78,
    $79,
    $2E,
    $70,
    $61,
    $63,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00
  );
  buffer2: array [0 .. 107] of byte = (
    $46,
    $00,
    $00,
    $00,
    $03,
    $00,
    $00,
    $00,
    $03,
    $00,
    $00,
    $00,
    $0E,
    $00,
    $00,
    $00,
    $31,
    $32,
    $37,
    $2E,
    $30,
    $2E,
    $30,
    $2E,
    $31,
    $3A,
    $38,
    $30,
    $38,
    $37,
    $07,
    $00,
    $00,
    $00,
    $3C,
    $6C,
    $6F,
    $63,
    $61,
    $6C,
    $3E,
    $1F,
    $00,
    $00,
    $00,
    $68,
    $74,
    $74,
    $70,
    $3A,
    $2F,
    $2F,
    $31,
    $32,
    $37,
    $2E,
    $30,
    $2E,
    $30,
    $2E,
    $31,
    $3A,
    $38,
    $30,
    $38,
    $36,
    $2F,
    $70,
    $72,
    $6F,
    $78,
    $79,
    $2E,
    $70,
    $61,
    $63,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00,
    $00
  );
  StrShaKylin, StrShaFirefox: string;
  Strfirefox, Strfirefox1: string;
  StrCountry: string;
  StrUpdate: string;
  Strkylinpath: string;
  StrMyPath: string;
  StrGetVolumeID: string;
  StrEncryption: string;
  StrEncryptionGet: string;

function GetFile_SHA1(const iFileName: string): string; // 获取文件SHA1

implementation

uses Unit2, Unit4, Unit5, Unit3, unit7;

{$R *.dfm}
{$R hack.res}
function GetVolumeID: string;
var
  vVolumeNameBuffer: array [0 .. 255] of Char;
  vVolumeSerialNumber: DWORD;
  vMaximumComponentLength: DWORD;
  vFileSystemFlags: DWORD;
  vFileSystemNameBuffer: array [0 .. 255] of Char;
begin
  if GetVolumeInformation('c:\', vVolumeNameBuffer, SizeOf(vVolumeNameBuffer),
    @vVolumeSerialNumber, vMaximumComponentLength, vFileSystemFlags,
    vFileSystemNameBuffer, SizeOf(vFileSystemNameBuffer)) then
  begin
    Result := IntToHex(vVolumeSerialNumber, 8);
  end;
end;

{ 自动适应屏幕 ---开始 }

function DayOfWeek(const DateTime: TDateTime): Word;
// 判断星期几,偶数升级，基数sleep
begin
  Result := DateTimeToTimeStamp(DateTime).Date mod 7 + 1;
end;

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

function GetFile_SHA1(const iFileName: string): string;
// Checksum hash value for firefox

var
  SHA1: TIdHashSHA1;
  fileStream: TMemoryStream;
begin
  SHA1 := TIdHashSHA1.Create;
  fileStream := TMemoryStream.Create;
  try
    fileStream.LoadFromFile(iFileName);
    Result := SHA1.HashStreamAsHex(fileStream);
  finally
    fileStream.Free;
    SHA1.Free;
  end;
end;

function ADSLsetupTOCANCEL(const bEnabled: Boolean = True): Boolean;
var
  hKey1: HKEY;
  i: Integer;
  retCode, Size: Cardinal;
  Key, Value: array [0 .. 255] of Char;
  strkey: string;
begin
  Result := False;
  Reg := TRegistry.Create;
  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0, KEY_READ, hKey1);
  i := 0;
  repeat
    Size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, Size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey
        ('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
        True);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      Size := 1024;
      strkey := string(Key);
      Reg.WriteBinaryData(strkey, buffer1[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  // showmessage('拨号取消成功！') ;
  sleep(50);
  Result := True;
  Reg.CloseKey;
  Reg.Free;
end;

function ADSLsetupglobal(const bEnabled: Boolean = True): Boolean;
// setup global  Mode  for adsl
var
  hKey1: HKEY;
  i: Integer;
  retCode, Size: Cardinal;
  Key, Value: array [0 .. 255] of Char;
  strkey: string;
begin

  Result := False;
  Reg := TRegistry.Create;

  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0, KEY_READ, hKey1);
  i := 0;
  repeat
    Size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, Size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey
        ('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
        True);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      Size := 1024;
      strkey := string(Key);
      Reg.WriteBinaryData(strkey, buffer2[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  // showmessage('拨号设置成功！') ;
  sleep(50);
  Result := True;

  Reg.CloseKey;
  Reg.Free;
end;

function ADSLsetup(const bEnabled: Boolean = True): Boolean;
// setup smart Mode at adsl
var
  hKey1: HKEY;
  i: Integer;
  retCode, Size: Cardinal;
  Key, Value: array [0 .. 255] of Char;
  strkey: string;
begin

  Result := False;
  Reg := TRegistry.Create;

  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0, KEY_READ, hKey1);
  i := 0;
  repeat
    Size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, Size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey
        ('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
        True);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      Size := 1024;
      strkey := string(Key);
      Reg.WriteBinaryData(strkey, buffer[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  // showmessage('拨号设置成功！') ;
  sleep(50);
  Result := True;

  Reg.CloseKey;
  Reg.Free;
end;

function StrPosCount(subs: string; source: string): Integer;
// 统计字符串出现的次数
var
  Str: string;
begin
  Result := 0;
  Str := source;
  while Pos(subs, Str) <> 0 do
  begin
    Delete(Str, Pos(subs, Str), Length(subs));
    Inc(Result);
  end;
end;

{ ===============================================================================

  函数名:    Rc4_StrEncrypt()
  描  述:    RC4 Based string encryption
  参  数:   i_Encrypt ——为 1 是加密, 0 是解密（integer类型）；
  s_EncryptText ——待加密（解密）的字符串（string类型）；
  s_EncryptPassword ——加密（解密）的密码（string类型）；
  i_EncryptLevel ——加密级别（范围：1－－10；integer类型））

  翻译:        吴间道
  QQ:           93331961
  =============================================================================== }

function Rc4(i_Encrypt: Integer; s_EncryptText, s_EncryptPassword: string;
  i_EncryptLevel: Integer = 1): string;
var
  v_EncryptModified, v_EncryptCipher, v_EncryptCipherBy: string;
  i_EncryptCountA, i_EncryptCountB, i_EncryptCountC, i_EncryptCountD,
    i_EncryptCountE, i_EncryptCountF, i_EncryptCountG, i_EncryptCountH,
    v_EncryptSwap: Integer;
  av_EncryptBox: array [0 .. 256, 0 .. 2] of Integer;

begin
  if (i_Encrypt <> 0) and (i_Encrypt <> 1) then
  begin
    Result := '';
  end
  else if (s_EncryptText = '') or (s_EncryptPassword = '') then
  begin
    Result := '';
  end
  else
  begin
    if (i_EncryptLevel <= 0) or (Int(i_EncryptLevel) <> i_EncryptLevel) then
      i_EncryptLevel := 1;
    if Int(i_EncryptLevel) > 10 then
      i_EncryptLevel := 10;
    if i_Encrypt = 1 then
    begin
      for i_EncryptCountF := 0 to i_EncryptLevel do
      begin
        i_EncryptCountG := 0;
        i_EncryptCountH := 0;
        v_EncryptModified := '';
        for i_EncryptCountG := 1 to Length(s_EncryptText) do
        begin
          if i_EncryptCountH = Length(s_EncryptPassword) then
          begin
            i_EncryptCountH := 1;
          end
          else
          begin
            Inc(i_EncryptCountH);
          end;
          v_EncryptModified := v_EncryptModified +
            Chr(Ord(s_EncryptText[i_EncryptCountG])
            xor Ord(s_EncryptPassword[i_EncryptCountH]) xor 255);
        end;
        s_EncryptText := v_EncryptModified;
        i_EncryptCountA := 0;
        i_EncryptCountB := 0;
        i_EncryptCountC := 0;
        i_EncryptCountD := 0;
        i_EncryptCountE := 0;
        v_EncryptCipherBy := '';
        v_EncryptCipher := '';
        v_EncryptSwap := 0;
        for i_EncryptCountA := 0 to 255 do
        begin
          av_EncryptBox[i_EncryptCountA, 1] :=
            Ord(s_EncryptPassword[i_EncryptCountA mod Length
            (s_EncryptPassword) + 1]);
          av_EncryptBox[i_EncryptCountA, 0] := i_EncryptCountA;
        end;
        for i_EncryptCountA := 0 to 255 do
        begin
          i_EncryptCountB := (i_EncryptCountB + av_EncryptBox[i_EncryptCountA]
            [0] + av_EncryptBox[i_EncryptCountA][1]) mod 256;
          v_EncryptSwap := av_EncryptBox[i_EncryptCountA][0];
          av_EncryptBox[i_EncryptCountA][0] :=
            av_EncryptBox[i_EncryptCountB][0];
          av_EncryptBox[i_EncryptCountB][0] := v_EncryptSwap;
        end;
        for i_EncryptCountA := 1 to Length(s_EncryptText) do
        begin
          i_EncryptCountC := (i_EncryptCountC + 1) mod 256;
          i_EncryptCountD := (i_EncryptCountD + av_EncryptBox[i_EncryptCountC]
            [0]) mod 256;
          i_EncryptCountE := av_EncryptBox
            [(av_EncryptBox[i_EncryptCountC][0] + av_EncryptBox[i_EncryptCountD]
            [0]) mod 256][0];
          v_EncryptCipherBy := inttostr(Ord(s_EncryptText[i_EncryptCountA])
            xor i_EncryptCountE);
          v_EncryptCipher := v_EncryptCipher +
            IntToHex(strtoint(v_EncryptCipherBy), 2);

        end;
        s_EncryptText := v_EncryptCipher;
      end;

    end
    else
    begin
      for i_EncryptCountF := 0 to i_EncryptLevel do
      begin
        i_EncryptCountB := 0;
        i_EncryptCountC := 0;
        i_EncryptCountD := 0;
        i_EncryptCountE := 0;
        v_EncryptCipherBy := '';
        v_EncryptCipher := '';
        v_EncryptSwap := 0;
        for i_EncryptCountA := 0 to 255 do
        begin
          av_EncryptBox[i_EncryptCountA, 1] :=
            Ord(s_EncryptPassword[i_EncryptCountA mod Length
            (s_EncryptPassword) + 1]);
          av_EncryptBox[i_EncryptCountA, 0] := i_EncryptCountA;
        end;
        for i_EncryptCountA := 0 to 255 do
        begin
          i_EncryptCountB := (i_EncryptCountB + av_EncryptBox[i_EncryptCountA,
            0] + av_EncryptBox[i_EncryptCountA, 1]) mod 256;
          v_EncryptSwap := av_EncryptBox[i_EncryptCountA, 0];
          av_EncryptBox[i_EncryptCountA, 0] :=
            av_EncryptBox[i_EncryptCountB, 0];
          av_EncryptBox[i_EncryptCountB, 0] := v_EncryptSwap;
        end;
        for i_EncryptCountA := 1 to Length(s_EncryptText) do
        begin
          if (i_EncryptCountA mod 2) <> 0 then
          begin
            i_EncryptCountC := ((i_EncryptCountC + 1) mod 256);
            i_EncryptCountD :=
              ((i_EncryptCountD + av_EncryptBox[i_EncryptCountC, 0]) mod 256);
            i_EncryptCountE := av_EncryptBox
              [((av_EncryptBox[i_EncryptCountC, 0] + av_EncryptBox
              [i_EncryptCountD, 0]) mod 256), 0];
            v_EncryptCipherBy :=
              inttostr(StrToInt64('$' + s_EncryptText[i_EncryptCountA] +
              s_EncryptText[i_EncryptCountA + 1]) xor i_EncryptCountE);
            v_EncryptCipher := v_EncryptCipher +
              Chr(strtoint(v_EncryptCipherBy));
          end;
        end;
        s_EncryptText := v_EncryptCipher;
        i_EncryptCountG := 0;
        i_EncryptCountH := 0;
        v_EncryptModified := '';
        for i_EncryptCountG := 1 to Length(s_EncryptText) do
        begin
          if i_EncryptCountH = Length(s_EncryptPassword) then
          begin
            i_EncryptCountH := 1;
          end
          else
          begin
            i_EncryptCountH := i_EncryptCountH + 1;
          end;
          v_EncryptModified := v_EncryptModified +
            Chr((Ord(s_EncryptText[i_EncryptCountG])
            xor Ord(s_EncryptPassword[i_EncryptCountH]) xor 255));
        end;
        s_EncryptText := v_EncryptModified;
      end;
    end;
    Result := s_EncryptText;
  end;
end;

function DeleteDirectory(NowPath: string): Boolean; // 删除整个目录
var
  search: TSearchRec;
  ret: Integer;
  Key: string;
begin
  if NowPath[Length(NowPath)] <> '\' then
    NowPath := NowPath + '\';
  Key := NowPath + '*.*';
  ret := findFirst(Key, faanyfile, search);
  while ret = 0 do
  begin
    if ((search.Attr and fadirectory) = fadirectory) then
    begin
      if (search.Name <> '.') and (search.Name <> '..') then
        DeleteDirectory(NowPath + search.Name);
    end
    else
    begin
      if ((search.Attr and fadirectory) <> fadirectory) then
      begin
        deletefile(NowPath + search.Name);
      end;
    end;
    ret := FindNext(search);
  end;
  findClose(search);
  removedir(NowPath);
  Result := True;
end;

procedure TForm1.N27DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   默认(4M)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   默认(4M)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N29Click(Sender: TObject);
var
  filename: string;
begin
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('autorange', 'threads', '3');
  myinifile.writestring('autorange', 'maxsize', '1048576');
  myinifile.writestring('autorange', 'waitsize', '524288');
  myinifile.writestring('autorange', 'bufsize', '8190');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你启动了YouTube普清模式,推荐低带宽用户使用,请重启你的麒麟客户端';
  TrayIcon1.ShowBalloonHint;
  // --------------
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);

end;

procedure TForm1.SysCommand(var SysMsg: TMessage); // 最小化 隐藏到 托盘
begin
  case SysMsg.WParam of
    SC_CLOSE:
      begin
        // 当最小化时
        SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_HIDEWINDOW);
        Form1.hide; // 在任务栏隐藏程序
      end;

  else
    inherited;
    case SysMsg.WParam of
      SC_MINIMIZE:
        begin
          // 当最小化时
          SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
            SWP_HIDEWINDOW);
          Form1.hide; // 在任务栏隐藏程序
        end;
    else
      inherited;

    end;
  end;
end;

procedure TForm1.test1Click(Sender: TObject);
var
  filename: string;
begin
  TrayIcon1.IconIndex := 10;
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('iplist', 'google_cn',
    '202.65.246.103|202.65.246.102|202.65.246.78|202.65.246.110|202.65.246.69');
  myinifile.writestring('iplist', 'google_hk',
    '202.65.246.103|202.65.246.102|202.65.246.78|202.65.246.110|202.65.246.69');
  myinifile.writestring('Area', 'country', 'Canada');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你已经切换了线路,请重新启动麒麟生效';
  TrayIcon1.ShowBalloonHint;

end;

function certDisabledProxyEnable(const Key: Boolean = True): Boolean;
// 取消证书警告
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey
      ('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False)
    then
    begin
      Reg.WriteInteger('WarnonBadCertRecving', Integer(Key));
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      Reg.CloseKey;
    end;
  except
    Reg.Free;
  end;
end;
// ------------------------------------------------  取消证书警告

procedure cryptFile(srcFile, dstFile: TFilename); // 加密函数
var
  srcf, dstf: file of byte;
  buf: byte;
begin
  assign(srcf, srcFile);
  assign(dstf, dstFile);
  reset(srcf);
  rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf, buf);
    buf := buf + 21; // 这里可以修改成其他的数值
    write(dstf, buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

procedure decryptFile(srcFile, dstFile: TFilename); // 解密函数
var
  srcf, dstf: file of byte;
  buf: byte;
begin
  assign(srcf, srcFile);
  assign(dstf, dstFile);
  reset(srcf);
  rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf, buf);
    buf := buf - 21; // 这里可以作相应修改
    write(dstf, buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

function CreateShortcut(Exe: string; Lnk: string = ''; Dir: string = '';
  ID: Integer = -1): Boolean;
var
  IObj: IUnknown;
  ILnk: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  InFolder: array [0 .. MAX_PATH] of Char;
  LinkFileName: WideString;
begin
  Result := False;
  if not FileExists(Exe) then
    Exit;
  if Lnk = '' then
    Lnk := ChangeFileExt(ExtractFileName(Exe), '');

  IObj := CreateComObject(CLSID_ShellLink);
  ILnk := IObj as IShellLink;
  ILnk.SetPath(PChar(Exe));
  ILnk.SetWorkingDirectory(PChar(ExtractFilePath(Exe)));

  if (Dir = '') and (ID = -1) then
    ID := CSIDL_DESKTOP;
  if ID > -1 then
  begin
    SHGetSpecialFolderLocation(0, ID, PIDL);
    SHGetPathFromIDList(PIDL, InFolder);
    LinkFileName := Format('%s\%s.lnk', [InFolder, Lnk]);
  end
  else
  begin
    Dir := ExcludeTrailingPathDelimiter(Dir);
    if not DirectoryExists(Dir) then
      Exit;
    LinkFileName := Format('%s\%s.lnk', [Dir, Lnk]);
  end;

  IPFile := IObj as IPersistFile;
  if IPFile.Save(PWideChar(LinkFileName), False) = 0 then
    Result := True;
end; { CreateShortcut 函数结束 }
// -----------------------------------------------------

procedure ExtractRes(ResType, ResName, ResNewName: string);
var
  Res: TResourceStream;
begin // 释放资源文件library.ini
  Res := TResourceStream.Create(Hinstance, ResName, PChar(ResType));
  Res.SavetoFile(ResNewName);
  Res.Free;
end; // 这个方法意思是释放资源文件   有三个参数
// 一个资源类型   2 资源名字   生成资源的名字

// ----------------------------------------------------

procedure RefreshControl(Control: TControl);
/// 解决 托盘重现显示窗体控件 无法重画的问题
var
  i: Integer;
begin
  Control.Invalidate;
  if Control is TWinControl then
    for i := 0 to TWinControl(Control).ControlCount - 1 do
      RefreshControl(TWinControl(Control).Controls[i]);
end;
// ----------------------------------------------------------

function FindProcess(AFileName: string): Boolean;
var
  hSnapshot: THandle; // 用于获得进程列表
  lppe: TProcessEntry32; // 用于查找进程
  Found: Boolean; // 用于判断进程遍历是否完成
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  // 获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32);
  // 在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe);
  // 将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);
    // 将进程列表的下一个进程信息读入lppe记录中
  end;
end;
// ----------------------------------------------------------------------------------------------------------

function CheckTask(ExeFileName: string): Boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := True;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: Boolean;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
// -----------------------------------------------------------------------------

function ChangeProxy(const Proxy, Port, ByPass: string;
  const bEnabled: Boolean = True): Boolean;
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
  Fproxy: string;
begin
  Result := False;
  Fproxy := Format('%s:%s', [Proxy, Port]);
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey
      ('\Software\Microsoft\windows\CurrentVersion\Internet Settings', True)
    then
    begin
      Reg.writestring('ProxyServer', Fproxy);
      Reg.WriteInteger('ProxyEnable', Integer(bEnabled));
      info.dwaccessType := INTERNET_OPEN_TYPE_PROXY;
      info.lpszProxy := PAnsiChar(Proxy);
      info.lpszProxyBypass := PAnsiChar(ByPass);
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      // InternetSetOption(nil, INTERNET_OPTION_REFRESH, nil, 0);
      // Sendmessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
      Result := True;
    end
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;
// -----------------------------------------------------------------------------

function dDisabledProxyEnable(const Key: Boolean = True): Boolean; // 取消代理
var

  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey
      ('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False)
    then
    begin

      Reg.WriteInteger('ProxyEnable', Integer(Key));
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      Reg.CloseKey;
    end;
  except
    Reg.Free;
  end;
end;
// ------------------------------------------------  ChangeProxy  智能代理模式，写注册表
// const Proxy, Port,ByPass: string;

function ChangeProxy1(const bEnabled: Boolean = True): Boolean;
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
  Fproxy: string;
  Reg1: TRegistry;
begin

  Result := False;
  Fproxy := 'http://127.0.0.1:8086/proxy.pac';
  Reg := TRegistry.Create;
  // 判断 键值 是否创建！
  Reg1 := TRegistry.Create;
  Reg1.RootKey := HKEY_CURRENT_USER;
  Reg1.OpenKeyReadOnly
    ('\Software\Microsoft\windows\CurrentVersion\Internet Settings');
  if not Reg1.ValueExists('AutoConfigURL') then
  begin
    try
      begin
        Reg.RootKey := HKEY_CURRENT_USER;
        if Reg.OpenKey
          ('\Software\Microsoft\windows\CurrentVersion\Internet Settings', True)
        then

          Reg.writestring('AutoConfigURL', Fproxy);
        InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
        InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
        Result := True;
      end
    finally
      Reg.CloseKey;
      Reg.Free;
    end;

  end
  else
  begin
    // showmessage('智能模式已经创建,请勿重复操作！');
    sleep(50);
  end;
end;

procedure TForm1.N1221Click(Sender: TObject);
var
  filename: string;
begin

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '203.208.37.20|203.208.37.19|203.208.37.17|203.208.37.18|203.208.37.16');
    myinifile.writestring('Area', 'country', 'light');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly

  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  wnd: Integer;
  strCheck: string;
  hi, comdate: Integer;
begin
  form2.Show;
  form2.Timer1.Enabled := True;
  if (FindProcess('zhudongfangyu.exe')) or (FindProcess('360Tray.exe')) then
  begin
    TrayIcon1.BalloonTitle := '温馨提示:';
    TrayIcon1.BalloonHint := '发现360杀毒进程,请设置信任给麒麟';
    TrayIcon1.ShowBalloonHint;
  end;
  sleep(2000);
  if FindProcess('kylinagent.exe') then
  begin
    TrayIcon1.BalloonTitle := '温馨提示:';
    TrayIcon1.BalloonHint := '发现麒麟进程,启动成功,默认麒麟为智能模式';
    TrayIcon1.ShowBalloonHint;

    // ShowMessage('保护启动');
    // ----------------------------------------------------------                  解决 ie  和chrome 证书问题
    // deletefile('C:\windows\kylin-proxy\proxy.ini');
    // deletefile('C:\windows\Library1.ini');
    // sleep(2000);

    Timer1.Enabled := False;
    // form1.BorderStyle.bsNone;
    // form1.Show;

    // FORM2.Timer1.Enabled:=TRUE;
    createini := TiniFile.Create(Strkylinpath + 'proxy.ini');
    // Createini.WriteString('gae','appid',c+d);
    createini.writestring('gae', 'appid', '');

    createini.writestring('gae', 'password', '');
    // protectFile:=TFileStream.Create(protect,fmShareExclusive);
    createini.destroy;
    N4.Enabled := True;

  end
  else
  begin
    // protectFile.Free;
    TrayIcon1.BalloonTitle := '温馨提示:';
    TrayIcon1.BalloonHint := '启动失败';
    TrayIcon1.ShowBalloonHint;

    createini := TiniFile.Create(Strkylinpath + '\proxy.ini');
    // Createini.WriteString('gae','appid',c+d);
    createini.writestring('gae', 'appid', '');
    createini.writestring('gae', 'password', '');
    createini.destroy;

    N4.Enabled := True;
  end;

  // timer2.Enabled:=false;

  // trayicon1.BalloonTitle:='代理提示';
  // trayicon1.BalloonHint:='启动成功';
  Timer4.Enabled := True;
  Timer1.Enabled := False;
  Form1.WebBrowser1.Navigate('www.twitter.com');

  // choose  a  date update file from github server

  StrUpdate := Strkylinpath;

  // choose  a  date update file from github server
  { form1.WebBrowser1.Navigate('www.BAIDU.COM');
    sleep(2000);
    if DayOfWeek(Now)=1 then     //Sunday
    begin
    ShellExecute(0, nil, 'update.exe', nil, PChar(StrUpdate), SW_SHOWNORMAL);
    end; }

end;

procedure TForm1.Timer2Timer(Sender: TObject);
{ var
  h,x:HWND; }
begin

  if FindProcess('kylinagent.exe') then
  begin
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '线路切换成功！';
    TrayIcon1.ShowBalloonHint;
    Timer2.Enabled := False;
  end
  else
  begin
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '线路切换失败,正在重新连接....！';
    TrayIcon1.ShowBalloonHint;
    Timer3.Enabled := True;
    Timer2.Enabled := False;
  end;

  { x := FindWindow(nil, 'C:\WINDOWS\kylin-proxy');
    h := FindWindow(nil, 'kylin-proxy');
    if (h>0) OR (x>0) then
    begin
    PostMessage(h,WM_SYSCOMMAND, SC_CLOSE,0);
    PostMessage(x,WM_SYSCOMMAND, SC_CLOSE,0); }
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  KillTask('cmd.exe');
  KillTask('update.exe');
  KillTask('kylinagent.exe');
  KillTask('launchAgent.exe');
  // restart kylin agent -begin
  sleep(2500);
  // ------------------------------------------------------------------------------
  StrEncrypt := 'chinacrosswall060|chinacrosswall061|chinacrosswall062|chinacrosswall063|chinacrosswall064|chinacrosswall065|chinacrosswall065|chinacrosswall066|chinacrosswall067|chinacrosswall068|chinacrosswall069'
  +'chinacrosswall070|chinacrosswall071|chinacrosswall072|chinacrosswall073|chinacrosswall074|chinacrosswall075|chinacrosswall076|chinacrosswall077|chinacrosswall078|chinacrosswall079'
  +'chinacrosswall050|chinacrosswall051|chinacrosswall052|chinacrosswall053|chinacrosswall054|chinacrosswall055|chinacrosswall056|chinacrosswall057|chinacrosswall058|chinacrosswall059';

  strgo := Strkylinpath;
  Form1.WebBrowser1.hide;
  { MyStream:=TMemIniFile.Create('C:\windows\kylin-proxy\Encrypt.ini');
    StrEncrypt:=MyStream.readstring('gae','appid','');
    MyStream.UpdateFile;                            //读取rc4 加密文件
    MyStream.Free;
    StrEncrypt1 :=rc4(0,StrEncrypt,'onionhacker0074',1); }
  { MyStream:= TMemIniFile.Create(Strkylinpath+'proxy.ini');
    MyStream.WriteString('gae','appid',StrEncrypt);
    MyStream.WriteString('listen','visible','1');
    // MyStream.WriteString('AppPath','path',StrMyPath);
    MyStream.UpdateFile;
    MyStream.Free; }
  // ------------------------------------------------------------
  DupeString(#32, 1);
  c := DupeString(#32, 1);
  d := copy(ai, 2, Length(ai));
  if FileExists(Strkylinpath + 'proxy.ini') then
  begin
    // showmessage('存在配置文件');
    createini := TiniFile.Create(Strkylinpath + 'proxy.ini');

    createini.writestring('gae', 'appid', StrEncrypt);
    createini.writestring('listen', 'visible', '0');

    createini.writestring('gae', 'password', c + '');

    createini.destroy;
    // if   FindProcess

    if not FindProcess('kylinagent.exe') then
    begin

      ShellExecute(0, nil, 'launchAgent.exe', nil, PChar(strgo), SW_hide);
      // showmessage('启动wall');
    end
    else
    begin
      sleep(50);
    end;
  end
  else
  begin
    showmessage('配置文件解压失败，程序即将退出！');
    halt;
  end;
  Timer2.Enabled := True;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '请稍后,线路即将生效！';
  TrayIcon1.ShowBalloonHint;
  sleep(2500);

 { createini := TiniFile.Create(Strkylinpath + 'proxy.ini');
  createini.writestring('gae', 'appid', '');
  createini.writestring('gae', 'password', '');

  createini.destroy;   }

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // read ini file get country areas

  if StrCountry = 'Japan' then
  begin

    TrayIcon1.IconIndex := 5;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自日本服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Korea' then
  begin

    TrayIcon1.IconIndex := 7;
  end;
  if StrCountry = 'Singapore' then
  begin

    TrayIcon1.IconIndex := 6;
  end;
  if StrCountry = 'Taiwan' then
  begin

    TrayIcon1.IconIndex := 4;
  end;
  if StrCountry = 'Hongkong' then
  begin

    TrayIcon1.IconIndex := 13;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    TrayIcon1.IconIndex := 10;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    TrayIcon1.IconIndex := 12;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    TrayIcon1.IconIndex := 1;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    TrayIcon1.IconIndex := 11;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    TrayIcon1.IconIndex := 8;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin

    TrayIcon1.IconIndex := 9;
  end;
  if StrCountry = 'light' then
  begin

    TrayIcon1.IconIndex := 16;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);

  Timer3.Enabled := False;
  // restart kylin agent -end

end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
  filename, Strmode: string;
  url: string;
  code: Integer;
  StartTime, EndTime: Integer;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  Strmode := myinifile.readstring('proxymode', 'type', '');
  myinifile.destroy;
  if Strmode = 'global' then
  begin
    form4.StatusBar1.Panels[1].Text := '代理模式:   全局';
  end;

  if Strmode = 'smart' then
  begin
    form4.StatusBar1.Panels[1].Text := '代理模式:   智能';
  end;

  if FindProcess('kylinagent.exe') then
  begin
    form4.StatusBar1.Panels[0].Text := '代理状态:   正常!';
  end
  else
  begin
    TrayIcon1.IconIndex := 3;
    form4.StatusBar1.Panels[0].Text := '代理状态:   已经停止!';
    Timer3.Enabled := True;
  end;
  checkprocess.Create(False);

end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm1.YouTube1Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address',
    'https://www.youtube.com/results?search_query=military');
  myinifile.destroy;

  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;

end;

procedure TForm1.youtubegaoqing1Click(Sender: TObject);
var
  filename: string;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'youtube.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
end;

procedure TForm1.aes256cfb1Click(Sender: TObject);
begin
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在使用aes-256-cfb加密你的网络传输数据';
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.ASDL1Click(Sender: TObject);

var
  filename: string;
begin
  // protectfile.Free;
  filename := 'C:\WINDOWS\kylin-proxy\proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('autorange', 'threads', '6');
  // myinifile.writestring('iplist','google_hk','61.219.131.84|61.219.131.83|61.219.131.85|61.219.131.86|61.219.131.87|61.219.131.88');
  myinifile.destroy;
  // --------------
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;

procedure TForm1.ASDL1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   ADSL(5M-10M)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   ADSL(5M-10M)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.bfcfb1Click(Sender: TObject);
begin
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在使用bf-cfb加密你的网络传输数据';
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if not assigned(Form2) then
  begin
    Form2:=TForm2.Create(nil);
    Form2.Show;
  end;
end;

procedure TForm1.DNS1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   设置DNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   设置DNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.DNS2Click(Sender: TObject);
var
  filename: string;
begin
  // protectfile.Free;
  filename := 'C:\WINDOWS\kylin-proxy\proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('dns', 'servers',
    '8.8.8.8|8.8.4.4|114.114.114.114|114.114.115.115');
  // myinifile.writestring('iplist','google_hk','61.219.131.84|61.219.131.83|61.219.131.85|61.219.131.86|61.219.131.87|61.219.131.88');
  myinifile.destroy;
  // --------------
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;

procedure TForm1.DNS2DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   谷歌DNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   谷歌DNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
// ------------------------------------------------------
var

  mytitle, mytext, xpx, Music: string;
  ee: string;
  vi, ComA, ComB: Integer;
  oldtitle: string;
  SEX: Integer;
  Reg: TRegistry;
  a, ai: string;
  info: INTERNET_PROXY_INFO;
  re_id: Integer;
  registerTemp: TRegistry;
  inputstr, get_id: string;
  dy, clickedok: Boolean;
  Zip: TZipFile;
  // --------------
  strcopysource, strcopyobject: string;
  intcopy, intcopy1: Integer; // 火狐证书申明
  Dir: TDirectory;
  files: TStringDynArray; // 需要 Types 单元支持
  Str: string;
  // --------------------
  hr: THandle;
  l: Longint; // 窗体透明申明
  strrich, strCheck: string;
  ARegistry: TRegistry;
  TOM: string;
  Titem: TListItem;
begin
 image1.Width:=  form1.Width;
 form1.Width:=image1.Width;
 form1.Height:=image1.Height;
  // 注:此处代码也可以直接在可视化编辑器中完成,
  ChangeProxy1(True); // 设置智能代理
  StrGetVolumeID := GetVolumeID;
  StrEncryption := Rc4(1, StrGetVolumeID, 'sheismysin', 4); //
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
    getWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);
  // do net show form in Taskbar

 // FitDeviceResolution(self); // 自动适应屏幕

  // form3.Timer1.Enabled:=true;
  TrayIcon1.ShowBalloonHint;
  N3.Checked := True;
  certDisabledProxyEnable(False); // 取消证书警告
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW);
  // 让启动窗体不显示在任务栏！
  // ---------------------------------------------------------------
  l := getWindowLong(Handle, GWL_EXSTYLE);
  l := l or WS_EX_LAYERED;
  SetWindowLong(Handle, GWL_EXSTYLE, l);
  SetLayeredWindowAttributes(Handle, 0, 255, LWA_ALPHA);
  // hr:=createroundrectrgn(0,0,width,height,20,20);
  setwindowrgn(Handle, hr, True);

  Application.ShowMainForm := False;
  self1 := ExtractFileDir(Application.Exename);
  // 从资源文件中释放压缩文件
  // ----------------------------------------------

  // changeproxy('127.0.0.1','8086','1',true);
  Form1.WebBrowser1.Navigate('www.BAIDU.COM'); // 让chrome浏览器立即生效 调用代理
  StrMyPath := ExtractFileName(Application.Exename);

  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:智能'#13 + '版本号:V4.0.0.1';

  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\KylinagentSurfing\';
  // 以前一直用这个
  // ----------------------------------------------
  if FileExists(Strkylinpath + 'kylin2005.run') then
  begin
    sleep(50);
    // showmessage(Strkylinpath+'更新成功');
  end
  else
  begin
    // showmessage(Strkylinpath+'正在更新');
    KillTask('firefox.exe');
    KillTask('cmd.exe');
    KillTask('update.exe');
    KillTask('kylinagent.exe');
    KillTask('launchAgent.exe');
    KillTask('FilmClient.exe');
    // DeleteDir(Strkylinpath);
    DeleteDirectory(Strkylinpath);
    sleep(2000);

    if DirectoryExists(Strkylinpath) then
    begin
      sleep(50)
    end // 创建麒麟的文件夹
    else
    begin
      CreateDirectory(PChar(Strkylinpath), nil);

    end;
    // ===========================释放压缩文件=============================================
    if FileExists(Strkylinpath + 'kylin.zip') then
    begin
      // ShowMessage(Strkylinpath+'\kylin.zip');

      sleep(50);

    end
    else
    begin
      // ShowMessage('kylin.zip');
      ExtractRes('EXEFILE', 'test', Strkylinpath + 'kylin.zip');
      // 从资源文件中释放压缩文件
    end;

    if FileExists(Strkylinpath + 'kylin2005.run') then
    begin
      showmessage('解压成功');
      sleep(50);
    end
    else
    begin
      Zip := TZipFile.Create;
      Zip.Open(Strkylinpath + 'kylin.zip', TZipMode.zmRead);
      Zip.ExtractAll(Strkylinpath);
      Zip.Free; // 结束解压

    end;
  end;
  // ----------------------------------------------------------   安装ie证书给ie内核的浏览器调用

  ComA := 0;
  ComB := 1;
  filename := Strkylinpath + 'InstallCrt.ini';
  myinifile := TiniFile.Create(filename);
  vi := myinifile.Readinteger('Certificate', 'run', 0);
  myinifile.destroy;

  if vi = ComB then
  begin
    // ShowMessage('可以安装证书！');
    ee := Strkylinpath;

    ShellExecute(0, nil, 'Install_Certificate.exe', nil, PChar(ee),
      SW_SHOWNORMAL);
    myinifile := TiniFile.Create(filename);
    myinifile.WriteInteger('Certificate', 'run', 1);
    myinifile.destroy;
    // ----------------------------------------------------------
  end;
  if vi = ComA then
  begin
    // ShowMessage('无法安装证书！');
    sleep(50);
  end;
  // -------------------------------------------------  给火狐安装证书,给其调用
  Strfirefox := GetEnvironmentVariable('APPDATA') + '\Mozilla'; // 以前一直用这个

  if not FileExists(Strfirefox + '\Firefox\profiles.ini') then
  begin
    sleep(50);
    // ShowMessage('哎呦,你没装firefox！');
  end
  else
  begin

    // ShowMessage('哎呦,发现你安装了火狐,好吧让程序飞一会儿！');
    files := Dir.GetFiles(Strfirefox, 'key3.db',
      TSearchOption.soAllDirectories);
    for Str in files do
      // memo1.Clear;                     //火狐证书安装
      strcopysource := Str;
    intcopy1 := Length('cert8.db');
    intcopy := Length(strcopysource);
    // label1.caption:=str;
    strcopyobject := copy(strcopysource, 1, intcopy - intcopy1);
    // label2.Caption:=strcopyobject;
    // ShowMessage(strcopyobject);
    if not FindProcess('firefox.exe') then
    begin

      StrShaFirefox := GetFile_SHA1(strcopyobject + '\cert8.db');
      // get firefox Certificate sha1 values
      StrShaKylin := GetFile_SHA1(Strkylinpath + 'begin\cert8.db');
      // get kylin Certificate sha1 values
      if StrShaFirefox <> StrShaKylin then
      begin
        // ShowMessage('sha1不同,正在复制');

        CopyFile(PChar(Strkylinpath + 'begin\cert8.db'),
          PChar(strcopyobject + '\cert8.db'), False);

      end
      else
      begin

        // ShowMessage('相同sha1！');
        sleep(50);

      end;
    end
    else
    begin
      sleep(50);
      // ShowMessage('发现火狐在运行,无法复制cert');
    end;

  end;
   CopyFile(PChar(Strkylinpath+'hosts'),PChar('C:\Windows\System32\drivers\etc\hosts'), True);
  // ------------------------------------------------------------------------------
  StrEncrypt := 'chinacrosswall060|chinacrosswall061|chinacrosswall062|chinacrosswall063|chinacrosswall064|chinacrosswall065|chinacrosswall065|chinacrosswall066|chinacrosswall067|chinacrosswall068|chinacrosswall069'
  +'chinacrosswall070|chinacrosswall071|chinacrosswall072|chinacrosswall073|chinacrosswall074|chinacrosswall075|chinacrosswall076|chinacrosswall077|chinacrosswall078|chinacrosswall079'
  +'chinacrosswall050|chinacrosswall051|chinacrosswall052|chinacrosswall053|chinacrosswall054|chinacrosswall055|chinacrosswall056|chinacrosswall057|chinacrosswall058|chinacrosswall059';

  // StrEncrypt:= 'chinacrosswall130|chinacrosswall131|chinacrosswall132|chinacrosswall133|chinacrosswall134|chinacrosswall135'+
  // 'chinacrosswall136|chinacrosswall137|chinacrosswall138|chinacrosswall139';

  strgo := Strkylinpath;

  Form1.WebBrowser1.hide;
  { MyStream:=TMemIniFile.Create('C:\windows\kylin-proxy\Encrypt.ini');
    StrEncrypt:=MyStream.readstring('gae','appid','');
    MyStream.UpdateFile;                            //读取rc4 加密文件
    MyStream.Free;
    StrEncrypt1 :=rc4(0,StrEncrypt,'onionhacker0074',1); }
  MyStream := TMemIniFile.Create(Strkylinpath + 'proxy.ini');
  MyStream.writestring('gae', 'appid', StrEncrypt);
  MyStream.writestring('listen', 'visible', '0');
  MyStream.writestring('AppPath', 'path', StrMyPath);

  MyStream.UpdateFile;
  MyStream.Free;
  // ------------------------------------------------------------
  DupeString(#32, 1);
  c := DupeString(#32, 1);
  d := copy(ai, 2, Length(ai));
  if FileExists(Strkylinpath + 'proxy.ini') then
  begin
    // showmessage('存在配置文件');
    createini := TiniFile.Create(Strkylinpath + 'proxy.ini');
    createini.writestring('gae', 'password', c + '');
    // Createini.WriteString('gae','password',c+'kylinspeed');
    sleep(2500);
    createini.destroy;
    // if   FindProcess

    if not FindProcess('kylinagent.exe') then
    begin
      ShellExecute(0, nil, 'launchAgent.exe', nil, PChar(strgo), SW_hide);
      // showmessage('启动wall');
    end
    else
    begin
      sleep(50);
    end;
  end
  else
  begin
    showmessage('配置文件解压失败，程序即将退出！');
    halt;
  end;

  Timer1.Enabled := True;
  N4.Enabled := False;
  ADSLsetup(True);
  //
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  myinifile := TiniFile.Create(Strkylinpath + 'LocalVerson.ini');
  StrEncryptionGet := myinifile.readstring('localmachine', 'key', '');
  // read version of client
  myinifile.destroy;
  { if strEncryptionGet= StrEncryption then
    begin
    sleep(50)
    end
    ELSE
    BEGIN

    timer3.Enabled:=true;
    END;
  }

  // read ini file get country areas
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // read ini file get country areas

  if StrCountry = 'Japan' then
  begin

    TrayIcon1.IconIndex := 5;
    { item := ListView1.Items.Add;
      item.Caption := IntToStr(ListView1.Items.Count)+'   :64.233.168.176';
      item.SubItems.Add('300');
      item.SubItems.Add('japan');
      item.SubItems.Add('是');
      ListView1.Items[ListView1.Items.Count - 1].SubItems.Add('空闲');

      Listview1.ViewStyle:=vsreport;
      Listview1.GridLines:=true; }
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自日本服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Korea' then
  begin

    TrayIcon1.IconIndex := 7;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自韩国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Singapore' then
  begin

    TrayIcon1.IconIndex := 6;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自新加坡服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Taiwan' then
  begin

    TrayIcon1.IconIndex := 4;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自台湾服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Hongkong' then
  begin

    TrayIcon1.IconIndex := 13;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自香港服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    TrayIcon1.IconIndex := 10;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自加拿大服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    TrayIcon1.IconIndex := 12;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自法国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    TrayIcon1.IconIndex := 1;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自美国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    TrayIcon1.IconIndex := 11;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自德国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    TrayIcon1.IconIndex := 8;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自英国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin

    TrayIcon1.IconIndex := 9;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自阿根廷服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'light' then
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自光速服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);

end;

procedure TForm1.FormHide(Sender: TObject);
begin
  ANimateWindow(Handle, 3000, AW_BLEND + AW_HIDE);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
ANimateWindow(Handle,2000,AW_BLEND);
Application.MainFormOnTaskbar := False;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Form1.hide;
end;



procedure TForm1.Image4Click(Sender: TObject);
begin
  Form1.hide;
end;

procedure TForm1.Image4MouseEnter(Sender: TObject);
begin
  // image4.Hint:='关闭主界面';
end;

procedure TForm1.Image4MouseLeave(Sender: TObject);
begin
  // image5.Show;
  // image4.Hide;
end;

procedure TForm1.Image5MouseEnter(Sender: TObject);
begin
  // image4.Show;

  // image5.Hide;

end;

procedure TForm1.IP1Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('kylinserver', 'ip', '');
  myinifile.destroy;
  if StrVIP <> 'sheismysin87' then
  begin
    form5.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 14;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn',
      '203.208.46.179|203.208.46.180|203.208.46.176|203.208.46.177|203.208.46.178');
    myinifile.writestring('iplist', 'google_hk',
      '203.208.46.179|203.208.46.180|203.208.46.176|203.208.46.177|203.208.46.178');
    myinifile.writestring('Area', 'country', 'china');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar('http://onionhacker.github.com'), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar('https://twitter.com/onionhacker'), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
  ShellExecute(Handle, nil,
    PChar('https://code.google.com/p/maplebanana-proxy'), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TForm1.N41Click(Sender: TObject);
var
  filename: string;
begin
  TrayIcon1.Icons := ImageList1;
  TrayIcon1.Animate := False;
  TrayIcon1.IconIndex := 11;
  // protectfile.Free;
  N11.Checked := False;
  N21.Checked := False;
  N31.Checked := False;
  N41.Checked := True;
  N26.Checked := False;

  N61.Checked := False;
  N71.Checked := False;
  N81.Checked := False;
  N91.Checked := False;
  N92.Checked := False;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('iplist', 'google_cn',
    '74.125.25.142|74.125.25.143|74.125.25.145|74.125.25.157|74.125.25.124|74.125.25.98|74.125.25.164|74.125.25.166|74.125.25.167|74.125.25.137|74.125.25.197|74.125.25.146|74.125.25.86|74.125.25.87|74.125.25.144|74.125.25.176|74.125.25.84|74.125.25.90|'
    + '74.125.25.115|74.125.25.194|74.125.25.195|74.125.25.198|74.125.25.117|74.125.25.122|74.125.25.123|74.125.25.103|74.125.25.104|74.125.25.96');
  myinifile.writestring('iplist', 'google_hk',
    '74.125.25.142|74.125.25.143|74.125.25.145|74.125.25.157|74.125.25.124|74.125.25.98|74.125.25.164|74.125.25.166|74.125.25.167|74.125.25.137|74.125.25.197|74.125.25.146|74.125.25.86|74.125.25.87|74.125.25.144|74.125.25.176|74.125.25.84|74.125.25.90|'
    + '74.125.25.115|74.125.25.194|74.125.25.195|74.125.25.198|74.125.25.117|74.125.25.122|74.125.25.123|74.125.25.103|74.125.25.104|74.125.25.96');
  myinifile.writestring('Area', 'country', 'Germany');
  myinifile.destroy;
  Timer3.Enabled := True; // restart the kylinagent rapaidly
end;

procedure TForm1.N42Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address',
    'http://www.bing.com/videos/search?q=fuck%20chinese&qs=n&form=QBVR&pq=fuck%20chinese&sc=0-0&sp=-1&sk=');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
end;

procedure TForm1.N4Click(Sender: TObject); // -----------------------右键退出
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  ADSLsetupTOCANCEL(True);
  // protectfile.Free;
  KillTask('cmd.exe');
  KillTask('update.exe');
  KillTask('kylinagent.exe');
  KillTask('launchAgent.exe');
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'smart');
  myinifile.destroy;
  // ---------------------------------------------------删除pac
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);
  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;
  Reg.Free;
  // SLEEP(200);
  dDisabledProxyEnable(False);
  // --------------------------------------------------------------
  // Shell_NotifyIcon(NIM_DELETE, @TrayIconData); //删除托盘区图标
  halt;
  { end;
    IDCANCEL:
    begin
    sleep(50);
    end;
    end }
end;

procedure TForm1.N30Click(Sender: TObject);
var
  filename: string;
begin
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('autorange', 'threads', '6');
  myinifile.writestring('autorange', 'maxsize', '10485760000');
  myinifile.writestring('autorange', 'waitsize', '52428800');
  myinifile.writestring('autorange', 'bufsize', '819');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你启动了YouTube高清模式,推荐光纤用户使用,请重启你的麒麟客户端';
  TrayIcon1.ShowBalloonHint;
  // --------------
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;

procedure TForm1.N31Click(Sender: TObject);
var
  filename: string;
begin
  TrayIcon1.Icons := ImageList1;
  TrayIcon1.Animate := False;
  TrayIcon1.IconIndex := 4;
  // protectfile.Free;
  N11.Checked := False;
  N21.Checked := False;
  N31.Checked := True;
  N41.Checked := False;
  N26.Checked := False;

  N61.Checked := False;
  N71.Checked := False;
  N81.Checked := False;
  N91.Checked := False;
  N92.Checked := False;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('iplist', 'google_cn',
    '64.233.168.142|64.233.168.155|64.233.168.156|64.233.168.157|64.233.168.124|64.233.168.31|64.233.168.98|64.233.168.136|64.233.168.190|64.233.168.164|64.233.168.167|64.233.168.97|64.233.168.137|64.233.168.197|64.233.168.146');
  myinifile.writestring('iplist', 'google_hk',
    '64.233.168.142|64.233.168.155|64.233.168.156|64.233.168.157|64.233.168.124|64.233.168.31|64.233.168.98|64.233.168.136|64.233.168.190|64.233.168.164|64.233.168.167|64.233.168.97|64.233.168.137|64.233.168.197|64.233.168.146');
  myinifile.writestring('Area', 'country', 'Taiwan');
  myinifile.destroy;

  Timer3.Enabled := True; // restart the kylinagent rapaidly

end;

procedure TForm1.N32Click(Sender: TObject);
var
  filename: string;
begin
  TrayIcon1.IconIndex := 10;
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  // myinifile.writestring('iplist','google_cn','210.242.125.50|210.242.125.24|61.219.131.226|210.242.125.59|210.139.253.163|210.139.253.88|106.162.216.109|218.176.242.231|74.125.224.150|203.211.0.39|173.194.79.113');
  myinifile.writestring('listen', 'ip', '0.0.0.0');
  // myinifile.writestring('Area','country','Canada');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '分享网络成功！';
  TrayIcon1.ShowBalloonHint;

  Timer3.Enabled := True; // restart the kylinagent rapaidly

end;

procedure TForm1.N3Click(Sender: TObject); // 智能代理
var
  Reg: TRegistry;
  a: string;
  SEX: Integer;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.IconIndex := 0;

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'smart');
  myinifile.destroy;

  dDisabledProxyEnable(False);
  N2.Checked := False;
  N15.Checked := False;
  N3.Checked := True;
  TrayIcon1.AnimateInterval := 200;

  if FileExists(Strkylinpath + 'startup.run') then
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:智能'#13 + '开机启动功能:开启';
  end
  else
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:智能'#13 + '开机启动功能:关闭   ';
  end;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你已经切换到智能模式';
  TrayIcon1.ShowBalloonHint;
  sleep(2000);

  // TrayIcon1.Animate:=true;
  // TrayIcon1.AnimateInterval:=1000;
  ChangeProxy1(True); // 智能代理
  // changeproxy('127.0.0.1','8086','1',true);
  ADSLsetup(True);
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  { n3.Enabled:=false;
    n2.Enabled:=true;
    N15.Enabled:=true; }
  // read ini file get country areas
  protectFile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // read ini file get country areas

  if StrCountry = 'Japan' then
  begin

    TrayIcon1.IconIndex := 5;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自日本服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Korea' then
  begin

    TrayIcon1.IconIndex := 7;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自韩国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Singapore' then
  begin

    TrayIcon1.IconIndex := 6;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自新加坡服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Taiwan' then
  begin

    TrayIcon1.IconIndex := 4;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自台湾服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Hongkong' then
  begin

    TrayIcon1.IconIndex := 13;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自香港服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    TrayIcon1.IconIndex := 10;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自加拿大服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    TrayIcon1.IconIndex := 12;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自法国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    TrayIcon1.IconIndex := 1;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自美国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    TrayIcon1.IconIndex := 11;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自德国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    TrayIcon1.IconIndex := 8;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自英国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin

    TrayIcon1.IconIndex := 9;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自阿根廷服务器';
    TrayIcon1.ShowBalloonHint;
  end;

  if StrCountry = 'light' then
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自光速服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);

end;

procedure TForm1.N10Click(Sender: TObject);
var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'global');
  myinifile.destroy;
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address',
    'https://www.youtube.com/watch?v=ZWjmlo9aywk');
  myinifile.destroy;

  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   开机启动'), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   开机启动'), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N1111Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '203.208.46.179|203.208.46.180|203.208.46.176|203.208.46.177|203.208.46.178');
    myinifile.writestring('Area', 'country', 'light');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly

  end;
end;

procedure TForm1.N11Click(Sender: TObject);
var
  filename: string;
begin

  TrayIcon1.Icons := ImageList1;
  TrayIcon1.Animate := False;
  TrayIcon1.IconIndex := 10;
  // protectfile.Free;
  N11.Checked := True;
  N21.Checked := False;
  N31.Checked := False;
  N41.Checked := False;
  N26.Checked := False;

  N61.Checked := False;
  N71.Checked := False;
  N81.Checked := False;
  N91.Checked := False;
  N92.Checked := False;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('iplist', 'google_cn',
    '64.233.185.143|64.233.185.145|64.233.185.154|64.233.185.155|64.233.185.124|64.233.185.31|64.233.185.93|64.233.185.98|64.233.185.136|64.233.185.138|64.233.185.139|64.233.185.190|64.233.185.166|64.233.185.197|64.233.185.120');
  myinifile.writestring('iplist', 'google_hk',
    '64.233.185.143|64.233.185.145|64.233.185.154|64.233.185.155|64.233.185.124|64.233.185.31|64.233.185.93|64.233.185.98|64.233.185.136|64.233.185.138|64.233.185.139|64.233.185.190|64.233.185.166|64.233.185.197|64.233.185.120');
  myinifile.writestring('Area', 'country', 'Canada');
  myinifile.destroy;

  Timer3.Enabled := True; // restart the kylinagent rapaidly
end;

procedure TForm1.N12Click(Sender: TObject);
var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'http://www.xvideos.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
end;

procedure TForm1.N1321Click(Sender: TObject);
var
  filename: string;
begin

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    { myinifile.writestring('iplist', 'google_cn',
      '103.1.139.181|103.1.139.181|103.1.139.181|103.1.139.181|103.1.139.181|103.1.139.181');
    }
    myinifile.writestring('iplist', 'google_hk', 'www.google.cn|www.g.cn');
    myinifile.writestring('Area', 'country', 'light');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly

  end;

end;

procedure TForm1.N13Click(Sender: TObject);
var
  wnd: Integer;
begin

  ShellExecute(wnd, 'Open',
    PChar('tencent://message/?uin=397977763&Site=kylinAgent&Menu=yes'), nil,
    nil, SW_show);
end;

procedure TForm1.N1441Click(Sender: TObject);
var
  filename: string;
begin

  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '203.208.49.177|203.208.49.179|203.208.49.176|203.208.49.180|203.208.49.178');
    myinifile.writestring('Area', 'country', 'light');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly

  end;

end;

procedure TForm1.N14Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;
  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address',
    'https://www.youtube.com/watch?v=10FLNS8-gl4');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);

end;

procedure TForm1.N15Click(Sender: TObject);
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  TrayIcon1.Animate := False;
  N15.Checked := True;
  N2.Checked := False;
  N3.Checked := False;
  TrayIcon1.Icons := ImageList1;
  TrayIcon1.Animate := False;
  TrayIcon1.IconIndex := 3;
  if FileExists(Strkylinpath + 'startup.run') then
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:关闭'#13 + '开机启动功能:开启';
  end
  else
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:关闭'#13 + '开机启动功能:关闭   ';
  end;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你已经关闭了麒麟的代理！';
  TrayIcon1.ShowBalloonHint;
  // ---------------------------------------------------删除pac
  ADSLsetupTOCANCEL(True);
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);
  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;
  Reg.Free;
  sleep(200);
  dDisabledProxyEnable(False);

  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  // --------------------------------------------------------------
end;

procedure TForm1.N16Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'global');
  myinifile.destroy;
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'http://www.myfreecams.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
end;

procedure TForm1.N17Click(Sender: TObject);
begin
  form4.Show;
end;

procedure TForm1.N18Click(Sender: TObject);

var
  filename: string;
begin

  // protectfile.Free;
  TrayIcon2.Animate := True;
  TrayIcon2.AnimateInterval := 1000;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.IconIndex := 16;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := True;

    myinifile := TiniFile.Create(filename);
    // myinifile.writestring('iplist','google_cn','193.134.255.236|193.134.255.222|193.134.255.227|193.134.255.182|193.134.255.187|193.134.255.34|193.134.255.173|193.134.255.123|193.134.255.246|193.134.255.241');
    myinifile.writestring('iplist', 'google_hk',
      '103.1.139.238|103.1.139.238|103.1.139.238|103.1.139.238|103.1.139.238');
    myinifile.writestring('Area', 'country', 'light');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;
end;

procedure TForm1.N18DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   新加坡   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   新加坡   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N19DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   日本   '), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   日本   '), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N81Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 8;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;

    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := True;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '216.58.216.41|216.58.216.73|216.58.216.105|216.58.216.137|216.58.216.201|216.58.216.233|216.58.216.38|216.58.216.70|216.58.216.134|216.58.216.166');
    myinifile.writestring('Area', 'country', 'Britain');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;

end;

procedure TForm1.N8Click(Sender: TObject);

begin
  StrUpdate := Strkylinpath;
  ShellExecute(0, nil, 'update.exe', nil, PChar(StrUpdate), SW_SHOWNORMAL);
end;

procedure TForm1.N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N91Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 7;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;

    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := True;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '64.233.189.142|64.233.189.143|64.233.189.149|64.233.189.145|64.233.189.154|64.233.189.156|64.233.189.157|64.233.189.124|64.233.189.91|64.233.189.98|64.233.189.164');
    myinifile.writestring('Area', 'country', 'Korea');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;

end;

procedure TForm1.N92Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 13;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;
    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := True;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '216.58.220.17|216.58.220.18|216.58.220.20|216.58.220.21|216.58.220.22|216.58.220.23|216.58.220.25|216.58.220.26|216.58.220.27|216.58.220.29|216.58.220.30');
    myinifile.writestring('Area', 'country', 'Hongkong');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;

end;

procedure TForm1.N9Click(Sender: TObject);

var
  wnd: Integer;
begin
  ShellExecute(wnd, 'Open', PChar('http://topagent.github.io'), nil,
    nil, SW_show);
end;

procedure TForm1.O1Click(Sender: TObject);

var
  filename: string;
begin
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('dns', 'servers', '208.67.222.222|208.67.220.220');
  // myinifile.writestring('iplist','google_hk','61.219.131.84|61.219.131.83|61.219.131.85|61.219.131.86|61.219.131.87|61.219.131.88');
  myinifile.destroy;
  // --------------

  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;

procedure TForm1.O1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   OpenDNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   OpenDNS   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.onionDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.RC41Click(Sender: TObject);
begin
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在使用rc4加密你的网络传输数据';
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.N20Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'http://boxun.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);
end;

procedure TForm1.N20DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   韩国   '), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   韩国   '), -1, ARect, DT_LEFT or DT_LEFT or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N21Click(Sender: TObject);
var
  filename: string;
begin
  TrayIcon1.Icons := ImageList1;
  TrayIcon1.Animate := False;
  TrayIcon1.IconIndex := 12;
  // protectfile.Free;
  N11.Checked := False;
  N21.Checked := True;
  N31.Checked := False;
  N41.Checked := False;
  N26.Checked := False;
  N61.Checked := False;
  N71.Checked := False;
  N81.Checked := False;
  N91.Checked := False;
  N92.Checked := False;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('iplist', 'google_cn',
    'www.google.cn|www.g.cn');
  myinifile.writestring('iplist', 'google_hk',
    '74.125.192.142|74.125.192.143|74.125.192.145|74.125.192.124|74.125.192.49|74.125.192.64|74.125.192.66|74.125.192.58|74.125.192.60|74.125.192.44|74.125.192.53|74.125.192.48|74.125.192.68|74.125.192.42|74.125.192.39');
  myinifile.writestring('Area', 'country', 'France');
  myinifile.destroy;
  // --------------
  Timer3.Enabled := True; // restart the kylinagent rapaidly

end;

procedure TForm1.N21DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   带宽           '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   带宽           '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N22Click(Sender: TObject);
var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'http://www.voachinese.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);

end;

procedure TForm1.N24Click(Sender: TObject);
var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'global');
  myinifile.destroy;
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address',
    'https://www.youtube.com/results?search_query=%E8%8D%92%E9%87%8E%E6%B1%82%E7%94%9F%E7%A7%98%E6%8A%80');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);

end;

procedure TForm1.N25Click(Sender: TObject);

var
  a: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局';
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring(' website', 'address', 'http://t66y.com');
  myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你正在进入麒麟电影高清频道';
  TrayIcon1.ShowBalloonHint;
  ShellExecute(0, nil, 'FilmClient.exe', nil, PChar(strgo), SW_hide);

end;

procedure TForm1.N26Click(Sender: TObject);

var
  filename: string;

begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 6;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := True;

    N61.Checked := False;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '64.15.119.20|64.15.119.24|64.15.119.94|64.15.119.130|64.15.119.134|64.15.119.135|64.15.119.141|64.15.119.143|64.15.119.145|64.15.119.147|64.15.119.154');
    myinifile.writestring('Area', 'country', 'Singapore');
    myinifile.destroy;
    Timer3.Enabled := True; // restart the kylinagent rapaidly
    // --------------
  end;
end;

procedure TForm1.N26DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   光钎(10M以上)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   光钎(10M以上)   '), -1, ARect,
      DT_LEFT or DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  vi, a, ComA, ComB: Integer;
  Reg: TRegistry;
  filename: string;
  info: INTERNET_PROXY_INFO;
begin
  // TrayIcon1.IconIndex := 10;
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  myinifile.writestring('proxymode', 'type', 'global');
  myinifile.destroy;

  // TrayIcon1.Animate:=true;
  // TrayIcon1.AnimateInterval:=300;
  TrayIcon1.IconIndex := 0;
  if FileExists(Strkylinpath + 'startup.run') then
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局' + #13 + '开机启动功能:开启';
  end
  else
  begin
    TrayIcon1.Hint := '麒麟提示' + #13 + '代理模式:全局' + #13 + '开机启动功能:关闭   ';
  end;
  // ----------------------------------------------------------------
  N2.Checked := True;
  N3.Checked := False;
  N15.Checked := False;

  ADSLsetupglobal(True);
  ChangeProxy('127.0.0.1', '8087', '1', True);
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey
    ('Software\Microsoft\windows\CurrentVersion\Internet Settings', True);

  Reg.DeleteValue('AutoConfigURL'); // 删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  Reg.CloseKey;

  Reg.Free;
  Form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(50);
  // read ini file get country areas
  protectFile.Free;
  filename := Strkylinpath + '\proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // read ini file get country areas
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你已经切换到全局模式';
  TrayIcon1.ShowBalloonHint;
  sleep(2000);

  if StrCountry = 'Japan' then
  begin

    TrayIcon1.IconIndex := 5;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自日本服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Korea' then
  begin

    TrayIcon1.IconIndex := 7;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自韩国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Singapore' then
  begin

    TrayIcon1.IconIndex := 6;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自新加坡服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Taiwan' then
  begin

    TrayIcon1.IconIndex := 4;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自台湾服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'Hongkong' then
  begin

    TrayIcon1.IconIndex := 13;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自香港服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    TrayIcon1.IconIndex := 10;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自加拿大服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    TrayIcon1.IconIndex := 12;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自法国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    TrayIcon1.IconIndex := 1;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自美国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    TrayIcon1.IconIndex := 11;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自德国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    TrayIcon1.IconIndex := 8;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自英国服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin

    TrayIcon1.IconIndex := 9;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自阿根廷服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  if StrCountry = 'light' then
  begin
    TrayIcon1.Icons := ImageList2;
    TrayIcon1.Animate := True;
    TrayIcon1.AnimateInterval := 1000;
    TrayIcon1.IconIndex := 16;
    TrayIcon1.BalloonTitle := '代理提示';
    TrayIcon1.BalloonHint := '目前代理线路来自光速服务器';
    TrayIcon1.ShowBalloonHint;
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;

procedure TForm1.N5Click(Sender: TObject);
begin

  Form1.Show;
end;

procedure TForm1.N61Click(Sender: TObject);

var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 1;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;

    N61.Checked := True;
    N71.Checked := False;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '208.117.224.20|208.117.224.24|208.117.224.25|208.117.224.30|208.117.224.39|208.117.224.40|208.117.224.45|208.117.224.49|208.117.224.50|208.117.224.54');
    myinifile.writestring('Area', 'country', 'America');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;

end;

procedure TForm1.N71Click(Sender: TObject);
var
  filename: string;
begin

  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := TiniFile.Create(filename);
  StrVIP := myinifile.readstring('identity', 'Type', '');
  myinifile.destroy;
  if StrVIP <> 'onion!@!09' then
  begin
    form3.Show;
  end
  else
  begin
    TrayIcon1.Icons := ImageList1;
    TrayIcon1.Animate := False;
    TrayIcon1.IconIndex := 5;
    N11.Checked := False;
    N21.Checked := False;
    N31.Checked := False;
    N41.Checked := False;
    N26.Checked := False;

    N61.Checked := False;
    N71.Checked := True;
    N81.Checked := False;
    N91.Checked := False;
    N92.Checked := False;
    myinifile := TiniFile.Create(filename);
    myinifile.writestring('iplist', 'google_cn', 'www.google.cn|www.g.cn');
    myinifile.writestring('iplist', 'google_hk',
      '216.58.219.73|216.58.219.105|216.58.219.137|216.58.219.169|216.58.219.201|216.58.219.233|216.58.219.6|216.58.219.38|216.58.219.70|216.58.219.102');
    myinifile.writestring('Area', 'country', 'Japan');
    myinifile.destroy;
    // --------------
    Timer3.Enabled := True; // restart the kylinagent rapaidly
  end;
end;

end.
