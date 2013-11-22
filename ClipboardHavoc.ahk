/*
  Clipboard Havoc

  Description:-
   Reverse the content of the clipboard
*/

#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon

SetBatchLines -1 ;For Speed

;Reverses the ClipBoard
reversePercent = 75

Return    ;End of Auto Execute Section

OnClipboardChange:

If (A_EventInfo = 1) ; IsText
{
  Random, Test, 1, 100
  if(test <= reversePercent)
  {
    temp =
    i := StrLen(Clipboard)

    Loop %i%
      temp := temp SubStr(Clipboard, i - A_index + 1, 1)

    Clipboard := temp
    temp =
  }
}

Return

