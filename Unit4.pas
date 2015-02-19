unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, WinInet, Vcl.ExtCtrls,
  GIFImg,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IniFiles, IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  TForm4 = class(TForm)
    StatusBar1: TStatusBar;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Strkylinpath: string;
  myinifile: Tinifile;

implementation

{$R *.dfm}

uses unit7;

function CheckOffline(URL: string): Integer;
var
  dwFlag: DWORD;
begin
  Result := 0;
  if InternetGetConnectedState(@dwFlag, 0) then
  begin
    if not InternetCheckConnection(PChar(URL), 1, 0) then
      Result := 1;
  end
  else
    Result := 2;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  http: TIdHTTP;
  URL, StrCountry, filename: string;
  code: Integer;
  StartTime, EndTime: Integer;
begin
  filename := Strkylinpath + 'proxy.ini';
  myinifile := Tinifile.Create(filename);
  StrCountry := myinifile.readstring('Area', 'country', '');
  myinifile.destroy;
  // read ini file get country areas

  if StrCountry = 'Japan' then
  begin
    Form4.StatusBar1.Panels[4].Text := '日本';
  end;
  if StrCountry = 'Korea' then
  begin
    Form4.StatusBar1.Panels[4].Text := '韩国';
  end;
  if StrCountry = 'Singapore' then
  begin
    Form4.StatusBar1.Panels[4].Text := '新加坡';
  end;
  if StrCountry = 'Taiwan' then
  begin

    Form4.StatusBar1.Panels[4].Text := '台湾';
  end;
  if StrCountry = 'Hongkong' then
  begin
    Form4.StatusBar1.Panels[4].Text := '香港';
  end;
  // protectFile:=TFileStream.Create(protect,fmShareExclusive);
  if StrCountry = 'Canada' then
  begin
    Form4.StatusBar1.Panels[4].Text := '加拿大';
  end;

end;

end.
