{$MINENUMSIZE 4}
{$ALIGN ON}

unit TrueOpenVR;

interface


uses
  Windows;

const
  // Current name of the DLL shipped in the same SDK as this header.
  // The name reflects the current version
  TOVR_DLL_A  = 'TOVR.dll';
  TOVR_DLL_W  = 'TOVR.dll';
  {$IFDEF UNICODE}
  TOVR_DLL = TOVR_DLL_W;
  {$ELSE}
  TOVR_DLL = TOVR_DLL_A;
  {$ENDIF}

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

  //VR Init
  PVRInfo = ^TVRInfo;
  _VRInfo = record
    ScreenIndex: integer;
    Scale: boolean;
    UserWidth: integer;
    UserHeight: integer;
  end;
  VRInfo = _VRInfo;
  TVRInfo = VRInfo;

  //Controllers
  PControllers = ^TControllers;
  _Controllers = record
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
  Controllers = _Controllers;
  TControllers = Controllers;

//
// TrueOpenVR APIs
//

function GetInfo(out myVRInfo: TVRInfo): DWORD; stdcall; external TOVR_DLL;
function GetHMDData(out myHMD: THMD): DWORD; stdcall; external TOVR_DLL;
function GetControllersData(out myController, myController2: TControllers): DWORD; stdcall; external TOVR_DLL;
function SetControllerData(dwIndex: integer; MotorSpeed: dword): DWORD; stdcall; external TOVR_DLL;
function SetCentering(dwIndex: integer): DWORD; stdcall; external TOVR_DLL;

implementation

end.
