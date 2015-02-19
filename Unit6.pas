unit Unit6;

interface

uses
  System.Classes, Windows, Messages, SysUtils, Variants, Graphics, Controls,
  Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils, Wininet, StrUtils, MPlayer,
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
  hSnapshot: THandle;                   //用于获得进程列表
  lppe: TProcessEntry32;                //用于查找进程
  Found: Boolean;                       //用于判断进程遍历是否完成
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);  //获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32);  //在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe);  //将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);  //将进程列表的下一个进程信息读入lppe记录中
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
  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\kylinagentUtra\';  // 以前一直用这个
  // 先在窗体上放一个 TImage 组件：Image1；
  Image1.Picture.LoadFromFile(Strkylinpath + '1.gif');

  // AnimationSpeed 设定动画速度，值越大，速度越快；
  TGIFImage(Image1.Picture.Graphic).AnimationSpeed := 100;
  TGIFImage(Image1.Picture.Graphic).Animate := True;

  form4.StatusBar1.Panels[2].Text := '正在读取数据... ';
  form4.StatusBar1.Panels[3].Text := '正在读取数据...';
  form4.StatusBar1.Panels[4].Text := '正在读取数据...';

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
      form4.StatusBar1.Panels[4].Text := '状态码 :' + inttostr(code);

    end;
    EndTime := GetTickCount;
    //  ShowMessage(IntToStr(code));
    if code = 200 then
    begin
      form4.StatusBar1.Panels[2].Text := '服务器状态:  正常 ';
      //StatusBar1.Panels[4].Text := '响应时间:' + floattostr((EndTime - StartTime))
       //   + ' 毫秒';
    end
    else
    begin
      form4.StatusBar1.Panels[2].Text := '服务器状态:  异常!';
    end;

    form4.StatusBar1.Panels[4].Text := '状态码 :' + inttostr(code);
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

    form4.StatusBar1.Panels[3].Text := '线路国家: 日本';
  end;
  if StrCountry = 'Korea' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路国家: 韩国';
  end;
  if StrCountry = 'Singapore' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路国家: 新加坡';
  end;
  if StrCountry = 'Taiwan' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路国家: 台湾';
  end;
  if StrCountry = 'Hongkong' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 香港';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 加拿大';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 法国';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 美国';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 德国';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin

    form4.StatusBar1.Panels[3].Text := '线路国家: 英国';
  end;
  //protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路国家: 阿根廷';
  end;

  if StrCountry = 'china' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路: 独享服务器';
  end;
    if StrCountry = 'light' then
  begin
    form4.StatusBar1.Panels[3].Text := '线路: 光速服务器';
  end;
end;

procedure test.Execute;
begin
  { Place thread code here }
  synchronize(give);
end;

end.

