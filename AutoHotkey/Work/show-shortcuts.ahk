#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


output = 
; FOLDER SHORTCUTS
output := output . "`n`n--- FILES / SCRIPTS ---"
output := output . "`nWIN + F1 = AutoHotkey (main)"
output := output . "`nWIN + F2 = MyBuys"
output := output . "`nWIN + F3 = MyBuys - Work Log"
output := output . "`n"
output := output . "`nWIN + F7 = Podcasts Log"
output := output . "`nWIN + F8 = Currently Listening Log"




; FOLDER SHORTCUTS
output := output . "`n`n--- FOLDERS ---"
output := output . "`nWIN + ~ = My Computer"
output := output . "`nWIN + 1 = My Documents"
output := output . "`nWIN + 2 = Downloads"
output := output . "`nWIN + 3 = Dropbox"
output := output . "`nWIN + 4 = Dropbox/AutoHotkey"

output := output . "`n`n--- FOLDERS (MYBUYS)---"
output := output . "`nWIN + ALT + 1 = local data"
output := output . "`nWIN + ALT + 2 = client ETL"
output := output . "`nWIN + ALT + 3 = mockups"
output := output . "`nWIN + ALT + 4 = clients config"
output := output . "`nWIN + ALT + 5 = clients"

; NUMPAD SHORTCUTS
output := output . "`n`n--- NUMPAD ---"
output := output . "`nWIN + 7 = evernote-wearing"
output := output . "`nWIN + 8 = evernote-walks"
output := output . "`nWIN + 9 = evernote-generic"

; MEDIA CONTROLS
output := output . "`n`n--- MEDIA ---"
output := output . "`nBREAK = Pause/Play VLC"
output := output . "`nWIN + NUMPAD - = Volume-Down"
output := output . "`nWIN + NUMPAD + = Volume-Up"
output := output . "`nWIN + NUMPAD * = Volume-Mute"

; MISC SHORTCUTS
output := output . "`n`n--- MISC ---"
output := output . "`nWIN + 12 = reload AutoHotkey (main)"
output := output . "`nWIN + 11 = reload MyBuys"
output := output . "`nWIN + break = open Calculator"

; TEXT EXPANSION (DATES)
output := output . "`n`n`n--- TEXT EXPANSION (DATE/TIME) ---"
output := output . "`n;d =`tM/d"
output := output . "`n;;d =`t[MM/dd]"
output := output . "`n;;dd =`t[MM/dd/yy]"
output := output . "`n;;ddl =`t[MM-dd-yy]"
output := output . "`n;;dl =`tMM-dd-yy"
output := output . "`n;;ddf =`tyyyy-MM-dd"
output := output . "`n;;ti =`tHH:mm"





msgbox %output%
;msgbox %output%
;msgbox %output%
;msgbox %output%