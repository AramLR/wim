#Include "modes.ahk"

class Store{
    static mode := Modes.Normal

    static SetMode(newMode){
        this.mode := newMode
        MsgBox("Changed mode to " this.mode)
        return
    }

    static GetDebugReport(){
        title := "Debug Report"
        date := A_Now
        scriptName := A_ScriptName
        scriptPath := A_ScriptFullPath
        ahkVersion := A_AhkVersion
        computerName := A_ComputerName
        platformArchitecture := "32 bits"
        if A_Is64bitOS{
            platformArchitecture := "64 bits"
        }
        osVersion := A_OSVersion

        debugInfo := Map(
            "Date", date,
            "Script Name", scriptName,
            "Script Path", scriptPath,
            "AutoHotKey Version", ahkVersion,
            "Computer Name", computerName,
            "Architecture", platformArchitecture,
            "Windows Version", osVersion
        )

        debugMsg := title . "`n"

        for k, v in debugInfo{
            debugMsg .= k . ": " . v . "`n"
        }

        return debugMsg

    }
}
