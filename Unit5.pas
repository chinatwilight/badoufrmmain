unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  myinifile: Tinifile;
  Strkylinpath: string;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm5.Button1Click(Sender: TObject);
begin
  if Memo1.text = 'sheismysin87' then
  begin

    self.Hide;
    form1.TrayIcon1.IconIndex := 12;
    myinifile := Tinifile.Create(Strkylinpath + 'proxy.ini');
    myinifile.writestring('kylinserver', 'ip', 'sheismysin87');
    // read version of client
    myinifile.Destroy;
    showmessage('����IP��ͨ,���л���·����');
    form1.timer3.Enabled := true;

  end
  else
  begin
    showmessage('��������ʶ��,����ϵ����ͷ�');
    Memo1.text := '';
  end;

end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  Memo1.text := '';
  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\kylinagentUtra\';
  // ��ǰһֱ�����
end;

end.
