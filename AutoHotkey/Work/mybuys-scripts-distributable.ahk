
; --------------- WINDOWS EXPLORER HOTKEYS ------------------------------------
; ctrl+e opens file in notepad
^e::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, notepad++.exe %clipboard%,, Max
clipboard := temp
return

; ctrl+shift+x copies filepath of currently select files
^+x::
clipboard =
send, ^c
clipwait
fPath := clipboard
return

; ctrl+shift+v pastes filepath
^+v::
send, %fPath%
return

; ctrl+shift+rightClick opens tortoise SVN diff
^+RButton::Send {RButton}t{Right}{Enter}
; ctrl+shift+numLock opens tortoise SVN diff
^+NumLock::Send {AppsKey}t{Right}{Enter}

; ctrl+win+rightClick opens tortoise SVN log
^#RButton::Send {RButton}t{Right}l

; ctrl+shift+space removes unwanted part of the file path when pushing files
^+SPACE::Send {HOME}^+{RIGHT 3}{DEL}{DOWN}


; --------------- OPENING FILES IN DIFFERENT WEB BROWSERS ---------------------
; ctrl+shift+1/2/3 opens chrome/firefox/IE
^#1::Run chrome.exe,, Max
^#2::Run firefox.exe,, Max
^#3::Run iexplore.exe,, Max

; ctrl+shift+0 kills all open browsers
^+0::
Process, close, chrome.exe
Process, close, firefox.exe
Process, close, iexplore.exe
return

; ctrl+1 opens file in chrome (incognito)
^1::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, chrome.exe --incognito %clipboard%,, Max
clipboard := temp
return

; ctrl+win+1 opens file in chrome (not incognito)
^+1::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, chrome.exe %clipboard%,, Max
clipboard := temp
return

; ctrl+2 opens file in firefox (private)
^2::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, firefox.exe -private %clipboard%,, Max
clipboard := temp
return

; ctrl+win+2 opens file in firefox (not private)
^+2::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, firefox.exe %clipboard%,, Max
clipboard := temp
return

; ctrl+3 opens file in internet explorer (inprivate)
^3::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run, iexplore.exe -private %clipboard%,, Max
clipboard := temp
return
