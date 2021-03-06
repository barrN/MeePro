Global Const $cbs_autohscroll = 64
Global Const $cbs_dropdown = 2
Global Const $gui_event_close = -3

Global $form1_1 = GUICreate("MeePro", 377, 160, 284, 254)
Global $menuitem1 = GUICtrlCreateMenu("&File")
Global $menuitem3 = GUICtrlCreateMenuItem("Exit", $menuitem1)
Global $menuitem2 = GUICtrlCreateMenu("&Info")
Global $menuitem4 = GUICtrlCreateMenuItem("Help", $menuitem2)
Global $menuitem6 = GUICtrlCreateMenuItem("Function Description", $menuitem2)
Global $menuitem5 = GUICtrlCreateMenuItem("About", $menuitem2)
Global $button1 = GUICtrlCreateButton("Set", 198, 24, 51, 20)
Global $nMeepos = 1

;--------------K E Y B I N D S-------------;

Global $selectPrimary = "{F1}"
Global $selectAll = ""
Global $DaggerPos = "1"
Global $poofAbility = "w"
Global $webAbility = "q"

;------------------------------------------;

GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)
Global $label11 = GUICtrlCreateLabel("***Go to  'Info > Help'  for steps***", 90, 2, 200, 15)

GUICtrlSetFont(-1, 7, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)
Global $label1 = GUICtrlCreateLabel("Poof Self", 8, 24, 119, 20)

GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)
Global $label2 = GUICtrlCreateLabel("Poof To Nearest", 8, 52, 122, 20)

GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)


Global $combo1 = GUICtrlCreateCombo("", 136, 24, 49, 25, BitOR($cbs_dropdown, $cbs_autohscroll))
GUICtrlSetData($combo1, "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|0|1|2|3|4|5|6|7|8|9")

Global $combo2 = GUICtrlCreateCombo("", 136, 52, 49, 25, BitOR($cbs_dropdown, $cbs_autohscroll))
GUICtrlSetData($combo2, "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|0|1|2|3|4|5|6|7|8|9")

Global $combo3 = GUICtrlCreateCombo("", 136, 75, 49, 25, BitOR($cbs_dropdown, $cbs_autohscroll))
GUICtrlSetData($combo3, "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|0|1|2|3|4|5|6|7|8|9")

Global $combo4 = GUICtrlCreateCombo("", 136, 100, 49, 25, BitOR($cbs_dropdown, $cbs_autohscroll))
GUICtrlSetData($combo4, "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|0|1|2|3|4|5|6|7|8|9")


Global $label3 = GUICtrlCreateLabel("Dagger Poof", 8, 75, 120, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $label4 = GUICtrlCreateLabel("Web", 9, 100, 119, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $button2 = GUICtrlCreateButton("Set", 198, 52, 51, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $button3 = GUICtrlCreateButton("Set", 198, 75, 51, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $button4 = GUICtrlCreateButton("Set", 198, 100, 51, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)


DirCreate("./")
FileInstall("./Meepo.jpg", "./")
Global $pic1 = GUICtrlCreatePic("./Meepo.jpg", 264, 20, 100, 100)
GUICtrlSetFont(-1, 8, 800, 2, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $label5 = GUICtrlCreateLabel("# Meepo : ", 270, 120, 126, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)

Global $label6 = GUICtrlCreateLabel($nMeepos, 350, 120, 126, 20)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 8388608)



GUISetState(@SW_SHOW)



Func inc()

	$nMeepos = $nMeepos + 1
	If $nMeepos > 5 Then $nMeepos = 5
	GUICtrlSetData($label6, $nMeepos)

EndFunc   ;==>inc

Func decM()
	$nMeepos = $nMeepos - 1
	If $nMeepos = 0 Then $nMeepos = 1
	GUICtrlSetData($label6, $nMeepos)

EndFunc   ;==>decM


Func poofself()
	If WinActive("Dota 2") Then
		For $i = 1 To $nMeepos
			Send($poofAbility & $poofAbility)
			Send("{TAB}")
		Next
	EndIf
EndFunc   ;==>poofself

Func poofnearest()
	If WinActive("Dota 2") Then
		For $i = 1 To $nMeepos
			Send($poofAbility)
			MouseClick("left")
			Send("{TAB}")
		Next
	EndIf
EndFunc   ;==>poofnearest

Func daggerpoof()
	If WinActive("Dota 2") Then
		Local $MousePos = MouseGetPos()

		Send($selectPrimary)
		Send($DaggerPos)
		MouseClick("left")

		Send($webAbility)
		MouseClick("left")
		Sleep(200)
		For $i = 1 To $nMeepos
			Send($poofAbility)
			MouseClick("left", $MousePos[0] + 50, $MousePos[1] + 50, 2, 0)
			Send("{TAB}")
		Next
		Send($selectAll)

	EndIf
EndFunc   ;==>daggerpoof

Func web()
	If WinActive("Dota 2") Then
		For $i = 03 To 0 Step -1
			Send("q")
			MouseClick("left")
			Send("{TAB}")
		Next
	EndIf
EndFunc   ;==>web

While 1
	If WinActive("Dota 2") Then
		HotKeySet("{PGUP}", "inc")
		HotKeySet("{PGDN}", "decM")
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $gui_event_close
			Exit
		Case $button1
			HotKeySet(GUICtrlRead($combo1), "poofself")
		Case $button2
			HotKeySet(GUICtrlRead($combo2), "poofnearest")
		Case $button3
			HotKeySet(GUICtrlRead($combo3), "daggerpoof")
		Case $button4
			HotKeySet(GUICtrlRead($combo4), "web")

		Case $menuitem4
			MsgBox(0, "Help", "How to use: " & @LF & "1. Choose your keys and press 'Set' for each key chosen. " & @LF & "2. Enter DotA 2." & @LF & "3. Join a game." & @LF & "4. Choose Meepo. " & @LF & "5. Use the set shortcut keys for its corresponding function. " & @LF & "6. Enjoy! " & @LF & @LF & @LF & @TAB & @TAB & "--- IMPORTANT ---" & @LF & @LF & "For DaggerPoof to work right you need to have the item slot where you have the dagger with keybinding 'NUMPAD1'." & @LF & "Try to have all meepos targetted before pressing a shortcut key.")
		Case $menuitem5
			MsgBox(0, "About!", "Why Meepo when you can MeePro!" & @LF & @LF & "Gogo easy Meepo!")
		Case $menuitem6
			MsgBox(0, "Function Description", "PoofSelf: " & @LF & "all Meepos will use poof on themselves (they won't teleport anywhere)" & @LF & @LF & "PoofNearest: " & @LF & "All Meepos will use poof on the mouse position." & @LF & @LF & "DaggerPoof: " & @LF & "the main Meepo will use dagger to the mouse position, throw a web then poof, the rest will use poof only on that position (without web)." & @LF & @LF & "Web: " & @LF & "all Meepos will throw their web on mouse position.")
	EndSwitch
WEnd

