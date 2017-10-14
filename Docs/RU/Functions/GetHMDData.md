﻿# GetHMDData
Получение состояния вращения (Yaw, Pitch, Roll) и позиционирования (X, Y, Z) шлема.

С++
```c
DWORD GetHMDData(
	__out THMD *myHMD
);
```

Delphi
```pascal
function GetHMDData(
	out myHMD: THMD
): DWORD;
```

#### Параметры
myHMD [out] - Указатель на структуру THMD, которая получает текущее состояние шлема.

#### Структура THMD
C++
```c
typedef struct _HMDData
{
	double	X;
	double	Y;
	double	Z;
	double	Yaw;
	double	Pitch;
	double	Roll;
} THMD, *PHMD;
```

Delphi
```pascal
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
```

Если вам удобнее использовать кватернион, его можно получить из Yaw, Pitch, Roll.
```c
double qW, qX, qY, qZ;
qW = cos(DegToRad(yaw) * 0.5) * cos(DegToRad(roll) * 0.5) * cos(DegToRad(pitch) * 0.5) + sin(DegToRad(yaw) * 0.5) * sin(DegToRad(roll) * 0.5) * sin(DegToRad(pitch) * 0.5);
qX = cos(DegToRad(yaw) * 0.5) * sin(DegToRad(roll) * 0.5) * cos(DegToRad(pitch) * 0.5) - sin(DegToRad(yaw) * 0.5) * cos(DegToRad(roll) * 0.5) * sin(DegToRad(pitch) * 0.5);
qY = cos(DegToRad(yaw) * 0.5) * cos(DegToRad(roll) * 0.5) * sin(DegToRad(pitch) * 0.5) + sin(DegToRad(yaw) * 0.5) * sin(DegToRad(roll) * 0.5) * cos(DegToRad(pitch) * 0.5);;
qZ = sin(DegToRad(yaw) * 0.5) * cos(DegToRad(roll) * 0.5) * cos(DegToRad(pitch) * 0.5) - cos(DegToRad(yaw) * 0.5) * sin(DegToRad(roll) * 0.5) * sin(DegToRad(pitch) * 0.5);
```

#### Возвращаемое значение
Если шлем подключен и функция успешно завершилась, возвращаемое значение равно 1, иначе 0.