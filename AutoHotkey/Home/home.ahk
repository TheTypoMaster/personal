#NoEnv						; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

; ********** HOME AUTOHOTKEY FILE -- FOR RUNNING ON HOME COMPUTER**************

; --------------- GENERIC SCRIPTS ---------------------------------------------
; reload current script
#F11::
Reload
msgbox, Script reloaded.
return

; open current script
#F2::Run notepad++.exe %A_ScriptDir%\Home.ahk


; --------------- MEDIA CONTROLS ----------------------------------------------
; adjust volume without needing function key
F10::Send {Volume_Mute}
$F11::Send {Volume_Down}
$F12::Send {Volume_Up}

$^F11::Send {F11} ;make ctrl+F11 act as normal F11
$^F12::Send {F12} ;make ctrl+F12 act as normal F12

; temp: for adding dates more easily
;:o*:[]::[//]{LEFT 3}
;:o*:[]::[/14]{LEFT 4}