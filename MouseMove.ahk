/*
  MouseMove Virus

  Description:-
	Moves the mouse randomly to any position.
*/

#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon

SetBatchLines -1 ; For Speed

CoordMode, Mouse, Screen

SysGet, WorkArea, MonitorWorkArea, 1 ; Avoid the taskbar

; Hide all windows from the action
WinMinimizeAll

; Change this to have fun as you want it...
SetTimer, MoveMouse, 1000

Return	 ;End of Auto Execute Section

MoveMouse:
	Random, Xcord , 0, %WorkAreaRight%
	Random, Ycord , 0, %WorkAreaBottom%
	MouseMove, Xcord, Ycord, 0
Return

q & m::
Exitapp
