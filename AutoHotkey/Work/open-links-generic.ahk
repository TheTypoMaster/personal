#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; pull in selected text
selected := GetSelectedText()
;msgbox, selected text=%selected%

FileAppend, %selected%, tmp1.txt

; loop over selected text by line
Loop
{
	; read in the line and trim whitespace
	FileReadLine, line1, tmp1.txt, %A_Index%
	line = %line1%

	; break if end of file
	if ErrorLevel
		break
	

	FileAppend, %line%`n, tmp2.txt
	
	; parse off .html extension (if exists) and if so, append link to file
	;findExt := SubStr(line, -4)

	;if (findExt = ".html")
	;{
		;msgbox found link!
	;}
}

; loop over file of html links by line
Loop
{
	; read in the file line
	FileReadLine, line, tmp2.txt, %A_Index%
	
	; break if end of file
	if ErrorLevel
		break

	; open link in chrome incognito
	Run, chrome.exe --incognito %line%,, Max
}

; cleanup -- delete temp files
FileDelete, tmp1.txt
FileDelete, tmp2.txt


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