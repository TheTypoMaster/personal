#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; --------------- FILE BACKUP SCRIPT ------------------------------------------
; Simple GUI based script to automatically backup files to dropbox. Files
; currently available for backup: AutoHotkey, PhraseExpress

; set up date formatting
FormatTime, date, ,yyyy-MM-dd

; delete any old log file
FileDelete, log.tmp

; --- set up GUI ---
Gui, Add, Text, ,Date: %date%
Gui, Add, Text, y+15,Files to backup:
Gui, Add, Button, w100 xm+10, AHK-Home
Gui, Add, Button, w100 x+20, AHK-Work
Gui, Add, Button, w100 x+20, PhraseExpress
Gui, Show, Center h85 w380,  AutoHotkey File Backup
return

; *********************************
; ***** FOR AUTOHOTKEY BACKUP *****
; *********************************

ButtonAHK-Home:		; AutoHotkey (HOME)
; set up log variable
copied = FILES BACKED UP %date%:`n

; select files to backup (and destination)
main = %A_ScriptDir%\AutoHotkey.ahk
backup = %A_ScriptDir%\Backup.ahk
othersDir = %A_ScriptDir%\Home\
destDir = C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\Home\

; copy primary file and backup file
FileCopy, %main%, C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\AutoHotkey [%date%].ahk
copied := copied . main . "`n"
FileCopy, %backup%, C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\Backup [%date%].ahk
copied := copied . backup . "`n"

; loop over directory and copy files
othersFiles := othersDir . "*.ahk"
Loop, %othersFiles%,,1
{
	len := StrLen(othersDir)						;get length of source path
	;name := SubStr(A_LoopFileFullPath,len,-4)		;get file name
	SplitPath, A_LoopFileFullPath,,,, name
	copy :=  destDir . name . " [" . date . "].ahk"	;append backup date
	;msgbox, original: %A_LoopFileFullPath%
	;msgbox, destination: %copy%
	
	FileCopy, %A_LoopFileFullPath%, %copy%
	copied := copied . A_LoopFileFullPath . "`n"
}

FileAppend, %copied%, log.tmp

;Gui, destroy
MsgBox, Backup Complete!
;ExitApp
Return


ButtonAHK-Work:		; AutoHotkey (Work)
; set up log variable
copied := "FILES BACKED UP:`n"

; select files to backup (and destination)
main = %A_ScriptDir%\AutoHotkey.ahk
backup = %A_ScriptDir%\Backup.ahk
othersDir = %A_ScriptDir%\Work\
destDir = C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\Work\

; copy primary file and backup file
FileCopy, %main%, C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\AutoHotkey [%date%].ahk
copied := copied . main . "`n"
FileCopy, %backup%, C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\AutoHotkey\Backup [%date%].ahk
copied := copied . backup . "`n"

; loop over directory and copy files
othersFiles := othersDir . "*.ahk"
Loop, %othersFiles%
{
	len := StrLen(othersDir)						;get length of source path
	;name := SubStr(A_LoopFileFullPath,len,-4)		;get file name
	SplitPath, A_LoopFileFullPath,,,, name
	copy :=  destDir . name . " [" . date . "].ahk"	;append backup date
	;msgbox, original: %A_LoopFileFullPath%
	;msgbox, destination: %copy%
	
	FileCopy, %A_LoopFileFullPath%, %copy%
	copied := copied . A_LoopFileFullPath . "`n"
}

FileAppend, %copied%, log.tmp

;Gui, destroy
MsgBox, Backup Complete!
;ExitApp
Return


; *************************************
; ***** FOR PHRASE EXPRESS BACKUP *****
; *************************************

ButtonPhraseExpress:	; PhraseExpress

; copy phrases file
FileCopy, C:\Users\%A_UserName%\Dropbox\Portable Apps\PhraseExpress\phrases.pxp, C:\Users\%A_UserName%\Dropbox\#Permanent Backup\Backups\PhraseExpress\phrases [%date%].pxp

;Gui, destroy
MsgBox, Backup Complete!
;ExitApp
Return

GuiClose:
Gui, destroy
MsgBox, Closing application. No backup performed.
ExitApp
Return

