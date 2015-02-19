unit Unit6;

interface

uses
  System.Classes, Windows, Messages, SysUtils, Variants, Graphics, Controls,
  Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {�ú���ʹ�õĵ�Ԫ} IOUtils, Wininet, StrUtils, MPlayer,
  mmsystem, ToolWin, IniFiles, System.Zip, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, IdHashSHA, Typinfo,
  Vcl.ImgList, Vcl.Grids;

type
  test = class(TThread)
  private
    { Private declarations }
  protected
    procedure give;
    procedure Execute; override;
  end;

implementation
uses Unit1;

function FindProcess(AFileName: string): boolean;
var
  hSnapshot: THandle;                   //���ڻ�ý����б�
  lppe: TProcessEntry32;                //���ڲ��ҽ���
  Found: Boolean;                       //�����жϽ��̱����Ƿ����
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);  //���ϵͳ�����б�
  lppe.dwSize := SizeOf(TProcessEntry32);  //�ڵ���Process32First API֮ǰ����Ҫ��ʼ��lppe��¼�Ĵ�С
  Found := Process32First(hSnapshot, lppe);  //�������б�ĵ�һ��������Ϣ����ppe��¼��
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);  //�������б����һ��������Ϣ����lppe��¼��
  end;
end;

procedure test.give;
var
  Strkylinpath: string;
  myinifile: Tinifile;
  http: TIdHttp;
  url, StrCountry, filename: string;
  code: integer;
  StartTime, EndTime: integer;
begin
  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\kylinagentUtra\';  // ��ǰһֱ�����
  // ���ڴ����Ϸ�һ�� TImage �����Image1��
  Image1.Picture.LoadFromFile(Strkylinpath + '1.gif');

  // AnimationSpeed �趨�����ٶȣ�ֵԽ���ٶ�Խ�죻
  TGIFImage(Image1.Picture.Graphic).AnimationSpeed := 100;
  TGIFImage(Image1.Picture.Graphic).Animate := True;

  form4.StatusBar1.Panels[2].Text := '���ڶ�ȡ����... ';
  form4.StatusBar1.Panels[3].Text := '���ڶ�ȡ����...';
  form4.StatusBar1.Panels[4].Text := '���ڶ�ȡ����...';

  StatusBar1.Panels[4].Text := '';
  // form4.StatusBar1.Panels[3].Text := '';
  url := 'http://64.233.168.176';
  http := TIdHTTP.Create(nil);
  try
    try
      StartTime := GetTickCount;
      http.Get(url, nil);
      code := http.ResponseCode;
      //showmessage(inttostr(code));
    except
      {on E: EIdHTTPProtocolException do
        code := http.ResponseCode;      // or: code := E.ErrorCode;    }
      form4.StatusBar1.Panels[4].Text := '״̬�� :' + inttostr(code);

    end;
    EndTime := GetTickCount;
    //  ShowMessage(IntToStr(code));
    if code = 200 then
    begin
      form4.StatusBar1.Panels[2].Text := '������״̬:  ���� ';
      //StatusBar1.Panels[4].Text := '��Ӧʱ��:' + floattostr((EndTime - StartTime))
       //   + ' ����';
    end
    else
    begin
      form4.StatusBar1.Panels[2].Text := '������״̬:  �쳣!';
    end;

    form4.StatusBar1.Panels[4].Text := '״̬�� :' + inttostr(code);
  finally

    http.Free();
  end;

  filename := Strkylinpath + 'proxy.ini';
  myinifile := Tinifile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  //read ini file get country areas

  if StrCountry = 'Japan' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: �ձ�';
  end;
  if StrCountry = 'Korea' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·����: ����';
  end;
  if StrCountry = 'Singapore' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·����: �¼���';
  end;
  if StrCountry = 'Taiwan' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·����: ̨��';
  end;
  if StrCountry = 'Hongkong' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: ���';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: ���ô�';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: ����';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: ����';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: �¹�';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    form4.StatusBar1.Panels[3].Text := '��·����: Ӣ��';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·����: ����͢';
  end;

  if StrCountry = 'china' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·: ���������';
  end;
    if StrCountry = 'light' then
  begin
    form4.StatusBar1.Panels[3].Text := '��·: ���ٷ�����';
  end;
end;

procedure test.Execute;
begin
  { Place thread code here }
  synchronize(give);
end;

end.

