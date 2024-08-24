#Include "../store.ahk"
#Include "../modes.ahk"

global debugLog := ""

Log(msg) {

    if (Store.isDebugging == true) {
        global debugLog .= FormatTime(A_Now, "[yyyy-MM-dd HH:mm] ") . msg . "`n"
    }
}

ClearDebug() {
    global debugLog := ""
}

GetReport() {

    selectedFile := FileSelect("S8", , "Create a new file to save the debug log", "Log file (*.log)")

    fileName := ""

    SplitPath(selectedFile, &fileName)
    Result := MsgBox("This action will create or override the file " fileName "`nDo you want to continue?", "Create debug log file", "YesNo Icon?")

    if (Result == "Yes") {

        title := "Debug Report"

        date := FormatTime(A_Now, "yyyy-MM-dd HH:mm")
        scriptName := A_ScriptName
        scriptPath := A_ScriptFullPath
        ahkVersion := A_AhkVersion
        computerName := A_ComputerName
        platformArchitecture := "32 bits"
        if A_Is64bitOS {
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

        for k, v in debugInfo {
            debugMsg .= k . ": " . v . "`n"
        }

        debugMsg .= debugLog

        FileAppend(debugMsg, selectedFile)

        Run("notepad " . selectedFile)

        return
    }

    MsgBox("Debug log file creation failed")

}
