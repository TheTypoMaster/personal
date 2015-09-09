#NoEnv						; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.


!l::Run C:\Users\DSmith\Documents\AutoHotkey-Local\createRawHTML.ahk


#NumPad2::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotKey\Work\SQL-promotable-products.ahk

#NumPad0::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotKey\Work\show-shortcuts.ahk
#NumPad7::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotKey\Work\evernote-add-wearing.ahk
#NumPad8::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotKey\Work\evernote-add-walks.ahk
;;#NumPad9::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotKey\Work\evernote-add-generic.ahk


^!v::Send ^v{TAB}^v

; ********** MYBUYS AUTOHOTKEY FILE -- FOR RUNNING ON WORK COMPUTER************

; --------------- GENERIC SCRIPTS ---------------------------------------------
; reload current script
#F11::
Reload
msgbox, Script reloaded.
return


; --------------- TEXT EXPANSION ----------------------------------------------
; ----- Current Time -----
::;;ti::
FormatTime, time,, HH:mm
SendInput %time%{space}-{space}
return

; ----- QA Email Addresses -----
:o*:;;gma::mybuys.psqa@gmail.com+{TAB}
:o*:;;ya::MyBuys_PSQA@yahoo.com 
:o*:;;aol::mybuys_psqa@aol.com 
:o*:;;ol::mybuys_psqa@outlook.com

; ----- HTML Editing Shortcuts -----
::;;cs::<{!}--
::;;ce::-->
:o:;;cc::{HOME}<{!}--{SPACE}{END}-->{LEFT 3}
::;;cu::{HOME}{DEL}{DEL}{DEL}{DEL}{END}{BACKSPACE}{BACKSPACE}{BACKSPACE}
::;cen::align="center"
::;bo::border-collapse:collapse; border:none;
::;bord::style="border-collapse:collapse; border:none;"
::;bl::display:block;
:o:;wi::width=""{SPACE}{LEFT 2}

; ----- ORACLE DATABASE TEXT SHORTCUTS -----
; --- RM Table ---
:o:;;rmcl::select * from rm_client where identifier = '';{LEFT 2}
:o:;;rmid::select * from rm_client where client_id = '';{LEFT 2}
:o:;;rmpr::select * from rm_product where client_id = (select client_id from rm_client where identifier = '');{LEFT 3}
:o:;;rmcat::select * from rm_categories where client_id = (select client_id from rm_client where identifier = '');{LEFT 3}
:o:;;rmsku::select * from rm_sku where client_id = (select client_id from rm_client where identifier = '');{LEFT 3}

; --- CDI / CDS Tables ---
:o:;;cdicat::select * from CD_I_CATEGORIES where client_identifier = '';{LEFT 2}
:o:;;cdscat::select * from CD_S_CATEGORIES where client_identifier = '';{LEFT 2}
:o:;;cdipr::select * from CD_I_PRODUCTS where client_identifier = '';{LEFT 2}
:o:;;cdspr::select * from CD_S_PRODUCTS where client_identifier = '';{LEFT 2}
:o:;;cdisku::select * from CD_I_SKUS where client_identifier = '';{LEFT 2}
:o:;;cdssku::select * from CD_S_SKUS where client_identifier = '';{LEFT 2}
:o:;;cdsopt::select * from CD_S_OPTIN where client_identifier = '';{LEFT 2}

; --- Simple Text Shortcuts ---
::;;cdic::CD_I_CATEGORIES
::;;cdsc::CD_S_CATEGORIES
::;;cdip::CD_I_PRODUCTS
::;;cdsp::CD_S_PRODUCTS
::;;cdis::CD_I_SKUS
::;;cdss::CD_S_SKUS
::;;cdso::CD_S_FEED_ORDERS
:o:;cid::client_identifier = ''{LEFT}
::;id::identifier
::;cn::count(*)
::runid::run_id
::;;ord::order by run_id desc
:o:;;l::like '%%'{LEFT 2}


; --------------- FOLDER AND APPLICATION SHORTCUTS ----------------------------
#!1::Run C:\etl\mybuys\clients-data
#!2::Run C:\mybuys\etl
#!3::Run C:\mybuys\ps\mockups
#!4::Run C:\mybuys\sites\clients-config
#!5::Run C:\mybuys\sites\clients

; open current script
#F2::Run Notepad++.exe %A_ScriptDir%\MyBuys.ahk,, Max
;open script directory
;#F5::Run C:\Users\%A_UserName%\Dropbox\Portable Apps\AutoHotkey\Work\
; open alert template fix tracker
;#F4::Run C:\Users\DSmith\Dropbox\MyBuys\Template Fixes.txt
; kill firefox and re-open dev portal
#Del::Run C:\Users\%A_UserName%\Dropbox\Portable Apps\AutoHotkey\Work\#no backup\restart-firefox.bat

; open daily work log
#F3::
FormatTime, date,, MM-dd-yy
Run C:\Users\DSmith\Documents\AutoHotkey-Local\WorkLogs\Working On [%date%].txt,, Max
return

^r::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run Excel.exe %clipboard%,, Max
clipboard := temp
return


; --------------- MEDIA CONTROLS ----------------------------------------------
; win+numpad* mutes volume
#NUMPADMULT::Send {VOLUME_MUTE}
; win+numpad+ increases volume
#NUMPADADD::Send {VOLUME_UP}
; win+numpad- decreases volume
#NUMPADSUB::Send {VOLUME_DOWN}

; win+numpadEnter pauses/plays vlc
#NUMPADENTER::
WinExist("VLC media player ahk_class QWidget")
ControlSend,, {space}, ahk_class QWidget
return

; break also pauses/plays vlc
break::
WinExist("VLC media player ahk_class QWidget")
ControlSend,, {space}, ahk_class QWidget
return

; break also pauses/plays vlc
!break::
if WinExist("ahk_class SpotifyMainWindow")
ControlSend,, {space}, ahk_class SpotifyMainWindow
return


; --------------- EXTERNAL AUTOHOTKEY SCRIPTS ---------------------------------
; ctrl+l opens time tracking
^!l::Run %A_ScriptDir%\taskTimer.ahk

; run collect generated messages (opens any links within currently selected text in chrome)
^7::Run %A_ScriptDir%\collectGenMessages.ahk
^8::Run %A_ScriptDir%\collectGenMessages-not html.ahk ;just for the day [04-29-15] 

; mockup file name validator -- stopped [04/23/15] 
 !p::Run C:\Users\DSmith\Dropbox\Portable Apps\AutoHotkey\Work\mockup.ahk

; ctrl+q alternates cursor back and forth between two side-by-side screens
!q::
AlternateCursor()
return

; ctrl+6 shows screen width/height (in pixels)
; ^6::msgbox, w=%A_ScreenWidth%, h=%A_ScreenHeight%

; ctrl+win+alt+9 opens clients-data and etl folders side by side
^#!9::
OpenClientETL()
return

; ctrl+win+alt+0 opens mockups and config folders side by side
^#!0::
OpenClientMockup()
return

; ctrl+shift+home opens canopy page for client
^+HOME::
OpenCanopyPage()
return


; --------------- WINDOWS EXPLORER HOTKEYS ------------------------------------
; ctrl+e opens file in notepad
;^e::
;temp := clipboard
;clipboard = 
;Send, ^c
;ClipWait
;Run notepad++.exe %clipboard%,, Max
;clipboard := temp
;return

; ctrl+shift+x copies filepath of currently select files
^+x::
temp := clipboard
clipboard =
send, ^c
clipwait
fPath := clipboard
clipboard := temp
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
; ctrl+win+numLock opens tortoise SVN log
;#^NumLock::Send {AppsKey}t{Right}l ;[03-30-15] -- not working

; ctrl+shift+space removes unwanted part of the file path when pushing files
^+SPACE::Send {HOME}^+{RIGHT 3}{DEL}{DOWN}


; --------------- OPENING FILES IN DIFFERENT WEB BROWSERS ---------------------
; ctrl+shift+1/2/3 opens chrome/firefox/IE
^#1::Run chrome.exe,, Max
^#2::
msgbox, test1
Run firefox.exe,, Max
return
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
Run chrome.exe --incognito %clipboard%,, Max
clipboard := temp
return

; ctrl+win+1 opens file in chrome (not incognito)
^+1::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run chrome.exe %clipboard%,, Max
clipboard := temp
return

; ctrl+2 opens file in firefox (private)
^2::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run firefox.exe -private %clipboard%,, Max
clipboard := temp
return

; ctrl+win+2 opens file in firefox (not private)
^+2::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run firefox.exe %clipboard%,, Max
clipboard := temp
msgbox, test3
return

; ctrl+3 opens file in internet explorer (inprivate)
^3::
temp := clipboard
clipboard = 
Send, ^c
ClipWait
Run iexplore.exe -private %clipboard%,, Max
clipboard := temp
return


; --------------- TIME TRACKING SCRIPT ----------------------------------------
; win+l writes break to working log file and locks computer, writes again on return
$#l::
FormatTime, date,, MM-dd-yy
FormatTime, time, ,HH:mm
WinGetActiveTitle T
FileAppend, %time% - *break*`n, C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs\Working On [%date%].txt
;Send {Win}l
DllCall("LockWorkStation")
Sleep 2000
WinWaitActive %T%
FormatTime, time, ,HH:mm
FileAppend, %time% - *break*`n, C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs\Working On [%date%].txt
return


; --------------- SCRIPTS FOR NOTEPAD++ ---------------------------------------
#IfWinActive ahk_class Notepad++
{
	; shift+rightClick closes all other windows
	+RButton::
	Send {RButton}{Down}{Down}{Enter}
	Return
	
	; search for selected text and count number found
	#NumLock::Send ^f{Tab}t
}


; --------------- NOTEPAD++ SEARCH FUNCTIONS ----------------------------------
#IfWinActive ahk_class #32770
{
	; search for selected text and count number found
	#NumLock::Send {Tab}t
	
	; copies line from search to replace
	^+b::Send ^a^c{tab}^v
}


; --------------- SCRIPTS FOR CHROME ------------------------------------------
#IfWinActive ahk_class Chrome_WidgetWin_1
{
	; shift+rightClick closes all other windows
	;+RButton::Send {RButton}ccc{Enter}	;moved to primary file 04/27/15
	
	; alt+w inspects element
	!w::Send ^+c
}


; --------------- SCRIPTS FOR FIREFOX -----------------------------------------
#IfWinActive ahk_class MozillaWindowClass
{
	; shift+rightClick closes all other windows
	+RButton::
	Send {RButton}o
	Sleep 200
	Send {Enter}
	Return
	
	; firefox -- open alert configurator, jumps to email line
	^9::
	Send {AppsKey}m{Down}{Enter}
	sleep 300
	Send {Tab 8}
	return

	; firefox -- open alert configurator, jumps to email line (and sends)
	^+9::
	Send {AppsKey}m{Down}{Enter}
	sleep 300
	Send {Tab 7}{Enter}
	return
}


; --------------- SCRIPTS FOR INTERNET EXPLORER -------------------------------
#IfWinActive ahk_class IEFrame
{
	; shift+rightClick closes all other windows
	+RButton::Send {RButton}o
}


; --------------- SCRIPTS FOR EXCEL -------------------------------------------
#IfWinActive ahk_class XLMAIN
{
	!RButton::Send ^{PgDn}
	!LButton::Send ^{PgUp}
}


; --------------- SCRIPTS FOR 7ZIP FILE MANAGER -------------------------------
#IfWinActive ahk_class FM
{
	; ctrl+shift+rightClick opens PS output file and checks for any errors 
	^+RButton::Run C:\Users\DSmith\Documents\AutoHotkey-Local\OpenPSoutput.ahk
	
	; ctrl+shift+r opens PS output file and checks for any errors
	^+r::Run C:\Users\DSmith\Documents\AutoHotkey-Local\OpenPSoutput.ahk
}

; --------------- SCRIPTS FOR SQL DEVELOPER -----------------------------------
#IfWinActive ahk_class SunAwtFrame
{
	; ^+UP::
	; temp1 := clipboard
	; clipboard = 
	; Send {HOME}+{END}^x
	; ClipWait

	; line := clipboard
	
	
	; ;Loop
	; ;{
		; clipboard = 
		; Send {UP}{HOME}+{END}^c{ENTER}
		; ClipWait
		
		; Trim(%clipboard%
		; ;	msgbox, fill
			; Send %line%{DOWN}%clipboard%
		
	
	
	

	; clipboard := temp
	; return

;^+DOWN::Send {HOME}+{END}^x{DOWN}^v

}

; --------------- EXTRA SCRIPT FUNCTIONS --------------------------------------
; get most recent active client based on input (by default, last used in timer)
OpenActiveClient()
{
	; try to read last entry used in timer script
	FileReadLine, lastEntry, C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs\zzWorking.tmp, 1
	InputBox, txt, Question, Which client?, , , 150, , , , , %lastEntry%

	if ErrorLevel
	{
		msgbox, Action Cancelled.
		return "cancel"
	}
	
	; if text entered, rewrite temp file, if not, don't change
	If txt !=
	{
		StringUpper, out, txt
		FileDelete C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs\zzWorking.tmp
		FileAppend %out%, C:\Users\%A_UserName%\Documents\AutoHotkey-Local\WorkLogs\zzWorking.tmp
	}
	
	return %txt%
}

; open clients-data and etl folders side by side
OpenClientETL()
{
	in := OpenActiveClient()

	if (in != "cancel")
	{
		StringUpper, client, in

		; try to open client ETL, if doesn't exist, open root
		if client !=
			Run C:\mybuys\etl\%client%,, Max
		else
			Run C:\mybuys\etl,, Max

		; snap right
		sleep 300	
		WinGetActiveTitle, WinTitle
		WinMove, %WinTitle%,,(A_ScreenWidth/2), 0

		; try to open client data, if doesn't exist, open root
		if client !=
			Run C:\etl\mybuys\clients-data\%client%,, Max
		else
			Run C:\etl\mybuys\clients-data,, Max
		
		; snap left
		sleep 300
		WinGetActiveTitle, WinTitle
		WinMove, %WinTitle%,, 0, 0, (A_ScreenWidth/2), A_ScreenHeight
	}
	
	return
}

; open mockups and config folders side by side
OpenClientMockup()
{
	in := OpenActiveClient()

	if (in != "cancel")
	{
		StringUpper, client, in

		; try to open clients-config, if doesn't exist, open root
		if (client != "")
			Run C:\mybuys\product\clients-config\%client%,, Max
		else
			Run C:\mybuys\product\clients-config,, Max
		
		; snap right
		sleep 300
		WinGetActiveTitle, WinTitle
		WinMove, %WinTitle%,,(A_ScreenWidth/2), 0

		; try to open mockups, if doesn't exist, open root
		if (client != "")
			Run C:\mybuys\ps\mockups\%client%,, Max
		else
			Run C:\mybuys\ps\mockups,, Max

		; snap left
		sleep 300
		WinGetActiveTitle, WinTitle
		WinMove, %WinTitle%,, 0, 0, (A_ScreenWidth/2), A_ScreenHeight
	}
	
	return
}

; alternate cursor from screen to screen in identical location
AlternateCursor()
{
	; set coordinate reference
	CoordMode, Mouse, Screen

	; get screen coords
	SysGet, vsWidth, 78
	SysGet, vsHeight, 79
	half := Floor(vsWidth/2)

	;msgbox, w=%vsWidth%, h=%vsHeight%, half=%half%

	; get current mouse position
	MouseGetPos, xpos, ypos

	;msgbox, x=%xpos%, y=%ypos%

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
	
	return
}

OpenCanopyPage()
{
	in := OpenActiveClient()

	if (in != "cancel")
	{
		StringUpper, client, in
		;msgbox, url=https://canopy.p.mybuys.com/ops/cgi-bin/dashboards/client_page.cgi?CLIENT=%client%
		Run chrome.exe https://canopy.p.mybuys.com/ops/cgi-bin/dashboards/client_page.cgi?CLIENT=%client%
	}
	return
}


:o:;;promo::
(
with results as (
select  count(distinct product_id) as products,
		sum(null_display) as null_display,
		sum(promo_index) as promo_index,
		sum(prices) as prices,
		sum(in_stock) as in_stock,
		sum(images) as images,
		sum(cat) as cat,
		sum(case when null_display = 1 and promo_index = 1 and prices = 1 and in_stock = 1 and images = 1 and cat = 1 then 1 else 0 end) as promotable
from ( select  pr.product_id,
				  case when pr.display_name is not null then 1 else 0 end as null_display,
				  case when pr.promotion_index is null or pr.promotion_index <> -1 then 1 else 0 end as promo_index,
				  case when (pr.prior_price is null) or (pr.prior_price >= pr.price) then 1 else 0 end as prices,
				  ( select  count(distinct sk.product_id) as in_stock
					from    rm_sku sk
					where   sk.client_id = pr.client_id
							and sk.product_id = pr.product_id
							and sk.in_stock = 1 ) as in_stock,
				  ( select  count(distinct im.product_id) as images
					from    rm_client_images im
					where   im.client_id = pr.client_id
							and im.product_id = pr.product_id
							and im.url_invalid_time is null
							and im.type = 0 ) as images,
				  ( select  count(distinct rel.product_id) as cat
					from    rm_product_cat_rels rel
							inner join rm_categories cat  on  cat.id = rel.category_id
														  and ( cat.type is null or cat.type = 0 )
					where   rel.product_id = pr.product_id ) as cat
		  from    rm_client cl
				  left outer join rm_product pr on  pr.client_id = cl.client_id
		  where   cl.identifier = '&clientidentifier' ) results )

select  'Total Products:' as description,
		products as rowcount
from    results
union all
select  'Non-Null Display Name:' as description,
		null_display as rowcount
from    results
union all
select  'Promotion Index <> -1 or is null:' as description,
		promo_index as rowcount
from    results
union all
select  'Prior Price >= Current Price:' as description,
		prices as rowcount
from    results
union all
select  'Products In Stock:' as description,
		in_stock as rowcount
from    results
union all
select  'Valid Images:' as description,
		images as rowcount
from    results
union all
select  'Valid Category:' as description,
		cat as rowcount
from    results
union all
select  'Promotable Products:' as description,
		promotable as rowcount
from    results;
)