; [02-13-15] -- Script opens gui with space to enter book and author. Select
; desired option to add to corresponding files.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; set up date
FormatTime, date,, yyyy/MM/dd

; set up gui
Gui, Add, Text, ,Date:
Gui, Add, Edit, w100 vCdate, %date%
Gui, Add, Text, ,Book:
Gui, Add, Edit, w380 vtxt ; The ym option starts a new column of controls.
Gui, Add, Button, w80 xm+10 y+20, Dropbox
Gui, Add, Button, w80 x+20, EN-Books
Gui, Add, Button, w80 x+20, EN-Started
Gui, Add, Button, w80 x+20, EN-Finished
Gui, Show, Center h160 w420, Mockup Folder Update Tool
return

; ---------- BUTTON 1 ----------
ButtonDropbox:

; first strip off title and author
Gui, Submit, NoHide
mid := InStr(txt, " by ", CaseSensitive = true)
title := Substr(txt, 1, mid-1)
author := substr(txt, mid+4)

;msgbox, title: %title%`nauthor: %author%

; append to Dropbox list file
FileAppend %Cdate% %txt%`n, C:\Users\%A_UserName%\Dropbox\Documents\Read Books List.txt

;Gui, destroy
MsgBox, Added to Dropbox list!
;ExitApp
Return


; ---------- BUTTON 2 ----------
ButtonEN-Books:

; first strip off title and author
Gui, Submit, NoHide
mid := InStr(txt, " by ", CaseSensitive = true)
title := Substr(txt, 1, mid-1)
author := substr(txt, mid+4)

;msgbox, title: %title%`nauthor: %author%

; add to Evernote/Books notebook
run, cmd.exe
Send cd C:\Program Files (x86)\Evernote\Evernote {Enter}
sleep 100
send ENScript.exe createNote /s "%A_ScriptDir%\template.txt" /i "%author% - %title%" /n "Books" /c "%cDate%" {Enter}
Process, close, cmd.exe
sleep 200

;Gui, destroy
MsgBox, Created 'Books' note in Evernote!
;ExitApp
Return


; ---------- BUTTON 3 ----------
ButtonEN-Started:

; first strip off title and author
Gui, Submit, NoHide
mid := InStr(txt, " by ", CaseSensitive = true)
title := Substr(txt, 1, mid-1)
author := substr(txt, mid+4)

;msgbox, title: %title%`nauthor: %author%

run, cmd.exe
sleep 100
Send cd C:\Program Files (x86)\Evernote\Evernote {Enter}
sleep 100
Send ENScript.exe createNote /s "%A_ScriptDir%\template.txt" /i "STARTED: %title% by %author%" /n "Timeline" /t "books" /c "%cDate%" {Enter}
Process, close, cmd.exe
sleep 200

;Gui, destroy
MsgBox, Created 'Timeline' note in Evernote!
;ExitApp
Return


; ---------- BUTTON 4 ----------
ButtonEN-Finished:

; first strip off title and author
Gui, Submit, NoHide
mid := InStr(txt, " by ", CaseSensitive = true)
title := Substr(txt, 1, mid-1)
author := substr(txt, mid+4)
; msgbox, title: %title%`nauthor: %author%
msgbox date=%cDate%
; add to Evernote/Books notebook
run, cmd.exe
sleep 100
Send cd C:\Program Files (x86)\Evernote\Evernote {Enter}
sleep 100
Send ENScript.exe createNote /s "%A_ScriptDir%\template.txt" /i "FINISHED: %title% by %author%" /n "Timeline" /t "books" /c "%cDate%" {Enter}
;Process, close, cmd.exe
sleep 200

;Gui, destroy
MsgBox, Created 'Timeline' note in Evernote!
;ExitApp
Return


; ---------- CLOSE BUTTON ----------
GuiClose:
Gui, destroy
MsgBox, Closing application. No operations performed.
ExitApp
Return