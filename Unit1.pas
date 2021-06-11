unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ComCtrls, idUri;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    IdHTTP1: TIdHTTP;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  URI: TidUri; // Used to extract the file name for URL
  MyStream: TMemoryStream; // Stream to which we write
  WebAddress: string; // Holds our full web address
begin
  WebAddress := Edit1.Text; // Store web address in a var
  URI := TidUri.Create(WebAddress); // Get Uri of Address
  SaveDialog1.FileName := URI.Document;
  URI.Free;
  if SaveDialog1.Execute then
  begin
    MyStream := TMemoryStream.Create; // create memory stream
    IdHTTP1.Get(WebAddress, MyStream);
    // Get remote file and and store it in a memory stream
    MyStream.SaveToFile(SaveDialog1.FileName);
    MyStream.Free;
    ShowMessage('File downloaded.');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ContentLength: Int64;
  Percent: Integer;
begin
  ContentLength := IdHTTP1.Response.ContentLength; // File size
  if (ContentLength > 0) then
  begin
    Percent := 100 * AWorkCount div ContentLength; // Download progress
    ProgressBar1.Position := Percent;
    Label3.Caption := 'Downloaded: ' + inttostr(AWorkCount div 1024) + ' KB of '
      + inttostr(ContentLength div 1024) + ' KB';
    Application.ProcessMessages; // Process messages
  end;
end;

end.
