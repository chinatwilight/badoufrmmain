program Project1;

uses
  windows,
  Forms,
  shellapi,
  Dialogs,
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Unit3 in 'Unit3.pas' {Form3},
  Unit2 in 'Unit2.pas' {Form2},
  Unit5 in 'Unit5.pas' {Form5},
  Unit4 in 'Unit4.pas' {Form4},
  Unit7 in 'Unit7.pas';

{$R *.res}

var
  myMutex: HWND;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  // CreateMutex����������󣬲��Ҹ����������һ��Ψһ�����֡�
  myMutex := CreateMutex(nil, False, 'lokOngled10Co0py');
  // ����û�б����й�
  if WaitForSingleObject(myMutex, 0) <> wait_TimeOut then
  begin
    TStyleManager.TrySetStyle('Turquoise Gray');
  Application.Title := '����2015-�汾��:V4.0.0.0';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm4, Form4);
  // Application.CreateForm(TForm2, Form2);
    Application.ShowMainForm := False;
    Application.Run;
  end;

end.
