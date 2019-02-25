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

  {设置 IWRegion1 的大小与位置}
  iwrgn2.HorzScrollBar.Visible:=False;
  iwrgn2.VertScrollBar.Visible:=False;
  IWRgn2.Width := 700;
  IWRgn2.Height := self.Height;
  IWRgn2.Top := 0;
  IWRgn2.Left := (ClientWidth - IWRgn2.Width) div 2;
  IWRgn2.Anchors := [akTop, akBottom]; //这是关键设置, 其实是 VCL 的老东西, 但对网页更重要一些

  {设置其它 3 个 IWRegion 的位置、大小与颜色}
  iwfrm.Align := alTop;

 {
iwfrm.Top:=0;
iwfrm.Left:=(ClientWidth - iwfrm.Width) div 2;
iwrgn1.Left:=(ClientWidth - iwrgn1.Width) div 2;
twdbdvwbgrd1.Left:=(ClientWidth - twdbdvwbgrd1.Width) div 2;  }
if UserSession.ulevel='1' then
  begin
     iwlbl7.Width:=60;
    iwlbl7.Caption:='管理员='+UserSession.uname;
  end;
if UserSession.ulevel='2' then
  begin
     iwlbl7.Width:=60;
    iwlbl7.Caption:='普通='+UserSession.uname;
  end;

iwbtnjieshou.Visible:=False;
iwbtn2.OnClick(Sender);    //为了只显示登录用户
end;

procedure TIWmain.iwbtn1Click(Sender: TObject);
begin
  twdvwbgrdxcl1.XLSExport('11.xls',WebApplication);  //下载本记录集

end;
 procedure TIWmain.iwbtn2Click(Sender: TObject);
begin
  //UserSession.unqry1.Refresh;
 if usersession.ulevel= '2' then
 begin
   with  UserSession.unqry1 do
 begin
  Close;
  sql.Clear;
  SQL.Add('select * from zhoubao where sfdel=0 and sfabr = ');
  sql.Add(''''+usersession.uname+''' order by id desc ');

  Open;
 end;
 end
 else
 begin
   with  UserSession.unqry1 do
 begin
  Close;
  sql.Clear;
  SQL.Add('select * from zhoubao where sfdel=0 order by id desc ');
  Open;
 end;
 end;
   UserSession.qryPosition.Refresh;
 end;



//接受任务
procedure TIWmain.iwbtnjieshouClick(Sender: TObject);
begin
  if ssid='' then
  begin
   WebApplication.ShowMessage('没有id号，请选择');
   exit;
  end;

  iwlbl7.Caption:=UserSession.uname+'-'+ssid;
 with UserSession.qryPosition do
begin

  Open;

  if Locate('id',ssid,[]) then  //查找
  begin
    Edit;
    Fields.FieldByName('jiesr').AsString:=UserSession.uname;    //经办人
    Fields.FieldByName('chulfs').AsString:=iwdt3.Text;         //处理方式
    Fields.FieldByName('houxjh').AsString:=iwdt6.Text;        //后续计划
    Fields.FieldByName('sfgd').AsBoolean:=iwchckbx1.Checked;    //是否归档
    FieldByName('sfwc').AsBoolean:=iwchckbx2.Checked;           //是否完成
    FieldByName('haos').AsString:=iwdt2.Text;                   //耗时
    FieldByName('wentigl').AsString:=cbb1.SelectedText;
    FieldByName('uarea').AsString:=UserSession.uarea;          //问题归类
    Post;

  end;
  UserSession.unqry1.Refresh;

end;
end;
//发布任务
procedure TIWmain.iwbtnpostClick(Sender: TObject);
begin
  with UserSession.unqry1 do
  begin

  Append;
  Fields.FieldByName('sdate').Value:=FormatDateTime('yyyy-MM-dd HH:nn:ss',now());
  Fields.FieldByName('sfabr').Value:=UserSession.uname;
  Fields.FieldByName('xiangmmc').Value:= iwdt1.Text;
  Fields.FieldByName('uarea').Value:= UserSession.uarea;
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
//WebApplication.ShowMessage('列号'+inttostr(Columnindex));   //列号
//WebApplication.ShowMessage('行号'+inttostr(RowIndex));    //h行号
//WebApplication.ShowMessage(twdbdvwbgrd1.CellValues[1,rowindex]);
 ssid:=twdbdvwbgrd1.CellValues[0,rowindex];
 with UserSession.qryPosition do
begin

  Open;

  if Locate('id',ssid,[]) then  //查找
  begin
    Edit;
    Fields.FieldByName('sfdel').AsString:='1';    //删除标记
    Post;

  end;
  UserSession.unqry1.Refresh;

end;

end;


//详细信息
procedure TIWmain.twdbdvwbgrd1AsyncLinkClick(Sender: TObject;
  EventParams: TStringList; RowIndex, ColumnIndex: Integer);
begin
 iwdt1.Text:=twdbdvwbgrd1.CellValues[3,rowindex];    //项目名
 iwdt3.Text:=twdbdvwbgrd1.CellValues[4,rowindex];    //处理方式
 iwdt6.Text:=twdbdvwbgrd1.CellValues[7,rowindex];    //后续计划
 ssid:=twdbdvwbgrd1.CellValues[0,rowindex];
 iwbtnjieshou.Visible:=true;  //允许编辑
 iwlbl7.Caption:=UserSession.uname+'-'+ssid;
end;

initialization
 // TIWmain.SetAsMainForm;

end.
