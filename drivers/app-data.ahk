#Include "filesystem.ahk"
#Include "../lib/JSON.ahk"
#Include "../drivers/debugger.ahk"

class AppData{
    static APP_DATA_DIR := JoinPaths(A_AppData, "Wim")
    static APP_DATA_FILES := Map(
        "general", JoinPaths(this.APP_DATA_DIR, "app.data"),
        "planningHelper", JoinPaths(this.APP_DATA_DIR, "planningHelper.data")
    )

    static INITIALIZED := false

    static Initialize(){

        if not DirExist(this.APP_DATA_DIR){
            DirCreate(this.APP_DATA_DIR)
        }

        if not FileExist(this.APP_DATA_FILES["general"]){

            defaultValue := {
                mode: "normal"
            }

            FileAppend(JSON.Dump(defaultValue), this.APP_DATA_FILES["general"])
        }

        if not FileExist(this.APP_DATA_FILES["planningHelper"]){

            defaultValue := {
                dailyTodos: []
            }

            FileAppend(JSON.Dump(defaultValue), this.APP_DATA_FILES["planningHelper"])
        }

        this.INITIALIZED := true
    }

    static GetPlanningHelperFileContents(){
        if not (this.INITIALIZED){
            this.Initialize()
        }

        fileContent := FileRead(this.APP_DATA_FILES["planningHelper"])

        parsed := JSON.Load(fileContent)

        return parsed
    }

    static GetDailyTodos(){

        fileContent := this.GetPlanningHelperFileContents()

        todos := fileContent["dailyTodos"]

        return todos
    }

    static AddDailyTodo(todo){
        if not (this.INITIALIZED){
            this.Initialize()
        }

        currentTodos := this.GetDailyTodos()

        currentTodos.Push(todo)

        newValue := {
            dailyTodos: currentTodos
        }

        FileDelete(this.APP_DATA_FILES["planningHelper"])
        FileAppend(JSON.Dump(newValue), this.APP_DATA_FILES["planningHelper"])

    }

    static GetMode(){
        fileContent := FileRead(this.APP_DATA_FILES["general"])

        jsonContent := JSON.Load(fileContent)

        mode := jsonContent["mode"]

        return mode
    }

    static SetMode(mode){

        newValue := {
            mode: mode
        }

        FileDelete(this.APP_DATA_FILES["general"])
        FileAppend(JSON.Dump(newValue), this.APP_DATA_FILES["general"])

    }
}
