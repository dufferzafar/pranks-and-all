/*
  Looks like a hang

  Description:-
	Turns your screen into grayscale, and no key works.

   Press Q & M to exit.
*/

#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon

SetBatchLines -1 ;For Speed

; Blocks almost all kind of input - Keyboard & Mouse
BlockInput, On

Gdip_Startup()

; Create a blank hidden GUI, we'll update it later
Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, 1: Show, NA
hwnd1 := WinExist() ;, OnMessage(0x201, "WM_LBUTTONDOWN")

; Grab Screenshot
pBitmap := Gdip_BitmapFromScreen(0 "|" 0 "|" A_ScreenWidth "|" A_ScreenHeight)
Width := Gdip_GetImageWidth(pBitmap), Height := Gdip_GetImageHeight(pBitmap)

; GDI+ stuff I don't understand
hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC()
obm := SelectObject(hdc, hbm), G := Gdip_GraphicsFromHDC(hdc)
Gdip_SetInterpolationMode(G, 7)

; Convert the screen to grayscale
Matrix = 0.299|0.299|0.299|0|0|0.587|0.587|0.587|0|0|0.114|0.114|0.114|0|0|0|0|0|1|0|0|0|0|0|1
Gdip_DrawImage(G, pBitmap, 0, 0, Width, Height, 0, 0, Width, Height, Matrix) ; Remove 'Matrix' to leave colored

; Show the GUI
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)

SelectObject(hdc, obm), DeleteObject(hbm)
DeleteDC(hdc), Gdip_DeleteGraphics(G)
Gdip_DisposeImage(pBitmap), Gdip_Shutdown(pToken)

Return ; End of AutoExecute

; This is called on left click to allow to drag
WM_LBUTTONDOWN()
{
   PostMessage, 0xA1, 2
}

q & m::
ExitApp
