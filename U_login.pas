unit U_login;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWCompEdit, IWCompLabel, IWBaseComponent,
  IWBaseHTMLComponent, IWBaseHTML40Component, IWCompExtCtrls, IWCompListbox;

type
  TIW_login = class(TIWAppForm)
    iwrgn4: TIWRegion;
    iwrgn1: TIWRegion;
    iwdt1: TIWEdit;
    iwdt2: TIWEdit;
    iwbtn1: TIWButton;
    iwrgn3: TIWRegion;
    iwlbl1: TIWLabel;
    iwlbl2: TIWLabel;
    iwbtnreg: TIWButton;
    iwlbl3: TIWLabel;
    procedure iwbtnregClick(Sender: TObject);
    procedure iwbtn1Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);

    procedure iwbtn2Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit, U_frame, U_main;


procedure TIW_login.IWAppFormCreate(Sender: TObject);
begin
//JavaScript.Text :='';
//iwbtn2.ScriptEvents.Values['onclick'] :='IWDT2IWCL.value = getLocation();';
//iwbtn2.ScriptEvents.Values['onclick'] :='getLocation();';
end;

procedure TIW_login.iwbtn1Click(Sender: TObject);
begin
if Trim(iwdt1.Text)='' then
begin
WebApplication.ShowMessage('�û�����Ϊ��');
exit;
end;
if UserSession.login(iwdt1.Text,iwdt2.Text,'')=1 then
begin
   UserSession.loguser(iwdt1.Text);
     Self.WebApplication.ActiveForm.Free;
    TIWmain.Create(WebApplication).Show;
end
else
WebApplication.ShowMessage('��¼ʧ��');


end;

procedure TIW_login.iwbtn2Click(Sender: TObject);
begin
exit;
end;



procedure TIW_login.iwbtnregClick(Sender: TObject);
begin

if Trim(iwdt1.Text)='' then
begin
WebApplication.ShowMessage('�û�����Ϊ��');
exit;
end;



if UserSession.reguser(iwdt1.Text,iwdt2.Text)=1 then
WebApplication.ShowMessage('ע��-'+iwdt1.Text+'-�ɹ�')
else
 WebApplication.ShowMessage('ע��ʧ��');
end;


initialization
  TIW_login.SetAsMainForm;

end.