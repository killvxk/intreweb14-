program Project1;



uses
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  Forms,
  IWStart,
  U_main in 'U_main.pas' {IWmain: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  U_login in 'U_login.pas' {IW_login: TIWAppForm},
  U_frame in 'U_frame.pas' {IWFrame2: TFrame},
  U_tongji in 'U_tongji.pas' {IWtongji: TIWAppForm};

{$R *.res}

 begin
  TIWStart.Execute(True);
end.
