; [02-23-15] working script to pull words from toLearn.txt, look up definition
; on www.definr.com, and output html file with definition. from there, can be
; imported into evernote or moved elsewhere
; -----------------------------------------------------------------------------

; working directory where .AHK file exists
SetWorkingDir %A_ScriptDir%  

; add date line to learned file, all learned words will be listed here
FormatTime, date,,MM-dd-yy
FileAppend, `n%date%`n, learned.txt

; initialize word counters, break flag
counter = 0
skipped = 0
brk = 0
words = 

; start looping over top line in toLearn.txt
Loop
{
	FileReadLine, line, toLearn.txt, 1
	;st = %line%
	words := words . line . "`n`t"

	; break if end of file
	if ErrorLevel
		break
		
	; use *** to break up toLearn.txt
	if (line = "***")
	{
		brk = 1
		break
	}
	
	; get url from definr.com for word definition
	UrlDownloadToFile, http://www.definr.com/%line%, Words\definition.tmp
	
	; initialize definition and create flag
	found = 0
	definition = 
	
	; loop through file to find definition
	Loop, read, Words\definition.tmp
	{	
		if (found == 1)
		{
			;msgbox, adding: %A_Loopreadline%
			definition := definition . A_Loopreadline
		}
	
		posStart := InStr(A_Loopreadline, "<div id=""meaning""><br />")
		if (posStart > 0)
		{
			found = 1
			;msgbox, found start! adding: A_Loopreadline%
			definition := definition . A_Loopreadline
		}

		posEnd := InStr(A_Loopreadline, "</div>")
		if (posEnd > posStart)
		{
			break
		}
	}
	
	; if no definition found, add to skipped.txt and stop processing word
	if (definition = "")
	{
		skipped++
		
		FileAppend, %line%`n, skipped.txt
	
		; read in file to remove word for toLearn.txt
		FileRead, file, toLearn.txt
		
		; get length of top word and read in all following text in file
		len := StrLen(line)
		content := SubStr(file, len + 3)
		
		; delete current toLearn file and replace with new copy
		FileDelete, toLearn.txt
		FileAppend, %content%, toLearn.txt
	}

	; otherwise process word as normal
	else
	{
		counter++
	
		; append definition to cumulative file
		FileAppend, <br><hr>`n%definition%, Words\Definitions-all.html
		
		; create distinct file for word, within dated folder
		FileCreateDir, Words\New\%date%
		FileAppend, %definition%, Words\New\%date%\%line%.html
		
		; append word to learned.txt
		FileAppend, %line%`n, learned.txt
		
		; read in file to remove word for toLearn.txt
		FileRead, file, toLearn.txt
		
		; get length of top word and read in all following text in file
		len := StrLen(line)
		content := SubStr(file, len + 3)
		
		; delete current toLearn file and replace with new copy
		FileDelete, toLearn.txt
		FileAppend, %content%, toLearn.txt
	}
}

; if operation stopped at *** break flag, remove from toLearn.txt
if (brk == 1)
{
	; read in file to remove word for toLearn.txt
	FileRead, file, toLearn.txt
	
	; get length of top word and read in all following text in file
	len := StrLen(line)
	content := SubStr(file, len + 3)
	
	; delete current toLearn file and replace with new copy
	FileDelete, toLearn.txt
	FileAppend, %content%, toLearn.txt
}

; delete temp file
FileDelete, Words\definition.tmp

;if (skipped > 0)
;	skipped--

; append to log file
FileAppend, %date% -- %counter% word(s) processed. %skipped% word(s) skipped.`n`t%words%`n, processedLog.txt

MsgBox, Operation Complete!`n%counter% word(s) processed.`n%skipped% word(s) skipped.