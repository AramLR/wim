#Include "store.ahk"
#Include "modes.ahk"
#Include "drivers\debugger.ahk"

#HotIf Store.isDebugging == true

F5::{
    Reload()

    action := "The script has been reloaded"
    Log(action)
    MsgBox(action, "Script reloaded")
}

r::{
    Log("Generated debug report")
    GetReport()
}
