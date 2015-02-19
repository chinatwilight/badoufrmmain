unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, WinInet, Vcl.ExtCtrls,
  GIFImg,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IniFiles, IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  checkprocess = class(TThread)
    StatusBar1: TStatusBar;
    Image1: TImage;
  private
    { Private declarations }
  protected
    procedure give;
    procedure Execute; override;
  end;

implementation

uses unit1, unit4;

procedure checkprocess.give;
var

  http: TIdHttp;
  url, StrCountry, filename: string;
  code: integer;
  StartTime, EndTime: integer;
  Strkylinpath: string;
  myinifile: Tinifile;
  IdAntiFreeze: TidAntiFreeze;
begin

  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\kylinagentUtra\';
  // 以前一直用这个

  filename := Strkylinpath + 'proxy.ini';
  myinifile := Tinifile.Create(filename);
  // showmessage(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // showmessage(StrCountry);

  // read ini file get country areas
  // showmessage(StrCountry);
  if StrCountry = 'Japan' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 日本';
  end;
  if StrCountry = 'Korea' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路国家: 韩国';
  end;
  if StrCountry = 'Singapore' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路国家: 新加坡';
  end;
  if StrCountry = 'Taiwan' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路国家: 台湾';
  end;
  if StrCountry = 'Hongkong' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 香港';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 加拿大';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);   France
  if StrCountry = 'France' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 法国';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'America' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 美国';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Germany' then
  begin

    form4.StatusBar1.Panels[2].Text := '线路国家: 德国';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Britain' then
  begin
    // showmessage('Britain');
    form4.StatusBar1.Panels[2].Text := '线路国家: 英国';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Argentina' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路国家: 阿根廷';
  end;

  if StrCountry = 'china' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路: 独享服务器';
  end;
  if StrCountry = 'light' then
  begin
    form4.StatusBar1.Panels[2].Text := '线路: 光速服务器';
  end;

end;

procedure checkprocess.Execute;
begin
  { Place thread code here }
  synchronize(give);

end;

end.
