unit U_frame;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls, IWHTMLContainer,
  IWHTML40Container,IWInit,IWAppForm,IWForm, IWCompLabel;

type
  TIWFrame2 = class(TFrame)
    IWFrameRegion: TIWRegion;
    iwlnk1: TIWLink;
    IWLink1: TIWLink;
    iwlnk2: TIWLink;
    iwlnk3: TIWLink;
    iwlnk4: TIWLink;
    iwlnk5: TIWLink;
    iwlnk6: TIWLink;
    procedure iwlnk6Click(Sender: TObject);
    procedure IWLink1Click(Sender: TObject);
    procedure iwlnk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Move(AFormClass: TIWAppFormClass);

  end;

implementation

uses
  ServerController, UserSessionUnit, U_login, U_main;

{$R *.dfm}


procedure TIWFrame2.IWLink1Click(Sender: TObject);
begin
  if UserSession.uname='' then
  begin
  WebApplication.ShowMessage('ÇëµÇÂ¼');
  Exit;
  end;
  Move(TIWmain);
end;

procedure TIWFrame2.iwlnk1Click(Sender: TObject);
begin
   //TIWAppForm(WebApplication.ActiveForm).Release;
  // Create the next form
  Move(TIW_login);
end;

procedure TIWFrame2.iwlnk6Click(Sender: TObject);
begin
WebApplication.Terminate('exit');
end;

procedure TIWFrame2.Move(AFormClass: TIWAppFormClass);
begin
  // Release the current form
  TIWAppForm(WebApplication.ActiveForm).Release;
  // Create the next form
  AFormClass.Create(WebApplication).Show;

end;
end.