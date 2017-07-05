library TOVR;

uses
  SysUtils, Classes, Windows, Registry;

type
  //HMD
  PHMD = ^THMD;
  _HMDData = record
    X: double;
    Y: double;
    Z: double;
    Yaw: double;
    Pitch: double;
    Roll: double;
end;
  HMD = _HMDData;
  THMD = HMD;

  //Controllers
  PController = ^TController;
  _Controller = record
    X: double;
    Y: double;
    Z: double;
    Yaw: double;
    Pitch: double;
    Roll: double;
    Buttons: dword;
    Trigger: byte;
    ThumbX: smallint;
    ThumbY: smallint;
end;
  Controller = _Controller;
  TController = Controller;

var
  DriverPath: string;
  DllHandle: HMODULE;

  DriverGetHMDData: function(out myHMD: THMD): DWORD; stdcall;
  DriverGetControllersData: function(out myController, myController2: TController): DWORD; stdcall;
  DriverSetControllerData: function (dwIndex: integer; MotorSpeed: dword): DWORD; stdcall;
  DriverSetCentering: function (dwIndex: integer): DWORD; stdcall;

{$R *.res}

function GetHMDData(out myHMD: THMD): DWORD; stdcall;
begin
  Result:=DriverGetHMDData(myHMD);
end;

function GetControllersData(out myController, myController2: TController): DWORD; stdcall;
begin
  Result:=DriverGetControllersData(myController, myController2);
end;

function SetControllerData(dwIndex: integer; MotorSpeed: dword): DWORD; stdcall;
begin
  Result:=DriverSetControllerData(dwIndex, MotorSpeed);
end;

function SetCentering(dwIndex: integer): DWORD; stdcall;
begin
  Result:=DriverSetCentering(dwIndex);
end;

procedure GetDriverPath;
var
  Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\TrueOpenVR', false) = false then
    Reg.CloseKey
  else begin
    if FileExists(Reg.ReadString('Drivers') + Reg.ReadString('Driver')) then
    DriverPath:=Reg.ReadString('Drivers') + Reg.ReadString('Driver');
  end;
  Reg.Free;
end;

exports
  GetHMDData index 1, GetControllersData index 2, SetControllerData index 3, SetCentering index 4;

begin
  GetDriverPath;
  if FileExists(DriverPath) then begin
    DllHandle:=LoadLibrary(PChar(DriverPath));
    @DriverGetHMDData:=GetProcAddress(DllHandle, 'GetHMDData');
    @DriverGetControllersData:=GetProcAddress(DllHandle, 'GetControllersData');
    @DriverSetControllerData:=GetProcAddress(DllHandle, 'SetControllerData');
    @DriverSetCentering:=GetProcAddress(DllHandle, 'SetCentering');
  end;
end.
 