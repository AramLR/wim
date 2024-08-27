#Include "../store.ahk"
#Include "modes.ahk"
#Include "../drivers/debugger.ahk"

#HotIf Store.isDebugging == true

F5::{
    Reload()

    MsgBox("The script has been reloaded", "Script reloaded")
}

r::{
    Log("Generated debug report")
    GetReport()
}
