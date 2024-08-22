#Include "store.ahk"
#Include "modes.ahk"

#HotIf Store.mode == Modes.Debug

F5::{
    Reload()
    MsgBox("The script has been reloaded", "Script reloaded", "T5000")
}

r::{
;   SelectedFile := FileSelect(8,,"Choose debug file location", "Debug (*.log)")
    MsgBox(Store.GetDebugReport())
}
