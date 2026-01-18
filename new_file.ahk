; ============================================
; Shows dialog for file creation with Alt+N
; ============================================

#Requires AutoHotkey v2.0

!n:: {  ; Alt+N
    ; Get current directory (from Explorer or Desktop)
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
    
    if (currentPath == "") {
        currentPath := A_Desktop
    }
    
    ; Show input dialog for filename
    IB := InputBox("Enter the name for the new file:", "Create New File", "w300 h100")
    
    if (IB.Result == "Cancel") {
        return
    }
    
    fileName := Trim(IB.Value)
    
    if (fileName == "") {
        MsgBox "No filename entered.", "Error", "Icon!"
        return
    }
    
    ; Create the full file path
    fullPath := currentPath "\" fileName
    
    ; Create the file
    try {
        FileAppend "", fullPath
        MsgBox "File created successfully:`n" fullPath, "Success", "Iconi"
    } catch as err {
        MsgBox "Error creating file:`n" err.Message, "Error", "Icon!"
    }
}