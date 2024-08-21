#Include "modes.ahk"

class Store{
    static mode := Modes.Normal

    static SetMode(newMode){
        mode := newMode
        MsgBox("Changed mode to " mode)
    }
}
