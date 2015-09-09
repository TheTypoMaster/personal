#NoEnv						; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

; --------------- ALTERNATE CURSOR SCRIPT -------------------------------------
; For 1 or 2 screen setup, script moves cursor back and forth to corresponding
; location on second screen (or half of screen)


; set coordinate reference
CoordMode, Mouse, Screen

; get screen coords
SysGet, vsWidth, 78
SysGet, vsHeight, 79
half := Floor(vsWidth/2)

; get current mouse position
MouseGetPos, xpos, ypos
; msgbox, current position: x=%xpos%, y=%ypos%

; find mirrored x position
newx := 0
if (xpos < 0) {
	newx := xpos+half
}
else {
	newx := xpos-half
}

; move cursor to new location
MouseMove, newx, %ypos%, 1

; get new window and make active
MouseGetPos,,, winID
WinActivate, ahk_id %winID%