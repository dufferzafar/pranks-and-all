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

;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Code Begins

;Reverses the ClipBoard
reversePercent = 100

Return    ;End of Auto Execute Section
;_____________________________________________

OnClipboardChange:
{
   IfEqual, A_EventInfo, 1 ;Checks to see if there is text on the Clipboard
   {
     random, test, 1, 100
     if(test <= reversePercent)
     {
         tempClipboard =
         i := StrLen(Clipboard)
         loop %i%
         {
            tempClipboard := tempClipboard SubStr(Clipboard, i - a_index + 1, 1)
         }
         Clipboard := tempClipboard
         tempClipboard =
     }
   }
   return
}
