#NoEnv						; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.
#NoTrayIcon					; Turn off tray icon.

; ********** PRIMARY AUTOHOTKEY FILE -- FOR RUNNING ON ALL COMPUTERS **********

; reload current script
#F12::
Reload
msgbox, Script reloaded.
return


; --------------- TEXT EXPANSION ---------------------------------------------- 
::;atk::autohotkey
:o*:;;gm::dsmith060@gmail.com
:o:;;cred::5466160298166107
; 000/5/19

; for autohotkey vars
;:o*:..::%%{LEFT}

; insert [MM/dd]
::;;d::
FormatTime, date,, MM/dd
SendInput [%date%]{space}
return

;insert M/d
::;d::
FormatTime, date,, M/d
SendInput %date%{space}
return

; insert [MM/dd/yy]
:o:;;dd::
FormatTime, date,, MM/dd/yy
SendInput [%date%]
return

; insert [MM-dd-yy]
:o:;;dll::
FormatTime, date,, MM-dd-yy
SendInput [%date%]{space}
return

; insert MM-dd-yy
:o:;;dl::
FormatTime, date,, MM-dd-yy
SendInput %date%{space}
return

; insert yyyy-MM-dd
:o:;;dff::
FormatTime, date,, yyyy-MM-dd
SendInput %date%{space}
return


; --------------- FOLDER SHORTCUTS --------------------------------------------
;$#`::Send #e ;open My Computer/Windows Explorer
$#`::Run C:\Users\%A_UserName%\Desktop

#1::Run C:\Users\%A_UserName%\Documents,, Max
#2::Run C:\Users\%A_UserName%\Downloads
#3::Run C:\Users\%A_UserName%\Dropbox
#4::Run C:\Users\%A_UserName%\Dropbox\Portable Apps\AutoHotKey
#F1::Run Notepad++.exe C:\Users\%A_UserName%\Dropbox\Portable Apps\AutoHotkey\AutoHotkey.ahk

#F7::Run Notepad++.exe C:\Users\DSmith\Dropbox\zMISC\Podcasts.txt
#F8::Run Notepad++.exe C:\Users\DSmith\Dropbox\zMISC\Great Courses\20th century fiction.txt


; ---------------  APP SHORTCUTS ----------------------------------------------
; ctrl+shift+m opens notepad++ with new txt document
^+m::
Run notepad++.exe
Sleep 300
Send ^n
return

; ctrl+win+alt+o generates new random password in keypass
^#!o::
Send {TAB}{TAB}{ENTER}gu{ENTER}
Send +{TAB}+{TAB}^a
return

; break key opens calculator
#break::
Run, calc.exe
return


; --------------- KEY FIXES ---------------------------------------------------
; disables use of F1 key, still functions as expected by pressing alt+F1
$F1::return
$!F1::Send {F1}

; disables CapsLock key, still functions as expected by pressing alt+CapsLock
$CapsLock::return
$!CapsLock::send {CapsLock}

; win+Esc closes programs, win+w closes windows (just like ctrl+w)
#Esc::!F4
#w::Send ^w

; replaces ` key as backspace key, use as normal with ctrl or shift
$`:: send _
$+`::send {~}
$!`::send ``

; alt+leftClick = back, alt+rightClick = forward
!LButton::Send !{LEFT}
!RButton::Send !{RIGHT}


; --------------- COPY/PASTE/EDIT HOTKEYS -------------------------------------
; win+leftClick copies, win+rightClick pastes
#LButton::Send ^c
#RButton::Send ^v
; win+alt+leftClick = enter, win+alt+rightClick = backspace
!#LButton::Send {Enter}
!#RButton::Send {Backspace}


; --------------- WINDOWS EXPLORER HOTKEYS ------------------------------------
; ctrl+e opens file in notepad
^e::
;msgbox test n++
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run Notepad++.exe %clipboard%,, Max
clipboard := temp
return


; --------------- CHROME HOTKEYS ----------------------------------------------
#IfWinActive ahk_class Chrome_WidgetWin_1
{
	; stops chrome from automatically zooming in and out
	^WheelDown::return 
	^WheelUp::return
	#MaxHotkeysPerInterval 1000

	; win+q runs google search for selected text
	#q::Run % "http://www.google.com/search?q=" . GetSelectedText()

	; win+a sends shortcut to go back to inbox when in gmail
	#a::Send gi
	
	; alt+e selects all messages
	!e::Send *a

	; shift+rightClick closes all tabs to the right
	+RButton::Send {RButton}ccc{Enter}
}


; --------------- COMMAND WINDOW HOTKEYS --------------------------------------
#IfWinActive ahk_class ConsoleWindowClass
{
	;ctrl+v pastes clipboard (normal paste functionality for CMD)
	^v::SendInput {Raw}%clipboard%
}


; --------------- HELPER FUNCTIONS --------------------------------------------
; function gets selected text without clearing clipboard
GetSelectedText()
{
	tmp = %ClipboardAll%	;save clipboard
	Clipboard := "" 		;clear clipboard
	Send, ^c 				;simulate Ctrl+C (=selection in clipboard)
	ClipWait, 1 			;wait until clipboard contains data
	selection = %Clipboard% ;save the content of the clipboard
	Clipboard = %tmp% 		;restore old content of the clipboard
	return (selection = "" ? Clipboard : selection)
}

