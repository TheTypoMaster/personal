#NoEnv  					; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  			; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

; set date formatting
FormatTime, date,, M/d

; raise input box
InputBox, txt, Question, Walk time:, , , 150, 1000, 650

; define message properties
mailsendlocation := A_MyDocuments
emailToAddress = dsmith060.bab40@m.evernote.com
emailFromAddress = sd592178@gmail.com
emailPass = XfQg1RiL1XE4xdTczIGl
emailSubject = Tracking Walks +
emailMessage = %txt%

; DEBUG -- display properties
; msgbox, account = %emailFromAddress%`npassword = %emailPass%`n`nto = %emailToAddress%`nsubject = %emailSubject%`nmessage = %emailMessage%

; execute send command
If (ErrorLevel = 0)
	Run, %mailsendlocation%\mailsend1.17b12.exe -to %emailToAddress% -from %emailFromAddress% -ssl -smtp smtp.gmail.com -port 465 -sub "%emailSubject%" -M "%emailMessage%" +cc +bc -auth-plain -user "%emailFromAddress%" -pass "%emailPass%" -q