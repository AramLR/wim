#Include "../store.ahk"
#Include "../modes.ahk"

global debugLog := ""

Log(msg){

    if(Store.isDebugging == true){
        global debugLog .= FormatTime(A_Now, "[yyyy-MM-dd HH:mm] ") . msg . "`n"
    }
}

ClearDebug(){
    global debugLog := ""
}

GetReport(){

    ; TODO: Save debug report to a file instead of displaying it in a message box

    title := "Debug Report"

    date := FormatTime(A_Now, "yyyy-MM-dd HH:mm")
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

    debugMsg .= debugLog

    MsgBox(debugMsg)

}
