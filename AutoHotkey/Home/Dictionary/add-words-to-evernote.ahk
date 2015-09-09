SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

othersFiles := A_ScriptDir . "\Words\New\*"
destDir := A_ScriptDir . "\Words\Archive\"
cnt = 0

Run, cmd.exe
Sleep 300
Send cd C:\Program Files (x86)\Evernote\Evernote {Enter}

Loop, %othersFiles%, 1, 1
{
	;;check if it's an actual file (not a folder)
	html := SubStr(A_LoopFileFullPath,-4, 5)
	;;extract the file name (without extension)
	SplitPath, A_LoopFileFullPath,,,,fileName


	if (html = ".html")
	{
		;;ew\07-16-15\imprecation.html"
		Evernote.exe "C:\Users\DSmith\Dropbox\Portable Apps\AutoHotkey\Home\Dictionary\Words\New\07-16-15\inimitable.html"
		ENScript.exe createNote /s "C:\Users\DSmith\Dropbox\Portable Apps\AutoHotkey\Home\Dictionary\Words\New\07-16-15\inimitable.html" /i %fileName%
		Send ENScript.exe createNote /s "%A_LoopFileFullPath%" /i %fileName%
		Send Evernote.exe "%A_LoopFileFullPath%"
		Sleep 500
		Send {Enter}
		;;/i "%author% - %title%" /n "Books" /c "%cDate%" {Enter}
		Sleep 2000
		cnt++
	}

	;;FileCopy, %A_LoopFileFullPath%, %destDir%
	;;FileDelete, %A_LoopFileFullPath%
}

msgbox, %cnt% files saved to Evernote.
FileAppend, %cnt% files saved to Evernote`n, movedLog.txt
