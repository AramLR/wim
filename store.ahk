#Include "modes.ahk"
#Include "drivers\debugger.ahk"

class Store{
    static mode := Modes.Normal
    static isDebugging := false

    static SetMode(newMode){
        if(newMode == Modes.Debug && this.isDebugging == true){
            this.isDebugging := false
            ClearDebug()
            MsgBox("Debugger stopped")
            return
        }

        if(newMode == Modes.Debug && this.isDebugging == false){
            MsgBox("Debugger started")
            this.isDebugging := true
            Log("Debugger started")
            return
        }

        action := "Changed mode to " newMode

        this.mode := newMode

        Log(action)
        MsgBox(action, "Mode changed")

    }

}
