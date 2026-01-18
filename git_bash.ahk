; ============================================
; Opens Git Bash in current directory with Ctrl+Alt+T
; ============================================

#Requires AutoHotkey v2.0

^!t:: {  ; Ctrl+Alt+T
    ; Get the path of the active Explorer window or Desktop
    currentPath := ""
    
    try {
        shellApp := ComObject("Shell.Application")
        
        for window in shellApp.Windows {
            try {
                if (WinActive("ahk_id " window.HWND)) {
                    currentPath := window.Document.Folder.Self.Path
                    break
                }
            }
        }
    }
    
    ; If no Explorer window is active, use Desktop
    if (currentPath == "") {
        currentPath := A_Desktop
    }
    
    ; Path to Git Bash (adjust if your installation is different)
    gitBashPath := "C:\Program Files\Git\git-bash.exe"
    
    ; Check if Git Bash exists
    if FileExist(gitBashPath) {
        Run gitBashPath, currentPath
    } else {
        MsgBox "Git Bash not found at: " gitBashPath "`n`nPlease adjust the path in the script.", "Error", "Icon!"
    }
}