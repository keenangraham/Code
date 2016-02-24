#include <AutoItConstants.au3>
#include <WinAPIFiles.au3>
#include <Excel.au3>
#include <Array.au3>
#include <GuiMenu.au3>
#include <GUIConstantsEx.au3>
#include <GuiComboBox.au3>
#include <StringConstants.au3>
#include <MsgBoxConstants.au3>

AutoItSetOption('MouseCoordMode', 0)
AutoItSetOption("SendKeyDelay", 0)

$Total = 50000
$t = 5856
$bbb = 0


Global $g_bPaused = False

HotKeySet("{PAUSE}", "HotKeyPressed")
HotKeySet("{ESC}", "HotKeyPressed")
HotKeySet("+!d", "HotKeyPressed") ; Shift-Alt-d


Func HotKeyPressed()
    Switch @HotKeyPressed ; The last hotkey pressed.
        Case "{PAUSE}" ; String is the {PAUSE} hotkey.
            $g_bPaused = Not $g_bPaused
            While $g_bPaused
                Sleep(100)
                ToolTip('Script is "Paused"', 0, 0)
            WEnd
            ToolTip("")

        Case "{ESC}" ; String is the {ESC} hotkey.
            Exit

        Case "+!d" ; String is the Shift-Alt-d hotkey.
            MsgBox($MB_SYSTEMMODAL, "", "This is a message.")

    EndSwitch
EndFunc


WinActivate("Microsoft Excel - SearchRaw")

$Excel = _Excel_Open()
$Workbook = _Excel_BookOpen($Excel, @ScriptDir & "\SearchRaw.xls")
$OrderNumber = _Excel_RangeRead($Workbook, Default, $Workbook.ActiveSheet.Usedrange.Columns("A:A"))

Do
   If 1 == 1 Then
	  AutoItSetOption('MouseCoordMode', 0)

	  $CurrentOrder = $OrderNumber[$t]
	  WinActivate("SoftLab 4.0.6 - Genova Diagnostics")
	  WinWait("SoftLab 4.0.6 - Genova Diagnostics")
	  WinActivate("SoftLab 4.0.6 - Genova Diagnostics")
	  MouseClick($MOUSE_CLICK_PRIMARY, 960, 101, 2, 0)
	  sleep(450)
	  $sActiveWindowTitle = WinGetTitle("[ACTIVE]")



	  If Not($sActiveWindowTitle = "Results Query") Then
		 Sleep(3000)
		 WinActivate("Clinical Information System")
		 $sActiveWindowTitle = WinGetTitle("[ACTIVE]")

		 If $sActiveWindowTitle = "Clinical Information System" Then


			While $sActiveWindowTitle = "Clinical Information System"
			   MouseClick($MOUSE_CLICK_PRIMARY, 479, 8, 1, 0)
			   WinActivate("SoftLab 4.0.6 - Genova Diagnostics")
			   WinWait("SoftLab 4.0.6 - Genova Diagnostics")
			   WinActivate("SoftLab 4.0.6 - Genova Diagnostics")
			   MouseClick($MOUSE_CLICK_PRIMARY, 960, 101, 2, 0)
			   Sleep(1500)
			   WinActivate("Clinical Information System")
			   $sActiveWindowTitle = WinGetTitle("[ACTIVE]")
			WEnd


		 EndIf
	  EndIf



	  WinWait("Results Query")
	  WinActivate("Results Query")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send($CurrentOrder)
	  Send("{Enter}")
	  WinWait("Lab Results Query - [Lab Results Query]")
	  WinActivate("Lab Results Query - [Lab Results Query]")
	  $sText = WinGetText("[ACTIVE]")
	  $Value = StringSplit($sText,@CRLF)
	  WinActivate("Lab Results Query - [Lab Results Query]")
	  WinWait("Lab Results Query - [Lab Results Query]")
	  MouseClick($MOUSE_CLICK_PRIMARY, 1256, 100, 1, 0)
	  sleep(200)
	  WinActivate("Patient Information")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  sleep(250)
	  Send("^c")
	  sleep(200)
	  $a1 = ClipGet()
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  sleep(200)
	  Send("^c")
	  sleep(200)
	  $a11 = ClipGet()
	  Send("{TAB}")
	  sleep(200)
	  Send("^c")
	  sleep(200)
	  $a2 = ClipGet()
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  sleep(200)
	  Send("^c")
	  sleep(200)
	  $a3 = ClipGet()
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  Send("{TAB}")
	  sleep(200)
	  Send("^c")
	  sleep(200)
	  $a4 = ClipGet()
	  For $i=1 To $Value[0]
		 If StringRegExp($Value[$i],"female") Then
			$a5 = "Female"
			Sleep(250)
			ExitLoop
		 ElseIf StringRegExp($Value[$i],"male") Then
			$a5 = "Male"
			Sleep(250)
			ExitLoop
		 EndIf
	  Next

	  WinActivate("Patient Information")
	  WinWait("Patient Information")

	  MouseClick($MOUSE_CLICK_PRIMARY, 1005, 6, 1, 0)
	  WinWait("Lab Results Query - [Lab Results Query]")
	  WinActivate("Lab Results Query - [Lab Results Query]")

	  MouseClick($MOUSE_CLICK_PRIMARY, 216, 60, 1, 0)
	  WinWait("Order Entry")

If 1 == 1 Then

		 Send("{ENTER}")
		 MouseClick($MOUSE_CLICK_PRIMARY, 137, 386, 1, 0)
		 WinActivate("Clinic Search Screen")
		 sleep(2000)
		 $swt = WinGetTitle("[ACTIVE]")
		 If $swt <> "Clinic Search Screen" Then
			sleep(500)
			Send("{ENTER}")
			MouseClick($MOUSE_CLICK_PRIMARY, 217, 122, 1, 0)
			MouseClick($MOUSE_CLICK_PRIMARY, 217, 122, 1, 0)
			sleep(250)
			MouseClick($MOUSE_CLICK_PRIMARY, 137, 386, 1, 0)
		 EndIf
		 sleep(1000)


		 $test = WinGetText("[ACTIVE]")

		 If StringInStr($test,"database!") <> 0 Then
			sleep(250)
			Send("{ENTER}")
			MouseClick($MOUSE_CLICK_PRIMARY, 1261, 18, 1, 0)
			Sleep(250)
			MouseClick($MOUSE_CLICK_PRIMARY, 206, 98, 1, 0)
			$a6 = $a11
			$a7 = $a11
			$a8 = $a2
			WinActivate("Lab Results Query")
			WinWait("Lab Results Query")
		 Else
			WinWait("Clinic Search Screen")
			WinActivate("Clinic Search Screen")
			Sleep(250)

			MouseClick($MOUSE_CLICK_PRIMARY, 255, 80, 1, 0)
			Sleep(250)
			Send("{ENTER}")
			WinWait("Wards/Clinics - SoftLab")
			WinActivate("Wards/Clinics - SoftLab")


			MouseClick($MOUSE_CLICK_PRIMARY, 123, 94, 1, 0)
			Sleep(250)
			Send("{TAB}")
			Send("{TAB}")
			Send("^c")
			$a6 = ClipGet()

			Send("{TAB}")
			Send("^c")
			$a7 = ClipGet()

			Send("{TAB}")
			Send("^c")
			$a8 = ClipGet()


			MouseClick($MOUSE_CLICK_PRIMARY, 852, 13, 1, 0)
			Sleep(250)

			WinActivate("Order Entry")


			MouseClick($MOUSE_CLICK_PRIMARY, 1261, 18, 1, 0)

			Sleep(250)

			MouseClick($MOUSE_CLICK_PRIMARY, 206, 98, 1, 0)



			WinActivate("Lab Results Query")
			WinWait("Lab Results Query")
		 EndIf


	  EndIf

	  WinActivate("Lab Results Query")
	  WinWait("Lab Results Query")

	  $c = 1
	  $e = 0

	  Do
	  $e = $e + 1
	  WinActivate("Lab Results Query")
	  WinWait("Lab Results Query")


	  MouseClick($MOUSE_CLICK_PRIMARY, 635, 259, 1, 0)

	  Send("{DOWN " & $c & "}")

	  Send("{ENTER}")
	  Sleep(250)

	  $New = WinGetTitle("[ACTIVE]")
	  If $New = "Test detailed information" Then
		 WinActivate("Test detailed information")
		 WinWait("Test detailed information")
		 MouseClick($MOUSE_CLICK_PRIMARY, 136, 50, 2, 0)
		 Send("{TAB}")
		 Send("^c")
		 $OrgTest = ClipGet()
		 If $OrgTest = "No Ova or Parasites Seen" Then
			Send("^c")
			$a9 = ClipGet()
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("{TAB}")
			Send("^c")
			$a10 = ClipGet()

			MouseClick($MOUSE_CLICK_PRIMARY, 591, 6, 1, 0)

			WinActivate("Lab Results Query")
			WinWait("Lab Results Query")
			MouseClick($MOUSE_CLICK_PRIMARY, 1259, 15, 1, 0)



			$e = 20
		 Else
			MouseClick($MOUSE_CLICK_PRIMARY, 591, 4, 1, 0)
			$c = $c + 1
		 EndIf
	  Else
	   $c = $c + 1
	  EndIf

	  Until $e = 20

	  WinActivate("Microsoft Excel - Pad")
	  WinWait("Microsoft Excel - Pad")
	  Send($a1)
	  Send("{TAB}")
	  Send($a2)
	  Send("{TAB}")
	  Send($a3)
	  Send("{TAB}")
	  Send($a4)
	  Send("{TAB}")
	  Send($a5)
	  Send("{TAB}")
	  Send($a6)
	  Send("{TAB}")
	  Send($a7)
	  Send("{TAB}")
	  Send($a8)
	  Send("{TAB}")
	  Send($a9)
	  Send("{TAB}")
	  Send($a10)
	  Send("{TAB}")


	  Send("{DOWN}")
	  sleep(200)
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("{LEFT}")
	  Send("^s")

	  EndIf

   $t = $t + 1
   Until $t = $Total





