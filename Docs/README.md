﻿[![EN](https://user-images.githubusercontent.com/9499881/33184537-7be87e86-d096-11e7-89bb-f3286f752bc6.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.md) 
[![RU](https://user-images.githubusercontent.com/9499881/27683795-5b0fbac6-5cd8-11e7-929c-057833e01fb1.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.RU.md) 
[![CN](https://user-images.githubusercontent.com/9499881/31012373-978ce414-a522-11e7-9936-387b1c530e2f.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.CN.md) 
[![ES](https://user-images.githubusercontent.com/9499881/31012379-9d8f7764-a522-11e7-8bf4-739077369e8b.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.ES.md) 
[![FR](https://user-images.githubusercontent.com/9499881/31012387-a7b4aaac-a522-11e7-8485-36ce58dc2d4a.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.FR.md) 
[![DE](https://user-images.githubusercontent.com/9499881/31012392-ac051326-a522-11e7-9c8c-2186ddf553d0.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.DE.md) 
[![PT](https://user-images.githubusercontent.com/9499881/31012384-a1d1b544-a522-11e7-8a13-3cb53450d55c.png)](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/README.PT.md)
# Functions TrueOpenVR
All functions are imported directly from the "TOVR.dll" library. The library path can be obtained from the registry.

| Name  | Description |
| ------------- | ------------- |
| [GetHMDData](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/EN/Functions/GetHMDData.md) | Retrieves the rotation and position state of HMD. |
| [GetControllersData](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/EN/Functions/GetControllersData.md) | Retrieves the state of the position, rotation, buttons, sticks and triggers of the two controllers. |
| [SetControllerData](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/EN/Functions/SetControllerData.md) | Sends data to a controller. Function is used to activate the feedback (vibration) of a controllers. |
| [SetCentering](https://github.com/TrueOpenVR/TrueOpenVR-Core/blob/master/Docs/EN/Functions/SetCentering.md) | Centering the device (reset rotation). |

# Parameters TrueOpenVR
The registry settings are in the branch `HKEY_CURRENT_USER\Software\TrueOpenVR`.

| Name  | Description |
| ------------- | ------------- |
| `Library` | The path to the main 32-bit library with functions. |
| `Library64` | The path to the main 64-bit library  with functions. |
| `ScreenIndex`  | VR screen index. For example, 1 is the main display, and 2 is the VR display. |
| `RenderWidth` and `RenderHeight` | Common frame rendering resolution. For example, the user can increase it to increase the quality of the picture or lower it to increase performance. |
| `Driver` | Current 32-bit driver name. |
| `Driver64` | Current 64-bit driver name. |
| `Drivers` | Path to the folder with drivers. |
| `IPD` | Software correction of interpupillary distance. |
| `DistortionK1`, `DistortionK2` | Lens distortion correction coefficients for VR HMD. |
| `ScaleWidth`, `ScaleHeight` | Scale stereo images vertically and horizontally. Values range from 0 to 100, where 100 is 100% of one stereo image. User can reduce them. It is necessary to change the stereo image to fit the size of a VR HMD lens. |
| `HMDProfiles` | Path to the folder with VR HMD profiles. |
| `ScreenControl` | Turn on or turn off the VR display when launching applications. The on of the option - 1, off - 0. Required for displays in extended mode. |