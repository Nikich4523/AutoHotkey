; ============================================
; Master launcher script (put this in shell:startup)
; ============================================

#Requires AutoHotkey v2.0

; Get the folder where this script is located
scriptDir := A_ScriptDir

; Launch Git Bash script
try {
    Run scriptDir "\git_bash.ahk"
} catch as err {
    MsgBox "Failed to launch git_bash.ahk:`n" err.Message, "Error", "Icon!"
}

; Launch New File script
try {
    Run scriptDir "\new_file.ahk"
} catch as err {
    MsgBox "Failed to launch new_file.ahk:`n" err.Message, "Error", "Icon!"
}

; Show confirmation tooltip
TrayTip "Startup Scripts Loaded", "Git Bash (Ctrl+Alt+T) and New File (Alt+N) are active", 1

; Exit the main launcher after starting the other scripts
ExitApp