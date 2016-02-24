#include <AutoItConstants.au3>
#include <WinAPIFiles.au3>

AutoItSetOption('MouseCoordMode', 0)
$i = 25
$mm = 32
$month = 8
$year = 14

$organism = "RHIS3"
Do
   If $month = 1 Or $month = 3 Or $month = 5 Or $month = 7 Or $month = 8 Or $month = 10 Or $month =12 Then
	  $mm = 32
   ElseIf $month = 2 Then
	  $mm = 29
   Else
	  $mm = 31
   EndIf

   WinWait("SoftLab 4.0.6 - Genova Diagnostics")
   sleep(1000)
   WinActivate("SoftLab 4.0.6 - Genova Diagnostics")

   MouseClick($MOUSE_CLICK_PRIMARY, 960, 101, 2, 0)

   WinWait("Results Query")
   WinActivate("Results Query")
   Sleep(2000)
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
   While $i <= 9
	  While $month <= 9
		 Send("0"&$month&"0"&$i&$year)
		 Send("{TAB}")
		 Send("0"&$month&"0"&$i&$year)
		 Send("{TAB}")
		 ExitLoop
		 WEnd
	  While $month > 9
		 Send($month&"0"&$i&$year)
		 Send("{TAB}")
		 Send($month&"0"&$i&$year)
		 Send("{TAB}")
		 ExitLoop
		 WEnd
	  ExitLoop
   WEnd
   While $i > 9
	  While $month <= 9
		 Send("0"&$month&$i&$year)
		 Send("{TAB}")
		 Send("0"&$month&$i&$year)
		 Send("{TAB}")
		 ExitLoop
		 WEnd
	  While $month > 9
		 Send($month&$i&$year)
		 Send("{TAB}")
		 Send($month&$i&$year)
		 Send("{TAB}")
		 ExitLoop
		 WEnd
	  ExitLoop
   WEnd

   Sleep(1000)
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
	  WinActivate("Microsoft Excel - Collect  [Compatibility Mode]")
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
	  Sleep(2000)
	  Send("!{F4}")
   ElseIf WinExists("Lab Results Query - [Exceptional Results Query]") == 1 Then
	  WinWait("Lab Results Query - [Exceptional Results Query]")
	  WinActivate("Lab Results Query - [Exceptional Results Query]")
	  Send("^a")
	  Send("^c")
	  WinActivate("Microsoft Excel - Collect  [Compatibility Mode]")
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
	  Sleep(2000)
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
$i = $i + 1
If $i = $mm Then
   If $month < 12 Then
	  $month = $month + 1
	  $i = 1
   EndIf
EndIf


	  Until $i = $mm



