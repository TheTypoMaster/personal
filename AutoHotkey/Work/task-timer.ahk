#NoEnv  					; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

; --------------- WORK TASK TIMER SCRIPT --------------------------------------
; raises input box asking what I'm doing and appends answer to text file

; read and format date/time
FormatTime, date, ,MM-dd-yy
FormatTime, time, ,HH:mm

; location of work logs directory
logsDir = C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs

; read what was last entered from temp file
FileReadLine, lastEntry, %logsDir%\zzWorking.tmp, 1

; input box asks what I'm doing
InputBox, txt, Question, What are you working on?, , , 150, , , , , %lastEntry%

if (ErrorLevel = 0)
{
	; appends time and task to file
	FileAppend %time% - %txt%`n, %logsDir%\Working On [%date%].txt

	; if text entered, rewrite temp file, if not, don't change
	If txt !=
	{
		FileDelete %logsDir%\zzWorking.tmp
		FileAppend %txt%, %logsDir%\zzWorking.tmp
	}
}