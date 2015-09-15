#NoEnv							; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input					; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%		;Ensures a consistent starting directory.


Gui, Destroy

LINEBREAK = -----------------------------------------------------------------------------------

slots = 1|2|3||4|5|6|7|8|9|10|11|12
zoneTypes = HOME||PRODUCT_DETAILS|HIGH_LEVEL_CATEGORY|CATEGORY|SHOPPING_CART|SEARCH_RESULTS|ORDER_CONFIRMATION|BRAND|LANDING|ADD_TO_CART|SALE|NEW|BRAND_HOME|MY_PAGE

Gui, Font, s11
Gui, Add, Text, xm, Client identifier:
Gui, Add, Edit, w230 x+10 vClient, <CLIENT>
Gui, Add, Text, xm, Zone type:
Gui, Add, DropDownList, w180 x+10 vZoneTypeInput, %zoneTypes%
Gui, Add, Text, xm, Zone number:
Gui, Add, Edit, x+10 w25 vZone, 1
Gui, Add, Text, xm, %LINEBREAK%
Gui, Add, Text, xm, Product slot type:
Gui, Add, Radio, checked vRadioDiv, div
Gui, Add, Radio, x+20 vRadioList, list
Gui, Add, Radio, x+20 vRadioTable, table
Gui, Add, Text, xm, Number of product slots:
Gui, Add, DropDownList, w60 x+10 vNumSlotsInput, %slots%
Gui, Add, Text, xm, Product slot content:
Gui, Add, Checkbox, checked vImageInput, Image
Gui, Add, Checkbox, checked vBrandInput, Brand
Gui, Add, Checkbox, checked vNameInput, Name
Gui, Add, Checkbox, checked vPriceInput, Current Price
Gui, Add, Checkbox, x+70 checked vShowPriceInput, Show   " Price: / Sale: "
Gui, Add, Checkbox, xm checked vSaleInput, Base Price / Sale Price
Gui, Add, Checkbox, vRatingsInput, Ratings
Gui, Add, Text, xm, Image size (H x W):
Gui, Add, Edit, x+10 vImageHeight, 150
Gui, Add, Text, x+2, x
Gui, Add, Edit, x+2 vImageWidth, 150
Gui, Add, Text, xm, %LINEBREAK%
Gui, Add, Button, w120 xm+110, Create

Gui, Show, Center w360, Raw HTML Creator
return



GuiClose:
Gui, destroy
;MsgBox, Closing application. No operations performed.
ExitApp
Return


; ---------- CREATE BUTTON ----------
ButtonCreate:
Gui, Submit, noHide

clientID = %Client%
zoneType = %ZoneTypeInput%
zoneNum = %Zone%
showImage = %ImageInput%
showBrand = %BrandInput%
showName = %NameInput%
showPrice = %PriceInput%
showPriceText = %ShowPriceInput%
showSale = %SaleInput%
showRatings = %RatingsInput%
HEIGHT = %ImageHeight%
WIDTH = %ImageWidth%
numSlots = %NumSlotsInput%

if (RadioDiv = 1)
	slotType = div
if (RadioList = 1)
	slotType = list
if (RadioTable = 1)
	slotType = table

command = %clientID% %zoneType% %zoneNum% %slotType% %numSlots% %HEIGHT% %WIDTH% %showImage% %showBrand% %showName% %showPrice% %showSale% %showPriceText% %showRatings%

Run, cmd.exe /k cd C:\Users\DSmith\workspace
sleep 1300
Send, java -jar html-creator.jar %command%
sleep 300
Send, {ENTER}
sleep, 300
Send, exit{ENTER}


return
