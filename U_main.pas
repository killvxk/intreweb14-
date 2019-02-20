unit U_main;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWWebGrid,
  IWDBAdvWebGrid, IWCompButton, IWAdvWebGridExcel, Vcl.Forms, U_frame,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  IWCompLabel, IWCompListbox, IWCompCheckbox, IWCompEdit, IWDBStdCtrls,
  IWDBAsyncNavigator,IWHTMLTag;

type
  TIWmain = class(TIWAppForm)
    twdbdvwbgrd1: TTIWDBAdvWebGrid;
    twdvwbgrdxcl1: TTIWAdvWebGridExcelIO;
    iwfrm: TIWFrame2;
    iwrgn1: TIWRegion;
    IWLabel1: TIWLabel;
    iwlbl1: TIWLabel;
    iwlbl2: TIWLabel;
    iwlbl5: TIWLabel;
    iwdt1: TIWEdit;
    iwdt3: TIWEdit;
    iwdt6: TIWEdit;
    iwchckbx1: TIWCheckBox;
    iwchckbx2: TIWCheckBox;
    cbb1: TIWComboBox;
    iwlbl6: TIWLabel;
    iwdt2: TIWEdit;
    iwbtnpost: TIWButton;
    iwlbl7: TIWLabel;
    iwbtnjieshou: TIWButton;
    iwbtn1: TIWButton;
    iwbtn2: TIWButton;
    IWButton1: TIWButton;
    iwrgn2: TIWRegion;
    procedure twdbdvwbgrd1AsyncButtonClick(Sender: TObject;
      EventParams: TStringList; RowIndex, ColumnIndex: Integer);
    procedure iwbtn1Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbtnpostClick(Sender: TObject);
    procedure twdbdvwbgrd1AsyncLinkClick(Sender: TObject;
      EventParams: TStringList; RowIndex, ColumnIndex: Integer);
    procedure iwbtnjieshouClick(Sender: TObject);
    procedure iwbtn2Click(Sender: TObject);
    procedure IWButton1HTMLTag(ASender: TObject; ATag: TIWHTMLTag);

  public
    ssid:string;
  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit;


procedure TIWmain.IWAppFormCreate(Sender: TObject);
begin

IWRgn1.Parent := IWRgn2;
  iwfrm.Parent := IWRgn2;
  twdbdvwbgrd1.Parent := IWRgn2;

  {���� IWRegion1 �Ĵ�С��λ��}
  iwrgn2.HorzScrollBar.Visible:=False;
  iwrgn2.VertScrollBar.Visible:=False;
  IWRgn2.Width := 700;
  IWRgn2.Height := self.Height;
  IWRgn2.Top := 0;
  IWRgn2.Left := (ClientWidth - IWRgn2.Width) div 2;
  IWRgn2.Anchors := [akTop, akBottom]; //���ǹؼ�����, ��ʵ�� VCL ���϶���, ������ҳ����ҪһЩ

  {�������� 3 �� IWRegion ��λ�á���С����ɫ}
  iwfrm.Align := alTop;

 {
iwfrm.Top:=0;
iwfrm.Left:=(ClientWidth - iwfrm.Width) div 2;
iwrgn1.Left:=(ClientWidth - iwrgn1.Width) div 2;
twdbdvwbgrd1.Left:=(ClientWidth - twdbdvwbgrd1.Width) div 2;  }
iwlbl7.Caption:=UserSession.uname;
iwbtnjieshou.Visible:=False;
end;

procedure TIWmain.iwbtn1Click(Sender: TObject);
begin
  twdvwbgrdxcl1.XLSExport('11.xls',WebApplication);  //���ر���¼��

end;
 procedure TIWmain.iwbtn2Click(Sender: TObject);
begin
 UserSession.unqry1.Refresh;
  UserSession.qryPosition.Refresh;
end;

//��������
procedure TIWmain.iwbtnjieshouClick(Sender: TObject);
begin
  if ssid='' then
  begin
   WebApplication.ShowMessage('û��id�ţ���ѡ��');
   exit;
  end;

  iwlbl7.Caption:=UserSession.uname+'-'+ssid;
 with UserSession.qryPosition do
begin

  Open;

  if Locate('id',ssid,[]) then  //����
  begin
    Edit;
    Fields.FieldByName('jiesr').AsString:=UserSession.uname;
    Fields.FieldByName('chulfs').AsString:=iwdt3.Text;
    Fields.FieldByName('houxjh').AsString:=iwdt6.Text;
    Fields.FieldByName('sfgd').AsBoolean:=iwchckbx1.Checked;
    FieldByName('sfwc').AsBoolean:=iwchckbx2.Checked;
    FieldByName('haos').AsString:=iwdt2.Text;
    FieldByName('wentigl').AsString:=cbb1.SelectedText;
    Post;

  end;
  UserSession.unqry1.Refresh;

end;
end;
//��������
procedure TIWmain.iwbtnpostClick(Sender: TObject);
begin
  with UserSession.unqry1 do
  begin

  Append;
  Fields.FieldByName('sdate').Value:=FormatDateTime('yyyy-MM-dd HH:nn:ss',now());
  Fields.FieldByName('sfabr').Value:=UserSession.uname;
  Fields.FieldByName('xiangmmc').Value:= iwdt1.Text;
  Post;
  end;
  UserSession.unqry1.refresh;
  UserSession.qryPosition.refresh;
  iwbtnjieshou.Visible:=False;
  iwlbl7.Caption:=UserSession.uname+'-'+ssid;
end;

procedure TIWmain.IWButton1HTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
ATag.Params.Values['type'] := 'reset';
end;

procedure TIWmain.twdbdvwbgrd1AsyncButtonClick(Sender: TObject;
  EventParams: TStringList; RowIndex, ColumnIndex: Integer);
begin
WebApplication.ShowMessage('�к�'+inttostr(Columnindex));   //�к�
WebApplication.ShowMessage('�к�'+inttostr(RowIndex));    //h�к�
WebApplication.ShowMessage(twdbdvwbgrd1.CellValues[1,rowindex]);

end;


//��ϸ��Ϣ
procedure TIWmain.twdbdvwbgrd1AsyncLinkClick(Sender: TObject;
  EventParams: TStringList; RowIndex, ColumnIndex: Integer);
begin
 iwdt1.Text:=twdbdvwbgrd1.CellValues[3,rowindex];    //��Ŀ��
 iwdt3.Text:=twdbdvwbgrd1.CellValues[4,rowindex];    //������ʽ
 iwdt6.Text:=twdbdvwbgrd1.CellValues[8,rowindex];    //�����ƻ�
 ssid:=twdbdvwbgrd1.CellValues[0,rowindex];
 iwbtnjieshou.Visible:=true;  //�����༭
 iwlbl7.Caption:=UserSession.uname+'-'+ssid;
end;

initialization
 // TIWmain.SetAsMainForm;

end.