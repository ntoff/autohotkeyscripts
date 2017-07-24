#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#MaxHotkeysPerInterval 100

; ========================================================================
; Sprint assist for games without run toggle
; https://autohotkey.com/boards/viewtopic.php?p=95156#p95156
;
; definitive auto fire thread
; https://autohotkey.com/board/topic/64576-the-definitive-autofire-thread/
; ========================================================================

GroupAdd, Group, ahk_exe TheForest.exe
GroupAdd, Group, ahk_exe Stranded_Deep.exe

#IfWinActive, ahk_group Group

*$~w up::GoSub, w_up
~w & LShift::GoSub, SprintAssist
 
SprintAssist:
{	SendInput, {LShift Up}
	SendInput, {LShift DownTemp}
} Return
 
w_up:
{ SendInput, {LShift Up}
} Return

$q::
    KeyWait q, T0.5                 ; Wait 1/2 second for user to release "a" key
    If ErrorLevel                   ; Still held down
        While GetKeyState("q","p"){ ; While it is held down
            Send e
            Sleep 10
        }
    Else                            ; They let go in time
        Send q
return

; ========================================================================
; STRANDED DEEP button remapping

#IfWinActive, ahk_exe Stranded_Deep.exe
*XButton1:: Send, {Alt Down}
*XButton1 Up:: Send, {Alt Up}	
*MButton:: Send, {LShift Down}
*MButton Up:: Send, {LShift Up}
