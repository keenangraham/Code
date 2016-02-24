#include <AutoItConstants.au3>
#include <WinAPIFiles.au3>
#include <Excel.au3>
#include <Array.au3>
#include <GuiMenu.au3>
#include <GUIConstantsEx.au3>
#include <GuiComboBox.au3>
#include <StringConstants.au3>

AutoItSetOption('MouseCoordMode', 0)


$Total = 10
$t =  7
$organism = "2EIAG"

WinActivate("Microsoft Excel - Org")

$Excel = _Excel_Open()
$Workbook = _Excel_BookOpen($Excel, @ScriptDir & "\Org.xls")
$OrderNumber = _Excel_RangeRead($Workbook, Default, $Workbook.ActiveSheet.Usedrange.Columns("A:A"))

Do

   WinWait("SoftLab 4.0.6 - Genova Diagnostics")
   WinActivate("SoftLab 4.0.6 - Genova Diagnostics")

   MouseClick($MOUSE_CLICK_PRIMARY, 960, 101, 2, 0)

   WinWait("Results Query")
   WinActivate("Results Query")

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
   Send("{TAB}")
   Send("{TAB}")
   Send($organism)
   Send("{TAB}")
   Send("{TAB}")
   Send("{TAB}")
   Send("{TAB}")
   Send("{TAB}")
   Send("{DOWN}")
   Send("{TAB}")
   $CurrentDate = $OrderNumber[$t]
   $CDate =  $CurrentDate
   Send($CDate)
   Send("{TAB}")
   Send($CDate)
   Send("{ENTER}")
   Sleep(2000)
   WinWaitNotActive("Communicating with server...")

   If WinExists("Communicating with server...") == 1 Then
	  WinWait("Communicating with server...")
	  WinActivate("Communicating with server...")
	  WinWaitNotActive("Communicating with server...")
	  WinWait("Lab Results Query - [Exceptional Results Query]")
	  WinActivate("Lab Results Query - [Exceptional Results Query]")
	  Send("^a")
	  Send("^c")
	  WinActivate("Microsoft Excel - Borg  [Compatibility Mode]")
	  WinWait("Microsoft Excel - Borg  [Compatibility Mode]")
	  Send("^v")
	  Send("{END}")
	  Send("{HOME}")
	  Send("{DOWN}")
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
	  Send("{LEFT}")
	  WinActivate("Lab Results Query - [Exceptional Results Query]")
	  WinWait("Lab Results Query - [Exceptional Results Query]")

	  Send("!{F4}")
   ElseIf WinExists("Lab Results Query - [Exceptional Results Query]") == 1 Then
	  WinWait("Lab Results Query - [Exceptional Results Query]")
	  WinActivate("Lab Results Query - [Exceptional Results Query]")
	  Send("^a")
	  Send("^c")
	  WinActivate("Microsoft Excel - Borg  [Compatibility Mode]")
	  WinWait("Microsoft Excel - Borg  [Compatibility Mode]")
	  Send("^v")
	  Send("{END}")
	  Send("{HOME}")
	  Send("{DOWN}")
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
	  Send("{LEFT}")
	  WinActivate("Lab Results Query - [Exceptional Results Query]")
	  WinWait("Lab Results Query - [Exceptional Results Query]")

	  Send("!{F4}")
   Else
	  Send("{ENTER}")
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
	  Send("{BACKSPACE}")
	  Send("{TAB 6}")
	  Send("{BACKSPACE}")
	  Send("{TAB}")
	  Send("{BACKSPACE}")
	  Send("!{F4}")
	  Send("!{F4}")

   EndIf

$t = $t + 1



	  Until $t = $Total



