unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Vcl.ExtCtrls,
  TLhelp32,
  Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  StrGetVolumeID: string;
  StrEncryption: string;
  Strkylinpath: string;
  myinifile: Tinifile;
  Id: Integer = 10;

implementation

{$R *.dfm}

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOLean;
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
// ----------------------

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
            inc(i_EncryptCountH);
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

/// ==================================================================================

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

procedure TForm3.Button1Click(Sender: TObject);
begin
  // showmessage(Strkylinpath);
  { myinifile:=Tinifile.Create('c:\LocalVerson.ini');
    myinifile.writestring('localmachine','key',StrEncryption);//read version of client
    myinifile.Destroy; }
  if Memo1.text = 'onion!@!09' then
  begin

    self.Hide;

    myinifile := Tinifile.Create(Strkylinpath + 'proxy.ini');
    myinifile.writestring('identity', 'Type', 'onion!@!09');
    // read version of client
    myinifile.Destroy;
    showmessage('尊贵VIP验证成功,请重新启动你的麒麟');
  end
  else
  begin
    showmessage('错误的身份识别,请联系麒麟客服');
    Memo1.text := '';
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

  Memo1.text := '请输入麒麟身份码！';
  StrGetVolumeID := GetVolumeID;
  Edit1.text := GetVolumeID;
  StrEncryption := Rc4(1, StrGetVolumeID, 'sheismysin', 4); // rc4加密序列号
  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\kylinagentUtra\';
  // 以前一直用这个

end;

procedure TForm3.Memo1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Memo1.text := '';
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if Id > 0 then
  begin
    Id := Id - 1;
    StatusBar1.Panels[0].text := '麒麟代理功能将在 ' + inttostr(Id) + ' 秒后自动结束';
  end
  else
  begin
    Timer1.Enabled := False;
    KillTask('cmd.exe');
    KillTask('update.exe');
    KillTask('kylinagent.exe');
    KillTask('launchAgent.exe');
    StatusBar1.Panels[1].text := '麒麟代理功能已经关闭,请购买vip！';

  end;
end;

end.
